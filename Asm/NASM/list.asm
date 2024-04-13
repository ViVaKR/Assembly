section .data
;	char DB 'A'
	list DB 1,2,3,4, -1 
	; each 4bytes list, 끝에 -1 또는 0을  추가하여 목록의 끝을 알려줌
	; 즉, 목록의 끝임을 나타내는 무언가가 필요하는 것

	; e.g. string (null char, 0)
	str1 DB "Hello ",0
	str2 DB "World",0

section .text
global _start

_start:
	mov bl,[str1]
	mov eax, 1
	int 80h
	
