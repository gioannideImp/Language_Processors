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
$END2:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-124
	sw	$fp,120($sp)
	sw	$31,116($sp)
	move	$fp,$sp

	li	$2, 7
$END4:
	sw	$2, 112($sp) #x

$FOR5:
	li	$2, 0
$END6:
	beq	$2,$0,$END5
	nop
	lw	$2, 112($sp) #x
	li	$3, 5
	add	$2, $2, $3
$END8:
	lw	$3, 112($sp) #x

	sw	$2,112($sp) #x

	b $FOR5
	nop
$END5:
	lw	$2, 112($sp) #x
$END9:
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

