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

$END0:
$END1:
$END2:
$END3:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-28
	sw	$fp,24($sp)
	sw	$31,20($sp)
	move	$fp,$sp

	li	$2, 8
$END4:
	sw	$2, 16($sp) #x

	li	$2, 9
$END5:
	sw	$2, 12($sp) #y

	li	$2, 88
$END6:
	sw	$2, 8($sp) #z

	lw	$2, 16($sp) #x
$END8:
	li	$3, 1
$END10:
	beq	$2,$3,$CASE9
	nop
	li	$3, 21
$END11:
	lw	$4, 16($sp) #x

#df
	sw	$3,16($sp) #x

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

	li	$3, 2
$END13:
	beq	$2,$3,$CASE12
	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

	li	$3, 4
$END15:
	beq	$2,$3,$CASE14
	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

	li	$3, 8
$END17:
	beq	$2,$3,$CASE16
	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$CASE9:
	lw	$2, 12($sp) #y
$END19:
	li	$3, 9
$END21:
	beq	$2,$3,$CASE20
	nop
	li	$3, 88
$END23:
	beq	$2,$3,$CASE22
	nop
$CASE9:
	li	$2, 42
$END24:
	move	$2,$2
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$CASE12:
	li	$2, 23
$END25:
	move	$2,$2
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$END18:
	li	$2, 21
$END26:
	lw	$3, 16($sp) #x

#df
	sw	$2,16($sp) #x

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$CASE16:
	li	$2, 55
$END27:
	lw	$3, 16($sp) #x

#df
	sw	$2,16($sp) #x

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$CASE20:
	li	$2, 66
$END28:
	lw	$3, 16($sp) #x

#df
	sw	$2,16($sp) #x

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$CASE22:
	li	$2, 87
$END29:
	lw	$3, 16($sp) #x

#df
	sw	$2,16($sp) #x

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

$END7:
	lw	$2, 16($sp) #x
$END30:
	move	$2,$2
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,28
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

