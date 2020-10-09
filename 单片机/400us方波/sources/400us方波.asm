    ; 400us·½²¨£¬12MHZ¾§Õñ£¬·½Ê½1
    ORG     0000H
    LJMP    START
    ORG     000BH
    LJMP    TIMER0

    ORG     0100H
START:
    MOV     TMOD, #00000001B
    MOV     TH0, #0FFH
    MOV     TL0, #38H
    MOV     IE, #10000010B
    MOV     IP, #00000010B
    SETB    TR0
    SJMP    $
TIMER0:
    CPL     P1.0
    MOV     TH0, #0FFH
    MOV     TL0, #38H
    RETI
    END