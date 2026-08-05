.global _main
.align 2
_main:
    bl 함수야
    mov x0, #0    
    mov x16, #1   
    svc #0x80     

함수야:
    ret                  