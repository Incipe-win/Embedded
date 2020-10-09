MAIN:
    SETB    P1.0
    LCALL   DELAY
    CLR     P1.0
    LCALL   DELAY
    AJMP    MAIN

DELAY:
    MOV     R7, #250
D1:
    MOV     R6, #250
D2:
    DJNZ    R6, D2
    DJNZ    R7, D1
    RET
END