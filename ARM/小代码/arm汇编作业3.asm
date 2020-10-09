    ;没考虑溢出
    LDR     R0, =0
    LDR     R1, =100
    LDR     R2, =1

LOOP
    ADD     R0, R0, R2     ;R0 = R0 + R2
    CMP     R1, R2
    BHS     LOOPEND
    ADD     R2, R2, #1
    B       LOOP

LOOPEND
    END