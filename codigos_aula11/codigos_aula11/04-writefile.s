.section .data
string1: .string "Criar um arquivo e inserir conteúdo \n"
tam1: .long . - string1
string2: .string "Cogumelo binário\n"
tam2: .long . - string2
arq: .string "/tmp/arquivo.txt" 

.section .text

.globl _start
_start:

movl $4, %eax		# syscall write
movl $1, %ebx
leal string1, %ecx
movl tam1, %edx
int $0x80

movl $5, %eax 		# syscall open (5)
movl $arq, %ebx 	# arquivo que será aberto
movl $0x42, %ecx 	# modo do arquivo
movl $0x1a4, %edx 	# Permissão 0 
int $0x80

movl %eax, %esi 	# Move o retorno da funcao open para ESI


movl $4, %eax		# syscall write, a no arquivo
movl %esi, %ebx 	# local de escrita, arquivo.txt
leal string2, %ecx 	# escrita do conteúdo de string2 para dentro
movl tam2, %edx 	# O tamanho da variavel
int $0x80


movl $6, %eax		# syscall close (6)
movl %esi, %ebx 	# Fecha o arquivo
int $0x80

movl $1, %eax
movl $0, %ebx
int $0x80

