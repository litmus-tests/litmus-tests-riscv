	.file	"demsky.c"
	.option nopic
	.text
.Ltext0:
	.align	2
	.globl	thread1
	.type	thread1, @function
thread1:
.LFB1:
	.file 1 "demsky.c"
	.loc 1 9 23
.LVL0:
	.loc 1 10 3
.LBB6:
	.loc 1 10 22
	.loc 1 10 8
	.loc 1 10 59
	lui	a5,%hi(x+4)
	lw	a5,%lo(x+4)(a5)
.LBE6:
.LBB7:
	.loc 1 11 5 is_stmt 0
	lui	a3,%hi(y)
	addi	a1,a3,%lo(y)
.LBE7:
.LBB8:
	.loc 1 10 59
	sext.w	a5,a5
	sext.w	a2,a5
.LVL1:
	.loc 1 10 9 is_stmt 1
.LBE8:
.LBB9:
	.loc 1 11 5 is_stmt 0
	slli	a4,a2,2
.LBE9:
	.loc 1 10 5
	lui	a0,%hi(r1)
.LVL2:
	sw	a2,%lo(r1)(a0)
	.loc 1 11 2 is_stmt 1
.LBB10:
	.loc 1 11 19
.LVL3:
	.loc 1 11 5
	.loc 1 11 5
	add	a4,a4,a1
	amoswap.w zero,a5,0(a4)
.LVL4:
.LBE10:
	.loc 1 13 3
.LBB11:
	.loc 1 13 22
	.loc 1 13 8
	.loc 1 13 59
	lw	a5,%lo(y)(a3)
.LBE11:
	.loc 1 13 5 is_stmt 0
	lui	a4,%hi(r2)
.LBB12:
	.loc 1 13 59
	sext.w	a5,a5
.LVL5:
	.loc 1 13 9 is_stmt 1
.LBE12:
	.loc 1 13 5 is_stmt 0
	sw	a5,%lo(r2)(a4)
	.loc 1 14 2 is_stmt 1
.LBB13:
	.loc 1 14 19
.LVL6:
	.loc 1 14 5
	.loc 1 14 5
	lui	a4,%hi(y+4)
	addi	a4,a4,%lo(y+4)
	amoswap.w zero,a5,0(a4)
.LVL7:
.LBE13:
	.loc 1 15 1 is_stmt 0
	ret
.LFE1:
	.size	thread1, .-thread1
	.align	2
	.globl	thread2
	.type	thread2, @function
thread2:
.LFB2:
	.loc 1 17 23 is_stmt 1
.LVL8:
	.loc 1 18 3
.LBB14:
	.loc 1 18 22
	.loc 1 18 8
	.loc 1 18 59
	lui	a5,%hi(y+4)
	lw	a5,%lo(y+4)(a5)
.LBE14:
.LBB15:
	.loc 1 19 5 is_stmt 0
	lui	a3,%hi(x)
	addi	a1,a3,%lo(x)
.LBE15:
.LBB16:
	.loc 1 18 59
	sext.w	a5,a5
	sext.w	a2,a5
.LVL9:
	.loc 1 18 9 is_stmt 1
.LBE16:
.LBB17:
	.loc 1 19 5 is_stmt 0
	slli	a4,a2,2
.LBE17:
	.loc 1 18 5
	lui	a0,%hi(r3)
.LVL10:
	sw	a2,%lo(r3)(a0)
	.loc 1 19 2 is_stmt 1
.LBB18:
	.loc 1 19 19
.LVL11:
	.loc 1 19 5
	.loc 1 19 5
	add	a4,a4,a1
	amoswap.w zero,a5,0(a4)
.LVL12:
.LBE18:
	.loc 1 21 3
.LBB19:
	.loc 1 21 22
	.loc 1 21 8
	.loc 1 21 59
	lw	a5,%lo(x)(a3)
.LBE19:
	.loc 1 21 5 is_stmt 0
	lui	a4,%hi(r4)
.LBB20:
	.loc 1 21 59
	sext.w	a5,a5
.LVL13:
	.loc 1 21 9 is_stmt 1
.LBE20:
	.loc 1 21 5 is_stmt 0
	sw	a5,%lo(r4)(a4)
	.loc 1 22 2 is_stmt 1
.LBB21:
	.loc 1 22 19
.LVL14:
	.loc 1 22 5
	.loc 1 22 5
	lui	a4,%hi(x+4)
	addi	a4,a4,%lo(x+4)
	amoswap.w zero,a5,0(a4)
