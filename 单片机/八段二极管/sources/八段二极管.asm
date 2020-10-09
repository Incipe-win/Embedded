    ORG 0000
    LJMP    START

    ORG 0100H
START:
    MOV     P0, #3FH
    LCALL   TIME
    MOV     P0, #06H
    LCALL   TIME
    MOV     P0, #5BH
    LCALL   TIME
    MOV     P0, #4FH
    LCALL   TIME
    MOV     P0, #66H
    LCALL   TIME
    MOV     P0, #6DH
    LCALL   TIME
    MOV     P0, #7DH
    LCALL   TIME
    MOV     P0, #07H
    LCALL   TIME
    MOV     P0, #7FH
    LCALL   TIME
    MOV     P0, #6FH
    LCALL   TIME
    SJMP    START

TIME:
    MOV     R5, #200    ;1次, 单周期
D1:
    MOV     R6, #20     ;200次, 单周期, 由DJNZ    R5, D1跳转产生
D2:
    MOV     R7, #248    ;20 + 200 * 20由DJNZ    R6, D2 和 DJNZ    R5, D1跳转产生
    DJNZ    R7, $       ;(20 * 248 + 200 * 20 * 248) * 2双周期
    DJNZ    R6, D2      ;20 * 200 * 2次 双周期
    DJNZ    R5, D1      ;200 * 2次 双周期
    RET                 ;2 双周期
    ;延时总次数 1 + 200 + 20 + 200 * 20 + (20 * 248 + 200 * 20 * 248) * 2 + 20 * 200 * 2 + 200 * 2 + 2 = 2006543次
    ;延时时间 2s?
    END
