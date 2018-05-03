.section .data
output:
#       0         1         2         3   .    4         5
#       01234567890123456789012345678901234678901234567890
.ascii "O ID do fabricante do processador é 'xxxxxxxxxxxx'\n"

.section .text
.globl _start

_start:
	mov  $0, %eax
	cpuid
	mov $output, %edi
	mov %ebx, 38(%edi)
	mov %edx, 42(%edi)
	mov %ecx, 46(%edi)

	mov $4, %eax         # USAR SYSCALL 4(WRITE) IMPRIMIR NA TELA
	mov $1, %ebx         # IMPRIMIR EM STDOUT (FD 1)
	mov $output, %ecx    # ENDERECO INICIO DO TEXTO A SER IMPRESSO
	mov $52, %edx        # COMPRIMENTO DO TEXTO A SER IMPRESSO
	int  $0x80           # CHAMA SYSCALL DO LINUX

	mov $1, %eax         # USAR SYSCALL 1 (EXIT) FINALIZAR PROGRAMA
	mov $0, %ebx         # SAIR COM ERROR CODE = 0
	int  $0x80           # CHAMAR SYSCALL DO LINUX

