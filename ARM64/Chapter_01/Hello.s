
.global _start
.align 4

_start:
    adr x0, msg
    bl _puts
    mov x0, #42
    b _exit

msg:
    .asciz "Hello ASM!"

