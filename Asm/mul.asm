section .data
	
section .text
 
global _start

_start:
	
	; MUO, IMUL 2가지 방식으로 수행됨
	mov al, 0xFF ; -1 로 인식 함.
	mov bl, 2
	;mul bl  ; 1개의 피연산자(operand)만 사용함..누산기
	imul bl  ; 1개의 피연산자(operand)만 사용함..누산기
	int 80h	 ; return -> -2 
