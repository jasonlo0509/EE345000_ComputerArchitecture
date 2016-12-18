.data 
msg_str:		.asciiz "Enter Some Number: "

.text

.globl main

main:
	la	$a0, msg_str
	li	$v0, 4				#print the message string
	syscall
	li	$a2, 0				#load in the first term
	li	$a3, 1				#load in the second term 
	li	$v0, 5				#wait for the input
	syscall
	move 	$a0, $v0			#copy input v0 to a0
	jal 	fac				#jump to function
	move 	$a0, $v0
	li	$v0, 1				# print the answer a0
	
	syscall
	li	$v0, 10				# end of code
	syscall
	
fac:
	bne	$a0, $zero, loophead		# If input is 0 zero , return 1. If not , go to the loop
	li	$v0, 0
	jr	$ra				# return value 1
	
loophead:
	move	$v0, $a0			# copy input to $v0 (prod) . we will keep multiplying it until loop ends
	li	$t0, 1				# load value 1 to $t0 as loop end condition
	
loopbody:
	addi	$a1, $a1, 1			# count the number of term
	add	$t0, $a2, $a3			# count the next term
	add	$a3, $a2, $zero			# move a2 to a3
	add	$a2, $t0, $zero			# move t0 to a2 to complete the move
	add	$v0, $zero, $a2			# move a2 to v0
	bne	$a0, $a1, loopbody		# if it hasn't reached a0, then continue the loop
	jr	$ra				# after complete, send back the answer
