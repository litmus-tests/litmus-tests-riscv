	.file	"atomics_test_2.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	thread_start, @function
thread_start:
.LFB0:
	.file 1 "thread_start_riscv64.h"
	.loc 1 15 53
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 16 48
	ld	a5,-24(s0)
	.loc 1 16 21
	mv	a0,a5
	.loc 1 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 1 23 10
#NO_APP
	mv	a5,a0
	sext.w	a5,a5
	.loc 1 24 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE0:
	.size	thread_start, .-thread_start
	.globl	x
	.section	.sbss,"aw",@nobits
	.align	2
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	y
	.align	2
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.comm	ry,4,4
	.comm	rx,4,4
	.text
	.align	2
	.globl	thread0
	.type	thread0, @function
thread0:
.LFB1:
	.file 2 "atomics_test_2.c"
	.loc 2 10 23
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 2 11 4
	lui	a5,%hi(x)
	li	a4,1
	sw	a4,%lo(x)(a5)
.LBB2:
	.loc 2 12 31
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	sd	a5,-24(s0)
	.loc 2 12 38
	li	a5,1
	sw	a5,-28(s0)
	.loc 2 12 5
	lw	a5,-28(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	fence iorw,ow; amoswap.w zero,a4,0(a5)
.LBE2:
	.loc 2 13 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE1:
	.size	thread0, .-thread0
	.align	2
	.globl	thread1
	.type	thread1, @function
thread1:
.LFB2:
	.loc 2 15 23
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
.LBB3:
	.loc 2 16 36
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	sd	a5,-24(s0)
	.loc 2 16 61
	ld	a5,-24(s0)
	lw	a5,0(a5)
	fence	iorw,iorw
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-28(s0)
	.loc 2 16 11
	lw	a4,-28(s0)
.LBE3:
	.loc 2 16 6
	lui	a5,%hi(ry)
	sw	a4,%lo(ry)(a5)
	.loc 2 17 10
	lui	a5,%hi(ry)
	lw	a5,%lo(ry)(a5)
	.loc 2 17 6
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L6
	.loc 2 18 8
	lui	a5,%hi(x)
	lw	a4,%lo(x)(a5)
	lui	a5,%hi(rx)
	sw	a4,%lo(rx)(a5)
.L6:
	.loc 2 21 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE2:
	.size	thread1, .-thread1
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 2 23 12
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 25 10
	lui	a5,%hi(thread0)
	addi	a0,a5,%lo(thread0)
	call	thread_start
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 26 10
	lui	a5,%hi(thread1)
	addi	a0,a5,%lo(thread1)
	call	thread_start
	mv	a5,a0
	sw	a5,-24(s0)
	.loc 2 27 10
	li	a5,1
	.loc 2 28 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE3:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x264
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x60
	.byte	0x3
	.byte	0x1e
	.byte	0x3
	.4byte	0x60
	.byte	0x3
	.4byte	.LASF0
	.byte	0
	.byte	0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x3
	.4byte	.LASF3
	.byte	0x3
	.byte	0x3
	.4byte	.LASF4
	.byte	0x4
	.byte	0x3
	.4byte	.LASF5
	.byte	0x5
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.4byte	.LASF7
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF9
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF11
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF13
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF15
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF16
	.byte	0x6
	.string	"x"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x6
	.string	"y"
	.byte	0x2
	.byte	0x5
	.byte	0xe
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	y
	.byte	0x6
	.string	"ry"
	.byte	0x2
	.byte	0x7
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	ry
	.byte	0x6
	.string	"rx"
	.byte	0x2
	.byte	0x7
	.byte	0x9
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	rx
	.byte	0x7
	.4byte	.LASF19
	.byte	0x2
	.byte	0x17
	.byte	0x5
	.4byte	0x91
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x147
	.byte	0x8
	.4byte	.LASF17
	.byte	0x2
	.byte	0x18
	.byte	0x7
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.4byte	.LASF18
	.byte	0x2
	.byte	0x18
	.byte	0xd
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	.LASF20
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a5
	.byte	0xa
	.string	"tid"
	.byte	0x2
	.byte	0xf
	.byte	0x12
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xb
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x8
	.4byte	.LASF21
	.byte	0x2
	.byte	0x10
	.byte	0x24
	.4byte	0x1a5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF22
	.byte	0x2
	.byte	0x10
	.byte	0x2a
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x91
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.byte	0xa
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x209
	.byte	0xa
	.string	"tid"
	.byte	0x2
	.byte	0xa
	.byte	0x12
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xb
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x8
	.4byte	.LASF24
	.byte	0x2
	.byte	0xc
	.byte	0x1f
	.4byte	0x1a5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF25
	.byte	0x2
	.byte	0xc
	.byte	0x26
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	.LASF31
	.byte	0x1
	.byte	0xf
	.byte	0x13
	.4byte	0x91
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x256
	.byte	0xa
	.string	"fp"
	.byte	0x1
	.byte	0xf
	.byte	0x29
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x10
	.byte	0x15
	.4byte	0x98
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x11
	.byte	0x15
	.4byte	0x98
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0xe
	.4byte	0x261
	.byte	0xf
	.4byte	0x91
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x256
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
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
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
	.byte	0x2e
	.byte	0x1
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
	.byte	0xa
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
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
.LASF4:
	.string	"memory_order_acq_rel"
.LASF23:
	.string	"thread0"
.LASF20:
	.string	"thread1"
.LASF24:
	.string	"__atomic_store_ptr"
.LASF16:
	.string	"long long unsigned int"
.LASF10:
	.string	"unsigned char"
.LASF14:
	.string	"long unsigned int"
.LASF26:
	.string	"argument"
.LASF12:
	.string	"short unsigned int"
.LASF2:
	.string	"memory_order_acquire"
.LASF5:
	.string	"memory_order_seq_cst"
.LASF22:
	.string	"__atomic_load_tmp"
.LASF0:
	.string	"memory_order_relaxed"
.LASF17:
	.string	"tid1"
.LASF18:
	.string	"tid2"
.LASF19:
	.string	"main"
.LASF6:
	.string	"unsigned int"
.LASF8:
	.string	"char"
.LASF28:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -ffreestanding"
.LASF27:
	.string	"result"
.LASF29:
	.string	"atomics_test_2.c"
.LASF31:
	.string	"thread_start"
.LASF15:
	.string	"long long int"
.LASF1:
	.string	"memory_order_consume"
.LASF21:
	.string	"__atomic_load_ptr"
.LASF3:
	.string	"memory_order_release"
.LASF30:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF11:
	.string	"short int"
.LASF13:
	.string	"long int"
.LASF9:
	.string	"signed char"
.LASF25:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
