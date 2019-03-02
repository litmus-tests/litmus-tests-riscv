	.file	"function_call_1.c"
	.option nopic
	.text
.Ltext0:
	.align	2
	.globl	f
	.type	f, @function
f:
.LFB0:
	.file 1 "function_call_1.c"
	.loc 1 3 14
.LVL0:
	.loc 1 4 3
	.loc 1 5 3
	.loc 1 6 3
	.loc 1 6 9 is_stmt 0
	lui	a4,%hi(n)
	lw	a5,%lo(n)(a4)
	addw	a0,a5,a0
.LVL1:
	.loc 1 6 5
	sw	a0,%lo(n)(a4)
	.loc 1 7 3 is_stmt 1
	.loc 1 8 1 is_stmt 0
	sext.w	a0,a0
	ret
.LFE0:
	.size	f, .-f
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 10 12 is_stmt 1
	addi	sp,sp,-16
.LCFI0:
	sd	ra,8(sp)
.LCFI1:
	.loc 1 11 3
	.loc 1 12 3
	.loc 1 12 7 is_stmt 0
	li	a0,5
	call	f
.LVL2:
	.loc 1 14 3 is_stmt 1
	.loc 1 15 3
	.loc 1 15 8 is_stmt 0
	li	a0,5
	call	f
.LVL3:
	.loc 1 16 3 is_stmt 1
	.loc 1 17 1 is_stmt 0
	li	a0,1
	ld	ra,8(sp)
.LCFI2:
	addi	sp,sp,16
.LCFI3:
	jr	ra
.LFE1:
	.size	main, .-main
	.globl	n
	.section	.sdata,"aw"
	.align	2
	.type	n, @object
	.size	n, 4
n:
	.word	3
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
	.align	3
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x81
	.byte	0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.byte	0
	.align	3
.LEFDE2:
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xff
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
	.4byte	0xb4
	.byte	0x5
	.string	"b"
	.byte	0x1
	.byte	0xb
	.byte	0x7
	.4byte	0x41
	.byte	0x6
	.string	"p"
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.4byte	0xc3
	.byte	0xa
	.byte	0x3
	.8byte	f
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL2
	.4byte	0xc9
	.4byte	0xa0
	.byte	0x8
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x9
	.8byte	.LVL3
	.4byte	0xc9
	.byte	0x8
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x41
	.4byte	0xc3
	.byte	0xb
	.4byte	0x41
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0xb4
	.byte	0xd
	.string	"f"
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.4byte	0x41
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.string	"a"
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.4byte	0x41
	.4byte	.LLST0
	.byte	0xf
	.string	"x"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	0x41
	.4byte	.LLST1
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
	.byte	0x97,0x42
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
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
.LASF1:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O1 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF2:
	.string	"function_call_1.c"
.LASF3:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF0:
	.string	"main"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
