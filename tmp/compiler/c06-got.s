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
$END3:
$END4:
$END5:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-136
	sw	$fp,132($sp)
	sw	$31,128($sp)
	move	$fp,$sp

	sw	$0, 124($sp) #k

	li	$2, 1
	li	$3, 2
	and	$2, $2, $3
	li	$3, 3
	li	$4, 4
	div	$3, $4
	mfhi	$3
	li	$4, 5
	sub	$3, $3, $4
	li	$4, 6
	add	$3, $3, $4
	xor	$2, $2, $3
$END7:
	sw	$2, 120($sp) #x

	lw	$2, 120($sp) #x
	li	$3, 3
	sle	$2, $2, $3
$END8:
	sw	$2, 116($sp) #y

	lw	$2, 116($sp) #y
	li	$3, 8
	addu	$2, $2, $3
	lw	$3, 120($sp) #x
	seq	$2, $2, $3
$END9:
	sw	$2, 112($sp) #z

	lw	$2, 112($sp) #z
$END10:
	lw	$3, 124($sp) #k

#df
	sw	$2,124($sp) #k

	lw	$2, 124($sp) #k
$END11:
	move	$2,$2
	move	$sp,$fp
	lw	$31,128($sp)
	lw	$fp,132($sp)
	addiu	$sp,$sp,136
	j	$31

	nop

	move	$sp,$fp
	lw	$31,128($sp)
	lw	$fp,132($sp)
	addiu	$sp,$sp,136
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

