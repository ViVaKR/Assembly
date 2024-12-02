.global _start
.align 2

_start:
    // 문자열 길이 계산
    adr X1, msg         // 메시지의 주소
    mov X2, #0          // 길이 초기화

strlen_loop:
    ldrb W3, [X1, X2]   // 메시지의 현재 문자를 로드
    cbz W3, strlen_done // 널 문자를 만나면 루프 종료
    add X2, X2, #1      // 길이 증가
    b strlen_loop       // 루프 반복

strlen_done:
    // write(1, msg, X2)
    mov X0, #1          // 파일 디스크립터 1 (stdout)
    adr X1, msg         // 메시지의 주소
    mov X16, #4         // write 시스템 호출 번호
    svc #0              // 시스템 호출

    // exit(0)
    mov X0, #0          // 종료 상태 0
    mov X16, #1         // exit 시스템 호출 번호
    svc #0              // 시스템 호출

msg: .asciz "Hello World!Fine Thanks And You?..\n"
