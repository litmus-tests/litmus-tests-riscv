RMEM ?= rmem
HERD ?= herd7
MCOMPARE ?= mcompare7
MSORT ?= msort7
MSUM ?= msum7

######################################################################
# The following targets are usable even if you do not have the models
# (i.e. they do not trigger rebuild of the logs)

# Compare the Flat model and Herd model results
compare-models:
	@$(MCOMPARE) -nohash model-results/flat.logs model-results/herd.logs
.PHONY: compare-models

# 'make show-test TEST=<name>' where <name> is a litmus test name
# (e.g. MP) shows the litmus test and the model results for it
show-test: show-test-file show-flat-test show-herd-test
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
	@$(MSUM) -names names.temp model-results/$*.logs 2>/dev/null
	@rm -f names.temp
.PHONY: show-test show-test-file

######################################################################
# For the following targets you will need to have the models

# Rebuild the logs by running the models
run-models: model-results/flat.logs model-results/herd.logs
.PHONY: run-models

# Remove old logs
clean-logs: clean-flat-logs clean-herd-logs
.PHONY: clean-logs

# This will set ATS to the list of @ files included by tests/non-mixed-size/@all
# including tests/non-mixed-size/@all itself at the head of the list
define ats =
$2 += $1
$$(foreach at,$(patsubst %,$(dir $1)%,$(shell grep @ $1)),$$(eval $$(call ats,$$(at),$2)))
endef
$(eval $(call ats,tests/non-mixed-size/@all,ATS))

-include flat-tests.d
-include herd-tests.d
%-tests.d: $(ATS)
	$(MSORT) $< | grep -v '^[[:space:]]*#' | awk '{\
	  print "model-results/$*/" $$1 ".log: count =" , NR;\
	  print "model-results/$*/" $$1 ".log:" , $$1;\
	  print "model-results/$*.logs: model-results/$*/" $$1 ".log";\
	}\
	END {\
	  print "model-results/$*.logs: totalc =" , NR;\
	}' > $@
model-results/flat/%.log: RUNMODEL = $(RMEM) -model flat -interactive false -pp_hex true -q -shallow_embedding true -eager true -hash_prune true $< > $@
model-results/herd/%.log: RUNMODEL = $(HERD) -model riscv.cat $< > $@
model-results/%.log:
	@printf "%5d/$(totalc) $(notdir $*)\n" "$(count)"
	@mkdir -p $(dir $@)
	@$(RUNMODEL)
clean-%-logs:
	rm -rf model-results/$*/tests

model-results/%.logs:
	rm -f $@
	$(call long-cat,$^,$@)

# The following  is similar to 'cat $1 >> $2', but it chops $1 to
# multiple parts of 1000 files each, and do the cat for each part
# separately; this is useful when $1 is bigger than what the shell can
# handle
long-cat = $(eval ts :=)$(foreach t,$1,$(if $(filter 1000,$(words $(ts))),$(call _long-cat,$(ts),$2)$(eval ts := $t),$(eval ts += $t)))$(call _long-cat,$(ts),$2)
define _long-cat =
cat $1 >> $2

endef
