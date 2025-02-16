# Assembly

> 고급언어 -> 컴파일러 -> 어셈블리어(.s) - 어셈블러 -> 기계어(.o) -> 링커 -> 실행파일

## 명령어 수행방식 ( _intel_ )

> OPCODE : 명령어
>
> OPERAND : 피연산자
>
> (ex) **EBX 의 값을 EAX 에 더함**
>
> | OPCODE | OPERAND`(Destination)` | OPERAND2`(Source)` |
> | :----: | :--------------------: | :----------------: |
> |  ADD   |          EAX           |        EBX         |

## 레지스터

- 32비트 : `E` 로 시작
- 64비트 : `R` 로 시작

1. 범용 레지스터
    - AX :
    - BX :
    - CX :
    - DX :
2. 인덱스 레지스터
    - ESI :
    - EDI :
3. 포인터 레지스터
    - EIP : Instruction Pointer (Program Counter)
        - 다음에 실할 명령어 의 주소를 가지고 있는 레지스터
    - ESP : Stack Pointer
        - 최상의 주소를 저장하는 레지스터
    - EBP : Base Pointer
        - 기준점 기저 주소를 저장하는 레지스터

## 주요 명령어

| 명령어 |     예제     |          설명          |    분류    |
| :----: | :----------: | :--------------------: | :--------: |
|  push  |   push eax   | eax 값을 stack 에 저장 | 스택 조작  |
|  pop   |   pop eax    |           -            |     -      |
|  mov   |      -       |           -            |     -      |
|  inc   |      -       |           -            |     -      |
|  dec   |      -       |           -            |     -      |
|  add   | add eax, ebx |        덧셈연산        | 논리, 연산 |
|  sub   | sub eax, ebx |        뺄셈연산        | 논리, 연산 |
|  call  |      -       |           -            |     -      |
|  ret   |      -       |           -            |     -      |
|  cmp   |      -       |           -            |     -      |
|  jmp   |      -       |           -            |     -      |
|  int   |      -       |           -            |     -      |
|  nop   |     nop      |      No Operation      |     -      |

## 아키텍처

> - 16비트 : IA-16(x86-16)
> - 32비트 : IA-32(x86-32)
> - 64비트 : AMD64(x86-64)

## 명령어 (Operator)

> - mov eax, 1

## 피연산자 (Operand)

## 동사(명령어)와 목적어(피연산자)

> - read(`operator`) data(`operand`)
> - 대소문자 구분이 없이
> - r0 ~ r7

- ir : return pointer, 함수가 반환되는 위치
- sp : stack pointer, 스택 포인터
- pc : program counter, next pointer, 다음 실행할 명령어 주소
- cpsr : 프로그램에 대한 정보를 저장, 플래그 , 음수 양수 큰수 등등, 특별한 정보 제공
- spsr :

- label : 고급 언어의 함수와 일종의 동의어..
- 시작 레이블 설정
- r7 : System Call (특수목적)
- 시스템 콜, 이터럽트
- SWI : 소프트웨어 인터럽트

## Apple M1, MacOS ARM64

```bash

# check mac versions
`$ sw_vers`

# SYSCALL Info

# e.g. (1) : as command -> macOS LLVM Clang Assembler link
`as -o demo.o demo.s`

# (1 - 2)
as -arch arm64 -o demo.o demo.s

# (1 - 3) : ld command -> object file convert to bin file
```bash
ld -macosx_version_min 14.0.0 -o demo demo.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

# -> lSystem : 표준 라이브러리 libSystem.dylib link

# -> syslibroot : libSystem.dylib file path

# -> -e _start : Entry point

# -> -arch arm64

# (1 - 4) run test

gcc hello_arm.s -o hello_arm
./hello_arm

- execute file

clang hello.c -o hello

- create assembly file : -S - Create Assembly

clang hello.c -S -o hello.a

- create object file

clang hello.c -c -o hello.o
ld helloworld.o -o helloworld -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64

```

## DisAssemble

`objdump -D demo`

## LLDB Commands

```bash

