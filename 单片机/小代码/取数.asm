    MOV     R7, #20
    MOV     R0, #30H
LOOP:
    MOV     A, @R0
    INC     R0
    DJNZ    R7, LOOP