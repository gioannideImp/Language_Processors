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
	.set noreorder
	.set nomacro
	addiu $sp,$sp,-148
	sw $fp,144($sp)
	sw $31,140($sp)
	move $fp,$sp

	sw $4,148($sp)
	sw $5,152($sp)
	sw $6,156($sp)
	sw $7,160($sp)
	lw	$2, 148($sp) #a
	lw	$3, 152($sp) #b
	add	$2, $2, $3
	move	$2,$2
	move	$sp,$fp
	lw	$31,140($sp)
	lw	$fp,144($sp)
	addiu	$sp,$sp,148
	j	$31

	nop

	move $sp,$fp
	lw $31,140($sp)
	lw $fp,144($sp)
	addiu $sp,$sp,148
	j $31

	nop
	.set macro
	.set reorder
	.end f
	.size f, .-f



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
	li	$2, 1
	sw	$2,156($sp) #g

	li	$2, 1
	sw	$2,152($sp) #h

	li	$2, 1
	sw	$2,148($sp) #i

	li	$2, 1
	sw	$2,144($sp) #j

	li	$2, 4
	sw	$2,140($sp) #k

	lw	$2, 156($sp) #g
	lw	$3, 152($sp) #h
	add	$2, $2, $3
	sw $1,136($sp)
	sw $2,132($sp)
	sw $3,128($sp)
	sw $4,124($sp)
	sw $5,120($sp)
	sw $6,116($sp)
	sw $7,112($sp)
	sw $8,108($sp)
	sw $9,104($sp)
	sw $10,100($sp)
	sw $11,96($sp)
	sw $12,92($sp)
	sw $13,88($sp)
	sw $14,84($sp)
	sw $15,80($sp)
	sw $16,76($sp)
	sw $17,72($sp)
	sw $18,68($sp)
	sw $19,64($sp)
	sw $20,60($sp)
	sw $21,56($sp)
	sw $22,52($sp)
	sw $23,48($sp)
	sw $24,44($sp)
	sw $25,40($sp)
	lw	$3, 156($sp) #g
	li	$4, 6
	li	$5, 2
	mult	$4, $5
	mflo	$4
	add	$3, $3, $4
	li	$4, 7
	sub	$3, $3, $4
	sw	$3, 0($sp) #a

	move	$4, $3 #load parameter 1
	lw	$3, 152($sp) #h
	sw	$3, 4($sp) #b

	move	$5, $3 #load parameter 2
	.option pic
	jal f
	nop
	move	$25, $2
	lw $1,136($sp)
	lw $2,132($sp)
	lw $3,128($sp)
	lw $4,124($sp)
	lw $5,120($sp)
	lw $6,116($sp)
	lw $7,112($sp)
	lw $8,108($sp)
	lw $9,104($sp)
	lw $10,100($sp)
	lw $11,96($sp)
	lw $12,92($sp)
	lw $13,88($sp)
	lw $14,84($sp)
	lw $15,80($sp)
	lw $16,76($sp)
	lw $17,72($sp)
	lw $18,68($sp)
	lw $19,64($sp)
	lw $20,60($sp)
	lw $21,56($sp)
	lw $22,52($sp)
	lw $23,48($sp)
	lw $24,44($sp)
	move $3, $25
	add	$2, $2, $3
	lw	$3, 140($sp) #k
	add	$2, $2, $3
	lw	$3, 144($sp) #j
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

