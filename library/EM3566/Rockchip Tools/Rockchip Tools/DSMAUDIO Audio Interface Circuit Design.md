Secure Grade:        Top-secret(        )          Secret(        )          Privacy(        )          Public(    √    )

DSMAUDIO Audio Interface Circuit Design

DSMAUDIO

Audio Interface Circuit Design

(Hardware Department)

Identifies：

Version：

Author：

1.0.0

Louis.Weng

Status：

[    ] draft

[    ] modifying

Date：

[√ ] release

Approver：

Date：

Rockchip Electronics Co.,Ltd.

DSMAUDIO Audio Interface Circuit Design

Disclaimer

This document is provided "status quo", RockchipElectronics Co., Ltd. ("the company", the same below) does
not  make  any  statements,  information  and  content  of  this  document  on  the  accuracy,  reliability,  completeness,
marketability, or specific purpose and non-infringement provide any express or implied statement or guarantee. This
document is only used as a reference for instructions.

Due to product version upgrades or other reasons, this document will be updated aperiodic. Unless otherwise
agreed, this document is only used as a guide. All statements, information and suggestions in this document do not
constitute any express or implied warranty.

Brand Statement

"Rockchip" and "瑞芯微" , "瑞芯"and other Rockchip trademarks are trademarks of Rockchip Electronics co.,

ltd., are exclusively owned by Rockchip Electronics Co., Ltd.

All other trademarks or registered trademarks mentioned in this document are owned by their respective owners.

Copyright © 2021Rockchip Electronics Co., Ltd.

Without the written permission of the company, any unit or individual shall not extract or copy part or all of

the content of this document,shall not disseminate it in any form.

Rockchip Electronics Co., Ltd.
Add: No.18 Building, A District, No.89, software Boulevard Fuzhou, Fujian, PRC
Web: www.rock-chips.com
Hotline: +86-591-83991906
Fax: +86-591-83951833
Email: fae@rock-chips.com

DSMAUDIO Audio Interface Circuit Design

Table of Content

1.  Hardware circuit design .......................................................................................................................... 5
DSMAudio interface circuit description ................................................................................................ 5
1.1
Introduction of RC Low-pass Filter Circuit ........................................................................................... 5
1.2
1.2.1  Circuit Introduction ................................................................................................................ 5
1.2.2  Preferences Selection ............................................................................................................. 6
2.  DSMAudio audio interface indicators ................................................................................................... 6

Revision History

DSMAUDIO Audio Interface Circuit Design

This revision history recorded description of each version, and any updates of previous versions are included

in the latest one.

Version

Author  Revision date

Revision description

Remark

V1.0.0

1.  Hardware circuit design

DSMAUDIO Audio Interface Circuit Design

The DSMAudio audio interface supports Direct Stream Digital to convert PCM data into a 1bit signal stream,
providing  oversampling  of  128x  or  more,  and  16x/32x/64x  up-sampling  interpolation.  In  a  design  that  is  not
equipped  with  a  high-performance  audio  DAC  and  requires  audio  output, AUDDSM  can  obtain  audio  signals
through first-order RC low-pass filtering, and the audio quality can be optimized to the greatest extent when using
differential output.

1.1 DSMAudio interface circuit description

Take the DSMAudio circuit of the RV1126 chip as an example. As shown in the figure below, there must be

an RC low-pass filter circuit between the DSMAudio audio interface circuit and the power amplifier chip.

The  RV1109/RV1126  chip  only  supports  the  right  channel  interface,  and  there  are no  restrictions  on  other

platforms.

1.2 Introduction of RC Low-pass Filter Circuit

1.2.1  Circuit Introduction

The RC low-pass filter of the DSMAudio audio interface circuit can be a first-order filter circuit. The following

describes the design of the first-order RC filter circuit and the selection of parameters.

Vin is the output from DSMAudio, and its maximum peak-to-peak signal can reach a power supply voltage
close to VCCIO7 (Note: VCCIO7 is the power domain where the RV1109/RV1126 DSMAudio interface is located).
This amplitude may exceed the input range of some audio power amplifiers, causing serious distortion.

