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
	.set noreorder
	.set nomacro
	addiu $sp,$sp,-168
	sw $fp,164($sp)
	sw $31,160($sp)
	move $fp,$sp

	sw $4,168($sp)
	sw $5,172($sp)
	sw $6,176($sp)
	sw $7,180($sp)
	sw	$0, 156($sp) #a

	sw	$0, 152($sp) #b

	li	$2, 8
	sw	$2,148($sp) #c

	li	$2, 9
	sw	$2,144($sp) #d

	li	$2, 828
	sw	$2,140($sp) #g

	lw	$2, 156($sp) #a
	lw	$3, 152($sp) #b
	add	$2, $2, $3
	lw	$3, 148($sp) #c
	add	$2, $2, $3
	move	$2,$2
	move	$sp,$fp
	lw	$31,160($sp)
	lw	$fp,164($sp)
	addiu	$sp,$sp,168
	j	$31

	nop

	move $sp,$fp
	lw $31,160($sp)
	lw $fp,164($sp)
	addiu $sp,$sp,168
	j $31

	nop
	.set macro
	.set reorder
	.end main
	.size main, .-main

