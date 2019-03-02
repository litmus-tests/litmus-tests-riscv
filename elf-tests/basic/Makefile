OUTPUTDIR = build

# This is using cross compilation.
# On Ubuntu you can get riscv64-linux-gnu-gcc like this: 'apt install gcc-riscv64-linux-gnu'.
CC = riscv64-linux-gnu-gcc
OBJDUMP = riscv64-linux-gnu-objdump
READELF = riscv64-linux-gnu-readelf

### for normal compilation
# CFLAGS=-I. -Wall -Wno-unused-but-set-variable -std=c11 -pthread -save-temps -O2

### for rmem:
CFLAGS = -g -static -std=c11 -nostdlib
# this is to make gcc generate .debug_frame
CFLAGS += -fno-dwarf2-cfi-asm
# this is needed only for tests that call start_thread
CFLAGS += -D__THREAD_START_H=\"thread_start_riscv64.h\"
# g is shorthand for imafd, in particular we do not support c (Compressed Instructions)
CFLAGS += -march=rv64g -mabi=lp64d
# show all warnings
CFLAGS += -Wall
# do not show this warning
CFLAGS += -Wno-unused-but-set-variable
# generate .s and .i files
CFLAGS += -save-temps=obj
# prevent gratuitous use of floating-point load/store instructions
# CFLAGS += -msoft-float
# do not try to insert calls to memcpy() or other library helpers
# (-O0 also probably prevents this)
CFLAGS += -ffreestanding
### linker options:
# _start is the symbol linksem uses to find the entry point
CFLAGS += -Wl,--defsym,_start=main
### assembler options:
# keep local symbols, e.g. the PowerPC .L.main
CFLAGS += -Wa,-L

all:
.PHONY: all

define build-and-dump
	$(CC) $(CFLAGS) -o $2 $1
	$(OBJDUMP) -D $2 > $2-objdump-D.txt
	$(READELF) -a $2 > $2-readelf-a.txt
endef

$(OUTPUTDIR)/thread_init_test: CFLAGS += -O2
$(OUTPUTDIR)/thread_init_test: CFLAGS += -Wno-unused-variable -Wno-unused-label
$(OUTPUTDIR)/thread_init_test: thread_init_test.c
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/thread_init_test



$(OUTPUTDIR)/thread_start_test: CFLAGS += -O0
$(OUTPUTDIR)/thread_start_test: thread_start_test.c thread_start_riscv64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/thread_start_test



$(OUTPUTDIR)/atomics_test_1-O%: CFLAGS += -O$*
$(OUTPUTDIR)/atomics_test_1-O%: atomics_test_1.c
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/atomics_test_1-O0 $(OUTPUTDIR)/atomics_test_1-O1 $(OUTPUTDIR)/atomics_test_1-O2

$(OUTPUTDIR)/atomics_test_2-O%: CFLAGS += -O$*
$(OUTPUTDIR)/atomics_test_2-O%: atomics_test_2.c thread_start_riscv64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/atomics_test_2-O0 $(OUTPUTDIR)/atomics_test_2-O1 $(OUTPUTDIR)/atomics_test_2-O2



### atomic_compare_exchange is not supported by gcc yet
# $(OUTPUTDIR)/atomic_bool_1-O%:
# $(OUTPUTDIR)/atomic_bool_1-O%: atomic_bool_1.c
# 	mkdir -p $(dir $@)
# 	$(call build-and-dump,$<,$@)
# all: $(OUTPUTDIR)/atomic_bool_1-O0 $(OUTPUTDIR)/atomic_bool_1-O1 $(OUTPUTDIR)/atomic_bool_1-O2
#
# $(OUTPUTDIR)/atomic_bool_2-O%:
# $(OUTPUTDIR)/atomic_bool_2-O%: atomic_bool_2.c
# 	mkdir -p $(dir $@)
# 	$(call build-and-dump,$<,$@)
# all: $(OUTPUTDIR)/atomic_bool_2-O0 $(OUTPUTDIR)/atomic_bool_2-O1 $(OUTPUTDIR)/atomic_bool_2-O2



$(OUTPUTDIR)/demsky-O%: CFLAGS += -O$*
$(OUTPUTDIR)/demsky-O%: demsky.c thread_start_riscv64.h
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/demsky-O0 $(OUTPUTDIR)/demsky-O1 $(OUTPUTDIR)/demsky-O2



$(OUTPUTDIR)/loop2-O%: CFLAGS += -O$*
$(OUTPUTDIR)/loop2-O%: CFLAGS += -DLOOPBOUND=2
$(OUTPUTDIR)/loop2-O%: loop.c
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/loop2-O0 $(OUTPUTDIR)/loop2-O1 $(OUTPUTDIR)/loop2-O2

$(OUTPUTDIR)/loop5-O%: CFLAGS += -O$*
$(OUTPUTDIR)/loop5-O%: CFLAGS += -DLOOPBOUND=5
$(OUTPUTDIR)/loop5-O%: loop.c
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/loop5-O0 $(OUTPUTDIR)/loop5-O1 $(OUTPUTDIR)/loop5-O2



$(OUTPUTDIR)/function_call_1-O%: CFLAGS += -O$*
$(OUTPUTDIR)/function_call_1-O%: function_call_1.c
	mkdir -p $(dir $@)
	$(call build-and-dump,$<,$@)
all: $(OUTPUTDIR)/function_call_1-O0 $(OUTPUTDIR)/function_call_1-O1 $(OUTPUTDIR)/function_call_1-O2



clean:
	rm -rf $(OUTPUTDIR)