.LVL15:
.LBE21:
	.loc 1 23 1 is_stmt 0
	ret
.LFE2:
	.size	thread2, .-thread2
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 25 12 is_stmt 1
	.loc 1 26 3
	.loc 1 27 3
.LVL16:
.LBB22:
.LBB23:
	.file 2 "thread_start_riscv64.h"
	.loc 2 16 3
	.loc 2 16 21 is_stmt 0
	lui	a0,%hi(thread1)
	addi	a0,a0,%lo(thread1)
	.loc 2 17 3 is_stmt 1
	.loc 2 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 2 23 3
.LVL17:
#NO_APP
.LBE23:
.LBE22:
	.loc 1 28 3
.LBB24:
.LBB25:
	.loc 2 16 3
	.loc 2 16 21 is_stmt 0
	lui	a0,%hi(thread2)
.LVL18:
	addi	a0,a0,%lo(thread2)
	.loc 2 17 3 is_stmt 1
	.loc 2 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 2 23 3
.LVL19:
#NO_APP
.LBE25:
.LBE24:
	.loc 1 29 3
	.loc 1 30 1 is_stmt 0
	li	a0,1
.LVL20:
	ret
.LFE3:
	.size	main, .-main
	.comm	r4,4,4
	.comm	r3,4,4
	.comm	r2,4,4
	.comm	r1,4,4
	.globl	y
	.globl	x
	.section	.sbss,"aw",@nobits
	.align	3
	.type	x, @object
	.size	x, 8
x:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	y, @object
	.size	y, 8
