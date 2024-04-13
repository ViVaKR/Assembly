; Macro
; A macro is a single instruction that expands into a predefined set of instructions to perform a paricular task.
; 매크로는 특정 작업을 수행하기 위해 미리 정의된 명령어 집합으로 확장되는 단일 명령어입니다.

; Defining Macros
; Exit Macro ======================================================================================================
%macro exit 0 ; <name> <argc>

; <maro body>
	mov rax, 60
	mov rdi, 0
	syscall

%endmacro

%macro printDigit 1
	mov rax, %1
	call _printRAXDigit

%endmacro
 
 
; End of Macro ====================================================================================================
section .data

section .text
	global _start

_start:
	printDigit 3
	printDigit 4
	exit
	 
%macro printDigitSum 2
	mov rax, %1
	mov rax, %2
	call _printRAXDigit


%endmacro
	 
%macro freeze 0
%%loop:
	jmp %%loop
%endmacro
 
 
 
 
 
 
 
 
