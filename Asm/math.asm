section .data
	digit db 0, 10 

section .text
	global _start

_start:
	mov rax, 10
	mov rbx, 2
	div rbx
	call _printRAXDigit
	
	mov rax, 60
	mov rdi, 0
	syscall

_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, 1	; write
	mov rdi, 1	; standard output
	mov rsi, digit	; buffer
	mov rdx, 2		; 2 charaters	
	syscall
	ret 

;=================================================================
; (Math Operations)
;=================================================================
; Math operations are used to mathematically manipulate registers.
; The first register is the subject of the operation.
; e.g.
; `add rax, 5`
; `sub rbx, rax`
;=================================================================
; add a, b						a = a + b
; sub a, b						a = a - b
; mul reg		imul reg		rax = rax * reg
; div reg		idiv reg		rax = rax / reg
; neg reg						reg = -reg
; inc reg						reg = reg + 1
; dec reg						reg = reg - 1
; adc a, b						a = a + b + CF
; sbb a, b						a = a - b - CF
;=================================================================

; (Display a Digit)
; The lower byte of the rax register is then moved into the memory address "digit"
; "digit is actually defined with two byes, being 0 and 10, a new line character.
; Since we are only loading the lower byte of the rax register into "digit", 
; it only overwirtes the first byte and dows not affect the newline chararer
 
; You can use this subroutine to display a digit between 0-9 by loading that
; the rax register then calling the subroution
 
 
