.global _main         ; Xcode 링커와 약속된 공식 진입점 _main
.align 4

_main:
    mov x0, #20       ; x0 = 20
    mov x1, #30       ; x1 = 30
    add x0, x0, x1    ; x0 = x0 + x1 (최종 결과 50이 리턴 레지스터 x0에 안착!)

    ret               ; 호출한 시스템(OS)으로 리턴하면서 프로그램 종료!
