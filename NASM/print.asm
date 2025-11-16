global main
extern printf
extern ExitProcess

section .data
msg db "Hello, World!", 10, 0

section .text
main:
    push rbp
    mov rbp, rsp
    ; 보수적으로 40(0x28) 바이트 확보: 32바이트 shadow + 추가 정렬 여유
    sub     rsp, 64

    mov     rcx, msg      ; 첫번째 인자 = 포맷 문자열
    call    printf

    add     rsp, 64       ; 복구
    pop rbp
    xor     ecx, ecx      ; Exit code = 0
    call    ExitProcess


; Microsoft x64 calling convention(윈도우에만 해당)

; Shadow Space (Home Space) : 호출받는 함수는 반드시 스택에 32 바이트(4개의 레지스터 크기)를 확보해야 함.
; RCX, RDX, R8, R9 에 들어온 인자를 저장할 공간으로 예약된 것
; 즉, printf 를 호출하기 전에 반드시 만들어 줘야 함

; 16 바이트 정렬보장 : 함수 호출 직전 RSP는 16바이트로 정렬되어 있어야 함
; call 명령어 직전 기준
; call 자겣가 8바이트 리턴주소를 push 함으로.. call 하기 직전 RSP 가 16의 배수 + 8 이어야 call 후에 16의 배수가 됨

; main 이 프로그램 진입점이므로 OS 가 main 을 호출할 때 이미 RSP 를 16바이트 정렬된 상태 + 8 바이트 (리턴 주소 push 된 상태)로 넘겨줌..

; 그러므로 main 처음에 해야 할 일:
; 현재 RSP = 16n + 8
; printf 호출전에 RSP 를 16의 배수로 만들어야함.
; 동시에 shadow space 32 바이트도 확보해야 함.
