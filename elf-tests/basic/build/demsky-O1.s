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
	lw	a4,%lo(x+4)(a5)
	sext.w	a4,a4
	sext.w	a5,a4
.LVL1:
	.loc 1 10 9
.LBE6:
	.loc 1 10 5 is_stmt 0
	lui	a3,%hi(r1)
	sw	a5,%lo(r1)(a3)
	.loc 1 11 2 is_stmt 1
.LBB7:
	.loc 1 11 19
.LVL2:
	.loc 1 11 5
	.loc 1 11 5
	slli	a5,a5,2
.LVL3:
	lui	a3,%hi(y)
.LVL4:
	addi	a2,a3,%lo(y)
	add	a5,a5,a2
	amoswap.w zero,a4,0(a5)
.LVL5:
.LBE7:
	.loc 1 13 3
.LBB8:
	.loc 1 13 22
	.loc 1 13 8
	.loc 1 13 59
	lw	a5,%lo(y)(a3)
	sext.w	a5,a5
.LVL6:
	.loc 1 13 9
.LBE8:
	.loc 1 13 5 is_stmt 0
	lui	a4,%hi(r2)
	sw	a5,%lo(r2)(a4)
	.loc 1 14 2 is_stmt 1
.LBB9:
	.loc 1 14 19
.LVL7:
	.loc 1 14 5
	.loc 1 14 5
	lui	a4,%hi(y+4)
	addi	a4,a4,%lo(y+4)
	amoswap.w zero,a5,0(a4)
.LVL8:
.LBE9:
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
.LVL9:
	.loc 1 18 3
.LBB10:
	.loc 1 18 22
	.loc 1 18 8
	.loc 1 18 59
	lui	a5,%hi(y+4)
	lw	a4,%lo(y+4)(a5)
	sext.w	a4,a4
	sext.w	a5,a4
.LVL10:
	.loc 1 18 9
.LBE10:
	.loc 1 18 5 is_stmt 0
	lui	a3,%hi(r3)
	sw	a5,%lo(r3)(a3)
	.loc 1 19 2 is_stmt 1
.LBB11:
	.loc 1 19 19
.LVL11:
	.loc 1 19 5
	.loc 1 19 5
	slli	a5,a5,2
.LVL12:
	lui	a3,%hi(x)
.LVL13:
	addi	a2,a3,%lo(x)
	add	a5,a5,a2
	amoswap.w zero,a4,0(a5)
.LVL14:
.LBE11:
	.loc 1 21 3
.LBB12:
	.loc 1 21 22
	.loc 1 21 8
	.loc 1 21 59
	lw	a5,%lo(x)(a3)
	sext.w	a5,a5
.LVL15:
	.loc 1 21 9
.LBE12:
	.loc 1 21 5 is_stmt 0
	lui	a4,%hi(r4)
	sw	a5,%lo(r4)(a4)
	.loc 1 22 2 is_stmt 1
.LBB13:
	.loc 1 22 19
.LVL16:
	.loc 1 22 5
	.loc 1 22 5
	lui	a4,%hi(x+4)
	addi	a4,a4,%lo(x+4)
	amoswap.w zero,a5,0(a4)
.LVL17:
.LBE13:
	.loc 1 23 1 is_stmt 0
	ret
.LFE2:
	.size	thread2, .-thread2
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 25 12 is_stmt 1
	.loc 1 26 3
	.loc 1 27 3
.LVL18:
.LBB14:
.LBB15:
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
.LVL19:
#NO_APP
.LBE15:
.LBE14:
	.loc 1 28 3
.LBB16:
.LBB17:
	.loc 2 16 3
	.loc 2 16 21 is_stmt 0
	lui	a0,%hi(thread2)
.LVL20:
	addi	a0,a0,%lo(thread2)
	.loc 2 17 3 is_stmt 1
	.loc 2 18 3
#APP
# 18 "thread_start_riscv64.h" 1
	.word 0xC0DE000B
# 0 "" 2
	.loc 2 23 3
.LVL21:
#NO_APP
.LBE17:
.LBE16:
	.loc 1 29 3
	.loc 1 30 1 is_stmt 0
	li	a0,1
