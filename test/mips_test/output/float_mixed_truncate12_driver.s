	.file	1 "float_mixed_truncate12_driver.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi($LC0)
	lwc1	$f0,%lo($LC0)($2)
	nop
	swc1	$f0,32($fp)
	lui	$2,%hi($LC1)
	lwc1	$f0,%lo($LC1)($2)
	nop
	swc1	$f0,28($fp)
	lwc1	$f0,32($fp)
	mtc1	$0,$f2
	nop
	c.eq.s	$f0,$f2
	nop
	bc1t	$L2
	nop

	lwc1	$f0,28($fp)
	mtc1	$0,$f2
	nop
	c.eq.s	$f0,$f2
	nop
	bc1f	$L3
	nop

$L2:
	lwc1	$f2,28($fp)
	lui	$2,%hi($LC2)
	lwc1	$f0,%lo($LC2)($2)
	nop
	add.s	$f0,$f2,$f0
	swc1	$f0,28($fp)
	lwc1	$f0,28($fp)
	mtc1	$0,$f2
	nop
	c.eq.s	$f0,$f2
	nop
	bc1t	$L4
	nop

$L3:
	li	$2,1			# 0x1
	b	$L5
	nop

$L4:
	move	$2,$0
$L5:
	sw	$2,36($fp)
	lwc1	$f14,28($fp)
	lwc1	$f12,32($fp)
	lw	$2,%call16(operations)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,operations
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,36($fp)
	nop
	bne	$3,$2,$L6
	nop

	move	$2,$0
	b	$L7
	nop

$L6:
	li	$2,75			# 0x4b
$L7:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC0:
	.word	1109512946
	.align	2
$LC1:
	.word	1051763671
	.align	2
$LC2:
	.word	1065353216
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
