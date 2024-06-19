# Testbench
This repository contains a series of tests for the PEC project extension. The tests are divided
in two categories: basic tests and Julia set test.

## Basic tests
To compile and launch the basic tests you just have to use the `sisa-as`. After assembling the test you need to
dissasemble it with `sisa'objdump` to get the hexadecimal version of the instructions.
In the tables below the cases resulting in some kind of overflow/underflow will be marked with (of)
### Add
This test tests the `addf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0x42A0 |
| 0x12 | 0x5C6C |
| 0x14 | 0x5B98 |
| 0x16 | 0x7FFF(of) |
| 0x18 | 0x0400 |
| 0x1A | 0x0000 |

### Sub
This test tests the `subf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0xC01E |
| 0x12 | 0xDA57 |
| 0x14 | 0xDB97 |
| 0x16 | 0x43B0 |
| 0x18 | 0x53FC |
| 0x1A | 0x0000(of) |
| 0x1B | 0x7FFF(of) |


### Mul
This test tests the `mulf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0x42E4 |
| 0x12 | 0x5C4E |
| 0x14 | 0x7FFF(of) |
| 0x16 | 0x0000(of) |
| 0x18 | 0xC320 |
| 0x1A | 0xC320 |
| 0x1B | 0x4320 |

### Div
This test tests the `divf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0x3B67 |
| 0x12 | 0x3AC9 |
| 0x14 | 0x240C |
| 0x16 | 0x7FFF(of) |
| 0x18 | 0xBE00 |
| 0x1A | 0xBE00 |
| 0x1B | 0x3E00 |
| 0x1C | 0x7FFF(of) |
| 0x1D | 0x7FFF(of) |
