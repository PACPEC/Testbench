.include "macros.s"
MOVI R1, 0x10
MOVI R2, 0x00
MOVHI R2, 0x80
for1:   
        $MOVIF F1, 0xBE00 ; -1.0
for2:
        $MOVIF F2, 0xBF00 ; -1.5

        $MOVIF F5, 0x0000
        ADDF F6, F1, F5 ; zr = y
        ADDF F5, F2, F5 ; zi = x

        MOVI R4, 0x00
while:  
        ; zr1      
        MULF F4, F6, F6 ; zr*zr
        MULF F3, F5, F5 ; zi*zi
        SUBF F4, F4, F3 ; zr*zr - zi*zi
        $MOVIF F3, 0x3D28 ; 0.79
        SUBF F4, F4, F3 ; zr*zr - zi*zi - 0.79

        ;zi
        MULF F3, F6, F5 ; zr*zi
        ADDF F3, F3, F3 ; zr*zi*2
        $MOVIF F0, 0x3866 ; 0.15
        ADDF F3, F3, F0 ; zr*zi*2 + 0.15
        
        ;if clause
        MULF F4, F6, F6 ; zr*zr
        MULF F3, F5, F5 ; zi*zi
        ADDF F3, F4, F3 ; zr*zr + zi*zi
        $MOVIF F4, 0x4200
        SUBF F4, F3, F4
        STF 0(R1), F4
        LD R3, 0(R1)
        AND R3, R3, R2
        BZ R3, Endwhile

        ADDI R4, R4, 0x01
        MOVI R5, 0x64
        CMPLTU R5, R4, R5
        BNZ R5, while
Endwhile:
        $MOVIF F4, 0x3333 ; 0.025
        ADDF F2, F2, F4
        ;Jump to beginning of for2 if F2 < 1.5

        $MOVIF F4, 0x3F00 ; 1.5
        SUBF F4, F2, F4
        STF 0(R1), F4
        LD R3, 0(R1)
        AND R3, R3, R2
        BNZ R3, for2
; End for2
        $MOVIF F3, 0x3533 ; 0.05
        ADDF F1, F1, F3
        ;Jump to beginning of for1 if F1 < 1.0

        $MOVIF F3, 0x3E00 ; 1.0
        SUBF F3, F1, F3
        STF 0(R1), F3
        LD R3, 0(R1)
        AND R3, R3, R2
        BNZ R3, for1
; End for1
        ADDF F2, F2, F4
        $MOVIF F3, 0x3F00 ; 1.5
        