    ORG     0000
    LJMP    LOOP
    ORG     0100H
LOOP:
    MOV     P1, #00001111B
    LCALL   TIME
    MOV     P1, #11110000B
    LCALL   TIME
    SJMP    LOOP
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
