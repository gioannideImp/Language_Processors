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
	beq	$2,$0,$ELSE3
	nop
$IF3:
$END4:
	b $END3
	nop
$ELSE3:
$END5:
	b $END3
	nop
$END3:
$END6:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-128
	sw	$fp,124($sp)
	sw	$31,120($sp)
	move	$fp,$sp

	li	$2, 0
$END8:
	sw	$2, 116($sp) #d

	li	$2, 13
$END9:
	sw	$2, 112($sp) #c

	lw	$2, 116($sp) #d
	beq	$2,$0,$ELSE10
	nop
$IF10:
	li	$2, 7
$END11:
	b $END10
	nop
$ELSE10:
	li	$2, 14
$END12:
	b $END10
	nop
$END10:
	lw	$3, 112($sp) #c

#df
	sw	$2,112($sp) #c

	lw	$2, 112($sp) #c
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

