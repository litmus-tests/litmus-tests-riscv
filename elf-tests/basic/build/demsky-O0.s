	.file	"demsky.c"
	.option nopic
	.text
.Ltext0:
	.align	2
	.type	thread_start, @function
thread_start:
.LFB0:
	.file 1 "thread_start_riscv64.h"
	.loc 1 15 53
	addi	sp,sp,-32
.LCFI0:
	sd	s0,24(sp)
.LCFI1:
	addi	s0,sp,32
.LCFI2:
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
.LCFI3:
	addi	sp,sp,32
.LCFI4:
	jr	ra
.LFE0:
	.size	thread_start, .-thread_start
	.globl	x
	.section	.sbss,"aw",@nobits
	.align	3
	.type	x, @object
	.size	x, 8
x:
	.zero	8
	.globl	y
	.section	.sdata,"aw"
	.align	3
	.type	y, @object
	.size	y, 8
y:
	.word	1
	.word	1
	.comm	r1,4,4
	.comm	r2,4,4
	.comm	r3,4,4
	.comm	r4,4,4
	.text
	.align	2
	.globl	thread1
	.type	thread1, @function
thread1:
.LFB1:
	.file 2 "demsky.c"
	.loc 2 9 23
	addi	sp,sp,-80
.LCFI5:
	sd	s0,72(sp)
.LCFI6:
	addi	s0,sp,80
.LCFI7:
	mv	a5,a0
	sw	a5,-68(s0)
