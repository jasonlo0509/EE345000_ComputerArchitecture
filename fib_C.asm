.data
msg_str:	.asciiz "Enter some Number: "

.text

.globl main

main:
	la	$a0, msg_str			# load the address of the message ”Enter some Number: ”
	li 	$v0, 4				# prepare for syscall 4, printing string to the user
	syscall					# syscall 4
	li	$v0, 5				# prepare for syscall 5, reading integer from the user
	syscall					# syscall 5
	
	move 	$a0, $v0			# Now input integer is in $v0. We cocy it to $a0 for
	li	$a1, 0				# load in the first and second term
	li	$a2, 1
	jal	fac				# start the function
	
	move	$a0, $a1			# 
	li	$v0, 1
	syscall
	
	li 	$v0, 10
	syscall

fac:
	beq	$a0, $zero, ret_a		# if reached zero term, then jump to the set function
	addi	$sp, $sp, -4			# create space for saving the address
	sw	$ra, 0($sp)			# save the return address to the stack
	addi	$a0, $a0, -1			# a-1
	
	jal	fac
	
	lw	$ra, 0($sp)			# load the address and start the recursive
	addi	$sp, $sp, 4			# ready for the next run
	move	$a3, $a2			# Tail Recursion(k-1, b, a + b)
	add	$a2, $a2, $a1
	move	$a1, $a3 
	
	j	ret
	
ret_a:
	move	$a0, $a1			# return a
	
ret:
	jr	$ra
