    ORG     0000H
    LJMP    START
    ORG     000BH
    LJMP    TIMER0

    ORG     0100H
START:
    MOV     TMOD, #00000001B
    MOV     TH0, #3CH
    MOV     TL0, #0B0H 
    MOV     A, #0FEH
    MOV     R0, #20
    MOV     IE, #10000010B
    MOV     IP, #00000010B
    SETB    TR0
    MOV     P1, A
    SJMP 	$
TIMER0:
    DJNZ    R0, LOOP
    MOV     R0, #20
    MOV     P1, A
    RL      A
LOOP:
    MOV     TH0, #3CH
    MOV     TL0, #0B0H
    RETI
END