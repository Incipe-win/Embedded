    AREA SORT, CODE, READONLY
    ENTRY
START
    MOV R1, #0X8
LP  
    LDR R0, =0X400004
    SUBS R1, R1, #1
    BEQ EXIT
    MOV R7, R1
LP1
    LDR R2, [R0], #4
    LDR R3, [R0]
    CMP R2, R3
    STRLO R3, [R0, #-4]
    STRLO R2, [R0]
    SUBS R7, R7, #1
    BNE LP1
    B LP
EXIT
    END