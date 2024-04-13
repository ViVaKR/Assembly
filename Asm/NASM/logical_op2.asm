section .data
	
section .text
 
global _start

_start:
	
	mov eax, 0b1010
	not eax             ; 0101
	and eax, 0x0000000F ; mask
	int 80h
	 
