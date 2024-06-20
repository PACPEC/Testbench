.include "macros.s"

$MOVEI r1, RSG
wrs    s5, r1      ;inicializamos en S5 la direccion de la rutina de antencion a las interrupcciones

MOVI R1, 0x10

$MOVIF F1, 0x3F23
$MOVIF F2, 0x41B0

;1.57 + 3.69
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x5881
$MOVIF F2, 0x5B98

; 10268.786 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales grandes
STF 2(R1), F3

$MOVIF F1, 0x44AC
$MOVIF F2, 0x5B98

;10.69 + 29468.352
ADDF F3, F1, F2 ; Suma dos numeros normales pequeños y grandes
STF 4(R1), F3

$MOVIF F1, 0x7FFF

;4290772992 + 4290772992 
ADDF F3, F1, F1 ; Suma dos numeros mas grandes (overflow)
STF 6(R1), F3

$MOVIF F1, 0x0200

;0.000000000931322 + 0.000000000931322
ADDF F3, F1, F1 ; Suma numeros mas pequeños
STF 8(R1), F3

$MOVIF F2, 0x81FF

;0.000000000931322 + -0.000000000929503
ADDF F3, F1, F2 ; Suma numero mas pequeño y su negativo (underflow)
STF 10(R1), F3

halt


RSG:   reti
