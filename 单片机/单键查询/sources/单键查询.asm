    ORG     0000
    LJMP    START

    ORG     0030H
START:
    SETB    P1.0
    JB      P1.0, ABC
    MOV     P1, #11001111B
    SJMP    START
ABC:
    MOV     P1, #00001111B
    LCALL   TIME
    MOV     P1, #11111111B
    LCALL   TIME
    SJMP    START

TIME:
    MOV     R5, #200
D1:
    MOV     R6, #20
D2:
    MOV     R7, #248
    DJNZ    R7, $
    DJNZ    R6, D2
    DJNZ    R5, D1
    RET
    END