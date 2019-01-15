RMEM ?= rmem
HERD ?= herd7
MCOMPARE ?= mcompare7
MSORT ?= msort7
MSUM ?= msum7
LITMUS ?= litmus7

GCC ?= gcc

ATFILE ?= tests/non-mixed-size/@all

######################################################################
# The following targets are usable even if you do not have the models
# (i.e. they do not trigger rebuild of the model logs)

# Compare the Flat model and Herd model results
compare-models:
	@$(MCOMPARE) -nohash model-results/flat.logs model-results/herd.logs
.PHONY: compare-models

# 'make show-test TEST=<name>' where <name> is a litmus test name
# (e.g. MP) shows the litmus test and the model results for it
show-test:
	@$(MAKE) -s show-test-file
	@echo
	@$(MAKE) -s show-flat-test
	@echo
	@$(MAKE) -s show-herd-test
	@echo
	@$(MAKE) -s show-hw-test
show-test-file: TESTFILES := $(shell find tests -name "$(subst [,\[,$(subst ],\],$(TEST))).litmus")
show-test-file:
	$(if $(TESTFILES),,$(error Error: cannot find $(TEST)))
	$(if $(word 2,$(TESTFILES)),$(warning $(TEST) was found multiple times))
	@ls -1 $(TESTFILES)
	@echo ----------------------------------------
	@cat $(word 1,$(TESTFILES))
	@echo ----------------------------------------
show-%-test:
	@echo "$(TEST)" > names.temp
	@echo "*** $* model results: ***"
	@$(MSUM) -names names.temp model-results/$*.logs 2>/dev/null | grep . || echo NONE
	@rm -f names.temp
show-hw-test:
	@echo "$(TEST)" > names.temp
	@echo "*** $* hardware results: ***"
	@$(MSUM) -names names.temp hw-results/run.log 2>/dev/null | grep . || echo NONE
	@rm -f names.temp
.PHONY: show-test show-test-file show-hw-test

clean: clean-model-logs clean-hw-tests
.PHONY: clean

######################################################################
# For the following targets you will need to have the models
# NOTE: using the '-rR' command line options, to disable make's
# built-in rules and variables, is significantly faster

# Rebuild the model logs by running the models
run-models: model-results/flat.logs model-results/herd.logs
.PHONY: run-models

# Remove old model logs
clean-model-logs: clean-model-logs-flat clean-model-logs-herd
.PHONY: clean-model-logs

# '$(call ats,<@file>)' expands to the list of @ files that are
# included by <@file> (recursively), including <@file> at the
# beginning of the list
ats = $(eval _atscum:=)$(eval $(call _ats,$1))$(_atscum)
define _ats =
_atscum += $1
$$(foreach at,$(shell grep @ $1),$$(eval $$(call _ats,$(dir $1)$$(at))))
endef

-include flat-tests.d
-include herd-tests.d
%-tests.d: $(call ats,$(ATFILE))
	$(MSORT) $< | grep -v '^[[:space:]]*#' | awk '{\
	  print "model-results/$*/" $$1 ".log: count =" , NR;\
	  print "model-results/$*/" $$1 ".log:" , $$1;\
	  print "model-results/$*.logs: model-results/$*/" $$1 ".log";\
	}\
	END {\
	  print "model-results/$*.logs: totalc =" , NR;\
	}' > $@
model-results/flat/%.log: RUNMODEL = $(RMEM) -model flat -interactive false -pp_hex true -q -shallow_embedding true -eager true -hash_prune true $< > $@
model-results/herd/%.log: RUNMODEL = $(HERD) -model riscv.cat "$<" > "$@"
model-results/%.log:
	@printf "%5d/$(totalc) $(notdir $*)\n" "$(count)"
	@mkdir -p $(dir $@)
	@$(RUNMODEL)
clean-model-logs-%:
	rm -rf model-results/$*/tests

model-results/%.logs:
	rm -f $@
	$(call long-cat,$^,$@)

# '$(call long-cat,<in-files>,<out-file>)' chops <in-files> to
# multiple parts of LONGCATMAX files each, and executes
# 'cat <in-part-n> >> <out-file>' for each part.
LONGCATMAX ?= 1000
long-cat = $(eval ts :=)$(foreach t,$1,$(if $(filter $(LONGCATMAX),$(words $(ts))),$(_long-cat)$(eval ts := $t),$(eval ts += $t)))$(_long-cat)
define _long-cat =
@echo 'cat [...] >> $2'
@cat $(ts) >> $2

endef

######################################################################

# Generate, build and run the tests on this machine
run-hw-tests: | hw-tests
	cd $| && ./run.sh
	$(MAKE) merge-hw-tests
.PHONY: run-hw-tests

# Compare hardware results with the models
compare-hw-%:
	$(MCOMPARE) -nohash hw-results/run.log model-results/$*.logs

# Generate and cross-compile the tests, to be run on a different machine
hw-tests: hw-tests-src/run.exe hw-tests-src/run.sh
	mkdir -p $@
	cp $^ $@

# Merge the results
merge-hw-tests:
	mkdir -p hw-results
	$(MSUM) hw-tests/run.*.log > hw-results/run.log
.PHONY: merge-hw-tests

