POP		LEA	R0, stackbase
		NOT	R0, R0
		ADD	R0, R0, 2		;R0 = -(stack-1)
		ADD	R0, R0, R6		;R6 = stack point
		BRz	underFlow		;If nothing is there to pop, then go to underflow

		LDR	R0, R6, 0		;the actual pop
		ADD	R6, R6, 1		;increments our stack pointer for next time
		AND	R5, R5, 0		;success
		RET

underFlow	LEA	R0, underFlowMsg	;failure
		PUTS
		AND	R5, R5, 0
		ADD	R5, R5, 1
		RET

stackbase	.FILL	x000
underFlowMsg	.FILL   x00A
		.STRINGZ "Error. Stack is empty!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PUSH		LEA	R1, stackMax
		NOT	R1, R1
		ADD	R1, R1, 1		;R1 = -(stack-1)
		ADD	R1, R1, R6		;R6 = stack point
		BRz	overFlow		;If nothing is there to push, then go to overflow

		ADD	R6, R6, -1		;increments our stack pointer for next time
		STR	R6, R0, 0		;the actual push
		BR	success
		

overFlow	LEA	R0, overFlowMsg
		PUTS
		AND	R5, R5, 0
		ADD	R5, R5, 1		;failure
		RET

success		AND	R5, R5, 0		;success
		RET

stackMax	.BLKW	9
overFlowMsg	.FILL   x00A
		.STRINGZ "Error. Stack is full!"