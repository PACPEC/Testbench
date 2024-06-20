.include "macros.s"

$MOVEI r1, RSG
wrs    s5, r1      ;inicializamos en S5 la direccion de la rutina de antencion a las interrupcciones

MOVI R1, 0x10

$MOVIF F1, 0x3F23
$MOVIF F2, 0x41B0

; 1.57 * 3.69
MULF F3, F1, F2 ; Multiplicacion dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x41B0
$MOVIF F2, 0x5881

;3.69 * 10268.786
MULF F3, F1, F2 ; Multiplicacion dos numeros normales pequeños y grandes (no overflow)
STF 2(R1), F3

$MOVIF F1, 0x7FFF
$MOVIF F2, 0x5B98

; 4290772992 * 29468.352
MULF F3, F1, F2 ; Multiplicacion dos numeros normales grandes (overflow)
STF 4(R1), F3

$MOVIF F1, 0x0200

; 0.000000000931322 * 0.000000000931322
MULF F3, F1, F1 ; Multiplicacion numeros muy pequeños (underflow)
STF 6(R1), F3

$MOVIF F1, 0x4066
$MOVIF F2, 0xC066

; 2.5 * -2.5
MULF F3, F1, F2 ; Multiplicacion + * -
STF 8(R1), F3

; -2.5 * 2.5
MULF F3, F2, F1 ; Multiplicacion - * +
STF 10(R1), F3

; -2.5 * -2.5
MULF F3, F2, F2 ; Multiplicacion - * -
STF 12(R1), F3

halt

RSG:   reti
