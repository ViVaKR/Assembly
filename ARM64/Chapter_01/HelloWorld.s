// X0 - X2 : Parametes to Unix System Calls
// X16 : System Call function number

.global _start
.p2align 4              // Make sure everything is aligned properly

_start:
    mov x0, #1      // 1 = StdOut
    adr x1, msg     // string to print buf = msg
    mov x2, #14     // length of string, count = len
    mov x16, #4     // `write()` is syscall #4
    svc #0x80          // Invoke syscall

    // exit (init status)
    mov x0, #0      // return code status = 0
    mov x16, #1     // exit is syscal #1
    svc #0x80              // Invoke syscall

msg: .ascii "Hello, World!\n"

