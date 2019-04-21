#	Storing Array in Memory
	lui	$s0, 0x1001
##	First Image
	addi	$t0, $zero, 5
	sw	$t0, 0($s0)
	addi	$t0, $zero, 16
	sw	$t0, 4($s0)
	addi	$t0, $zero, 7
	sw	$t0, 8($s0)
	addi	$t0, $zero, 1
	sw	$t0, 12($s0)
	addi	$t0, $zero, 1
	sw	$t0, 16($s0)
	addi	$t0, $zero, 13
	sw	$t0, 20($s0)
	addi	$t0, $zero, 2
	sw	$t0, 24($s0)
	addi	$t0, $zero, 8
	sw	$t0, 28($s0)
	addi	$t0, $zero, 10
	sw	$t0, 32($s0)
##	Second Image
	addi	$t0, $zero, 4
	sw	$t0, 36($s0)
	addi	$t0, $zero, 15
	sw	$t0, 40($s0)
	addi	$t0, $zero, 8
	sw	$t0, 44($s0)
	addi	$t0, $zero, 0
	sw	$t0, 48($s0)
	addi	$t0, $zero, 2
	sw	$t0, 52($s0)
	addi	$t0, $zero, 12
	sw	$t0, 56($s0)
	addi	$t0, $zero, 3
	sw	$t0, 60($s0)
	addi	$t0, $zero, 7
	sw	$t0, 64($s0)
	addi	$t0, $zero, 11
	sw	$t0, 68($s0)
	
#	Main Function
	addi	$s1, $zero, 0
	addi	$s2, $zero, 32
loop:	add	$s3, $s0, $s1
	lw	$a0, 0($s3)
	lw	$a1, 36($s3)
	jal	diff
	sw	$v0, 72($s3) 
	beq	$s1, $s2, exit
	addi	$s1, $s1, 4
	j	loop
exit:	addi	$a0, $zero, 36
	jal	sum
	j	return
	
#	Calculate Difference between Two Pixels
diff:	slt	$t1, $a1, $a0
	beq	$t1, $zero, inv
	sub	$v0, $a0, $a1
	jr	$ra
inv:	sub	$v0, $a1, $a0
	jr	$ra

#	Calculate Sum Recursively
sum:	beq	$a0, $zero, end
	subi	$sp, $sp, 8
	sw	$a0, 4($sp)
	sw	$ra, 0($sp)
	subi	$a0, $a0, 4
	jal	sum
	add	$t0, $s0, $a0
	lw	$t0, 72($t0)
	add	$v0, $v0, $t0
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	addi	$sp, $sp, 8
	jr	$ra
end:	addi	$v0, $zero, 0
	jr	$ra

#	Return Statement, Result is stored in $v0
return: nop
