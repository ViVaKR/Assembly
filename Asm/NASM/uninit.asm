section .bss
	; 메모리 공간을 예약하는데 사용, Object
	num RESB 3 ; 3bytes

section .data
	num2 DB 3 DUP(2) 
section .text
 
global _start

_start:
	mov bl,1
	mov bl,[num2] 
	mov [num],bl
	mov [num+1],bl
	mov [num+2],bl

	mov eax, 1
	int 80h 
