.global _start
.p2align 6

_start:
    mov X0, #1              // stdout
    adr X1, result_msg      // address of 'Sum: ' string
    mov X2, #5              // length of 'Sum: ' string (5)
    mov X16, #4             // write to stdout
    svc 0                   // syscall

    // x0 = 3, x1 = 5
    mov x0, #3
    mov x1, #5

    // x0 = x0 + x1 (sum)
    add x0, x0, x1

    // Print sum as integer
    bl print_sum

    // Exit
    b _terminate

// Print integer (uses syscall write)
print_sum:
    // Convert integer to ASCII string (basic conversion)
    mov X1, x0             // move sum to X1 for printing
    bl int_to_str          // convert integer to string and store in X0
    mov X2, X3             // length of string in X3
    mov X0, #1             // stdout
    mov X16, #4            // write syscall
    svc 0                  // trigger system call
    ret

// Integer to string conversion
int_to_str:
    mov X3, #10            // divisor for decimal conversion
    mov X4, X1             // copy sum to X4
    mov X5, X0             // string address pointer

    // Convert integer to string in reverse
convert_loop:
    udiv X6, X4, X3        // X6 = X4 / 10 (quotient)
    msub X7, X6, X3, X4    // X7 = X4 % 10 (remainder)
    add X7, X7, #'0'       // convert to ASCII
    strb X7, [X5], #1      // store ASCII character in string
    mov X4, X6
    cmp X6, #0
    bne convert_loop

    // Reverse the string to get correct order
    mov X4, X0
    sub X5, X5, #1
reverse_loop:
    cmp X4, X5
    bge reverse_end
    ldrb X6, [X0], #1
    ldrb X7, [X5], #1
    strb X7, [X0, #-1]
    strb X6, [X5, #-1]
    b reverse_loop
reverse_end:
    mov X3, X5             // update string length
    ret

_terminate:
    mov X0, #0             // return code 0
    mov X16, #1            // terminate syscall
    svc 0                  // syscall

// result message string
result_msg:  .ascii "Sum: "     // 5 chars
