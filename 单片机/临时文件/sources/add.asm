LOOP:
    MOV     34H, #10H
    MOV     R0, #13H
    MOV     A, 34H
    ADD     A, R0
    MOV     R1, #34H
    ADD     A, @R1
    AJMP    LOOP
END