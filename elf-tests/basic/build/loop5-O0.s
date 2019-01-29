	.file	"loop.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	t
	.section	.sbss,"aw",@nobits
	.align	2
	.type	t, @object
	.size	t, 4
t:
	.zero	4
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "loop.c"
	.loc 1 2 12
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 3 7
	sw	zero,-20(s0)
	.loc 1 4 9
	sw	zero,-20(s0)
	.loc 1 4 3
	j	.L2
.L3:
	.loc 1 5 11 discriminator 3
	lui	a5,%hi(t)
	lw	a5,%lo(t)(a5)
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	.loc 1 5 7 discriminator 3
	lui	a5,%hi(t)
	sw	a4,%lo(t)(a5)
	.loc 1 4 21 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 4 3 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,4
	ble	a4,a5,.L3
	.loc 1 6 10
	li	a5,1
	.loc 1 7 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x71
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.string	"t"
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.4byte	0x41
	.byte	0x9
	.byte	0x3
	.8byte	t
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	0x41
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.string	"i"
	.byte	0x1
	.byte	0x3
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
	.byte	0x97,0x42
	.byte	0x19
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
	.string	"/home/shaked/rems/litmus-tests-riscv/elf-tests/basic"
.LASF0:
	.string	"GNU C11 8.2.0 -march=rv64g -mabi=lp64d -g -O0 -std=c11 -ffreestanding"
.LASF1:
	.string	"loop.c"
.LASF3:
	.string	"main"
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
