MOVI R1, 16

$MOVIF F1, 0x3E48
$MOVIF F2, 0x4361

; 1.57 / 3.69
DIVF F3, F1, F2 ; Division dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x7104
$MOVIF F2, 0x7732

; 10268.786 / 29468.352
DIVF F3, F1, F2 ; Division dos numeros normales grandes
STF 2(R1), F3

$MOVIF F1, 0x7732
$MOVIF F2, 0x4361

DIVF F3, F1, F2 ; Division dos numeros normales grandes y pequeños
STF 4(R1), F3

$MOVIF F1, 0x0001
$MOVIF F2, 0x03ff

;0.000000059604645 / 0.000060975552
DIVF F3, F1, F2 ; Division dos numeros denormales diferentes
STF 6(R1), F3

DIVF F3, F1, F1 ; Division dos numeros denormales iguales
STF 8(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7C01

DIVF F3, F1, F2 ; Division numero / NaN
STF 10(R1), F3

DIVF F3, F2, F1 ; Division NaN / numero
STF 12(R1), F3

DIVF F3, F2, F2 ; Division dos NaN
STF 14(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7C00

DIVF F3, F1, F2 ; Division numero / inf
STF 16(R1), F3

DIVF F3, F2, F1 ; Division inf / numero
STF 18(R1), F3

DIVF F3, F2, F2 ; Division inf / inf
STF 20(R1), F3

$MOVIF F2, 0x0000

DIVF F3, F1, F2 ; Division entre 0
STF 24(R1), F3

DIVF F3, F2, F2 ; Division 0 / 0
STF 26(R1), F3