.LBB2:
	.loc 2 10 34
	lui	a5,%hi(x+4)
	addi	a5,a5,%lo(x+4)
	sd	a5,-24(s0)
	.loc 2 10 59
	ld	a5,-24(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-52(s0)
	.loc 2 10 9
	lw	a4,-52(s0)
.LBE2:
	.loc 2 10 5
	lui	a5,%hi(r1)
	sw	a4,%lo(r1)(a5)
.LBB3:
	.loc 2 11 4
	lui	a5,%hi(r1)
	lw	a5,%lo(r1)(a5)
	.loc 2 11 31
	slli	a4,a5,2
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 11 38
	lui	a5,%hi(r1)
	lw	a5,%lo(r1)(a5)
	sw	a5,-56(s0)
	.loc 2 11 5
	lw	a5,-56(s0)
	sext.w	a4,a5
	ld	a5,-32(s0)
	amoswap.w zero,a4,0(a5)
.LBE3:
.LBB4:
	.loc 2 13 34
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	sd	a5,-40(s0)
	.loc 2 13 59
	ld	a5,-40(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-60(s0)
	.loc 2 13 9
	lw	a4,-60(s0)
.LBE4:
	.loc 2 13 5
	lui	a5,%hi(r2)
	sw	a4,%lo(r2)(a5)
.LBB5:
	.loc 2 14 31
	lui	a5,%hi(y+4)
	addi	a5,a5,%lo(y+4)
	sd	a5,-48(s0)
	.loc 2 14 38
	lui	a5,%hi(r2)
	lw	a5,%lo(r2)(a5)
	sw	a5,-64(s0)
	.loc 2 14 5
	lw	a5,-64(s0)
	sext.w	a4,a5
	ld	a5,-48(s0)
	amoswap.w zero,a4,0(a5)
.LBE5:
	.loc 2 15 1
	nop
	ld	s0,72(sp)
.LCFI8:
	addi	sp,sp,80
.LCFI9:
	jr	ra
.LFE1:
	.size	thread1, .-thread1
	.align	2
	.globl	thread2
	.type	thread2, @function
thread2:
.LFB2:
	.loc 2 17 23
	addi	sp,sp,-80
.LCFI10:
	sd	s0,72(sp)
.LCFI11:
	addi	s0,sp,80
.LCFI12:
	mv	a5,a0
	sw	a5,-68(s0)
.LBB6:
	.loc 2 18 34
	lui	a5,%hi(y+4)
	addi	a5,a5,%lo(y+4)
	sd	a5,-24(s0)
	.loc 2 18 59
	ld	a5,-24(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-52(s0)
	.loc 2 18 9
	lw	a4,-52(s0)
.LBE6:
	.loc 2 18 5
	lui	a5,%hi(r3)
	sw	a4,%lo(r3)(a5)
.LBB7:
	.loc 2 19 4
	lui	a5,%hi(r3)
	lw	a5,%lo(r3)(a5)
	.loc 2 19 31
	slli	a4,a5,2
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 19 38
	lui	a5,%hi(r3)
	lw	a5,%lo(r3)(a5)
	sw	a5,-56(s0)
	.loc 2 19 5
	lw	a5,-56(s0)
	sext.w	a4,a5
	ld	a5,-32(s0)
	amoswap.w zero,a4,0(a5)
.LBE7:
.LBB8:
	.loc 2 21 34
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sd	a5,-40(s0)
	.loc 2 21 59
	ld	a5,-40(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sext.w	a5,a5
	sw	a5,-60(s0)
	.loc 2 21 9
	lw	a4,-60(s0)
.LBE8:
	.loc 2 21 5
	lui	a5,%hi(r4)
	sw	a4,%lo(r4)(a5)
.LBB9:
	.loc 2 22 31
	lui	a5,%hi(x+4)
	addi	a5,a5,%lo(x+4)
	sd	a5,-48(s0)
	.loc 2 22 38
	lui	a5,%hi(r4)
	lw	a5,%lo(r4)(a5)
	sw	a5,-64(s0)
	.loc 2 22 5
	lw	a5,-64(s0)
	sext.w	a4,a5
	ld	a5,-48(s0)
	amoswap.w zero,a4,0(a5)
.LBE9:
	.loc 2 23 1
	nop
	ld	s0,72(sp)
.LCFI13:
	addi	sp,sp,80
.LCFI14:
	jr	ra
.LFE2:
	.size	thread2, .-thread2
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 2 25 12
	addi	sp,sp,-32
.LCFI15:
	sd	ra,24(sp)
	sd	s0,16(sp)
.LCFI16:
	addi	s0,sp,32
.LCFI17:
	.loc 2 27 10
	lui	a5,%hi(thread1)
	addi	a0,a5,%lo(thread1)
	call	thread_start
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 28 10
	lui	a5,%hi(thread2)
	addi	a0,a5,%lo(thread2)
	call	thread_start
	mv	a5,a0
	sw	a5,-24(s0)
	.loc 2 29 10
	li	a5,1
	.loc 2 30 1
	mv	a0,a5
	ld	ra,24(sp)
.LCFI18:
	ld	s0,16(sp)
.LCFI19:
	addi	sp,sp,32
.LCFI20:
	jr	ra
.LFE3:
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
	.byte	0x20
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
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI5-.LFB1
	.byte	0xe
	.byte	0x50
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0x88
	.byte	0x2
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI10-.LFB2
	.byte	0xe
	.byte	0x50
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0x88
	.byte	0x2
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI15-.LFB3
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0x81
	.byte	0x2
	.byte	0x88
	.byte	0x4
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xc1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE6:
	.text
.Letext0:
	.file 3 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3d8
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
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	0xb4
	.byte	0x9
	.byte	0x3
	.8byte	x
	.byte	0x8
	.string	"y"
	.byte	0x2
	.byte	0x5
	.byte	0x5
	.4byte	0xb4
	.byte	0x9
	.byte	0x3
	.8byte	y
	.byte	0x8
	.string	"r1"
	.byte	0x2
	.byte	0x7
	.byte	0x5
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r1
	.byte	0x8
	.string	"r2"
	.byte	0x2
	.byte	0x7
	.byte	0x9
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r2
	.byte	0x8
	.string	"r3"
	.byte	0x2
	.byte	0x7
	.byte	0xd
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r3
	.byte	0x8
	.string	"r4"
	.byte	0x2
	.byte	0x7
	.byte	0x11
	.4byte	0x91
	.byte	0x9
	.byte	0x3
	.8byte	r4
	.byte	0x9
	.4byte	.LASF19
	.byte	0x2
	.byte	0x19
	.byte	0x5
	.4byte	0x91
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x181
	.byte	0xa
	.4byte	.LASF17
	.byte	0x2
	.byte	0x1a
	.byte	0x7
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xa
	.4byte	.LASF18
	.byte	0x2
	.byte	0x1a
	.byte	0xd
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xb
	.4byte	.LASF20
	.byte	0x2
	.byte	0x11
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x27c
	.byte	0xc
	.string	"tid"
	.byte	0x2
	.byte	0x11
	.byte	0x12
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0xd
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x1e3
	.byte	0xa
	.4byte	.LASF21
	.byte	0x2
	.byte	0x12
	.byte	0x22
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF22
	.byte	0x2
	.byte	0x12
	.byte	0x28
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0xd
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x217
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x13
	.byte	0x1f
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0x13
	.byte	0x26
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xd
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x24b
	.byte	0xa
	.4byte	.LASF21
	.byte	0x2
	.byte	0x15
	.byte	0x22
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.4byte	.LASF22
	.byte	0x2
	.byte	0x15
	.byte	0x28
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0
	.byte	0xe
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x16
	.byte	0x1f
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0x16
	.byte	0x26
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x8
	.4byte	0x91
	.byte	0xb
	.4byte	.LASF25
	.byte	0x2
	.byte	0x9
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x37d
	.byte	0xc
	.string	"tid"
	.byte	0x2
	.byte	0x9
	.byte	0x12
	.4byte	0x91
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x2e4
	.byte	0xa
	.4byte	.LASF21
	.byte	0x2
	.byte	0xa
	.byte	0x22
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF22
	.byte	0x2
	.byte	0xa
	.byte	0x28
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0xd
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x318
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0xb
	.byte	0x1f
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0xb
	.byte	0x26
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xd
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x34c
	.byte	0xa
	.4byte	.LASF21
	.byte	0x2
	.byte	0xd
	.byte	0x22
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.4byte	.LASF22
	.byte	0x2
	.byte	0xd
	.byte	0x28
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0xe
	.byte	0x1f
	.4byte	0x27c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0xe
	.byte	0x26
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF31
	.byte	0x1
	.byte	0xf
	.byte	0x13
	.4byte	0x91
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ca
	.byte	0xc
	.string	"fp"
	.byte	0x1
	.byte	0xf
	.byte	0x29
	.4byte	0x3d5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF26
	.byte	0x1
	.byte	0x10
	.byte	0x15
	.4byte	0x98
	.byte	0x1
	.byte	0x5a
	.byte	0xa
	.4byte	.LASF27
	.byte	0x1
	.byte	0x11
	.byte	0x15
	.4byte	0x98
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x11
	.4byte	0x3d5
	.byte	0x12
	.4byte	0x91
	.byte	0
	.byte	0xf
	.byte	0x8
	.4byte	0x3ca
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
	.byte	0x96,0x42
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
.LASF23:
	.string	"__atomic_store_ptr"
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
.LASF28:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF9:
	.string	"signed char"
.LASF24:
	.string	"__atomic_store_tmp"
.LASF7:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
