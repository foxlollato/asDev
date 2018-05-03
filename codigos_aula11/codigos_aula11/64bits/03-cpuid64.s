.section .data
output:
	#        0         1         2         3         4         5
	#        012345678901234567890123456789012345678901234567890
	 .ascii "O ID do fabricante do processador e 'xxxxxxxxxxxx'\n"
	#.ascii "                                                  \n"
.section .text
.globl _start
_start:
	mov  $0, %eax
	cpuid
	mov $output, %rdi
	mov %ebx, 37(%rdi)
	mov %edx, 41(%rdi)
	mov %ecx, 45(%rdi)

	mov $1, %rax
	mov $1, %rdi
	mov $output, %rsi
	mov $53, %rdx
	syscall

	mov $60, %rax
	mov $0, %rdi
	syscall

