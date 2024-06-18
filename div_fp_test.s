MOVI R1, 16

DIVF F3, F1, F2 ; Division dos numeros normales
STF 0(R1), F3
DIVF F3, F1, F2 ; Division numero normal / denormal
STF 4(R1), F3
DIVF F3, F1, F2 ; Division denormal / numero normal
DIVF F3, F1, F2 ; Division dos numeros denormales
DIVF F3, F1, F2 ; Division numero / NaN
DIVF F3, F1, F2 ; Division NaN / numero
DIVF F3, F1, F2 ; Division dos NaN
DIVF F3, F1, F2 ; Division numero / inf
DIVF F3, F2, F2 ; Division inf / numero
DIVF F3, F1, F2 ; Division inf / inf
DIVF F3, F1, F2 ; Division entre 0
DIVF F3, F1, F2 ; Division 0 / 0
DIVF F3, F1, F2 ; Division inf / inf