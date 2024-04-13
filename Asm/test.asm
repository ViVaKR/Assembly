section .data

section .bss
	digitSpace resb 100
	digitSpacePos resb 8
	
section .text
	global _start

_start:
	mov rax, 123
	call _printRAX

	mov rax, 60
	mov rdi, 0
	syscall
	 
	 
_printRAX:
	mov rcx, digitSpace
	mov rbx, 10
	mov [rcx], rbx
	inc rcx
	mov [digitSpacePos], rcx
	
