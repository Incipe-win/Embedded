MAIN:
    mov     p1, #0ffh
    lcall   delay
    ljmp    MAIN
DELAY:
    mov     r7, #250h
D1:
    mov     r6, #250h
D2:
    djnz    r6, D2
    djnz    r7, D1
    ret
end