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
$END3:
$END4:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	sw	$31,24($sp)
	move	$fp,$sp

	li	$2, 890
$END5:
	sw	$2, 20($sp) #h

	li	$2, 0
$END6:
	sw	$2, 16($sp) #y

	li	$2, 65
$END7:
	sb	$2, 12($sp) #c

	lw	$2, 16($sp) #y
	lb	$3, 12($sp) #c
	lw	$4, 20($sp) #h
	sne	$3,$0,$3
	sne	$4,$0,$4
	and	$3,$3,$4
	sne	$2,$0,$2
	sne	$3,$0,$3
	or	$2,$2,$3
$END8:
	sw	$2, 8($sp) #x

	lw	$2, 8($sp) #x
$END9:
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

