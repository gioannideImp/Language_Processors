	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


	.text
	.align	2
	.globl	operations
	.set	nomips16
	.set	nomicromips
	.ent	operations
	.type	operations, @function
operations:

$END2:	.set noreorder
	.set nomacro
	addiu $sp,$sp,-140
	sw $fp,136($sp)
	sw $31,132($sp)
	move $fp,$sp

	swc1	$f12,140($sp)
	swc1 $f14, 144($sp)
	sw $6,148($sp)
	sw $7,152($sp)
	lwc1	$f2, 144($sp) #b
	nop	
	lwc1	$f3, 140($sp) #a
	nop	
	c.lt.s	$f2,$f3
	bc1f	$NOT_LT6
	nop

	li.s	$f2,1
	b	$ENDLT6
	nop	
$NOT_LT6:
	mtc1	$0,$f2
	nop

$ENDLT6:
$END5:
$END4:
	swc1	$f2,128($sp) #result

	lwc1	$f2, 128($sp) #result
	nop	
$END7:
	mov.s	$f0,$f2
	move	$sp,$fp
	lw	$31,132($sp)
	lw	$fp,136($sp)
	addiu	$sp,$sp,140
	j	$31

	nop

	move $sp,$fp
	lw $31,132($sp)
	lw $fp,136($sp)
	addiu $sp,$sp,140
	j $31

	nop
	.set macro
	.set reorder
	.end operations
	.size operations, .-operations

