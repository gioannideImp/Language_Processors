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
$END5:
$END6:
$END8:
$IF7:
$END10:
$IF9:
$END12:
$IF11:
$ELSE11:
$END11:
$END9:
$END7:	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-140
	sw	$fp,136($sp)
	sw	$31,132($sp)
	move	$fp,$sp

	li	$2, 9
$END14:
	sw	$2, 128($sp) #x

	li	$2, 7
$END15:
	sw	$2, 124($sp) #a

	li	$2, 8
$END16:
	sw	$2, 120($sp) #b

	li	$2, 98
$END17:
	sw	$2, 116($sp) #d

	li	$2, 115
$END18:
	sb	$2, 112($sp) #g

	li	$2, 9
$END19:
	lw	$3, 120($sp) #b

	add	$2, $2, $3
	sw	$2,120($sp) #b

	lw	$3, 124($sp) #a

	sub	$2, $3, $2
	sw	$2,124($sp) #a

	lw	$2, 128($sp) #x
	li	$3, 1
	sgt	$2, $2, $3
$END21:
	beq	$2,$0,$END20
	nop
$IF20:
	lw	$2, 128($sp) #x
	li	$3, 1
	sgt	$2, $2, $3
$END23:
	beq	$2,$0,$END22
	nop
$IF22:
	lw	$2, 128($sp) #x
	li	$3, 2
	sgt	$2, $2, $3
$END25:
	beq	$2,$0,$ELSE24
	nop
$IF24:
	li	$2, 88
$END26:
	move	$2,$2
	move	$sp,$fp
	lw	$31,132($sp)
	lw	$fp,136($sp)
	addiu	$sp,$sp,140
	j	$31

	nop

	b $END24
	nop
$ELSE24:
	li	$2, 8
$END32:
	lw	$3, 120($sp) #b

	add	$2, $2, $3
	sw	$2,120($sp) #b

$END31:
	lw	$3, 124($sp) #a

	mult	$2,$3
	mflo	$2
	sw	$2,124($sp) #a

$END30:
	lw	$3, 120($sp) #b

	and	$2, $2, $3
	sw	$2,120($sp) #b

$END29:
	lw	$3, 116($sp) #d

	or	$2, $2, $3
	sw	$2,116($sp) #d

$END28:
	lb	$3, 112($sp) #g
	div	$3,$2
	mflo	$2
	sb	$2,112($sp) #g
$END27:
	move	$2,$2
	move	$sp,$fp
	lw	$31,132($sp)
	lw	$fp,136($sp)
	addiu	$sp,$sp,140
	j	$31

	nop

$END24:
$END22:
$END20:
	move	$sp,$fp
	lw	$31,132($sp)
	lw	$fp,136($sp)
	addiu	$sp,$sp,140
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

