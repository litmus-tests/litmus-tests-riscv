	.file	"atomics_test_2.c"
	.option nopic
	.text
.Ltext0:
	.align	2
	.globl	thread0
	.type	thread0, @function
thread0:
.LFB1:
	.file 1 "atomics_test_2.c"
	.loc 1 10 23
.LVL0:
	.loc 1 11 3
	.loc 1 11 4 is_stmt 0
	li	a5,1
	lui	a4,%hi(x)
	sw	a5,%lo(x)(a4)
	.loc 1 12 2 is_stmt 1
.LBB6:
	.loc 1 12 19
.LVL1:
	.loc 1 12 5
	.loc 1 12 5
	lui	a4,%hi(y)
	addi	a4,a4,%lo(y)
	fence iorw,ow; amoswap.w zero,a5,0(a4)
.LVL2:
.LBE6:
	.loc 1 13 1 is_stmt 0
	ret
.LFE1:
	.size	thread0, .-thread0
	.align	2
	.globl	thread1
	.type	thread1, @function
thread1:
.LFB2:
	.loc 1 15 23 is_stmt 1
.LVL3:
	.loc 1 16 3
.LBB7:
	.loc 1 16 24
	.loc 1 16 10
	.loc 1 16 61
	lui	a5,%hi(y)
	lw	a5,%lo(y)(a5)
	fence	iorw,iorw
.LBE7:
	.loc 1 16 6 is_stmt 0
	lui	a4,%hi(ry)
.LBB8:
	.loc 1 16 61
	sext.w	a5,a5
.LVL4:
	.loc 1 16 11 is_stmt 1
.LBE8:
	.loc 1 16 6 is_stmt 0
	sw	a5,%lo(ry)(a4)
	.loc 1 17 3 is_stmt 1
	.loc 1 17 6 is_stmt 0
	li	a4,1
	beq	a5,a4,.L5
	.loc 1 21 1
	ret
.L5:
	.loc 1 18 5 is_stmt 1
	.loc 1 18 8 is_stmt 0
	lui	a5,%hi(x)
	lw	a4,%lo(x)(a5)
	lui	a5,%hi(rx)
	sw	a4,%lo(rx)(a5)
	.loc 1 20 6 is_stmt 1
	.loc 1 21 1 is_stmt 0
	ret
.LFE2:
	.size	thread1, .-thread1
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 23 12 is_stmt 1
	.loc 1 24 3
	.loc 1 25 3
.LVL5:
.LBB9:
.LBB10:
	.file 2 "thread_start_riscv64.h"
	.loc 2 16 3
	.loc 2 16 21 is_stmt 0
	lui	a0,%hi(thread0)
	addi	a0,a0,%lo(thread0)
	.loc 2 17 3 is_stmt 1
	.loc 2 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 2 23 3
.LVL6:
#NO_APP
.LBE10:
.LBE9:
	.loc 1 26 3
.LBB11:
.LBB12:
	.loc 2 16 3
	.loc 2 16 21 is_stmt 0
	lui	a0,%hi(thread1)
.LVL7:
	addi	a0,a0,%lo(thread1)
	.loc 2 17 3 is_stmt 1
	.loc 2 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 2 23 3
.LVL8:
#NO_APP
.LBE12:
.LBE11:
	.loc 1 27 3
	.loc 1 28 1 is_stmt 0
	li	a0,1
.LVL9:
	ret
.LFE3:
	.size	main, .-main
	.comm	rx,4,4
	.comm	ry,4,4
	.globl	y
	.globl	x
	.section	.sbss,"aw",@nobits
	.align	2
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
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
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.align	3
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.align	3
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.align	3
.LEFDE4:
	.text
