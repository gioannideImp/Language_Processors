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
	addiu	$sp,$sp,-128
	sw	$fp,124($sp)
	sw	$31,120($sp)
	move	$fp,$sp

	li	$2, 1
$END5:
	sw	$2, 116($sp) #x

	li	$2, 0
$END6:
	sw	$2, 112($sp) #y

	lw	$2, 116($sp) #x
$END8:
$FOR7:
	lw	$2, 116($sp) #x
	li	$3, 5
	sle	$2, $2, $3
$END9:
	beq	$2,$0,$END7
	nop
	lw	$2, 116($sp) #x
$END11:
	lw	$3, 112($sp) #y

	add	$2, $2, $3
#df
	sw	$2,112($sp) #y

	lw	$3, 116($sp) #x

	addiu	$2, $3,1
#df
	sw	$2,116($sp) #x

$END12:
	b $FOR7
	nop
$END7:
	lw	$2, 112($sp) #y
$END13:
	move	$2,$2
	move	$sp,$fp
	lw	$31,120($sp)
	lw	$fp,124($sp)
	addiu	$sp,$sp,128
	j	$31

	nop

	move	$sp,$fp
	lw	$31,120($sp)
	lw	$fp,124($sp)
	addiu	$sp,$sp,128
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

