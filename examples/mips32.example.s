	.data
prompt: .asciiz "\n Please input a value for N = "
result: .asciiz " The sum of the integers from 1 to N is "
bye:    .asciiz "\n *** Adios Amigo - Have a good day ***"
	.global _start
	.text
_start:
	jal main
	li $v0, 10
	syscall		# Use syscall 10 to stop simulation

main:

	# Ask the user for a number
	# Print prompt to screen
	li 		$v0, 4
	la 		$a0, prompt
	syscall

	# Read input
	li		$v0, 5
	syscall

	# Check if valid, and jump to end if not
	blez 	$v0, end
	li		$t0, 0

loop:

	# Main loop for incrementing the number
	add		$t0, $t0, $v0
	addi	$v0, $v0, -1
	bnez	$v0, loop

	# Print result message
	li		$v0, 4
	la 		$a0, result
	syscall

	# Print resulting integer to screen
	li		$v0,1
	move	$a0,$t0
	syscall

	b		main

end:
	# Print bye message to screen
	li		$v0, 4
	la		$a0, bye
	syscall

	li 		$v0, 10
	syscall
