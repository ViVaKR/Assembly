.global main
.align 4

main:
    mov x0, #5  ; move immediate value 2 into register x0
    mov x16, #1  ; move the syscall number for sys_write into x16
    svc 0x80     ; make supervisor call
