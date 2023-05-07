section .data
    msg:    db      "Hello World", 0x0A
    .len:   equ     $ - msg

section .text
    global _main

_main :
    mov rax, 0x2000004
    mov rdi, 1 ; stdout
    mov rsi, msg
    mov rdx, 12
    syscall

    mov rax, 0x2000001 ; exit
    mov rdi, 0
    syscall
