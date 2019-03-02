	.file	"thread_start_test.c"
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
	.comm	new_tid,4,4
	.align	2
	.globl	f
	.type	f, @function
f:
.LFB1:
	.file 2 "thread_start_test.c"
	.loc 2 5 17
	addi	sp,sp,-32
.LCFI5:
	sd	s0,24(sp)
.LCFI6:
	addi	s0,sp,32
.LCFI7:
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 6 11
	lui	a5,%hi(new_tid)
	lw	a4,-20(s0)
	sw	a4,%lo(new_tid)(a5)
	.loc 2 7 1
	nop
	ld	s0,24(sp)
.LCFI8:
	addi	sp,sp,32
.LCFI9:
	jr	ra
.LFE1:
	.size	f, .-f
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 2 9 12
	addi	sp,sp,-16
.LCFI10:
	sd	ra,8(sp)
	sd	s0,0(sp)
.LCFI11:
	addi	s0,sp,16
.LCFI12:
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
.LCFI13:
	ld	s0,0(sp)
.LCFI14:
	addi	sp,sp,16
.LCFI15:
	jr	ra
.LFE2:
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
	.byte	0x20
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
	.byte	0x10
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0x81
	.byte	0x2
	.byte	0x88
	.byte	0x4
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xc1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE4:
	.text
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
	.byte	0xf
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
	.byte	0xf
	.byte	0x29
	.4byte	0xec
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x10
	.byte	0x15
	.4byte	0xf2
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.4byte	.LASF1
	.byte	0x1
	.byte	0x11
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
.LASF5:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF3:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF1:
	.string	"result"
.LASF4:
	.string	"thread_start_test.c"
.LASF2:
	.string	"long int"
.LASF7:
	.string	"main"
.LASF0:
	.string	"argument"
.LASF8:
	.string	"thread_start"
.LASF6:
	.string	"new_tid"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