; disassemble ;
; lldb hello
; disassemble --name start
(lldb) run
(lldb) r
(lldb) run : 현재 프로그램을 중단하고 새로운 Biild/Run 을 진행
(lldb) continue : 다음 Breakpoint 가 나타날때 까지 프로그램을 진행함.
(lldb) po (expression -O --): 객체에 대한 다양한 정보를 콘솔에 출력, -O (object 의 description)
(lldb) memory read -fx -c4 -s4 $address

- -f : display format
- -s : size of the data
- -c : count

help breakpoint
help breakpoint set
(lldb) apropos "reference count"

Stepping Over (n)ext : next 현재 Break 걸려 있는 지점에서 바로 다음 Statement 로 이동.
Stepping In (s)tep : Statement 가 Function Call 인 경우 Debugger 를 해당 함수 내부에 위치한 시작 지점으로 이동하게 해줌.
Steppint Out ( : 현재 진행중인 function return 될때 까지 프로그램을 진행한 후 프로그램 Break 걸어 주는 Stepping Action -> Stack Frame Pop


expr int $num = 10
expr int $num = 34;
po $num + 19;

image list

function
image lookup -F "func name"

file name
image lookup -f "main.c"

memory address
image lookup -a "0xooaddress"

line number
image lookup -f "main.c" 15

```

## Compile Process

> - hello.c >- (compile) >- hello.o >- link >- hello

## CPSR

> - N : 마이너스
> - Z : 0
> - C :
> - V :

- Rd : destination register
- Rn : first
- Rm : second

## Makefile (C Project)

- TARGET : Dependency

> - command
> - Source (.c) -> Object(.o) -> excute file (.out)

```bash

clang CalculateApp.c -o ./Bin/Calculate

```

## General Purpose Registers

- X0 ~ X7 : Parameter / Result Registers
- X8 : Indirect Result Location Register
- X9 ~ X15 : Temporary Registers
- X16 : IP0
- X17 : IP1
- X18 : PR(Platform Register)
- X19 ~ X28 : Calle-Saved Registers
- X29 : FP (Frame Pointer) :
    > - Points to the stack base during a function call, to recover stack from the calling function.(함수 호출 중에 스택 베이스를 가리켜 호출 함수에서 스택을 복구)
- X30 : LR (Link Register) : Saves the return address at a function call.

## Special Registers

- SP (Stack Pointer) : Points to dynamic memory available during program excution.
- NZCV (Global Condition Flag Register)
- FPSR (Floating Point Status Register)
- FPSR (Floating Point Status Register)
- FPCR (Floating Point Control Register)
- PC (Program Counter) : Contains Address of the next instruction to be executed.
- XZR (Zero Register (Abastract))

## Floating Point & SIMD Registers

- D0 ~ D7 : Argument / Result Value Registers
- D8 ~ D15 : To be Preserved Across Calls
- D16 ~ D31 : Temporary Registers

> - Code must be aligned to 4-byte boundary
> - Their lower 32 bits can be addressed by the names W0 to W30

## Stack

1. 함수 내의 로컬 변수임시 저장
2. 함수 호출 시 파라미터 전달
3. 복귀 주소 저장
4. FILO (First In Last Out)

```bash

## Ubuntu nasm
  >- sudo apt-get install nasm

## 64 bit
  >- nasm -f elf64 file.asm -o file.o
  >- ld file.o -o file
```

## ARMv7 DE1-SoC

```bash

.global _start

_start:


```

- ALU (Arithmetic Logic Unit)
- Control Unit
- IR Register
- R0
- R1
- R2
- R3
- R4 : IR (Instruction Register)
- R5 : SP (Stack Pointer)
- R6 : IR (Link Register)
- R7 : PC (Program Counter)

- Bus Interface
- I/O BUS
- <fetch>
- Memory

- R0 ~ R3 : 연산할 값들을 담아 놓거나 혹은 ALU 에서 연산한 결과값을 담아 놓을 용도.
- R4 : 들어온 명령어를 담아놓는 레지스터 (e.g. ADD R3, R1, R2 -> R1 과 R2를 연산한 값을 R3에 담아라)
- R5 : 스택 포인터로 다음 명령어 처리에 필요한 가용 스택 주소를 가르킴, 스택을 반환하고 나면 FP의 주소롤 돌아감
- R6 : Link Register 는 FP (Frame Pointer) 레지스터, 함수가 종료된 후 스택에 담긴 데이터를 반환할 때 돌아갈 스택의 위치를 저장
- R7 : Program Counter 로 다음 명령어가 실행될 주소를 담아 놓는 레지스터.

- PUSH : 명령어는 데이터를 스택에 넣고자 할 때 사용함.
- -> PUSH 0x02 --- 현재 SP 값을 참조하여 데이터 0x02 를 해당 위치에 저장
- -> PUSH R1 --- 현재 SP 값을 참조해서 레지스터 R1 값ㅇ르 해당 위치에 저장

- POP : 스택에 가장 마지막에 들어간 데이터를 꺼내기 위해서 사용함.
- SP 레지스터에 저장된 값을 감소시킴
- POP 은 피연산자가 불필요하고 단순히 POP 형태로 명령어를 사용함.
- -> ADD SP, SP, -4 --- 현재 SP 값에 -4를 더하여 SP 에 저장
- -> SUB SP, SP, 4 --- 현재 SP 값에 4를 빼서 SP 에 저장

---

- ADD : 덧셈
- SUB : 뺄셈
- MUL : 곱셈
- DIV : 나눗셈
-
- | 예약 | 연산자 | 저장소 | 피연산자 1 | 피연산자 2 |
-
- 예약 : 사용자가 사용할 지능 구분을 위해 남겨놓은 비트 구간
-
- 저장소는 항상 레지스터 고정
- 피연산자는 레지스터 혹은 숫자 상수일 수 있다.
-
- 문제점 : 피연산자1, 2에 오는코드가 숫자인지 레지스터인지 식별하기 어려움.
- 레지스터 값이 들어오면 레지스터 안에 저장된 데이터를 참조하겠다는 의미
- 해결 : 4개의 비트 중 첫번째 비트에 1이 오면 레지스터, 0이 오면 숫자로 식별시킬수 있음.
- 그러므로 실질적으로 표현할 수 있는 숫자는 3비트값, 피연산자 하나당 8, 즉 0 ~7 까지 밖에 되지 않음.
- 그래서 STORE & LOAD 명령어의 개념을 도입해야 할 필요가 있음.
-
- => 메모리 주소에 값을 할당하고 그 주소를 LOAD 로 레지스터에 적재한 후 연산을 진행하고
- 그 값을 다시 STORE 로 메모리에 적재해 놓는 방식으로 더 넓은 범위의 값을 표현 가능
- int a = 10; // 0x10 번지에 할당
- int b = 20; // 0x20 번지에 할당
- int c = 0; // 0x30 번지에 할당
- c = a + b;
-
- LOAD r1, 0x10 // 0x10 번지에 저장된 데이터를 r1 로 이동
- LOAD r2, 0x20 // 0x20 번지에 저장된 데이터를 r2 로 이동
- ADD r3, r1, r2 // r1, r2 에 저장된 값을 더해서 r3 에 결과 저장
- STORE r3, 0x30 // r3 에 저장된 값을 0x30 번지에 저장

---

## ARM64

R1 ~ R7     : Low
R8 ~ R12    : High

R13 (SP)
R14 (LR)
R15 (PC)
xPSR : Program Status Register

0x0000_0000
0xFFFF_FFFF

LDR Rn, [Rn]  # dest <- source
STR Rn, [Rn]  # source -> dest
-> Square Bracket : Address

```armasm
-----------------------------------------------------------
LDR R3, [R0] # [00 00 00 08] <- [08 00 00 00] 4bytes (word)
LDR R4, [R1] # [00 00 00 04] <- [04 00 00 00]
-----------------------------------------------------------

Register            Memoery
R0 - 00 00 00 10    0x0000
R1 - 00 00 00 14    0x0004
R2                  0x0008
R3 - 00 00 00 08    0x000C
R4 - 00 00 00 04    0x0010 - 08 00 00 00
R5                  0x0014 - 04 00 00 00
-----------------------------------------------------------

-----------------------------------------------------------
STR R3, [R4] # [00 00 00 08] -> [08 00 00 00]
-----------------------------------------------------------

(1)
LDR R0, = 0x0000 0010
ADDR EQU 0x0000 00014
LDR R1, = ADDR

(2)
MOV R0, #0x0010  // hash 즉시값

(3)
MOV R3, #0x2000  // R3에 즉시값 0x2000 을  저장
STR R0, [R3]     // R0의 값을 R3에 기록된 메모리 주소에 저장

-----------------------------------------------------------

ADD  R0, R1, R2
R0 - 00 00 00 24
R1 - 00 00 00 14
R2 - 00 00 00 10
    0x14
 +  0x10
 =  0x24

# 음수에서 양수로 (음수중 가장 큰수가 -1 임에 주의)
... FFFB -> FFFC -> FFFD -> FFFE -> FFFF -> 0000 -> 0001 -> 0002 ...

LDR R0, = 0x8000    // Save address to R0 value 8000
LDR R1, [R0]        // Get value from 8000
ADD R0, R0, #4      // Address : 8004
LDR R2, [R0]        // Get Value from 8004
ADD R3, R1, R2      // R3 = R1 + R2
LDR R0, = 0x9000    // Save address to R0 value 9000
STR R3, [R0]        // Save stored value at R3 to address 9000
--------------------------------------------------------------------------------------
## Addressing Mode ##
- (1) PreIndex Addressing with offset
- (2) Register Indirect Addressing

e.g.
x = a + b - c
    0x2000 + 0x2004 - ox2008
    R0       R1       R2

(direct addressing)
LDR R4, = 0x2000    // R4 를 메모리 주소 포인터로 사용 (address pointer)
LDR R0, [ R4 ]      // R0 에 값 a를 저장
LDR R4, = 0x2004    // R4 에 두번째 인수의 b 값이 저장된 메모리 주소 저장 (address pointer)
LDR R1, [ R4 ]      // R4 에 저장된 메모리 주소 포인터 b 값을 R1 에 저장
LDR R4, =0x2008     // R4 에 세번째 인수인 c 값이 저장된 메모리 주소 로드  (address pointer)
LDR R2, [ R4 ]      // R4 에 저장된 메모리 주소 포인터 c 값을 R2 에 저장
ADD R0, R0, R1      // R0 = R0 + R1 (a + b)
SUB R0, R0, R2      // R0 = R0 - R2 ((a + b) - c) -> x
LDR R4, =0x200A     // 최종값을 저장할 메모리 주소를 R4에 즉시값으로 저장 : 200A (address pointer)
STR R0, [ R4 ]      // x값을 R4에 저장된 메모리 주소로 저장 내보내기

(offset addressing)
LDR R4, = 0x2000     // Never Changes
LDR R0, [R4]
LDR R1, [R4, #4]     // Address = R4 + #4 -> 0x2004
LDR R2, [R4, #8]     // Address = R4 + #8 -> 0x2008
ADD R0, R0, R1
SUB R0, R0, R2
STR R0, [ R4, #0xA ] // Address = 0x200A

(Pre Index Addressing with register offset)
LDR R1, [ R4, R5 ]   // R5 : Register Offset

--------------------------------------------------------------------------------------

## LOOP ##

---------------------------
int a = 0;
for ( i = 0; i < 30; i++ )
{
    a = a + 1;
}
a => 30
---------------------------
1. Compare
2. Branch  (Condition)

PC - Program Counter

LDR R3, 0x0000      // Start, i = 0
LDR R2, 0x0000      // a = 0

(AGAIN, Branch)
ADD R2, R2, #1      // (AGAIN) a = a + 1
ADD R3, R3, #1      // i++
CMP R3, #30         // Compare,

BLT AGAIN                // Branch (LT:Less Than),  i < 30

```
