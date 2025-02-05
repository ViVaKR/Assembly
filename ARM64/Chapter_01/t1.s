.global _start
.p2align 6

_start:
    mov x0, #2
    mov x1, #4
    cmp x0, x1

    addlt x2, #1

    blt less_than
    bal exit // bal function  // function으로 분기하고, 리턴 주소는 LR에 저장
    bge _terminate

less_than:
    add x2, #1

_terminate:
    mov x0, #0xff // return code 0
    mov x16, #1 // system call: exit
    svc 0 // trigger system call

exit:
    mov x0, #0
    mov x16, #1
    svc 0

// Commands (in terminal)
//-> $ as t1.s -o t1.o
//--> $ ld t1.o -o t1 -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
