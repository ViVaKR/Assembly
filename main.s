section .data   ;data section
    msg db "Hello World", 0x0A  ;개행문자

section .text   ;text section
    global _main    ;전역에서 접근가능

_main :   ;메인함수
    mov rax, 0x2000004  ;syscall write() 함수번호
    mov rdi, 1 ;매개변수
    mov rsi, msg
    mov rdx, 12
    syscall ; call
    mov rax, 0x2000001 ; syscall exit() 함수.
    mov rdi, 0 ; 매개변수
    syscall ; 호출
