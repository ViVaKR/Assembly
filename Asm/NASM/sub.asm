section .data
	
section .text
 
global _start

_start:
	mov eax, 3
	mov ebx, 5
	sub eax, ebx
	mov ebx, 7 ; For SF Test
	add eax, ebx ; 
	int 80h
 
 	; -> 어떻게 음수인지 매우 큰수인지 
 	; -> 컴파일러는 인식하는가? 
 	; eax => 0xfffffffe -2
 	 
 	; i reg eflags -> [ CF AF SF IF ]
 	; SF : sign flag
 	; CR : 두가지 용도로 사용하는 플래그, carry 와 차용
 	
