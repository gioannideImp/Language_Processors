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

$END1:
$END2:
$END3:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-124
	sw	$fp,120($sp)
	sw	$31,116($sp)
	move	$fp,$sp

	li	$2, 1
$END5:
	sw	$2, 112($sp) #x

	li	$2, 4
$END6:
	move	$2,$2
	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,120($sp)
	addiu	$sp,$sp,124
	j	$31

	nop

	li	$2, 5
$END7:
	move	$2,$2
	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,120($sp)
	addiu	$sp,$sp,124
	j	$31

	nop

	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,120($sp)
	addiu	$sp,$sp,124
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

