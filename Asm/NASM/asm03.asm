section .data
	num1 DB 1
	num2 DB 2

section .text
global _start

_start:
	; mov bl,[num1] ; 8bit
	mov bh,[num1] ; 
	; mov cl,[num2] ; 8bit
	mov ch,[num2] ;
	mov eax,1
	int 80h
	
