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
as -o demo.o demo.s

ld -macosx_version_min 14.0.0 -o demo demo.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

./demo
```
