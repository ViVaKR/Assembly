# Assembly

> 고급언어 -> 컴파일러 -> 어셈블리어(.s) - 어셈블러 -> 기계어(.o) -> 링커 -> 실행파일

## 명령어 수행방식 ( *intel* )

> OPCODE : 명령어
>
> OPERAND : 피연산자
>
> (ex) **EBX 의 값을 EAX 에 더함**
>
| OPCODE | OPERAND`(Destination)` | OPERAND2`(Source)` |
| :----: | :--------------------: | :----------------: |
|  ADD   |          EAX           |        EBX         |

## 레지스터

>
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

>- 16비트 : IA-16(x86-16)
>- 32비트 : IA-32(x86-32)
>- 64비트 : AMD64(x86-64)

## 명령어 (Operator)

>- mov eax, 1

## 피연산자 (Operand)

## 동사(명령어)와 목적어(피연산자)

>- read(`operator`) data(`operand`)
>- 대소문자 구분이 없이

r0 ~ r7

- ir : return pointer
- sp : stack pointer
- pc : program counter, next pointer
- cpsr : 프로그램에 대한 정보를 저장,플래그 , 음수 양수 큰수 등등.. 작업에 대한특별한 정보 제공
- spsr :

- label : 고급 언어의 함수와 일종의 동의어..
- 시작 레이블 설정
- r7 : System Call (특수목적)
- 시스템 콜, 이터럽트
- SWI : 소프트웨어 인터럽트

## Apple M1, MacOS ARM64

```bash
# check mac versions
sw_vers

cat /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/ syscall.h

# e.g. (1) : as command -> macOS LLVM Clang Assembler link
as -o demo.o demo.s

# (1 - 2)
as -arch arm64 -o demo.o demo.s

# (1 - 3) : ld command -> object file convert to bin file
ld -macosx_version_min 14.0.0 -o demo demo.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

#-> lSystem : 표준 라이브러리 libSystem.dylib link
#-> syslibroot : libSystem.dylib file path
#-> -e _start : Entry point
#-> -arch arm64 : m1 용으로 변경


# (1 - 4) run test
./demo

# e.g. (2)
gcc hello_arm.s -o hello_arm
./hello_arm

# e.g. (3)
clang hello.c -o hello

```

## DisAssemble

`objdump -D demo`

## Compile Process

>- hello.c >- (compile) >- hello.o >- link >- hello

## CPSR

>- N : 마이너스
>- Z : 0
>- C :
>- V :

- Rd : destination register
- Rn : first
- Rm : second

## Makefile (C Project)

- TARGET : Dependency

>- command
>- Source (.c) -> Object(.o) -> excute file (.out)

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
  >- Points to the stack base during a function call, to recover stack from the calling function.(함수 호출 중에 스택 베이스를 가리켜 호출 함수에서 스택을 복구)
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

>- Code must be aligned to 4-byte boundary
>- Their lower 32 bits can be addressed by the names W0 to W30

## Stack

1. 함수 내의 로컬 변수임시 저장
2. 함수 호출 시 파라미터 전달
3. 복귀 주소 저장
4. FILO (First In Last Out)


```bash
  # Ubuntu nasm
  >- sudo apt-get install nasm

  # 64 bit
  >- nasm -f elf64 file.asm -o file.o
  >- ld file.o -o file
```
