	.file	"thread_start_test.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	thread_start, @function
thread_start:
.LFB0:
	.file 1 "thread_start_riscv64.h"
	.loc 1 33 53
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 34 48
	ld	a5,-24(s0)
	.loc 1 34 21
	mv	a0,a5
	.loc 1 36 3
#APP
# 36 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 1 41 10
#NO_APP
	mv	a5,a0
	sext.w	a5,a5
	.loc 1 42 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE0:
	.size	thread_start, .-thread_start
	.comm	new_tid,4,4
	.align	2
	.globl	f
	.type	f, @function
f:
.LFB1:
	.file 2 "thread_start_test.c"
	.loc 2 5 17
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 6 11
	lui	a5,%hi(new_tid)
	lw	a4,-20(s0)
	sw	a4,%lo(new_tid)(a5)
	.loc 2 7 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE1:
	.size	f, .-f
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 2 9 12
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 10 3
	lui	a5,%hi(f)
	addi	a0,a5,%lo(f)
	call	thread_start
	.loc 2 11 3
	lui	a5,%hi(f)
	addi	a0,a5,%lo(f)
	call	thread_start
	.loc 2 13 10
	li	a5,1
	.loc 2 14 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF3
	.byte	0xc
	.4byte	.LASF4
	.4byte	.LASF5
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3
	.byte	0x5
	.4byte	0x43
	.byte	0x9
	.byte	0x3
	.8byte	new_tid
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x9
	.byte	0x5
	.4byte	0x43
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.string	"f"
	.byte	0x2
	.byte	0x5
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x94
	.byte	0x6
	.string	"tid"
	.byte	0x2
	.byte	0x5
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x21
	.byte	0x13
	.4byte	0x43
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xe1
	.byte	0x6
	.string	"fp"
	.byte	0x1
	.byte	0x21
	.byte	0x29
	.4byte	0xec
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x22
	.byte	0x15
	.4byte	0xf2
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.4byte	.LASF1
	.byte	0x1
	.byte	0x23
	.byte	0x15
	.4byte	0xf2
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x9
	.4byte	0xec
	.byte	0xa
	.4byte	0x43
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0xe1
	.byte	0xc
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"long int"
.LASF5:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF1:
	.string	"result"
.LASF4:
	.string	"thread_start_test.c"
.LASF3:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -ffreestanding"
.LASF7:
	.string	"main"
.LASF0:
	.string	"argument"
.LASF8:
	.string	"thread_start"
.LASF6:
	.string	"new_tid"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
