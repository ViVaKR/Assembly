section .data
	
section .text
 
global _start

_start:
	mov al,0b11111111
	mov bl,0b0001
	add al,bl ; eax = eax + ebx
	adc ah,0; eflags - carry info
	int 80h	

	; (gdb) i reg eflags -> (gdb) i reg eflags : 
	; eflags         0x206       [ PF IF ]
	; - PF : 패리티 플래그, 홀수 +=1 짝수 +=0 -> 결과 0으로 설정, 값의 이상유무를 알려줌, 볼수 있는 유일한 플래그
	; - IF : 
 
 	; (gdb) i reg eflags
	; eflags         0x257 [ CF PF AF ZF IF ] 
	; - CR : Carry Flag
	; - AF : 보조 플래그, BCD 계산에 사용
	; - IF : 
	; - PF : 
	; - ZF : 연산결과가 0일 때 설정됨
