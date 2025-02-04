# ASM

## Applie Silicon (M1, M2)

- ARMv8-A 아키텍처
- ARrch64 명령어 세트

## 연산자

- AND
- ORR
- EOR : -bxor
- MVN : -bnot

```bash

uname -m
# arm64

clang -arch arm64 -dM -E - < /dev/null | grep __ARM_ARCH

#define __ARM_ARCH 8
#define __ARM_ARCH_ISA_A64 1
#define __ARM_ARCH_PROFILE 'A'

sysctl -a | grep machdep.cpu
# machdep.cpu.cores_per_package: 8
# machdep.cpu.core_count: 8
# machdep.cpu.logical_per_package: 8
# machdep.cpu.thread_count: 8
# machdep.cpu.brand_string: Apple M1
```

# Apple Silicon (M1, M2 등)

- 아키텍처 : ARMv8-A.
- 명령어 세트 : AARch64
- 레지스터 : 31개의 범용 레지스터 (X0-X30), SP(스택포인터), PC (프로그램 카운터)

```bash
arm-linux-gnueabi-as hello.s -o hello.o
arm-linux-gnueabi-gcc hello.o -o hello -nostdlib
./hello

echo $?
# 42
# file hello
```

	mov r0, #0x42
	and r1, r0, #0x26

	mov r0, #0x42
	eor r1, r0, #0x26

	mov r0, #0x42
	mvn r1, r0 // bitwise not

	mov r0, #0x42
	mvn r1, r0 // bitwise not

    mov r0, #25
	mov r1, #-25
	mov r2, #16
	mov r3, #-16

## LSL

	mov r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1
	lsl r0, r0, #1

```bash
lldb ./hello
b main
r
si
re read x0
si
re read x16


```

## ARM CPU

- R0 ~ R14 : 15개의 범용 레지스터
- R13 : SP, 스택의 주소
- R14 : LR, 함수 호출시 되돌아갈 함수의 주소 레지스터
- R15 : PC, 다음 실해할 프로그램의 주소 레지스터
- CPSR ; 상태 레지스터
