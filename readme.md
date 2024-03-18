# CSD Encoder

The generation of a Canonical Signed Digit (CSD) representation from a binary representation is revisited. Based on the property that each nonzero digit is surrounded by a zero digit, a hardware-efficient conversion method using bypass instead of carry propagation is proposed. The proposed method requires less area per digit and the required bypass signal can be generated or propagated with only a single NOR gate. It is shown that the proposed converter outperforms previous converters and a look-ahead circuitry to speed up the generation of bypass signals is also proposed.

![Implemented Paper](https://www.researchgate.net/publication/260615745_Fast_and_VLSI_efficient_binary-to-CSD_encoder_using_bypass_signal)

# License

Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
