.section .data
	string1: .string "About to create a file \n"
	len1: .quad .-string1

	string2: .string "It goes inside the created file\n"
	len2: .quad .-string2

	file: .string "/tmp/foo.txt"

.section .text
	.globl _start

_start:

	# write syscall
	mov	$1, %rax	# sys_write
	mov	$1, %rdi 	# unsigned int fd: stdout
	mov	$string1, %rsi	# const char *buf
	mov	len1, %rdx	# size_t count: length of string1
	syscall

	# open syscall
	mov	$2, %rax	# sys_open
	mov 	$file, %rdi	# const char * pathname
	mov 	$0x42, %rsi	# int flags: O_RDWR | O_CREAT
	mov 	$0x1a4, %rdx	# mode_t mode: 0644
	syscall

	xor 	%r9, %r9
	mov	%eax, %r9d	# save the returned FD in %r9

	# write syscall
	mov	$1, %rax	# sys_write
	mov	%r9, %rdi	# fd: opened file
	mov	$string2, %rsi	# buf: string2
	mov	len2, %rdx	# count: length of string2
	syscall

	# close syscall
	mov 	$3, %rax	# sys_close
	mov 	%r9, %rdi	# unsigned int fd: value stored in r9
	syscall

	# exit syscall
	mov 	$60, %rax	# sys_exit
	mov 	$0, %rdi	# int error_code
	syscall

