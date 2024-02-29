section .data
	num DD 5	;DB, DW, DD, DQ, DT

section .text

global _start

_start:
	mov eax, 1
	mov ebx, [num] ; 해당 주소의 값을 할당함. [ ]
	int 80h
	 
	
