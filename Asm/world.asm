global main
extern printf, scanf

section .text

main:
	push rbp		; keep the stack aligned
	mov rbp, rsp	; 
	sub rsp, 16		; must be 16 byte increments to maintain
	
	; write our body
	xor eax, eax	; 같은 값으로 xor 연산을 하면 0이됨.
	lea rdi, [msg]	; first parameter
	call printf		;
	
	mov eax, 0		; clear AL (zero FP args in XMM registers)
	lea rdi, [format]	; (first parameter) load format string
	lea rsi, [number]	; (second parameter) set storage to address of x
	call scanf
	
	mov DWORD [rbp-4 ], 0	; our local variable i

loop:
	
	mov edx, [number]		; first parameter
	mov rsi, [rbp - 4]		; local variable -> i
	lea rdi, [msg2 ]		; 
	xor eax, eax
	call printf

	mov ecx, DWORD [number]
	add DWORD [rbp -4], 1		; i++

	cmp [rbp - 4], ecx		; compare i [rbp -4] with ecx[number]
	jle loop				; jump if i < number

	add rsp, 16
	leave			; mov rsp, rbp, pop, rbp
	ret				;

section .data
	msg: db "Enter a number: ", 0
	msg2: db "Looping %d of %d", 10, 0
	format: db "%d", 0

section .bas
	number resb 4
	
