.global _start
_start:

	MOV R0, #5
	MOV R1, #7
	// BAL add2
	BL add2  // LR Register
	MOV R3, #145


add2:
	ADD R2, R0, R1
	Bx LR
