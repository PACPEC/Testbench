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
| 0x16 | 0x7FFF |
| 0x18 | 0x0400 |
| 0x1A | 0x0000 |

### Sub
This test tests the `subf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0xC03D |
| 0x12 | 0xF4B0 |
| 0x14 | 0xF732 |
| 0x16 | 0xC361 |
| 0x18 | 0x4361 |
| 0x1A | 0x0000 |
| 0x1B | 0x0000 |
| 0x1C | NaN    |
| 0x1D | NaN    |
| 0x1E | NaN    |
| 0x1F | -Inf   |
| 0x20 | InF    |
| 0x22 | NaN    |


### Mul
This test tests the `mulf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0x45CB |
| 0x12 | 0x78A0 |
| 0x14 | Inf(of)|
| 0x16 | 0x0B5F |
| 0x18 | 0x0B5F |
| 0x1A | 0x0000(of) |
| 0x1B | NaN    |
| 0x1C | NaN    |
| 0x1D | NaN    |
| 0x1E | Inf    |
| 0x1F | Inf    |
| 0x20 | InF    |
| 0x22 | NaN    |

### Div
This test tests the `divf` instruction. The results should look something like this:
| Mem  | Value  |
|------|--------|
| 0x10 | 0x36CF |
| 0x12 | 0x3594 |
| 0x14 | 0x6FCD |
| 0x16 | 0x |
| 0x18 | 0x |
| 0x1A | 0x |
| 0x1B | NaN    |
| 0x1C | NaN    |
| 0x1D | NaN    |
| 0x1E | Inf    |
| 0x1F | Inf    |
| 0x20 | InF    |
| 0x22 | NaN    |
