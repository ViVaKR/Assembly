; (Section)
; All x86_64 Assembly files have three sections
; .data section : Defined before compilation
; .bss section  : For future use.
; .text section  : The Actual Code.

; (Labels)
; - Upon compilation, the compiler will calculate the location in which the label will sit in memory

; "Start" Label
; - The '_start' label is essential for all programs.
; If the linker cannot find '_start', it will throw an error.

; "Global" Label
; - The word 'global is used when you want the linker to be able to know the address of
; some a label.
; - The object file generatied will contain a link to every label declared 'global'
; - In this case, we have to declare '_start' as blobal since it is required for
; the code to be properly linked.

; (Flags)
; - Flags, like registers, hold data.
; - Flags only hold 1 bit each. They are either true or false.
; - Individual flags are part of a larger register
; - CF : Carry
; - PF : Parity
; - ZF : Zero
; - SF : Sign
; - OF : Overflow
; - AF : Adjust
; - IF ; Interrupt Enabled

; (Pointers)
; - They hold its memory address (hold data).
; - rip (eip, ip) : Index pointer, Next Address to be executed in the control flow.
; - rsp (esp, sp) : Stack pointer, Points to the top address of the stack.
; - rbp (ebp, bp) : Stack base pointer, Points to the bottom of the stack.

; (Control Flow)
; - All code runs from top to bottom by default.
; - The direction a program flows is called the control flow.
; - The 'rip' register holds the address of the next instruction(명령) to executed.
; - After each instruction, it is incremented by 1, 
; making the control flow naturally flow from top to bottom

; (Jumps)
; - Jumps can be used to jump to different parts of code based on labels 
; - e.g. -> `jmp _start`

; (Comparisons)
; - Comparisons allow programs to be albe to take different paths based on certain conditions
; - e.g. 
; `cmp rax, 23`
; `cmp rax, rbx`
; a == b -> ZF = 1
; a != b -> ZF = 0

; (Conditional Jumps)
; jump symbol(singed)	(unsigned)		result of cmp a, b
; je						-					a = b
; jne						-					a != b
; jg						ja					a > b
; jge						jae					a >= b
; jl						jb					a < b
; jle						jbe					a <= b
; jz						-					a = 0
; jnz						-					a != 0
; jo						-					Overflow occurred
; jno						-					Overflow dit not occur
; js						-					Jump if signed
; jns						-					Jump if not signed
; - e.g.
; `cmp rax, 23`
; `je _doThis` 

; (Registers as Pointers)
; The default registers can be treated as pointers.
; - To treat a register as a pointer, surround the register name with square brackets
; - 'rax' -> '[rax]`
; - e.g.
; `mov rax, [rbx]` 
; -> Loads the value the rbx register is pointing to into the rax register.

; (Call)
; - When 'Call' is used, the original position the call was made can be returned to using 'ret'
; 
 
 
;====================================================================================;
section .data
	text db "Hello, World!",10 ; 10 newline, '\n', db  byte define

section .text
	global _start

; SysCall 
; - https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit	 

_start:
	call _printHello
	
	; sys_exit(error number) 
	mov rax, 60				; exit							; rip = x + 5
	mov rdi, 254			; error code, 0 - no error		; rip = x + 6
	syscall					;								; rip = x + 7
	
_printHello:
	mov rax, 1				; write							; rip = x
	mov rdi, 1				; standard output				; rip = x + 1
	mov rsi, text			; *buf (text)					; rip = x + 2
	mov rdx, 14				; text count, length			; rip = x + 3
	syscall													; rip = x + 4 
	ret
	
; compile 

; - `nasm -f elf -o hello.o hello.asm`
; - `ld -cynamic-linker /lib64/ld-linux-x86_64.so.1 -o hello hello.o
; - ./hello





