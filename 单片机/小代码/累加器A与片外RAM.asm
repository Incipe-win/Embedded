; MOVX    A, @Ri
; MOVX    @Ri, A
; MOVX    A, @DPTR
; MOVX    @DPTR, A
;EG
MOV DPTR，#0100H

MOVX A，@DPTR

MOV DPTR,#0200H

MOVX @DPTR,A