Therefore, R2 is introduced into the circuit for voltage division, which is conducive to matching Vout with the

input range of the power amplifier and avoiding distortion.

1.2.2  Preferences Selection

DSMAUDIO Audio Interface Circuit Design

DSMAudio output series R1 is selected in the range of 1Kohm～10Kohm, the accuracy of R1 and R2 is 1%,

and the low-pass cut-off frequency of the filter:

After neaten:

𝑓(−3𝑑𝐵) =

𝑅1 + 𝑅2
2𝜋𝑅1𝑅2𝐶1

𝐶1 =

𝑅1 + 𝑅2
2𝜋𝑅1𝑅2𝑓(−3𝑑𝐵)

(1)

(2)

Determine the voltage divider ratio of R1 and R2 according to the input range of VCCIO7 and the audio power
amplifier. Assuming that the ratio of the voltage of VCCIO7 to the input voltage of the power amplifier is n, then:

𝑅2 =

𝑅1
𝑛 − 1

Substituting formula (3) into formula (2) to sort out, then:

𝐶1 =

𝑛
2𝜋𝑅1𝑓(−3𝑑𝐵)

(3)

(4)

For example, if  the  power  supply  voltage of VCCIO7  is 3.3V  and the input  amplitude of  the audio  power
amplifier is 0.5 Vpp, then n=6.6. Generally, it is recommended that  𝑓(−3𝑑𝐵) = 33𝐾𝐻𝑧  in the range of 22KHz～
40KHz (if the actual sampling rate of the product is low, the low-pass filter range can be appropriately reduced ), if
𝑓(−3𝑑𝐵) = 33𝐾𝐻𝑧  and  𝑅1 = 5.6 𝐾𝑜ℎ𝑚, it can be calculated by formula (3) and formula (4):
𝑅1
𝑛 − 1

5.6
6.6 − 1

= 1(𝐾𝑜ℎ𝑚)

𝑅2 =

=

𝐶1 =

𝑛
2𝜋𝑅1𝑓(−3𝑑𝐵)

=

6.6

2𝜋 × 5.6 × 33 × 106 ≈ 5.6(𝑛𝐹)

As above, the cut-off frequency of the first-order RC low-pass filter is usually in the range of 22KHz~40KHz.
If the user's DSMAudio output sampling frequency is relatively low, such as 16KHz or 8KHz, the cut-off frequency
of the RC filter can be appropriately reduced.

2.  DSMAudio audio interface indicators

The  audio  indicators of DSMAudio  have a  strong  correlation  with  the  clock  of DSMAudio. Therefore,  the

DSMAudio audio indicators is related to the frequency division method of the platform PLL.

The following indicators take the 48K sampling test data of the RV1109/RV1126 platform as an example:
zboot_fracdiv_ds_dither: The clock is divided by integer PLL and then decimal divider;
zboot_fracpll_ds_dither: The clock is divided by a decimal number PLL and then an integer.

No.  Test Item

Sample rate of
audio source

1

2

3

4

5

6

7

THD+N

RMS Level

SNR

SNRA

Noise

Crosstalk

48K

48K

48K

48K

48K

48K

48K

DSMAUDIO Audio Interface Circuit Design

DSMAudio Test Report

test result
(zboot_fracdiv_ds_dither)

test result
(zboot_fracpll_ds_dither)

R
-78.1dB

-76.1dB

1.115Vrms

78.487dB

79.40dB

130.1uVrms

-73.Db

R
-81.1dB

-82dB

1.115Vrms

86.3dB

88.40dB

56.1uVrms

-73.4dB

At present, we have verified 8K, 16K, 32K and other frequencies. The test results show that the audio indicators
of DSMAudio has a relatively obvious relationship with PLL frequency division, and the indicators of PLL divided
by decimal fraction and then integer frequency division for DSMAudio is obviously better. Therefore, when the
platform uses the DSMAudio audio interface, special attention should be paid to the setting of the DSMAudio clock.

