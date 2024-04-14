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
