.global _start
.align 2
_start:
    mov X0, #1
    adr X1, msg //
    adr X2, msg_end //
    sub X2, X2, X1
    mov X16, #4 // sys_write
    svc #0x80 // syscall
    mov X0, #0
    mov X16, #1 // sys_exit
    svc #0x80 // syscall

msg:
    .ascii "Hello World! Fine Thanks And You?\n"
msg_end:
