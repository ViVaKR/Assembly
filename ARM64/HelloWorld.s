//
// Hello World
//

.global _start
.p2align 3

_start:
    mov     x0, #1      // fd = STDOUT_FILENO
    adr     x1, msg    // buf = msg
    mov     x2, #14     // count = len
    mov     x16, #4     // `write()` is syscall #64
    svc     #0              // Invoke syscall

    // exit (init status)
    mov x0, #0      // status = 0
    mov x16, #1     // exit is syscal #1
    svc #0              // Invoke syscall

msg: .ascii "Hello, World!\n"

