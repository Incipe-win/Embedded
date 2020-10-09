    ORG     0000
    LJMP    START

    ORG     8000H
START:
    MOV     R1, #250
	MOV		@R1, #12
    MOV     R2, 250
	AJMP	START
    END