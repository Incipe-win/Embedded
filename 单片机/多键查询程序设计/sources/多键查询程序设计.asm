    ORG 0000H
    LJMP    START

    ORG 0030H

START:
    SETB    P1.0
    SETB    P1.1
    MOV     A, P1
    ANL     A, #03H
    RL      A
    MOV     DPTR, #TABL
    JMP     @A+DPTR

TABL:
    AJMP    CS0
    AJMP    CS1
    AJMP    CS2
    AJMP    CS3

CS0:
    MOV     P1, #11101111B
    SJMP    START
CS1:
    MOV     P1, #11011111B
    SJMP    START
CS2:
    MOV     P1, #10111111B
    SJMP    START
CS3:
    MOV     P1, #01111111B
    SJMP    START
    
    END