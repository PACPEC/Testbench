.include "macros.s"

$MOVEI r1, RSG
wrs    s5, r1      ;inicializamos en S5 la direccion de la rutina de antencion a las interrupcciones

MOVI R1, 0x10

$MOVIF F1, 0x3F23
$MOVIF F2, 0x41B0

;1.57 - 3.69
SUBF F3, F1, F2 ; Resta dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x5881
$MOVIF F2, 0x5B98

; 10268.786 - 29468.352
SUBF F3, F1, F2 ; Resta dos numeros normales grandes
STF 2(R1), F3

$MOVIF F1, 0x41B0
$MOVIF F2, 0x5B98

;3.69 - 29468.352
SUBF F3, F1, F2 ; Resta dos numeros normales pequeños y grandes
STF 4(R1), F3

$MOVIF F2, C1B0
SUBF F3, F1, F2 ; Resta un numero y su negativo
STF 6(R1), F3

$MOVIF F1, 0xD636
$MOVIF F2, 0xD735

; -4530.36 - (-6571.36)
SUBF F3, F1, F2 ; Resta dos numeros negativos
STF 8(R1), F3

$MOVIF F1, 0x0300
$MOVIF F2, 0x0200


SUBF F3, F1, F2 ; Resta dos numeros negativos (underflow)
STF 10(R1), F3

$MOVIF F1, 0x7DFF
$MOVIF F2, 0xFDFF

SUBF F3, F1, F2 ; Resta dos numeros (overflow)
STF 12(R1), F3

halt

RSG:   reti
