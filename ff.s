	.file 1 "f.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=xx
	.module nooddspreg
	.abicalls


	.data
	.globl	c
	.align	2
	.type	c, @object
	.size	c, 4
c:
	.word	0


	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	addiu	 $sp,$sp,-4
	sw	$2,0($sp)
	li	$2,	8
	sw	$2,4($sp)
	lw	$2,0($sp)
	addiu	 $sp,$sp,4
	addiu	 $sp,$sp,-4
	sw	$2,0($sp)
	li	$2,	88
	sw	$2,8($sp)
	lw	$2,0($sp)
	addiu	 $sp,$sp,4
	addiu	 $sp,$sp,-4
	sw	$2,0($sp)
	li	$2,	99
	sw	$2,12($sp)
	lw	$2,0($sp)
	addiu	 $sp,$sp,4
	addiu	 $sp,$sp,-4
	sw	$3,0($sp)
	la	 $3,
	lw	$3,0($sp)
	addiu	 $sp,$sp,4
	addiu	 $sp,$sp,-4
	sw	$3,0($sp)
	la	 $3,
	lw	$3,0($sp)
	addiu	 $sp,$sp,4
	add	 $2, $2, $3

	addiu	 $sp,$sp,-4
	sw	$3,0($sp)
	la	 $3,
	lw	$3,0($sp)
	addiu	 $sp,$sp,4
	add	 $2, $2, $3

	addiu	 $sp,$sp,-4
	sw	$3,0($sp)
	la	 $3,
	lw	$3,0($sp)
	addiu	 $sp,$sp,4
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

