.include "macros.s"

MOVI R1, 0x10

$MOVIF F1, 0x0000
$MOVIF F2, 0x8000

CMPEQF R3, F1, F2 ; Comparacion +0 == -0
ST 0(R1), R3

CMPLTF R3, F1, F2 ; Comparacion +0 < -0
ST 2(R1), R3

CMPLTF R3, F2, F1 ; Comparacion -0 < +0
ST 4(R1), R3

CMPLEF R3, F1, F2 ; Comparacion +0 <= -0
ST 6(R1), R3

$MOVIF F1, 0x4080
$MOVIF F2, 0xC080

CMPEQF R3, F1, F2 ; 2.5 == -2.5
ST 8(R1), R3

CMPLTF R3, F2, F1 ; -2.5 < 2.5
ST 10(R1), R3

CMPLTF R3, F1, F2 ; 2.5 < -2.5
ST 12(R1), R3

CMPEQF R3, F2, F2 ; -2.5 == -2.5
ST 14(R1), R3

$MOVIF F1, 0x41B0
$MOVIF F2, 0x5881

;3.69 < 10268.786
CMPLTF R3, F1, F2 ; Comparacion numeros normales pequeños y grandes
ST 16(R1), R3

;3.69 <= 10268.786
CMPLEF R3, F1, F2 ; Comparacion numeros normales pequeños y grandes
ST 18(R1), R3

;3.69 > 10268.786
CMPLTF R3, F2, F1 ; Comparacion numeros normales pequeños y grandes
ST 20(R1), R3

;3.69 => 10268.786
CMPLEF R3, F2, F1 ; Comparacion numeros normales pequeños y grandes
ST 22(R1), R3
