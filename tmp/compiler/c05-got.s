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
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	sw	$31,24($sp)
	move	$fp,$sp

	sw	$0, 20($sp) #k

	li	$2, 1
	li	$3, 2
	add	$2, $2, $3
	li	$3, 3
	add	$2, $2, $3
	li	$3, 4
	add	$2, $2, $3
	li	$3, 5
	add	$2, $2, $3
	li	$3, 6
	add	$2, $2, $3
$END4:
	sw	$2, 16($sp) #x

	lw	$2, 16($sp) #x
	li	$3, 3
	div	$2, $3
	mflo	$2
$END5:
	sw	$2, 12($sp) #y

	lw	$2, 12($sp) #y
	li	$3, 8
	lw	$4, 16($sp) #x
	multu	$3, $4
	mflo	$3
	addu	$2, $2, $3
$END6:
	sw	$2, 8($sp) #z

	lw	$2, 8($sp) #z
$END7:
	lw	$3, 20($sp) #k

#df
	sw	$2,20($sp) #k

	lw	$2, 20($sp) #k
$END8:
	move	$2,$2
	move	$sp,$fp
	lw	$31,24($sp)
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31

	nop

	move	$sp,$fp
	lw	$31,24($sp)
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