.LVL22:
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
	.4byte	0x470
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
	.4byte	0x91
	.4byte	0xc4
	.byte	0x7
	.4byte	0x9f
	.byte	0x1
	.byte	0
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	0xb4
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x8
	.string	"y"
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0xb4
	.byte	0x9
	.byte	0x3
	.8byte	y
	.byte	0x8
	.string	"r1"
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r1
	.byte	0x8
	.string	"r2"
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r2
	.byte	0x8
	.string	"r3"
	.byte	0x1
	.byte	0x7
	.byte	0xd
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r3
	.byte	0x8
	.string	"r4"
	.byte	0x1
	.byte	0x7
	.byte	0x11
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r4
	.byte	0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x19
	.byte	0x5
	.4byte	0x91
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x20b
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1a
	.byte	0x7
	.4byte	0x91
	.4byte	.LLST6
	.byte	0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.byte	0xd
	.4byte	0x91
	.4byte	.LLST7
	.byte	0xb
	.4byte	0x42d
	.8byte	.LBB14
	.8byte	.LBE14-.LBB14
	.byte	0x1
	.byte	0x1b
	.byte	0xa
	.4byte	0x1c8
	.byte	0xc
	.4byte	0x43e
	.4byte	.LLST8
	.byte	0xd
	.8byte	.LBB15
	.8byte	.LBE15-.LBB15
	.byte	0xe
	.4byte	0x449
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.4byte	0x455
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	0x42d
	.8byte	.LBB16
	.8byte	.LBE16-.LBB16
	.byte	0x1
	.byte	0x1c
	.byte	0xa
	.byte	0xc
	.4byte	0x43e
	.4byte	.LLST9
	.byte	0xd
	.8byte	.LBB17
	.8byte	.LBE17-.LBB17
	.byte	0xe
	.4byte	0x449
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.4byte	0x455
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
	.4byte	0x319
	.byte	0x11
	.string	"tid"
	.byte	0x1
	.byte	0x11
	.byte	0x12
	.4byte	0x91
	.byte	0x1
	.byte	0x5a
	.byte	0x12
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.4byte	0x270
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x12
	.byte	0x22
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	y+4
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0x12
	.byte	0x28
	.4byte	0x91
	.byte	0
	.byte	0x12
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.4byte	0x2a6
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x13
	.byte	0x1f
	.4byte	0x319
	.4byte	.LLST3
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x13
	.byte	0x26
	.4byte	0x91
	.4byte	.LLST4
	.byte	0
	.byte	0x12
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.4byte	0x2df
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x15
	.byte	0x22
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	x
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0x15
	.byte	0x28
	.4byte	0x91
	.byte	0
	.byte	0xd
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0x16
	.byte	0x1f
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	x+4
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x16
	.byte	0x26
	.4byte	0x91
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x8
	.4byte	0x91
	.byte	0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x42d
	.byte	0x11
	.string	"tid"
	.byte	0x1
	.byte	0x9
	.byte	0x12
	.4byte	0x91
	.byte	0x1
	.byte	0x5a
	.byte	0x12
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x384
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa
	.byte	0x22
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	x+4
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.byte	0x28
	.4byte	0x91
	.byte	0
	.byte	0x12
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x3ba
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0xb
	.byte	0x1f
	.4byte	0x319
	.4byte	.LLST0
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xb
	.byte	0x26
	.4byte	0x91
	.4byte	.LLST1
	.byte	0
	.byte	0x12
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x3f3
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0xd
	.byte	0x22
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	y
	.byte	0x9f
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd
	.byte	0x28
	.4byte	0x91
	.byte	0
	.byte	0xd
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0xe
	.byte	0x1f
	.4byte	0x319
	.byte	0xa
	.byte	0x3
	.8byte	y+4
	.byte	0x9f
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xe
	.byte	0x26
	.4byte	0x91
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF31
	.byte	0x2
	.byte	0xf
	.byte	0x13
	.4byte	0x91
	.byte	0x3
	.4byte	0x462
	.byte	0x17
	.string	"fp"
	.byte	0x2
	.byte	0xf
	.byte	0x29
	.4byte	0x46d
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0x10
	.byte	0x15
	.4byte	0x98
	.byte	0x14
	.4byte	.LASF27
	.byte	0x2
	.byte	0x11
	.byte	0x15
	.4byte	0x98
	.byte	0
	.byte	0x18
	.4byte	0x46d
	.byte	0x19
	.4byte	0x91
	.byte	0
	.byte	0x15
	.byte	0x8
	.4byte	0x462
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
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
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0xa
	.byte	0x3
	.8byte	thread1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0xa
	.byte	0x3
	.8byte	thread2
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x15
	.byte	0x7f
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
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1e
	.byte	0x3
	.8byte	r3
	.byte	0x94
	.byte	0x4
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
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE2-.Ltext0
	.2byte	0x1e
	.byte	0x3
	.8byte	r3
	.byte	0x94
	.byte	0x4
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
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	r3
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x15
	.byte	0x7f
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
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1e
	.byte	0x3
	.8byte	r1
	.byte	0x94
	.byte	0x4
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
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE1-.Ltext0
	.2byte	0x1e
	.byte	0x3
	.8byte	r1
	.byte	0x94
	.byte	0x4
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
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x9
	.byte	0x3
	.8byte	r1
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
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
.LASF28:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O1 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF25:
	.string	"thread1"
.LASF20:
	.string	"thread2"
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
.LASF22:
	.string	"__atomic_store_ptr"
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
.LASF23:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
