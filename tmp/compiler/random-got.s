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
	addiu	$sp,$sp,-21
	sw	$fp,17($sp)
	move	$fp,$sp

	li	$2, 9
$END5:
	sw	$2, 0($sp) #x

	li	$2, 7
$END6:
	sw	$2, 4($sp) #a

	li	$2, 8
$END7:
	sw	$2, 8($sp) #b

	li	$2, 98
$END8:
	sw	$2, 12($sp) #d

	li	$2, 115
$END9:
	sb	$2, 16($sp) #g

	li	$2, 9
$END10:
	lw	$3, 8($sp) #b

	add	$2, $2, $3
#df
	sw	$2,8($sp) #b

	lw	$3, 4($sp) #a

	sub	$2, $3, $2
#df
	sw	$2,4($sp) #a

	lw	$2, 0($sp) #x
	li	$3, 88
	xor	$2, $2, $3
	sltu	$2, $0, $2
$END12:
	beq	$2,$0,$ELSE11
	nop
$IF11:
	li	$2, 0
$END13:
	sw	$2, 17($sp) #i

	lw	$2, 17($sp) #i
$END15:
$FOR14:
	lw	$2, 17($sp) #i
	li	$3, 100
	slt	$2, $2, $3
$END16:
	beq	$2,$0,$END14
	nop
	lw	$3, 17($sp) #i

	addiu	$2, $3,1
#df
	sw	$2,17($sp) #i

$END17:
 # this is the problem--
	lw	$3, 0($sp) #x

	addiu	$2, $3,-1
#df
	sw	$2,0($sp) #x

$END18:
	b $FOR14
	nop
$END14:
	b $END11
	nop
$ELSE11:
	li	$2, -1
$END19:
	move	$sp,$fp
	lw	$fp,17($sp)
	addiu	$sp,$sp,21
	j	$31

	nop

$END11:
	lw	$2, 0($sp) #x
$END20:
	move	$sp,$fp
	lw	$fp,17($sp)
	addiu	$sp,$sp,21
	j	$31

	nop

	li	$2, 8
$END27:
	lw	$3, 8($sp) #b

	add	$2, $2, $3
#df
	sw	$2,8($sp) #b

$END26:
	lw	$3, 4($sp) #a

	mult	$2,$3
	mflo	$2
#df
	sw	$2,4($sp) #a

$END25:
	lw	$3, 8($sp) #b

	and	$2, $2, $3
#df
	sw	$2,8($sp) #b

$END24:
	lw	$3, 12($sp) #d

	or	$2, $2, $3
#df
	sw	$2,12($sp) #d

$END23:
	lb	$3, 16($sp) #g
	div	$3,$2
	mflo	$2
#df
	sb	$2, 16($sp) #g
$END22:
$END21:
	move	$sp,$fp
	lw	$fp,17($sp)
	addiu	$sp,$sp,21
	j	$31

	nop

	move	$sp,$fp
	lw	$fp,17($sp)
	addiu	$sp,$sp,21
	j	$31

	nop
	.set	 macro
	.set	 reorder
	.end	 main
	.size	 main, .-main

