	.file	"atomics_test_1.c"
	.option nopic
	.text
.Ltext0:
	.globl	x
	.section	.sdata,"aw"
	.align	2
	.type	x, @object
	.size	x, 4
x:
	.word	1
	.comm	y_relaxed,4,4
	.comm	y_acquire,4,4
	.comm	y_sc,4,4
	.globl	n
	.section	.sbss,"aw",@nobits
	.align	2
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "atomics_test_1.c"
	.loc 1 9 12
	addi	sp,sp,-96
.LCFI0:
	sd	s0,88(sp)
.LCFI1:
	addi	s0,sp,96
.LCFI2:
	.loc 1 10 4
	lui	a5,%hi(n)
	li	a4,11
	sw	a4,%lo(n)(a5)
.LBB2:
	.loc 1 11 43
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-24(s0)
	.loc 1 11 68
	ld	a5,-24(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-68(s0)
	.loc 1 11 18
	lw	a4,-68(s0)
.LBE2:
	.loc 1 11 13
	lui	a5,%hi(y_relaxed)
	sw	a4,%lo(y_relaxed)(a5)
	.loc 1 12 4
	lui	a5,%hi(n)
	li	a4,12
	sw	a4,%lo(n)(a5)
.LBB3:
	.loc 1 13 43
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-32(s0)
	.loc 1 13 68
	ld	a5,-32(s0)
	lw	a5,0(a5)
	fence	iorw,iorw
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-72(s0)
	.loc 1 13 18
	lw	a4,-72(s0)
.LBE3:
	.loc 1 13 13
	lui	a5,%hi(y_acquire)
	sw	a4,%lo(y_acquire)(a5)
	.loc 1 14 4
	lui	a5,%hi(n)
	li	a4,13
	sw	a4,%lo(n)(a5)
.LBB4:
	.loc 1 15 38
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-40(s0)
	.loc 1 15 63
	ld	a5,-40(s0)
	fence	iorw,iorw
	lw	a5,0(a5)
	fence	iorw,iorw
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-76(s0)
	.loc 1 15 13
	lw	a4,-76(s0)
.LBE4:
	.loc 1 15 8
	lui	a5,%hi(y_sc)
	sw	a4,%lo(y_sc)(a5)
	.loc 1 17 4
	lui	a5,%hi(n)
	li	a4,21
	sw	a4,%lo(n)(a5)
.LBB5:
	.loc 1 18 31
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-48(s0)
	.loc 1 18 38
	li	a5,2
	sw	a5,-80(s0)
	.loc 1 18 5
	lw	a5,-80(s0)
	sext.w	a4,a5
	ld	a5,-48(s0)
	amoswap.w zero,a4,0(a5)
.LBE5:
	.loc 1 19 4
	lui	a5,%hi(n)
	li	a4,22
	sw	a4,%lo(n)(a5)
.LBB6:
	.loc 1 20 31
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-56(s0)
	.loc 1 20 38
	li	a5,3
	sw	a5,-84(s0)
	.loc 1 20 5
	lw	a5,-84(s0)
	sext.w	a4,a5
	ld	a5,-56(s0)
	fence iorw,ow; amoswap.w zero,a4,0(a5)
.LBE6:
	.loc 1 21 4
	lui	a5,%hi(n)
	li	a4,23
	sw	a4,%lo(n)(a5)
.LBB7:
	.loc 1 22 31
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-64(s0)
	.loc 1 22 38
	li	a5,3
	sw	a5,-88(s0)
	.loc 1 22 5
	lw	a5,-88(s0)
	sext.w	a4,a5
	ld	a5,-64(s0)
	fence iorw,ow; amoswap.w.aq zero,a4,0(a5)
.LBE7:
	.loc 1 24 4
	lui	a5,%hi(n)
	li	a4,31
	sw	a4,%lo(n)(a5)
	.loc 1 27 4
	lui	a5,%hi(n)
	li	a4,99
	sw	a4,%lo(n)(a5)
	.loc 1 29 10
	li	a5,1
	.loc 1 30 1
	mv	a0,a5
	ld	s0,88(sp)
.LCFI3:
	addi	sp,sp,96
.LCFI4:
	jr	ra
.LFE0:
	.size	main, .-main
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.string	""
	.byte	0x1
	.byte	0x7c
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0
	.align	3
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.byte	0x60
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x88
	.byte	0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE0:
	.text
.Letext0:
	.file 2 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x27e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x60
	.byte	0x2
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
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	y_relaxed
	.byte	0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x5
	.byte	0x10
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	y_acquire
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x5
	.byte	0x1b
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	y_sc
	.byte	0x6
	.string	"n"
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	n
	.byte	0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.4byte	0x91
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x27b
	.byte	0x9
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x175
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0xb
	.byte	0x2b
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0xb
	.byte	0x31
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0
	.byte	0x9
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x1aa
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0xd
	.byte	0x2b
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0xd
	.byte	0x31
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0x9
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x1df
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0xf
	.byte	0x26
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0xf
	.byte	0x2c
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0
	.byte	0x9
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x214
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x12
	.byte	0x1f
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x12
	.byte	0x26
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0x9
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x249
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x14
	.byte	0x1f
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x14
	.byte	0x26
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0
	.byte	0xb
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x16
	.byte	0x1f
	.4byte	0x27b
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x16
	.byte	0x26
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x91
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
	.byte	0x8
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
.LASF17:
	.string	"y_relaxed"
.LASF18:
	.string	"y_acquire"
.LASF22:
	.string	"__atomic_store_ptr"
.LASF16:
	.string	"long long unsigned int"
.LASF10:
	.string	"unsigned char"
.LASF25:
	.string	"atomics_test_1.c"
.LASF14:
	.string	"long unsigned int"
.LASF12:
	.string	"short unsigned int"
.LASF19:
	.string	"y_sc"
.LASF2:
	.string	"memory_order_acquire"
.LASF5:
	.string	"memory_order_seq_cst"
.LASF21:
	.string	"__atomic_load_tmp"
.LASF0:
	.string	"memory_order_relaxed"
.LASF27:
	.string	"main"
.LASF6:
	.string	"unsigned int"
.LASF8:
	.string	"char"
.LASF15:
	.string	"long long int"
.LASF1:
	.string	"memory_order_consume"
.LASF20:
	.string	"__atomic_load_ptr"
.LASF3:
	.string	"memory_order_release"
.LASF26:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF11:
	.string	"short int"
.LASF13:
	.string	"long int"
.LASF24:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF9:
	.string	"signed char"
.LASF23:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
