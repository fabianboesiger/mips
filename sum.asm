#	Hardcoded Inputs
	addi	$a0, $zero, 5		# a0 = a;
	addi	$a1, $zero, 4		# a1 = b;

#	Initialization
	addi	$v0, $zero, 0		# v0 = 0
	slt	$t0, $a1, $a0		# t0 = (a1 < a0) ? 1 : 0
	addi	$t1, $zero, 1		# t1 = 1
	beq	$t0, $t1, return	# if (t1 == 1) return
	addi	$t2, $a0, 0		# t2 = a0

#	Summing up
loop:	add	$v0, $v0, $t2		# v0 += t2
	beq	$t2, $a1, return	# if (t2 == a1) return
	addi	$t2, $t2, 1		# t2 += 1
	j	loop			# loop

#	Return
return:	nop
	
