    ORG 0000H
    LJMP    START			

    ORG 0300H
START:
    MOV     A, #0FEH

OUTPUT:
    MOV     P1, A
    RL      A
    LCALL   Delay
    LJMP    OUTPUT

Delay:
    MOV     R4, #4
L1:
    MOV     R6, #0
    MOV     R7, #0

DLoop:
    DJNZ    R7, DLoop
    DJNZ    R6, DLoop
    DJNZ    R4, L1
    RET
    END