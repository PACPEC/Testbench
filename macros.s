.macro $MOVIF p1 imm16
    MOVI R2, 0xA0
    MOVHI R2, 0x00
    MOVI R3, lo(\imm16)
    MOVHI R3, hi(\imm16)
    ST 0(R2), R3
    LDF \p1, 0(R2)
.endm

.macro $movei p1 imm16
        movi    \p1, lo(\imm16)
        movhi   \p1, hi(\imm16)
.endm
