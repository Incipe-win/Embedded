    ORG     0000H
    LJMP    START
    ORG     0023H
    LJMP    SER

    ORG     0030H
START:
    MOV     SCON, #01010000B   ; 串口方式1
    SETB    EA                 ; 开总中断
    SETB    ES                 ; 开串口中断
    MOV     TMOD, #00100000B   ; 定时器方式2 波特率发生器
    ; 初值
    MOV     TH1, #0F3H  
    MOV     TL1, #0F3H
    SETB    TR1                ; T1开始运行
    MOV     PCON, #00          ; // 波特率不加倍位
    ;查表开始
    MOV     R1, #16
    MOV     R2, 00H

MAIN:
    CJNE    R2, #16, CONTINUE
    MOV     R2, #00H
CONTINUE:
    MOV     DPTR, #TABLE
    MOV     A, R2
    MOVC    A, @A + DPTR
    MOV     P2, A
    INC     R2
    ; 查表结束
    LCALL   DLY1S
OUTPUT:
    ; 发送数据
    MOV     SBUF, A
    ; 数据是否发送完毕
    JNB     TI, $
    CLR     TI
    SJMP    MAIN 

TABLE: 
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 77H, 7CH, 58H, 5EH, 79H, 71H

SER:
    ; 接收数据
    JB      RI, LOOP
LOOP:
    CLR     RI
    MOV     P2, SBUF
    RETI

; 延时子程序
DLY1S:
    MOV R5, #10          ;执行1次, 单周期指令
DLY1:
    MOV R6, #200         ;执行10次, 单周期指令
DLY2:
    MOV R7, #248         ;执行 200 * 10 次, 单周期指令
    DJNZ R7, $           ;执行 2 * 248 * 200 * 10, 双周期指令, 所以要 × 2
    DJNZ R6, DLY2        ;执行 2 * 200 * 10, 双周期指令
    DJNZ R5, DLY1        ;执行 2 * 10, 双周期指令
    RET                 ;双周期指令 2
    ;总时间 1 + 10 + 200 * 10 + 2 * 248 * 200 * 10 + 2 * 200 * 10 + 2 * 10 + 2 = 998033us, 即延时1s
END

;     ORG     0000H
;     LJMP    START
;     ORG     0023H
;     LJMP    SBR

;     ORG     0030H
; START:
;     MOV     SCON, #01010000B
;     SETB    EA
;     SETB    ES
;     MOV     TMOD, #00100000B
;     MOV     TH1, #0F3H
;     MOV     TL1, #0F3H
;     SETB    TR1
;                 ;BODE = 2400bps
;     MOV     PCON, #00
;     MOV     R4, #0
;     MOV     R1, #16
;     MOV     R2, 00H
;     ;前面都是初始化

; MAIN:
;     CJNE    R2, #16, CONTINUE
;     MOV     R2, #00H
; CONTINUE:
;     MOV     DPTR, #TABLE
;     MOV     A, R2
;     MOVC    A, @A + DPTR
;     MOV     P2, A
;     INC     R2
;     LCALL   DLY1S
;     ;
;     CJNE    R4, #0, LOOP
;     SJMP    MAIN 
; LOOP:
;     MOV     SBUF, A
; LOOP1:
;     JB	    TI, LOOP1
;     CLR		TI
;     MOV     R4, #0
;     SJMP    MAIN

; TABLE: 
;     DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 77H, 7CH, 58H, 5EH, 79H, 71H

; SBR:
;     MOV     P2, SBUF
;     CLR 	RI
;     MOV     R4, #1
;     RETI

; DLY1S:
;     MOV R5, #10          ;执行1次, 单周期指令
; DLY1:
;     MOV R6, #200         ;执行10次, 单周期指令
; DLY2:
;     MOV R7, #248         ;执行 200 * 10 次, 单周期指令
;     DJNZ R7, $           ;执行 2 * 248 * 200 * 10, 双周期指令, 所以要 × 2
;     DJNZ R6, DLY2        ;执行 2 * 200 * 10, 双周期指令
;     DJNZ R5, DLY1        ;执行 2 * 10, 双周期指令
;     RET                 ;双周期指令 2
;     ;总时间 1 + 10 + 200 * 10 + 2 * 248 * 200 * 10 + 2 * 200 * 10 + 2 * 10 + 2 = 998033us, 即延时1s
; END
	

;     ORG     0000H
;     LJMP    START
;     ORG     0023H
;     LJMP    SBR

;     ORG     0030H
; START:
;     MOV     SCON, #01010000B
;     SETB    EA
;     SETB    ES
;     MOV     TMOD, #00100000B
;     MOV     TH1, #0F3H
;     MOV     TL1, #0F3H
;     SETB    TR1
;                 ;BODE = 2400bps
;     MOV     PCON, #00
;     MOV     R4, #0
;     MOV     R1, #16
;     MOV     R2, 00H
;     ;前面都是初始化

; MAIN:
;     CJNE    R2, #16, CONTINUE
;     MOV     R2, #00H
; CONTINUE:
;     MOV     DPTR, #TABLE
;     MOV     A, R2
;     MOVC    A, @A + DPTR
;     MOV     P2, A
;     INC     R2
;     LCALL   DLY1S
;     ;
;     CJNE    R4, #0, LOOP
;     SJMP    MAIN 
; LOOP:
;     MOV     SBUF, A
;     MOV     R4, #0
;     SJMP    MAIN

; TABLE: 
;     DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 77H, 7CH, 58H, 5EH, 79H, 71H

; SBR:
;     JB      RI, LOOP2
;     CLR     TI
; LOOP2:
;     CLR     RI
;     MOV     P2, SBUF
;     MOV     R4, #1
;     RETI

; DLY1S:
;     MOV R5, #10          ;执行1次, 单周期指令
; DLY1:
;     MOV R6, #200         ;执行10次, 单周期指令
; DLY2:
;     MOV R7, #248         ;执行 200 * 10 次, 单周期指令
;     DJNZ R7, $           ;执行 2 * 248 * 200 * 10, 双周期指令, 所以要 × 2
;     DJNZ R6, DLY2        ;执行 2 * 200 * 10, 双周期指令
;     DJNZ R5, DLY1        ;执行 2 * 10, 双周期指令
;     RET                 ;双周期指令 2
;     ;总时间 1 + 10 + 200 * 10 + 2 * 248 * 200 * 10 + 2 * 200 * 10 + 2 * 10 + 2 = 998033us, 即延时1s
; END