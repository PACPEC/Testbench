.include "macros.s"

MOVI R1, 0x10

$MOVEF F1, 0x3E48
$MOVEF F2, 0x4361

;1.57 + 3.69
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños
STF 0(R1), F3

MOVI R3, 0x04
MOVHI R3, 0x71
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x32
MOVHI R3, 0x77
ST 0(R2), R3
LDF F2, 0(R2)

; 10268.786 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales grandes
STF 2(R1), F3

MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x32
MOVHI R3, 0x77
ST 0(R2), R3
LDF F2, 0(R2)

;3.69 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños y grandes
STF 4(R1), F3

MOVI R3, 0xff
MOVHI R3, 0x03
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F2, 0(R2)

;0.000060975552 + 3.69
ADDF F3, F1, F2 ; Suma numero normal + denormal
STF 6(R1), F3

MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0xff
MOVHI R3, 0x03
ST 0(R2), R3
LDF F2, 0(R2)

;3.69 + 0.000060975552
ADDF F3, F1, F2 ; Suma denormal + numero normal
STF 8(R1), F3

MOVI R3, 0xff
MOVHI R3, 0x03
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0xff
MOVHI R3, 0x03
ST 0(R2), R3
LDF F2, 0(R2)

;0.000060975552 + 0.000060975552 
ADDF F3, F1, F2 ; Suma dos numeros denormales mas grandes
STF 10(R1), F3

MOVI R3, 0x01
MOVHI R3, 0x00
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x01
MOVHI R3, 0x00
ST 0(R2), R3
LDF F2, 0(R2)

;0.000000059604645 + 0.000000059604645 
ADDF F3, F1, F2 ; Suma dos numeros denormales mas pequeños
STF 12(R1), F3

MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x01
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F2, 0(R2)

;3.69 + NaN
ADDF F3, F1, F2 ; Suma numero + NaN
STF 14(R1), F3

MOVI R3, 0x01
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F2, 0(R2)

;NaN + 3.69
ADDF F3, F1, F2 ; Suma NaN + numero
STF 16(R1), F3

MOVI R3, 0x01
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x01
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F2, 0(R2)

ADDF F3, F1, F2 ; Suma dos NaN
STF 18(R1), F3

MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x00
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F2, 0(R2)

;3.69 + Inf
ADDF F3, F1, F2 ; Suma numero + inf
STF 20(R1), F3

MOVI R3, 0x00
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x61
MOVHI R3, 0x43
ST 0(R2), R3
LDF F2, 0(R2)

;Inf + 3.69
ADDF F3, F2, F2 ; Suma inf + numero
STF 22(R1), F3

MOVI R3, 0x00
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F1, 0(R2)
MOVI R3, 0x00
MOVHI R3, 0x7C
ST 0(R2), R3
LDF F2, 0(R2)

;Inf + Inf
ADDF F3, F1, F2 ; Suma inf + inf
STF 24(R1), F3
