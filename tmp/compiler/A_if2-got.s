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

$END0:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp

	li	$2, 1
$END1:
	sw	$2, 0($sp) #x

	lw	$2, 0($sp) #x
	li	$3, 1
	xor	$2, $2, $3
	sltu	$2, $0, $2
$END3:
	beq	$2,$0,$ELSE2
	nop
$IF2:
	li	$2, 144
$END4:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31

	nop

	b $END2
	nop
$ELSE2:
	li	$2, 1
$END5:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31

	nop

$END2:
	li	$2, 100
$END6:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31

	nop

	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

