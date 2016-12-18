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
	jal	fac				# start the recursive part
	move	$a0, $v1			# copy v1 to a0
	
	li	$v0, 1
	syscall
	
	li 	$v0, 10
	syscall

fac:
	beq	$a0, $zero, ret_one		# if reached zero term, then jump to the set function
	addi	$sp, $sp, -4			# create space for saving the address
	sw	$ra, 0($sp)			# save the return address to the stack
	addi	$a0, $a0, -1			# a-1
	
	jal	fac
	
	lw	$ra, 0($sp)			# load the address and start the recursive
	addi	$sp, $sp, 4			# ready for the next run
	move	$a2, $v0			# copy the 1st term
	add	$v0, $v0, $v1			# calculate f(n)= f(n-1)+f(n-2)
	move	$v1, $a2	 		# move the f(n-2)to f(n-1)
	j	ret				# do it again
ret_one:
	li	$v1, 0				# load the initial value
	li	$v0, 1 
	
ret:
	jr	$ra
