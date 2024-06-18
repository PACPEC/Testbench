.macro $MOVIF p1 imm16
    MOVI R2, 0xA0
    MOVI R3, lo(\imm16)
    MOVHI R3, hi(\imm16)
    ST 0(R2), R3
    LDF \p1, 0(R2)
.endm
