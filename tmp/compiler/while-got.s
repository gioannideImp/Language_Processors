	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls



	.data
	.globl	a
	.align	2
	.type	a, @object
	.size	a, 4
a:
	.word	3
#0
#3
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0
#0


	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.set noreorder
	.set nomacro
	addiu $sp,$sp,-152
	sw $fp,148($sp)
	sw $31,144($sp)
	move $fp,$sp

	sw $4,152($sp)
	sw $5,156($sp)
	sw $6,160($sp)
	sw $7,164($sp)
	lui	$2, %hi(a)
	lw	$2, %lo(a)($2)
	li	$3, 97
	add	$2, $2, $3
	sw	$2,140($sp) #x

$BEGIN2:
	lw	$2, 140($sp) #x
	li	$3, 0
	xor	$2, $2, $3
	sltu	$2, $0, $2
	beq	$2,$0,$END_iter2
	nop
$WHILE2:
	lw	$2, 140($sp) #x
	li	$3, 1
	sub	$2, $2, $3
	lw	$3, 140($sp) #x

	sw	$2,140($sp) #x

	b $BEGIN2
	nop
$END_iter2:
	lw	$2, 140($sp) #x
	move	$2,$2
	move	$sp,$fp
	lw	$31,144($sp)
	lw	$fp,148($sp)
	addiu	$sp,$sp,152
	j	$31

	nop

	move $sp,$fp
	lw $31,144($sp)
	lw $fp,148($sp)
	addiu $sp,$sp,152
	j $31

	nop
	.set macro
	.set reorder
	.end main
	.size main, .-main

