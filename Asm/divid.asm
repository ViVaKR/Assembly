section .data
	
section .text
 
global _start

_start:
	
	;mov eax, 11
	mov eax, 0xFF	 
	mov ecx, 2
	div ecx
	int 80h
	 
	; 11 / 2 => eax = 5 (몫), edx = 1 (나머지) 
	; 0xFF / 2 =>  
