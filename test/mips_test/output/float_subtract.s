	.file 1 "t.c"
	.section .mdebug.abi32
	.previous
	.nan legacy
	.module fp=32
	.module nooddspreg
	.abicalls


	.text
	.align	2
	.globl	subtract
	.set	nomips16
	.set	nomicromips
	.ent	subtract
	.type	subtract, @function
subtract:

$END2:	.set noreorder
	.set nomacro
	addiu $sp,$sp,-184
	sw $fp,180($sp)
	sw $31,176($sp)
	move $fp,$sp

	swc1	$f12,184($sp)
	swc1 $f14, 188($sp)
	sw $6,192($sp)
	sw $7,196($sp)
	lwc1	$f2, 184($sp) #a
	nop	
	lwc1	$f3, 188($sp) #b
	nop	
	sub.s	$f2,$f2,$f3
	lw	$3, 192($sp) #x
	mtc1	$3,$f3
	nop

	cvt.s.w	$f3,$f3
	nop

	sub.s	$f2,$f2,$f3
$END4:
	swc1	$f2,172($sp) #s

	lwc1	$f2, 172($sp) #s
	nop	
$END5:
	mov.s	$f0,$f2
	move	$sp,$fp
	lw	$31,176($sp)
	lw	$fp,180($sp)
	addiu	$sp,$sp,184
	j	$31

	nop

	move $sp,$fp
	lw $31,176($sp)
	lw $fp,180($sp)
	addiu $sp,$sp,184
	j $31

	nop
	.set macro
	.set reorder
	.end subtract
	.size subtract, .-subtract

