	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


	.text
	.align	2
	.globl	divide
	.set	nomips16
	.set	nomicromips
	.ent	divide
	.type	divide, @function
divide:

$END2:	.set noreorder
	.set nomacro
	addiu $sp,$sp,-140
	sw $fp,136($sp)
	sw $31,132($sp)
	move $fp,$sp

	swc1	$f12,140($sp)
	swc1 $f14, 144($sp)
	sw $6,148($sp)
	sw $7,152($sp)# ida- f_call0- reading0- function1- SizeOf:0- lhs_of_assignment:0

	lwc1	$f2, 140($sp) #a
	nop	# idb- f_call0- reading0- function1- SizeOf:0- lhs_of_assignment:0

	lwc1	$f3, 144($sp) #b
	nop	
	div.s	$f2,$f2,$f3
$END4:
	swc1	$f2,128($sp) #x
# idx- f_call0- reading0- function1- SizeOf:0- lhs_of_assignment:0

	lwc1	$f2, 128($sp) #x
	nop	
$END5:
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
	.end divide
	.size divide, .-divide

