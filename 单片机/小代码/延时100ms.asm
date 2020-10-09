    ORG     0000
    LJMP    START

    ORG     8000H
START:
    LCALL   DELAY
    AJMP    START

DELAY:
    MOV     R5, #200    ;1次
D1:
    MOV     R4, #250    ;250次
D2:
    DJNZ    R4, D2      ;250次 * 200次 * 2 双周期
    DJNZ    R5, D1      ;250次 * 2
    RET
END