.Letext0:
	.file 3 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2d2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
	.4byte	.Ldebug_ranges0+0x30
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x5c
	.byte	0x3
	.byte	0x1e
	.byte	0x3
	.4byte	0x5c
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
	.byte	0x4
	.byte	0x5
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x6
	.string	"y"
	.byte	0x1
	.byte	0x5
	.byte	0xe
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	y
	.byte	0x6
	.string	"ry"
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	ry
	.byte	0x6
	.string	"rx"
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	rx
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x17
	.byte	0x5
	.4byte	0x8d
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x1cd
	.byte	0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0x18
	.byte	0x7
	.4byte	0x8d
	.4byte	.LLST1
	.byte	0x8
	.4byte	.LASF18
	.byte	0x1
	.byte	0x18
	.byte	0xd
	.4byte	0x8d
	.4byte	.LLST2
	.byte	0x9
	.4byte	0x28f
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x1
	.byte	0x19
	.byte	0xa
	.4byte	0x18a
	.byte	0xa
	.4byte	0x2a0
	.4byte	.LLST3
	.byte	0xb
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.byte	0xc
	.4byte	0x2ab
	.byte	0x1
	.byte	0x5a
	.byte	0xc
	.4byte	0x2b7
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x28f
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.byte	0x1
	.byte	0x1a
	.byte	0xa
	.byte	0xa
	.4byte	0x2a0
	.4byte	.LLST4
	.byte	0xb
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.byte	0xc
	.4byte	0x2ab
	.byte	0x1
	.byte	0x5a
	.byte	0xc
	.4byte	0x2b7
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF20
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x223
	.byte	0xf
	.string	"tid"
	.byte	0x1
	.byte	0xf
	.byte	0x12
	.4byte	0x8d
	.byte	0x1
	.byte	0x5a
	.byte	0x10
	.4byte	.Ldebug_ranges0+0
	.byte	0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x10
	.byte	0x24
	.4byte	0x223
	.byte	0xa
	.byte	0x3
	.8byte	y
	.byte	0x9f
	.byte	0x12
	.4byte	.LASF25
	.byte	0x1
	.byte	0x10
	.byte	0x2a
	.4byte	0x8d
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x8
	.4byte	0x8d
	.byte	0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x28f
	.byte	0xf
	.string	"tid"
	.byte	0x1
	.byte	0xa
	.byte	0x12
	.4byte	0x8d
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x11
	.4byte	.LASF23
	.byte	0x1
	.byte	0xc
	.byte	0x1f
	.4byte	0x223
	.byte	0xa
	.byte	0x3
	.8byte	y
	.byte	0x9f
	.byte	0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0xc
	.byte	0x26
	.4byte	0x8d
	.4byte	.LLST0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF31
	.byte	0x2
	.byte	0xf
	.byte	0x13
	.4byte	0x8d
	.byte	0x3
	.4byte	0x2c4
	.byte	0x15
	.string	"fp"
	.byte	0x2
	.byte	0xf
	.byte	0x29
	.4byte	0x2cf
	.byte	0x12
	.4byte	.LASF26
	.byte	0x2
	.byte	0x10
	.byte	0x15
	.4byte	0x94
	.byte	0x12
	.4byte	.LASF27
	.byte	0x2
	.byte	0x11
	.byte	0x15
	.4byte	0x94
	.byte	0
	.byte	0x16
	.4byte	0x2cf
	.byte	0x17
	.4byte	0x8d
	.byte	0
	.byte	0x13
	.byte	0x8
	.4byte	0x2c4
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
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
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
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.8byte	.LVL6
	.8byte	.LVL7
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL8
	.8byte	.LVL9
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL5
	.8byte	.LVL6
	.2byte	0xa
	.byte	0x3
	.8byte	thread0
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL6
	.8byte	.LVL8
	.2byte	0xa
	.byte	0x3
	.8byte	thread1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL1
	.8byte	.LVL2
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.8byte	0
	.8byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB7
	.8byte	.LBE7
	.8byte	.LBB8
	.8byte	.LBE8
	.8byte	0
	.8byte	0
	.8byte	.Ltext0
	.8byte	.Letext0
	.8byte	.LFB3
	.8byte	.LFE3
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF4:
	.string	"memory_order_acq_rel"
.LASF22:
	.string	"thread0"
.LASF20:
	.string	"thread1"
.LASF23:
	.string	"__atomic_store_ptr"
.LASF16:
	.string	"long long unsigned int"
.LASF28:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O2 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF14:
	.string	"long unsigned int"
.LASF26:
	.string	"argument"
.LASF12:
	.string	"short unsigned int"
.LASF10:
	.string	"unsigned char"
.LASF2:
	.string	"memory_order_acquire"
.LASF5:
	.string	"memory_order_seq_cst"
.LASF25:
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
.LASF24:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
