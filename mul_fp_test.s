.include "macros.s"

MOVI R1, 0x10

$MOVIF F1, 0x3E48
$MOVIF F2, 0x4361

MULF F3, F1, F2 ; Multiplicacion dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x3E48
$MOVIF F2, 0x7104

MULF F3, F1, F2 ; Multiplicacion dos numeros normales pequeños y grandes (no overflow)
STF 2(R1), F3

$MOVIF F1, 0x7104
$MOVIF F2, 0x7732

MULF F3, F1, F2 ; Multiplicacion dos numeros normales grandes (overflow)
STF 4(R1), F3

$MOVIF F1, 0x03ff
$MOVIF F2, 0x4361
MULF F3, F1, F2 ; Multiplicacion numero normal * denormal
STF 6(R1), F3

MULF F3, F2, F1 ; Multiplicacion denormal * numero normal
STF 8(R1), F3

MULF F3, F1, F1 ; Multiplicacion dos numeros denormales (overflow)
STF 10(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7C01

MULF F3, F1, F2 ; Multiplicacion numero * NaN
STF 12(R1), F3

MULF F3, F2, F1 ; Multiplicacion NaN * numero
STF 14(R1), F3

MULF F3, F2, F2 ; Multiplicacion dos NaN
STF 16(R1), F3

$MOVIF F1, 0x4361
$MOVIF F2, 0x7C00

MULF F3, F1, F2 ; Multiplicacion numero * inf
STF 18(R1), F3

MULF F3, F2, F1 ; Multiplicacion inf * numero
STF 20(R1), F3

MULF F3, F2, F2 ; Multiplicacion inf * inf
STF 22(R1), F3

$MOVIF F1, 0x0000

MULF F3, F1, F2 ; Multiplicacion 0 * inf
STF 24(R1), F3
