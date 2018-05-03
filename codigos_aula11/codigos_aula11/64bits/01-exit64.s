.section .data
.section .text
.globl _start

_start:

	movq	$60, %rax	# system call exit(2)
	movq	$10, %rdi	# the shell receives this value
	syscall

