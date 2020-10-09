MOV     R0, #0X30040000
LDR     R1, [R0]
LDR     R2, [R0, #4]
CMP     R1, R2
MOVHI   R1, #1
MOVLO   R1, #-1
MOVEQ   R1, #0
STR     R1,[R0, #8]