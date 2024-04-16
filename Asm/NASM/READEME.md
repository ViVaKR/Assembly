# NASM

## Compile

```bash

- Compile
$ nasm -f elf64 -o hello.o hello.asm

- Load
$ ld hello.o -o hello
$ ld -m elf_i386 -o hello hello.o # 32bit

- Run
$ ./hello

- Check
$ echo $? #=> return 1; return ebx value,

# db - stands for "define bytes" It essentially means that we are going to define some raw bytes of data to insert into our code
# 10 - newline character, as "\n"
# text - A name assigned to the address in memory that this data is located in.
```

## Sections

>- All x86_64 assembly files have three sections
  1. .data : where all data is defined before compilation
  2. .bss  : where data is allocated for furutre use.
  3. .text : where the actual code goes.

## Labels

>- Any time the name of the label is used afterwards, that name is replaced by the location in memory by compiler.
>- Used to label a part of code.
1. `Start` Label : _start label is essential for all programs.
   - When your program is compiled and later executed, it is executed first at the location of "_start"

## Global
>
>- global is used when you want the linker to be able to known the address of some a label
>- The object file generated will contain a link to every label declared 'global'
>- '_start' as global since it is required for the code to be properly linked.

## sys_write

>- id : 1
>- arg1 : #file descriptor (0 input, 1 output, 2 error)
>- arg2 : $buffer, Location of string to write
>- arg3 : $count, Length of string

---

## sys_exit

>- rax : 60
>- rdi : #errorcode

## Flags

>- Flags, like registers, hold data.
>- Flags only hold 1 bit each.
>- They are either true or false
>- Individual flags are part of a larger register

1. CF : Carry
2. PF : Parity
3. ZF : Zero
4. SF : Sign
5. OF : Overflow
6. AF : Adjust
7. IF : Interrupt Enabled

---

## Pointers

>- Pointers are also registers that hold data.
>- They "point to" data meaning, they hodl its memory address.

1. rip (dip, ip), Index pointer : Points to next address to be executed in the control flow.
2. rsp (esp, sp), Stack pointer : Points to the top address of the stack.
3. rbp (ebp, bp), Stack base pointer : Points to the bottom of stack.

---

## Control Flow

>- Runs from top to bottom by defaule.
>- The direction a program flows is called the control flow.

---

## Jumps

>- Jumps can be used to jump to different parts of code based on labels.
>- example. `jmp _start`

symbol
(signed)	(unsigned)		(result of cmp a, b)
je,  						a = b
jne, 						a != b
jg, 		ja, 			a > b
jge, 		jae, 			a >= b
jl, 		jb, 			a < b
---

## Comparisons

>- cmp
>- check condition
>- Comparisons are done on registers.
>- example. `cmp register, register/value`, `cmp rax, 23`, `cmp rax, rbx`

cmp a, b
a == b  ZF = 1
a != b  ZF = 0
		SF = msb(a-b)
---

- x86 32-bit processor, each register is 32 bits in size

- 32 bit
EAX : Extended accumulater, automatically used by multiplication and vivision instructions.
EBX : General purpose
ECX : Used as a loop counter by the CPU
EDX : General purpose

ESI : High speed memory transfer
EDI : High speed memroy transfer
EBP : Used to reference functionparameters and local variables ont the stack
ESP : A pointer to the current stack address

EIP : The instruction pointer, points to the address of the next instruction.

EFLAGS : Flags to denote the status of an operation.
- CF (carry flag)
- OF (overflow flag)
- SF (sign flag)
- ZF (zero flag)
- AC (auxiliary cary)
- PF (parity flag)

- 16 bit
AX :
BX :
CX
DX

8 bit high
AH
BH
CH
DH

8 bit low
AL
BL
CL
DL

--------------------------------------------

## start.asm

section .data
section .text
global _start

_start:
	mov eax, 1 ; 종료코드
	mov ebx, 123 ; 상태코드
	int 80h ; h = hex

--------------------------------------------

## data.asm ##

(gdb) x/x $ebx  # 해당 주소의 값을 가져오기

# -> list DB 1,2,3,4

(gdb) x/x 0x804a000
0x804a000:      0x04030201
--------------------------------------------
