.data
hello: .asciz "Hello, World!\n"

.text
.global _start

_start:
    ADRP X0, hello
    ADD X0, X0, :lo12:hello
    MOV X1, X0
    MOV X2, #14  // 문자열 길이
    MOV X8, #64  // sys_write
    MOV X0, #1   // stdout
    SVC #0

    MOV X8, #93  // sys_exit
    MOV X0, #0   // 종료 코드
    SVC #0
