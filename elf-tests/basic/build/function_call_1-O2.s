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
	ret
.LFE0:
	.size	f, .-f
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 10 12 is_stmt 1
	.loc 1 11 3
	.loc 1 12 3
.LVL2:
.LBB4:
.LBB5:
	.loc 1 4 3
	.loc 1 5 3
	.loc 1 6 3
	.loc 1 6 5 is_stmt 0
	lui	a4,%hi(n)
	.loc 1 6 9
	lw	a5,%lo(n)(a4)
.LBE5:
.LBE4:
	.loc 1 10 12
	addi	sp,sp,-16
.LCFI0:
	.loc 1 15 8
	li	a0,5
.LBB8:
.LBB6:
	.loc 1 6 9
	addiw	a5,a5,5
.LBE6:
.LBE8:
	.loc 1 10 12
	sd	ra,8(sp)
.LCFI1:
.LBB9:
.LBB7:
	.loc 1 6 5
	sw	a5,%lo(n)(a4)
	.loc 1 7 3 is_stmt 1
.LVL3:
.LBE7:
.LBE9:
	.loc 1 14 3
	.loc 1 15 3
	.loc 1 15 8 is_stmt 0
	call	f
.LVL4:
	.loc 1 16 3 is_stmt 1
	.loc 1 17 1 is_stmt 0
	ld	ra,8(sp)
.LCFI2:
	li	a0,1
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
	.4byte	0x127
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ldebug_ranges0+0x40
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.string	"n"
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.4byte	0x3d
	.byte	0x9
	.byte	0x3
	.8byte	n
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x3d
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xc7
	.byte	0x5
	.string	"b"
	.byte	0x1
	.byte	0xb
	.byte	0x7
	.4byte	0x3d
	.byte	0x6
	.string	"p"
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.4byte	0xd6
	.byte	0xa
	.byte	0x3
	.8byte	f
	.byte	0x9f
	.byte	0x7
	.4byte	0xdc
	.8byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0xc
	.byte	0x7
	.4byte	0xb3
	.byte	0x8
	.4byte	0xeb
	.4byte	.LLST2
	.byte	0x9
	.4byte	.Ldebug_ranges0+0
	.byte	0xa
	.4byte	0xf5
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xb
	.8byte	.LVL4
	.4byte	0xdc
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x3d
	.4byte	0xd6
	.byte	0xe
	.4byte	0x3d
	.byte	0
	.byte	0xf
	.byte	0x8
	.4byte	0xc7
	.byte	0x10
	.string	"f"
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.4byte	0x3d
	.byte	0x1
	.4byte	0x100
	.byte	0x11
	.string	"a"
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.4byte	0x3d
	.byte	0x5
	.string	"x"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	0x3d
	.byte	0
	.byte	0x12
	.4byte	0xdc
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	0xeb
	.4byte	.LLST0
	.byte	0x13
	.4byte	0xf5
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
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
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
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
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
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x20
	.byte	0xb
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
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x2e
	.byte	0x1
	.byte	0x31
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
	.byte	0x13
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST2:
	.8byte	.LVL2
	.8byte	.LVL3
	.2byte	0x2
	.byte	0x35
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0
	.8byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1
	.8byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0
	.8byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1
	.8byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
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
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB4
	.8byte	.LBE4
	.8byte	.LBB8
	.8byte	.LBE8
	.8byte	.LBB9
	.8byte	.LBE9
	.8byte	0
	.8byte	0
	.8byte	.Ltext0
	.8byte	.Letext0
	.8byte	.LFB1
	.8byte	.LFE1
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O2 -std=c11 -fno-dwarf2-cfi-asm -ffreestanding"
.LASF1:
	.string	"function_call_1.c"
.LASF2:
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF3:
	.string	"main"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
