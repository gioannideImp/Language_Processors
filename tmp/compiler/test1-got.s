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
$END1:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-12
	sw	$fp,8($sp)
	move	$fp,$sp

	li	$2, 1
$END2:
	sw	$2, 0($sp) #a

	li	$2, 2
$END3:
	sw	$2, 4($sp) #b

	li	$2, 3
$END5:
	lw	$3, 4($sp) #b

	add	$2, $2, $3
#df
	sw	$2,4($sp) #b

	lw	$3, 0($sp) #a

	div	$3,$2
	mfhi	$2
#df
	sw	$2,0($sp) #a

$END4:
	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,12
	j	$31

	nop

	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,12
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

