    MOV     A, #0FEH
UP:
    MOV     P1, A
    LCALL   DELAY
    RL      A
    SJMP    UP

DELAY:
    MOV     R7, #2
DELAY11:
    MOV     R6, #250
    DJNZ    R6, $
    DJNZ    R7, DELAY11
    RET
END