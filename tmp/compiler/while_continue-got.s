	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


$END0:

	.data
	.globl	x
	.align	2
	.type	x, @object
	.size	x, 4
x:
	.word	5


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
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	sw	$31,16($sp)
	move	$fp,$sp

	li	$2, 0
$END4:
	sw	$2, 12($sp) #y

	li	$2, 0
	li	$3, 9
	sub	$2, $2, $3
$END5:
	sw	$2, 8($sp) #x

$BEGIN6:
	lw	$2, 8($sp) #x
	li	$3, 5
	slt	$2, $2, $3
$END7:
	beq	$2,$0,$END6
	nop
$WHILE6:
	lw	$2, 8($sp) #x
	li	$3, 1
	add	$2, $2, $3
$END8:
	lw	$3, 8($sp) #x

#df
	sw	$2,8($sp) #x

	lw	$2, 8($sp) #x
	li	$3, 1
	seq	$2, $2, $3
$END10:
	beq	$2,$0,$END9
	nop
$IF9:
	lw	$2, 8($sp) #x
	li	$3, 5
	slt	$2, $2, $3
$END11:
	b $BEGIN6
	nop
$END9:
	lw	$2, 12($sp) #y
	lw	$3, 8($sp) #x
	add	$2, $2, $3
$END12:
	lw	$3, 12($sp) #y

#df
	sw	$2,12($sp) #y

	b $BEGIN6
	nop
$END6:
	lw	$2, 12($sp) #y
$END13:
	move	$2,$2
	move	$sp,$fp
	lw	$31,16($sp)
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31

	nop

	move	$sp,$fp
	lw	$31,16($sp)
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

