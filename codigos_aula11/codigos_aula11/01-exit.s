.section .data
.section .text
.globl _start

_start:

	movl	$1, %eax	# system call exit(2)
	movl	$0, %ebx	# the shell receives this value

	int 	$0x80		# trap

