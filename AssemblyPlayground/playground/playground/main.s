//  main.s
//  playground
//  Created by 김범준 on 2026 .7. 26

.include "section_macros.inc"
.global _main
.align 2


CSTRING_SECTION

format_str: .asciz "%lld + %lld = %lld"

CODE_SECTION
_main:
    stp x29, x30, [sp, #-32]!
    mov x20, sp
    stp x19, x20, [sp, #16]
    
    
    adrp x0, format_str@PAGE
    add x0, x0, format_str@PAGEOFF
    
    mov x19, #43
    mov x20, #109
    sub sp, sp, #16
    stp x19, x20, [sp, #0]
    bl _printf
    add sp, sp, #16
    
    
    
    mov x0, #0
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp], #32
    ret
