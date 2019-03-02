	.file	"function_call_1.c"
	.option nopic
	.text
.Ltext0:
	.globl	n
	.section	.sdata,"aw"
	.align	2
	.type	n, @object
	.size	n, 4
n:
	.word	3
	.text
	.align	2
	.globl	f
	.type	f, @function
f:
.LFB0:
	.file 1 "function_call_1.c"
	.loc 1 3 14
	addi	sp,sp,-48
.LCFI0:
	sd	s0,40(sp)
.LCFI1:
	addi	s0,sp,48
.LCFI2:
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 5 5
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 6 9
	lui	a5,%hi(n)
	lw	a5,%lo(n)(a5)
	lw	a4,-36(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	.loc 1 6 5
	lui	a5,%hi(n)
	sw	a4,%lo(n)(a5)
	.loc 1 7 10
	lui	a5,%hi(n)
	lw	a5,%lo(n)(a5)
	.loc 1 8 1
	mv	a0,a5
	ld	s0,40(sp)
.LCFI3:
	addi	sp,sp,48
.LCFI4:
	jr	ra
.LFE0:
	.size	f, .-f
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 10 12
	addi	sp,sp,-32
.LCFI5:
	sd	ra,24(sp)
	sd	s0,16(sp)
.LCFI6:
	addi	s0,sp,32
.LCFI7:
	.loc 1 12 7
	li	a0,5
	call	f
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 1 14 9
	lui	a5,%hi(f)
	addi	a5,a5,%lo(f)
	sd	a5,-32(s0)
	.loc 1 15 8
	ld	a5,-32(s0)
	li	a0,5
	jalr	a5
.LVL0:
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 1 16 10
	li	a5,1
	.loc 1 17 1
	mv	a0,a5
	ld	ra,24(sp)
.LCFI8:
	ld	s0,16(sp)
.LCFI9:
	addi	sp,sp,32
.LCFI10:
	jr	ra
.LFE1:
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
	.byte	0x30
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
	.byte	0x81
	.byte	0x2
	.byte	0x88
	.byte	0x4
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xc
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xc1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xc8
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.byte	0x2
	.align	3
.LEFDE2:
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xce
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF1
	.byte	0xc
	.4byte	.LASF2
	.4byte	.LASF3
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.string	"n"
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.4byte	0x41
	.byte	0x9
	.byte	0x3
	.8byte	n
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x41
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x85
	.byte	0x5
	.string	"b"
	.byte	0x1
	.byte	0xb
	.byte	0x7
	.4byte	0x41
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x5
	.string	"p"
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.4byte	0x94
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x6
	.4byte	0x41
	.4byte	0x94
	.byte	0x7
	.4byte	0x41
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x85
	.byte	0x9
	.string	"f"
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.4byte	0x41
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.string	"a"
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.4byte	0x41
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x5
	.string	"x"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	0x41
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
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
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.string	"function_call_1.c"
.LASF3:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF1:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF0:
	.string	"main"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
