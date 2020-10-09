UP0:
    MOV     R4, #10
    MOV     R2, #00H
    MOV     DPTR, #TAB
UP:
    MOV     A, R2
    MOVC    A, @A+DPTR
    MOV     P0, A
    LCALL   D1S
    INC     R2
    DJNZ    R4, UP
    SJMP    UP0
TAB:
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH

D1S:
    MOV R5,#10          ;1
DLY1:
    MOV R6,#200         ;1*10
DLY2:
    MOV R7,#248         ;1*200*10
    DJNZ R7,$           ;2*248*200*10
    DJNZ R6,DLY2        ;2*200*10
    DJNZ R5,DLY1        ;2*10
    RET                 ;2
END