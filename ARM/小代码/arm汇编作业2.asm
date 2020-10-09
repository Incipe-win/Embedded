    LDR     R0, =0X30080000
    LDR     R1, =0
    LDR     R3, =0X30082000
    LDR     R7, =100

LOOP
    LDR     R2, [R0], #4
    CMP     R2, #0
    BNE     NEXT
    ADDEQ     R1, R1, #1
NEXT
    SUBS    R7, R7, #1
    BNE     LOOP
    STR     R1, [R3]
    B $

