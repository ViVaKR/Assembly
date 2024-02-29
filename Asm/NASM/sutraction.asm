section .data
	
section .text
 
global _start

_start:
	mov eax, 5
	mov ebx, 3
	mov eax, ebx

	int 80h
 
