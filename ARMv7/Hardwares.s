.equ SWITCH, 0xff200040
.equ LED, 0xff200000
.global _start
_start:

	// SWITCH
	// LDR : Load Register.
	LDR R0, =SWITCH
	LDR R1, [R0]

	// LED
	// LDR : Load Register.
	LDR R0, =LED

	// STR : Store Register.
	STR R1, [R0]

// LDR    R8, [R10]            ; Loads R8 from the address in R10.
// STR    R0, [R5, R1]         ; Store value of R0 into an address equal to
// LDRSB  R0, [R5, R1, LSL #1] ; Read byte value from an address equal to
// STR    R0, [R1, R2, LSL #2] ; Stores R0 to an address equal to sum of R1; and four times R2.

