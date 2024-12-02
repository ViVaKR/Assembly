section .data
	
section .text

global _start

_start:
	mov eax, 1 ; 종료코드
	mov ebx, 123 ; 상태코드
	int 80h ; h = hex
	 
