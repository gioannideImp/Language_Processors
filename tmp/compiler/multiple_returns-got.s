	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-4
	sw	$fp,0($sp)
	move	$fp,$sp

	li	$2, 1
	li	$3, 2
	mult	$2, $3
	mflo	$2
	li	$3, 3
	li	$4, 4
	mult	$3, $4
	mflo	$3
	add	$2, $2, $3
	li	$3, 5
	li	$4, 6
	mult	$3, $4
	mflo	$3
	add	$2, $2, $3
	li	$3, 7
	li	$4, 8
	mult	$3, $4
	mflo	$3
	add	$2, $2, $3
$END0:
	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,4
	j	$31

	nop

	li	$2, 4
	li	$3, 9
	mult	$2, $3
	mflo	$2
	li	$3, 3
	div	$2, $3
	mflo	$2
	li	$3, 4
	sub	$2, $2, $3
$END1:
	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,4
	j	$31

	nop

	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,4
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

