	ORG     0000H
    LJMP    START

    ORG     0030H
START:
    MOV     R5, #3
SUBROUTINE:
    MOV     P2, #0
    LCALL   DELAY
    MOV     P2, #0FFH
    LCALL   DELAY
    DJNZ    R5, SUBROUTINE
DLOOP:
    MOV     P2, P3
    LJMP    DLOOP

DELAY:
    MOV     R0, #100
D1:
    MOV     R1, #50
D2:
    MOV     R2, #25
    DJNZ    R2, $
    DJNZ    R1, D2
    DJNZ    R0, D1
    RET
END
