    ORG 0000
	MOV		SP, #70H
    LJMP    START

    ORG 8000H
START:
    LCALL	DELAY
	MOV		R5, #6
	
	ORG 8100H
DELAY:
	    MOV     R5, #200
		RET
	; D1:
	; 	MOV     R6, #20
	; D2:
	; 	MOV     R7, #248
	; 	DJNZ    R7, $
	; 	DJNZ    R6, D2
	; 	DJNZ    R5, D1
	; 	RET
    END