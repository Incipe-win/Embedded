LOOP:
    MOV A, #39H
    CPL A
    RL A
    CLR C
    RRC A
    SETB C
    RLC A
    SWAP A
    AJMP LOOP
END