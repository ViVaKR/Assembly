# ARM (Advanced RISC Machine)

/**
* ARM architecture *

* Every instruction endocing is 32 bit wide.
* Code must be aligned to 4-byte boundary
* ARM64 has 31 general `purpose register`, named X0 to X30
* Their lower 32 bits can be addressed by the names W0 to W30.

* Special Registers:
    * Program  count (PC)       : contains address of the next instruction to be excuted.
    * Stact pointer (SP)        : points to dynamic memory available during program execution.
    * Frame pointer (FP, X29)   : points to the stack base during a function call, to recover stack from the calling function.
    * Link register (LR, X30)   : saves the return address at a function call.
    * Zero register (XZR)       : always contains the value zero.
    * Specifically on macOS     : X18 is reserved (do not use it)
* Instruction set comprises the ususl arithemetic, logical and branching operations. (산술, 논리, 분기)
* Level of privilege
    -> User mode (USR)          : least privileges, standard for program execution.
    -> Supervisor mode (SVC)    : kernel level privileges.

* Assumin you installed Xcode (with the Apple Developer Tools)
* assembler is invoked by -> $ as hello.asm -o hello.o
    * This produces the binary code for our assembler program.
*/

## Operate

```c

# First, load data into a register:
ldr X0, [X1] ; Load, where X1 contains the memory address of our data

# and when done, Store the data back in memory
str X0, [X1]

# We can assess memory at an offset from X1, say 4 bytes
ldr X0, [X1, #4]
str X0, [X1, #4]

# We can move data from other registers or immediate values into a register
mov X0, X1
mov X0, #0x1234

# Using movn instead of mov negates the argument before moving it
# We can only move 160bit values into a register. To fill it with larger values, use
movk X0, #0x5678, lsl #n
where n is 0, 16, 32, or 48:

- This shifts the second argument (here ox5678) to the position indicated by the lsl argument,
- keeps all other values in the register intact.

For example
mov  x0, #0x3210
movk x0, #0x7654, lsl #16
movk X0, #0xBA98, lsl #32
movk x0, #0xFEDC, lsl #48

#-> fills X0 with the value 0xFEDC_BA98_7654_3210 (48bit)

#-> Labels
mylabel: ascii "Hello, World"
otherlabel: byte 0x12
where we specify one of the data types `byte`, `word`, `quad` or `ascii`

#-> To acces this data, load the address into a register and then use this register as a pointer to load data into another register

adr x1, otherlabel
ldr x0 [X1]

#-> The basic arithmetic operations are add, sub, mul and signed/unsigned division sdiv/udiv.
#-> They all take three registers as arguments: Destination, first operand, second operand.

add x0, x1, x2
sub x0, x1, x2

#-> The logical shift operations lsl x0, #n and lsr x0, #n shift the content of a register to the left or to the right by n bits.

mov x0, #0x0F
lsl x0, #16 ; now x0 contains 0x000F_0000 (left shift)
lsr x0, #8  ; now x0 contains 0x0F00      (right shift)

#-> ARM64 also supports the usual bitwise logical operations and, orr and eor(not xor!) on registers.
#-> Since these instrucitions are only 32 bits wid, it is not possible to give a 64-bit mask as an immediate argument.
#->Instead, there is a rather bizarre sceme to encode the bitmasks

#-> To control the program flow, we can use
    - comopare (cmp) a register with another register or a 12 bit value
    - this sets certain flages (Negative, Zero, Cary an Overflow)
    - depending on these, conditional branches (b.<condition>) take us to different parts of the program.

#-> Example
loop:
    cmp x0, x1
    b.cc endloop ; is x0 < x1 ?
    ...          ; loop body
endloop:
    ...          ; continue after loop

#=> The stack is a data structure for short-term memory allocation at runtime.
    - last-in-first-put principle.
    - grows towards smaller address in memory
    - one entry is 128 bits/16 bytes wide (2 registers)
#=> The stack pointer SP contains address of the top of the stack.
    - SP must always be aligned to a 16-byte boundary.
    - No explicit push or pop instructions on ARM64.
    - To push and pop registers to the stack, use `str` and `ldr`

    str x0, [SP, #-16]! ; push x0 to stack, decrease SP by 16
    ldr x0, [SP], #16   ; pop staack entry into x0, increase SP by 16

    - Since register ar

    stp x0, x1, [SP, #-16]! ; push x0, x1 to stack, decrease SP byt 16
    ldp x0, x1, [SP], #16   ; pop

    mov x0, #0x1234
    str x0, [SP, #-16]
    ldr x2, [SP], #16

#=> Apple uses the Little Endian format on its M1 machines.
(ARM in general supports both Little Endian and Big Endian)

    - The string "/bin" is four bytes long; supose we store it in register x0.
    - Hexadecimal encoding: / = 0x2F, b = 0x62, i = 0x 69, n = 0x6E
    - In memory, the byte 0x2F is stored at the lowest address, but the whole string corresponds to the number `6E69622F`, where sF is the lowest order digit.
    --------( low to high address )--------------------->   63             31                   0
    memory | 2F | 62 | 69 | 6E |                         X0 |   |   |   |   | 6E | 69 | 62 | 2F |

#=> In ARM assembly, a [ function call ] i executed via the instruction branch with link `bl`.
    - Program counter PC + 4 bytes is saved in the link register LR
      (the return address right after the bl instruction)
    - PC is replaced by the argubment of bl (usuallly a label in assembly).
    - Program execution resumes at ther new address in PC
    - At the end of the function, the return instruction ret copies LF back into PC.

#=> Calling convention on ARM64:
    - Push any registers that need to be preserved on the stack.
    - The first ten arguments are stored in the registers X0 to x9.
    - Any further arguments are pushed to the stack.
    - Execute bl and run the function.
    - Place return value in x0, then execute ret.
    - Evaluate return value, then pop any previously saved registers.

#=> ONly in nested function calls is the stack used to save return addresses.
    - Save LR on the stack before the nested funciton call.
    - Pop it off the stack into LR atfer returningfom the nested function.

#=> execute kernel function (system calls), we must chagne the privilege level from user mode to `supervisor mode`.
    - Every kernel function is identified by a uniquer numbre.
    - Place this number in -> register x16.
    - Then the supervisor call svc #n switches to supervisor mode and executes the kernel function.
    - The argument `n` is irrelevant on macOS (traditinally 0x80, on 32bit Linux, or choose 0xFFFF to avoid NULL bytes.)

# Calling convention as for regular functions:
    - Arguments in registers x0 to x9, further arguments on stack.
    - Return value in x0.


#=> find out the number of a kernel function?
    - locally in the file
        - `cat /Library/Developer/CommandLineTools/SDKs/MacOSX14.4.sdk/usr/include/sys/syscall.h | grep connect`
    - Alternatively, -> https://opensource.appl.com/    source/xnu/bsd/kern/syscalls.master

#
```
