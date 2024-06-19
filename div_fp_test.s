.include "macros.s"

MOVI R1, 0x10

$MOVIF F1, 0x3F23
$MOVIF F2, 0x41B0

; 1.57 / 3.69
DIVF F3, F1, F2 ; Division dos numeros normales pequeños
STF 0(R1), F3

$MOVIF F1, 0x5881
$MOVIF F2, 0x5B98

; 10268.786 / 29468.352
DIVF F3, F1, F2 ; Division dos numeros normales grandes
STF 2(R1), F3

$MOVIF F1, 0x5B98
$MOVIF F2, 0x41B0

; 3.69 / 29468.352
DIVF F3, F2, F1 ; Division dos numeros normales grandes y pequeños
STF 4(R1), F3

$MOVIF F1, 0x7DFF
$MOVIF F2, 0x0200

; 4290772992 / 0.000000000931322
DIVF F3, F1, F2 ; Division numero mas grande entre mas pequeño (overflow)
STF 6(R1), F3

$MOVIF F1, 0x4066
$MOVIF F2, 0xC066

; 2.5 / -2.5
DIVF F3, F1, F2 ; Division + / -
STF 8(R1), F3

; -2.5 / 2.5
DIVF F3, F2, F1 ; Division - / +
STF 10(R1), F3

; -2.5 / -2.5
DIVF F3, F2, F2 ; Division - / -
STF 12(R1), F3

$MOVIF F2, 0x0000

DIVF F3, F1, F2 ; Division entre 0
STF 14(R1), F3

DIVF F3, F2, F2 ; Division 0 / 0
STF 16(R1), F3