hw-tests-src/run.exe: | hw-tests-src
	$(MAKE) -C $|

hw-tests-src: gcc.excl
	rm -rf $@
	mkdir -p $@
	$(LITMUS) -mach ./riscv.cfg -avail $(CORES) -excl $< -o $@ $(ATFILE)

### This will produce 1.2 billion results for a 2-thread test
# -s values for litmus run.exe
SIZES=50k 500k 10k 100k 5k 1M
# -st values for litmus run.exe
STRIDES=1 2 3 4 5 6 7 8 31 133
# Calculate a value for litmus run.exe -r argument, given a value to
# the -s argument and the number of cores in the machine, in order to
# produce 20 million results for a 2-thread test
r-for-s = $(shell printf 'scale=2; x=40000000 / (%d * $(CORES)) + 0.5; scale=0; if (x > 1) x/1 else 1\n' "`echo '$1' | sed 's/[mM]$$/000000/; s/[kK]$$/000/'`" | bc | sed 's/000000$$/M/; s/000$$/k/')
logs-count = $(eval _logs-count += 1)$(words $(_logs-count))
hw-tests-src/run.sh: | hw-tests-src
	{ echo '#!/bin/sh';\
	  echo './run.exe -st 1 -s 5k -r 20 > run.test.log';\
	  $(foreach st,$(STRIDES),\
	    $(foreach s,$(SIZES),\
	      echo './run.exe -st $(st) -s $(s) -r $(call r-for-s,$(s)) > run.$(logs-count).log';\
	    )\
	  )\
	  echo 'touch done';\
	} > $@
	chmod a+x $@

# Generate the C program that runs the tests, but do not compile it
hw-tests-src.tgz: %.tgz: %/run.sh | %
	tar -caf $@ $*

# Before generating the program that runs all the tests, we try to
# build the following tests individually. A failure to generate one of
# those tests implies that GCC does not support it so we will exclude
# it, and similar instructions, from the final generated program.
gcc-tests/fence.tso-src: TEST = tests/non-mixed-size/SINGLE_INST/fence.tso.litmus
gcc-tests/amoswap.w.aq.rl-src: TEST = tests/non-mixed-size/SINGLE_INST/amoswap.w.aq.rl.litmus
gcc-tests/lr.w.aq.rl-src: TEST = tests/non-mixed-size/SINGLE_INST/lr.w.aq.rl.litmus
# MP is just to make sure we can build a simple test (with no special instructions)
gcc-tests/MP-src: TEST = tests/non-mixed-size/BASIC_2_THREAD/MP.litmus
gcc-tests/%-src:
	mkdir -p $@
	$(LITMUS) -mach ./riscv.cfg -avail $(CORES) -o $@ $(TEST)
gcc-tests/%-src/run.exe: | gcc-tests/%-src
	$(MAKE) -C $| clean
	$(MAKE) -C $|

FORCE:
.PHONY: FORCE

# The first line of gcc.excl is the version of gcc with which the file
# was generated, if the version changes we force a rebuild of the file
ifneq "$(wildcard gcc.excl)" ""
ifneq "\# $(shell $(GCC) --version | head -1)" "$(shell head -1 gcc.excl)"
gcc.excl: FORCE
endif
endif
gcc.excl: grep-tests = $(MSORT) $(ATFILE) | grep '^[^\#]' | xargs grep -li $(foreach e,$(1),-e "$(e)") | sed -e 's|.*/||' -e 's|\.litmus||'
gcc.excl:
	rm -rf gcc-tests $@
	# First we check if we are able to generate and build the MP test (sanity)
	$(MAKE) gcc-tests/MP-src || { echo "Error: Something went worng while trying to run litmus"; exit 1; }
	$(MAKE) gcc-tests/MP-src/run.exe || { echo "Error: Something went worng while trying to build the litmus generated program"; exit 1; }
	{ echo "# $$($(GCC) --version | head -1)";\
	  echo "# tests with l{b|h|w|d}.aq[.rl] or s{b|h|w|d}[.aq].rl instruction:";\
	  $(call grep-tests,l[bhwd]\.aq l[bhwd]\.aq\.rl s[bhwd]\.rl s[bhwd]\.aq\.rl);\
	} > $@
	# Check individual instructions
	$(MAKE) gcc-tests/fence.tso-src/run.exe || {\
	  echo "# tests with fence.tso instruction:";\
	  $(call grep-tests,fence\.tso);\
	} >> $@
	$(MAKE) gcc-tests/amoswap.w.aq.rl-src/run.exe || {\
	  echo "# tests with amo*.{w|d}.aq.rl instructions:";\
	  $(call grep-tests,amo[^[:space:]]*\.[wd]\.aq\.rl);\
	} >> $@
	$(MAKE) gcc-tests/lr.w.aq.rl-src/run.exe || {\
	  echo "# tests with {lr|sc}.{w|d}.aq.rl instruction:";\
	  $(call grep-tests,lr\.[wd]\.aq\.rl sc\.[wd]\.aq\.rl);\
	} >> $@

clean-hw-tests:
	rm -rf gcc-tests gcc.excl
	rm -rf hw-tests hw-tests-src hw-tests-src.tgz
.PHONY: clean-hw-tests
