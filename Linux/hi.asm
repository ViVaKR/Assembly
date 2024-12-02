section .data
	text db "Hi, Everyone", 10 ; Name of memory address, "define bytes" , "...", 10 (new line)

section .text
	global _start

_start:
	mov rax, 1		; rip = x,			sys_write (ID:1)
	mov rdi, 1		; rip = x + 1,		arg1 : #file descriptor (0 Input, 1 Output, 2 Error) 
	mov rsi, text	; rip = x + 2,				arg2 : ADDR, $buffer, 'Hi, Everyone' 의 실제 메모리 주소 로드.
	mov rdx, 13		; rip = x + 3,		arg3 : #count, charators + '\n' 
	syscall			; rip = x + 4,

	mov rax, 60		; rip = x + 5,		sys_exit. (ID:60)
	mov rdi, 0		; rip = x + 6,		0 오류가 없다는 뜻, 어떤 값이든 올수 있음.
	syscall			; rip = x + 7
