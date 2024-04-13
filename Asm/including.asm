%include "extern.inc"

; Macros and EQU definitions are often defined inside of included files

section .data
	text db "Hello, World!",10,0

section .text
	global _start

_start:
	print text
	exit 
