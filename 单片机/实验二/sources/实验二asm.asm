    ORG     0000H
    LJMP    START
    ORG     0003H
    LJMP    INT_0
    ORG     0013H
    LJMP    INT_1

START:
    MOV     P2, 00000000B
    SETB	P0.4
    SETB    EA
    SETB    EX0
    SETB    EX1
    SETB    IT1
    SETB    IT0
	MOV     R1, #16
    MOV     R2, 00H
DLOOP:
    LJMP   DLOOP

INT_0:
    ; 保护现场
    CLR     EA		
	PUSH	PSW		
	PUSH	ACC
	SETB	EA	
    ; 中断子程序	
    CPL     P0.4
    ; 恢复现场	
    CLR     EA		
	POP		ACC		
	POP		PSW
    SETB    EA		
    RETI			

INT_1:
    CLR     EA		
	PUSH	PSW		
	PUSH	ACC
	SETB	EA		
    ; 中断子程序
    ; 查表程序
    CJNE    R2, #16, CONTINUE
    MOV     R2, #00H
CONTINUE:
    MOV     DPTR, #TABLE
    MOV     A, R2
    MOVC    A, @A + DPTR
    MOV     P2, A
    INC     R2
    ; 中断子程序
    CLR     EA		
	POP		ACC		
	POP		PSW
    SETB    EA		
    RETI			

TABLE: 
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 77H, 7CH, 58H, 5EH, 79H, 71H
END
