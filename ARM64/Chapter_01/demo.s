.global _start
.align 4

.data
list:
    .word 4, 5, -9, 1, 0, 2, -3

// start
_start:
    LDR X0,=list
	LDR X1, [X0]
	LDR X2, [X0, #4]
    b _printf
    b _terminate

_printf:
    mov X0, #1              // stdout
    adr X1, helloworld      // address of 'Hello, World' string
    mov X2, #13             // length of 'Hello, World' string (13)
    mov X16, #4             // write to stdout
    svc 0                   // syscall

_terminate:
    mov X0, #0      // return 0
    mov X16, #1     // terminate
    svc 0           // syscall



// hello world string
helloworld: .ascii "Hello, World\n"     // 13 char


