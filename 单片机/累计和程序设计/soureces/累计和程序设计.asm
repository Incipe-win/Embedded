    ORG 0000
    LJMP    ABC

    ORG 0300H
ABC:
    MOV     R7, #10
    MOV     R0, #30H
    CLR     A
LOOP:
    ADD     A, @R0
    INC     R0
    DJNZ    R7, LOOP
    MOV     3AH, A
    RET
    END