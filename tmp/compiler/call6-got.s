	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


	.text
	.align	2
	.globl	f
	.set	nomips16
	.set	nomicromips
	.ent	f
	.type	f, @function
f:

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

	sw	$0, 124($sp) #i

	sw	$0, 120($sp) #j

	sw	$0, 116($sp) #k

	sw	$0, 112($sp) #l

	li	$2, 1
$END7:
	lw	$3, 124($sp) #i

	sw	$2,124($sp) #i

	li	$2, 2
$END8:
	lw	$3, 120($sp) #j

	sw	$2,120($sp) #j

	li	$2, 3
$END9:
	lw	$3, 116($sp) #k

	sw	$2,116($sp) #k

	li	$2, 57
$END10:
	lw	$3, 112($sp) #l

	sw	$2,112($sp) #l

	lw	$2, 112($sp) #l
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
	.end	 f
	.size	 f, .-f



	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:

$END13:
$END14:
$END15:
$END16:
$END17:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-136
	sw	$fp,132($sp)
	sw	$31,128($sp)
	move	$fp,$sp

	sw	$0, 124($sp) #i

	sw	$0, 120($sp) #j

	sw	$0, 116($sp) #k

	sw	$0, 112($sp) #l

	li	$2, 1
$END19:
	li	$2, 2
$END20:
	lw	$3, 120($sp) #j

	sw	$2,120($sp) #j

	li	$2, 3
$END21:
	lw	$3, 116($sp) #k

	sw	$2,116($sp) #k

	li	$2, 57
$END22:
	lw	$3, 112($sp) #l

	sw	$2,112($sp) #l

	sw	$1, 108($sp)
	sw	$2, 104($sp)
	sw	$3, 100($sp)
	sw	$4, 96($sp)
	sw	$5, 92($sp)
	sw	$6, 88($sp)
	sw	$7, 84($sp)
	sw	$8, 80($sp)
	sw	$9, 76($sp)
	sw	$10, 72($sp)
	sw	$11, 68($sp)
	sw	$12, 64($sp)
	sw	$13, 60($sp)
	sw	$14, 56($sp)
	sw	$15, 52($sp)
	sw	$16, 48($sp)
	sw	$17, 44($sp)
	sw	$18, 40($sp)
	sw	$19, 36($sp)
	sw	$20, 32($sp)
	sw	$21, 28($sp)
	sw	$22, 24($sp)
	sw	$23, 20($sp)
	sw	$24, 16($sp)
	sw	$25, 12($sp)
	.option pic
	jal f
	nop
	move	$25, $2
	lw	$1, 108($sp)
	lw	$2, 104($sp)
	lw	$3, 100($sp)
	lw	$4, 96($sp)
	lw	$5, 92($sp)
	lw	$6, 88($sp)
	lw	$7, 84($sp)
	lw	$8, 80($sp)
	lw	$9, 76($sp)
	lw	$10, 72($sp)
	lw	$11, 68($sp)
	lw	$12, 64($sp)
	lw	$13, 60($sp)
	lw	$14, 56($sp)
	lw	$15, 52($sp)
	lw	$16, 48($sp)
	lw	$17, 44($sp)
	lw	$18, 40($sp)
	lw	$19, 36($sp)
	lw	$20, 32($sp)
	lw	$21, 28($sp)
	lw	$22, 24($sp)
	lw	$23, 20($sp)
	lw	$24, 16($sp)
	move	$2, $25
$END23:
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

