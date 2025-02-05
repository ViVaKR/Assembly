.global _start
.p2align 6

_start:
    // x0 = 3, x1 = 5
    mov x0, #3
    mov x1, #5

    // x0 = x0 + x1
    add x0, x0, x1   // x0 now contains the sum

    // Print result
    mov x1, x0       // move result to x1 for printing
    bl print_sum

    // Exit
    b _terminate

// Print integer (uses syscall write)
print_sum:
    // Load format string address into x0
    adr x0, result_msg
    mov x2, x1           // move integer to x2 for the message
    mov x16, #4          // system call: write
    svc #0               // trigger system call
    ret

_terminate:
    mov x0, #0           // return code 0
    mov x16, #1          // system call: exit
    svc 0

result_msg:  .asciz "Sum: %d\n"

// ld camp.o -o camp -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

// as camp.s -o camp.o
// ld camp.o -o camp -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
