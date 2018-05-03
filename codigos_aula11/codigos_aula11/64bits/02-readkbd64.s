.section .data
string: .string "Digite algo:\n"
tam: .long . - string

.section .text
.globl _start
_start:
	movq 	$1, %rax		
	movq 	$1, %rdi	
	leaq 	string, %rsi	
	movq 	tam, %rdx		
	syscall

	movq 	$0, %rax 	
	movq 	$0, %rdi
	movq 	%rsp, %rsi 	
	subq 	$10, %rsp		
	movq 	$9, %rdx 		
	syscall

	movq 	%rax, %rdx 	
	movq 	$1, %rax		
	movq 	$1, %rdi
	syscall

	movq 	$60, %rax
	movq 	$0, %rdi
	syscall