y:
	.word	1
	.word	1
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
	.4byte	0x44c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
	.4byte	.Ldebug_ranges0+0x140
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
	.4byte	0x8d
	.4byte	0xc0
	.byte	0x7
	.4byte	0x9b
	.byte	0x1
	.byte	0
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	0xb0
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x8
	.string	"y"
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0xb0
	.byte	0x9
	.byte	0x3
	.8byte	y
	.byte	0x8
	.string	"r1"
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	r1
	.byte	0x8
	.string	"r2"
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	r2
	.byte	0x8
	.string	"r3"
	.byte	0x1
	.byte	0x7
	.byte	0xd
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	r3
	.byte	0x8
	.string	"r4"
	.byte	0x1
	.byte	0x7
	.byte	0x11
	.4byte	0x8d
	.byte	0x9
	.byte	0x3
	.8byte	r4
	.byte	0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x19
	.byte	0x5
	.4byte	0x8d
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x207
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1a
	.byte	0x7
	.4byte	0x8d
	.4byte	.LLST6
	.byte	0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.byte	0xd
	.4byte	0x8d
	.4byte	.LLST7
	.byte	0xb
	.4byte	0x409
	.8byte	.LBB22
	.8byte	.LBE22-.LBB22
	.byte	0x1
	.byte	0x1b
	.byte	0xa
	.4byte	0x1c4
	.byte	0xc
	.4byte	0x41a
	.4byte	.LLST8
	.byte	0xd
	.8byte	.LBB23
	.8byte	.LBE23-.LBB23
	.byte	0xe
	.4byte	0x425
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.4byte	0x431
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	0x409
	.8byte	.LBB24
	.8byte	.LBE24-.LBB24
	.byte	0x1
	.byte	0x1c
	.byte	0xa
	.byte	0xc
	.4byte	0x41a
	.4byte	.LLST9
	.byte	0xd
	.8byte	.LBB25
	.8byte	.LBE25-.LBB25
	.byte	0xe
	.4byte	0x425
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.4byte	0x431
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF20
	.byte	0x1
	.byte	0x11
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x305
	.byte	0x11
	.string	"tid"
	.byte	0x1
	.byte	0x11
	.byte	0x12
	.4byte	0x8d
	.4byte	.LLST3
	.byte	0x12
	.4byte	.Ldebug_ranges0+0xa0
	.4byte	0x262
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x12
	.byte	0x22
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	y+4
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0x12
	.byte	0x28
	.4byte	0x8d
	.byte	0
	.byte	0x12
	.4byte	.Ldebug_ranges0+0xd0
	.4byte	0x29e
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0x13
	.byte	0x1f
	.4byte	0x305
	.byte	0x15
	.byte	0x7c
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.8byte	x
	.byte	0x22
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x13
	.byte	0x26
	.4byte	0x8d
	.4byte	.LLST4
	.byte	0
	.byte	0x12
	.4byte	.Ldebug_ranges0+0x110
	.4byte	0x2cb
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x15
	.byte	0x22
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	x
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0x15
	.byte	0x28
	.4byte	0x8d
	.byte	0
	.byte	0xd
	.8byte	.LBB21
	.8byte	.LBE21-.LBB21
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0x16
	.byte	0x1f
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	x+4
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x16
	.byte	0x26
	.4byte	0x8d
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x8
	.4byte	0x8d
	.byte	0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x409
	.byte	0x11
	.string	"tid"
	.byte	0x1
	.byte	0x9
	.byte	0x12
	.4byte	0x8d
	.4byte	.LLST0
	.byte	0x12
	.4byte	.Ldebug_ranges0+0
	.4byte	0x366
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa
	.byte	0x22
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	x+4
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.byte	0x28
	.4byte	0x8d
	.byte	0
	.byte	0x12
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0x3a2
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0xb
	.byte	0x1f
	.4byte	0x305
	.byte	0x15
	.byte	0x7c
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.8byte	y
	.byte	0x22
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xb
	.byte	0x26
	.4byte	0x8d
	.4byte	.LLST1
	.byte	0
	.byte	0x12
	.4byte	.Ldebug_ranges0+0x70
	.4byte	0x3cf
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0xd
	.byte	0x22
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	y
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd
	.byte	0x28
	.4byte	0x8d
	.byte	0
	.byte	0xd
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0xe
	.byte	0x1f
	.4byte	0x305
	.byte	0xa
	.byte	0x3
	.8byte	y+4
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xe
	.byte	0x26
	.4byte	0x8d
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF31
	.byte	0x2
	.byte	0xf
	.byte	0x13
	.4byte	0x8d
	.byte	0x3
	.4byte	0x43e
	.byte	0x17
	.string	"fp"
	.byte	0x2
	.byte	0xf
	.byte	0x29
	.4byte	0x449
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0x10
	.byte	0x15
	.4byte	0x94
	.byte	0x14
	.4byte	.LASF27
	.byte	0x2
	.byte	0x11
	.byte	0x15
	.4byte	0x94
	.byte	0
	.byte	0x18
	.4byte	0x449
	.byte	0x19
	.4byte	0x8d
	.byte	0
	.byte	0x15
	.byte	0x8
	.4byte	0x43e
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST6:
	.8byte	.LVL17
	.8byte	.LVL18
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL19
	.8byte	.LVL20
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL16
	.8byte	.LVL17
	.2byte	0xa
	.byte	0x3
	.8byte	thread1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL17
	.8byte	.LVL19
	.2byte	0xa
	.byte	0x3
	.8byte	thread2
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL8
	.8byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10
	.8byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL11
	.8byte	.LVL12
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL14
	.8byte	.LVL15
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0
	.8byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2
	.8byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL3
	.8byte	.LVL4
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6
	.8byte	.LVL7
	.2byte	0x1
	.byte	0x5f
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
	.8byte	.LBB6
	.8byte	.LBE6
	.8byte	.LBB8
	.8byte	.LBE8
	.8byte	0
	.8byte	0
	.8byte	.LBB7
	.8byte	.LBE7
	.8byte	.LBB9
	.8byte	.LBE9
	.8byte	.LBB10
	.8byte	.LBE10
	.8byte	0
	.8byte	0
	.8byte	.LBB11
	.8byte	.LBE11
	.8byte	.LBB12
	.8byte	.LBE12
	.8byte	0
	.8byte	0
	.8byte	.LBB14
	.8byte	.LBE14
	.8byte	.LBB16
	.8byte	.LBE16
	.8byte	0
	.8byte	0
	.8byte	.LBB15
	.8byte	.LBE15
	.8byte	.LBB17
	.8byte	.LBE17
	.8byte	.LBB18
	.8byte	.LBE18
	.8byte	0
	.8byte	0
	.8byte	.LBB19
	.8byte	.LBE19
	.8byte	.LBB20
	.8byte	.LBE20
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
.LASF25:
	.string	"thread1"
.LASF20:
	.string	"thread2"
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
.LASF24:
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
.LASF31:
	.string	"thread_start"
.LASF15:
	.string	"long long int"
.LASF29:
	.string	"demsky.c"
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
.LASF22:
	.string	"__atomic_store_ptr"
.LASF23:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
