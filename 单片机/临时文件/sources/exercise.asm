LOOP:
    MOV A, #12H         ;A = 12H
    MOV R0, #24H        ;R0 = 24H
    MOV 21H, #56H       ;(21H) = 56H
    ADD A, #12H         ;A = A + 12H = 24H
    MOV DPTR, #4316H    ;DPTR = 4316H
    ADD A, DPH          ;A = A + 43H = 67H
    ADD A, R0           ;A = A + R0 = 8BH
    CLR C               ;CY = 0
    SUBB A, DPL         ;A = A - 16H = 75H
    SUBB A, #25H        ;A = A - 25H = 50H
    INC A               ;A = A + 1 = 51H
    SETB C              ;CY = 1
    ADDC A, 21H         ;A = A + 56H + CY = A8H
    INC R0              ;R0 = 25H
    SUBB A, R0          ;A = A - 25H = 83H
    MOV 24H, #16H		;(24H) = 16H
    CLR C				;C = 0
    ADD A, @R0			;A = 83H
    AJMP LOOP
END