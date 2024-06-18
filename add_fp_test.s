.include "macros.s"

MOVI R1, 0x10

$MOVIF F1, 0x3E48
$MOVIF F2, 0x4361

;1.57 + 3.69
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x7104
$MOVIF F2, 0x7732

; 10268.786 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales grandes
STF 2(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7732

;3.69 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños y grandes
STF 4(R1), F3

$MOVIF F1, 0x03ff
$MOVIF F2, 0x4361

;0.000060975552 + 3.69
ADDF F3, F1, F2 ; Suma numero normal + denormal
STF 6(R1), F3

;3.69 + 0.000060975552
ADDF F3, F2, F1 ; Suma denormal + numero normal
STF 8(R1), F3

$MOVIF F1, 0x03ff

;0.000060975552 + 0.000060975552 
ADDF F3, F1, F1 ; Suma dos numeros denormales mas grandes
STF 10(R1), F3

$MOVIF F1, 0x0001

;0.000000059604645 + 0.000000059604645 
ADDF F3, F1, F1 ; Suma dos numeros denormales mas pequeños
STF 12(R1), F3


$MOVIF F1, 0x4361
$MOVIF F2, 0x7C01

;3.69 + NaN
ADDF F3, F1, F2 ; Suma numero + NaN
STF 14(R1), F3

;NaN + 3.69
ADDF F3, F2, F1 ; Suma NaN + numero
STF 16(R1), F3

ADDF F3, F2, F2 ; Suma dos NaN
STF 18(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7C00

;3.69 + Inf
ADDF F3, F1, F2 ; Suma numero + inf
STF 20(R1), F3

;Inf + 3.69
ADDF F3, F2, F1 ; Suma inf + numero
STF 22(R1), F3

;Inf + Inf
ADDF F3, F1, F1 ; Suma inf + inf
STF 24(R1), F3
