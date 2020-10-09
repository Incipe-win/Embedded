    ORG 0000H
    LJMP START

    ORG 30H
START:
    MOV SP, #5FH
    MOV A, #80H

LOOP:
    MOV P1, A
    RL A
    LCALL DELAY
    LJMP LOOP

DELAY:
    MOV R7, #255
D1:
    MOV R6, #255
D2:
    NOP
    NOP
    NOP
    NOP
    DJNZ R6, D2
    DJNZ R7, D1
    RET
END