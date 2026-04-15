RTL8211F-CG     RTL8211FD-CG
RTL8211FI-CG    RTL8211FDI-CG

INTEGRATED 10/100/1000M ETHERNET
PRECISION TRANSCEIVER

DATASHEET
 (CONFIDENTIAL: Development Partners Only)

Rev. 1.2
09 July 2014
Track ID: JATR-8275-15

Realtek Semiconductor Corp.
No. 2, Innovation Road II, Hsinchu Science Park, Hsinchu 300, Taiwan
Tel.: +886-3-578-0211   Fax: +886-3-577-6047
www.realtek.com

RTL8211F(I)/RTL8211FD(I)
Datasheet

COPYRIGHT

©2014 Realtek Semiconductor Corp. All rights reserved. No part of this document may be reproduced,
transmitted, transcribed, stored in a retrieval system, or translated into any language in any form or by any
means without the written permission of Realtek Semiconductor Corp.

DISCLAIMER

Realtek provides this document ‘as is’, without warranty of any kind. Realtek may make improvements
and/or changes in this document or in the product described in this document at any time. This document
could include technical inaccuracies or typographical errors.

TRADEMARKS

Realtek is a trademark of Realtek Semiconductor Corporation. Other names mentioned in this document are
trademarks/registered trademarks of their respective owners.

LICENSE

This product is covered by one or more of the following patents: US5,307,459, US5,434,872, US5,732,094,
US6,570,884, US6,115,776, and US6,327,625.

USING THIS DOCUMENT

This  document  is  intended  for  the  software  engineer’s  reference  and  provides  detailed  programming
information.

Though every effort has been made to ensure that this document is current and accurate, more information
may have become available subsequent to the production of this guide.

REVISION HISTORY

Revision
1.0
1.1

Release Date
2013/05/20
2014/04/09

1.2

2014/07/09

Summary
First release.
Added RTL8211FD-CG, RTL8211FI-CG, and RTL8211FDI-CG data.
Corrected minor typing errors.
Corrected minor typing errors.
Revised section 7.11.3 Change Page, page 19.
Revised section 7.14.1 Customized LED Function, page 26.
Revised section 7.17 PHY Reset (Hardware Reset), page 28.
Revised section 8 Register Descriptions, page 29.
Revised section 9 Regulators and Power Sequence, page 48.
Revised Table 55 Oscillator/External Clock Requirements, page 52.
Revised section 10.6.2 RGMII Timing Modes, page 55.
Revised section 12 Ordering Information, page 59.

Integrated 10/100/1000M Ethernet Precision Transceiver

ii

Track ID: JATR-8275-15   Rev. 1.2

RTL8211F(I)/RTL8211FD(I)
Datasheet

1.  GENERAL DESCRIPTION..............................................................................................................................................1

Table of Contents

2.

3.

4.

5.

6.

7.

FEATURES.........................................................................................................................................................................2

3.1.
3.2.

SYSTEM APPLICATIONS...............................................................................................................................................3
APPLICATION DIAGRAM - RTL8211F(I) ......................................................................................................................3
APPLICATION DIAGRAM - RTL8211FD(I) ...................................................................................................................4
BLOCK DIAGRAM...........................................................................................................................................................5

7.2.

5.1.

7.1.

7.1.1.
7.1.2.
7.1.3.

6.1.
6.2.
6.3.
6.4.
6.5.
6.6.
6.7.
6.8.
6.9.

PIN ASSIGNMENTS .........................................................................................................................................................6
PACKAGE IDENTIFICATION...........................................................................................................................................6
PIN DESCRIPTIONS ........................................................................................................................................................7
TRANSCEIVER INTERFACE............................................................................................................................................7
CLOCK .........................................................................................................................................................................7
RGMII.........................................................................................................................................................................8
MANAGEMENT INTERFACE...........................................................................................................................................8
RESET ..........................................................................................................................................................................9
MODE SELECTION ........................................................................................................................................................9
LED DEFAULT SETTINGS...........................................................................................................................................10
REGULATOR AND REFERENCE....................................................................................................................................10
POWER AND GROUND ................................................................................................................................................10
FUNCTION DESCRIPTION ..........................................................................................................................................11
TRANSMITTER ............................................................................................................................................................11
1000Mbps Mode...................................................................................................................................................11
100Mbps Mode.....................................................................................................................................................11
10Mbps Mode.......................................................................................................................................................11
RECEIVER...................................................................................................................................................................11
1000Mbps Mode...................................................................................................................................................11
100Mbps Mode.....................................................................................................................................................11
10Mbps Mode.......................................................................................................................................................12
ENERGY EFFICIENT ETHERNET (EEE)........................................................................................................................12
7.3.
7.4.  WAKE-ON-LAN (WOL)............................................................................................................................................13
INTERRUPT.................................................................................................................................................................14
7.5.
INTB/PMEB PIN USAGE ...........................................................................................................................................14
7.6.
MDI INTERFACE ........................................................................................................................................................14
7.7.
HARDWARE CONFIGURATION ....................................................................................................................................15
7.8.
7.9.
LED AND LDO CONFIGURATION...............................................................................................................................16
7.10.  GREEN ETHERNET (1000/100MBPS MODE ONLY) .....................................................................................................17
Cable Length Power Saving ............................................................................................................................17
Register Setting................................................................................................................................................17
7.11.  MAC/PHY INTERFACE ..............................................................................................................................................18
RGMII..............................................................................................................................................................18
Management Interface.....................................................................................................................................18
Change Page ...................................................................................................................................................19
Access to MDIO Manageable Device (MMD).................................................................................................20
7.12.  AUTO-NEGOTIATION..................................................................................................................................................20
Auto-Negotiation Priority Resolution..............................................................................................................23

7.11.1.
7.11.2.
7.11.3.
7.11.4.

7.2.1.
7.2.2.
7.2.3.

7.10.1.
7.10.2.

7.12.1.

Integrated 10/100/1000M Ethernet Precision Transceiver

iii

Track ID: JATR-8275-15   Rev. 1.2

RTL8211F(I)/RTL8211FD(I)
Datasheet

8.1.
8.2.
8.3.

7.12.2.
7.12.3.

7.14.1.
7.14.2.

7.15.
7.16.
7.17.

Auto-Negotiation Master/Slave Resolution .....................................................................................................23
Auto-Negotiation PAUSE/ASYMMETRIC PAUSE Resolution........................................................................24
7.13.  CROSSOVER DETECTION AND AUTO-CORRECTION ....................................................................................................25
LED CONFIGURATION................................................................................................................................................26
7.14.
Customized LED Function...............................................................................................................................26
EEE LED Function..........................................................................................................................................27
POLARITY CORRECTION .............................................................................................................................................28
POWER .......................................................................................................................................................................28
PHY RESET (HARDWARE RESET) ..............................................................................................................................28
8.  REGISTER DESCRIPTIONS.........................................................................................................................................29
REGISTER MAPPING AND DEFINITIONS.......................................................................................................................29
MMD REGISTER MAPPING AND DEFINITIONS............................................................................................................31
REGISTER TABLES......................................................................................................................................................31
8.3.1.  BMCR (Basic Mode Control Register, Address 0x00) .........................................................................................31
8.3.2.  BMSR (Basic Mode Status Register, Address 0x01).............................................................................................32
8.3.3.  PHYID1 (PHY Identifier Register 1, Address 0x02) ............................................................................................34
8.3.4.  PHYID2 (PHY Identifier Register 2, Address 0x03) ............................................................................................34
8.3.5.  ANAR (Auto-Negotiation Advertising Register, Address 0x04) ...........................................................................34
8.3.6.  ANLPAR (Auto-Negotiation Link Partner Ability Register, Address 0x05) .........................................................35
8.3.7.  ANER (Auto-Negotiation Expansion Register, Address 0x06) .............................................................................36
8.3.8.  ANNPTR (Auto-Negotiation Next Page Transmit Register, Address 0x07) .........................................................37
8.3.9.  ANNPRR (Auto-Negotiation Next Page Receive Register, Address 0x08) ...........................................................37
GBCR (1000Base-T Control Register, Address 0x09).....................................................................................38
8.3.10.
GBSR (1000Base-T Status Register, Address 0x0A) .......................................................................................38
8.3.11.
MACR (MMD Access Control Register, Address 0x0D) .................................................................................39
8.3.12.
MAADR (MMD Access Address Data Register, Address 0x0E)......................................................................39
8.3.13.
GBESR (1000Base-T Extended Status Register, Address 0x0F) .....................................................................40
8.3.14.
INER (Interrupt Enable Register, Page 0xa42, Address 0x12) .......................................................................40
8.3.15.
PHYCR1 (PHY Specific Control Register 1, Page 0xa43, Address 0x18).......................................................41
8.3.16.
PHYCR2 (PHY Specific Control Register 2, Page 0xa43, Address 0x19).......................................................42
8.3.17.
PHYSR (PHY Specific Status Register, Page 0xa43, Address 0x1A) ..............................................................42
8.3.18.
INSR (Interrupt Status Register, Page 0xa43, Address 0x1D) ........................................................................43
8.3.19.
PAGSR (Page Select Register, Page 0xa43, Address 0x1F) ...........................................................................44
8.3.20.
PHYSCR (PHY Special Cofig Register, Page 0xa46, Address 0x14) ..............................................................44
8.3.21.
LCR (LED Control Register, Page 0xd04, Address 0x10) ..............................................................................44
8.3.22.
EEELCR (EEE LED Control Register, Page 0xd04, Address 0x11)...............................................................45
8.3.23.
INTBCR (INTB Pin Control Register, Page 0xd40, Address 0x16) ................................................................45
8.3.24.
PC1R (PCS Control 1 Register, MMD Device 3, Address 0x00) ....................................................................45
8.3.25.
PS1R (PCS Status1 Register, MMD Device 3, Address 0x01) ........................................................................46
8.3.26.
EEECR (EEE Capability Register, MMD Device 3, Address 0x14)................................................................46
8.3.27.
EEEWER (EEE Wake Error Register, MMD Device 3, Address 0x16) ..........................................................46
8.3.28.
EEEAR (EEE Advertisement Register, MMD Device 7, Address 0x3c) ..........................................................47
8.3.29.
EEELPAR (EEE Link Partner Ability Register, MMD Device 7, Address 0x3d) ............................................47
8.3.30.
9.  REGULATORS AND POWER SEQUENCE................................................................................................................48
SWITCHING REGULATOR (RTL8211F(I) ONLY) .........................................................................................................48
LOW-DROPOUT REGULATOR (RTL8211FD(I) ONLY) ...............................................................................................48
POWER SEQUENCE .....................................................................................................................................................49
CHARACTERISTICS.................................................................................................................................................51
10.1.  ABSOLUTE MAXIMUM RATINGS.................................................................................................................................51
10.2.  RECOMMENDED OPERATING CONDITIONS .................................................................................................................51
10.3.  CRYSTAL REQUIREMENTS..........................................................................................................................................52

9.1.
9.2.
9.3.

10.

Integrated 10/100/1000M Ethernet Precision Transceiver

iv

Track ID: JATR-8275-15   Rev. 1.2

RTL8211F(I)/RTL8211FD(I)
Datasheet

10.6.1.
10.6.2.

10.4.  OSCILLATOR/EXTERNAL CLOCK REQUIREMENTS ......................................................................................................52
10.5.  DC CHARACTERISTICS...............................................................................................................................................53
10.6.  AC CHARACTERISTICS...............................................................................................................................................54
MDC/MDIO Timing ........................................................................................................................................54
RGMII Timing Modes......................................................................................................................................55
MECHANICAL DIMENSIONS.................................................................................................................................58
11.1.  MECHANICAL DIMENSIONS NOTES ............................................................................................................................58
ORDERING INFORMATION...................................................................................................................................59

11.

12.

List of Tables
TABLE 1.   TRANSCEIVER INTERFACE ..............................................................................................................................................7
TABLE 2.   CLOCK............................................................................................................................................................................7
TABLE 3.   RGMII ...........................................................................................................................................................................8
TABLE 4.   MANAGEMENT INTERFACE.............................................................................................................................................8
TABLE 5.   RESET.............................................................................................................................................................................9
TABLE 6.   MODE SELECTION ..........................................................................................................................................................9
TABLE 7.   LED DEFAULT SETTINGS .............................................................................................................................................10
TABLE 8.   REGULATOR AND REFERENCE ......................................................................................................................................10
TABLE 9.   POWER AND GROUND...................................................................................................................................................10
TABLE 10. CONFIG PINS VS. CONFIGURATION REGISTER............................................................................................................15
TABLE 11. CONFIGURATION REGISTER DEFINITIONS ....................................................................................................................15
TABLE 12. MANAGEMENT FRAME FORMAT ..................................................................................................................................18
TABLE 13. MANAGEMENT FRAME DESCRIPTION...........................................................................................................................18
TABLE 14. 1000BASE-T BASE AND NEXT PAGE BIT ASSIGNMENTS..............................................................................................21
TABLE 15. LED DEFAULT DEFINITIONS........................................................................................................................................26
TABLE 16. LED REGISTER TABLE.................................................................................................................................................26
TABLE 17. LED CONFIGURATION TABLE......................................................................................................................................27
TABLE 18. REGISTER ACCESS TYPES ............................................................................................................................................29
TABLE 19. REGISTER MAPPING AND DEFINITIONS ........................................................................................................................29
TABLE 20. MMD REGISTER MAPPING AND DEFINITIONS..............................................................................................................31
TABLE 21. BMCR (BASIC MODE CONTROL REGISTER, ADDRESS 0X00) ......................................................................................31
TABLE 22. BMSR (BASIC MODE STATUS REGISTER, ADDRESS 0X01)..........................................................................................32
TABLE 23. PHYID1 (PHY IDENTIFIER REGISTER 1, ADDRESS 0X02) ...........................................................................................34
TABLE 24. PHYID2 (PHY IDENTIFIER REGISTER 2, ADDRESS 0X03) ...........................................................................................34
TABLE 25. ANAR (AUTO-NEGOTIATION ADVERTISING REGISTER, ADDRESS 0X04)....................................................................34
TABLE 26. ANLPAR (AUTO-NEGOTIATION LINK PARTNER ABILITY REGISTER, ADDRESS 0X05) ...............................................35
TABLE 27. ANER (AUTO-NEGOTIATION EXPANSION REGISTER, ADDRESS 0X06)........................................................................36
TABLE 28. ANNPTR (AUTO-NEGOTIATION NEXT PAGE TRANSMIT REGISTER, ADDRESS 0X07).................................................37
TABLE 29. ANNPRR (AUTO-NEGOTIATION NEXT PAGE RECEIVE REGISTER, ADDRESS 0X08) ...................................................37
TABLE 30. GBCR (1000BASE-T CONTROL REGISTER, ADDRESS 0X09) .......................................................................................38
TABLE 31. GBSR (1000BASE-T STATUS REGISTER, ADDRESS 0X0A)..........................................................................................38
TABLE 32. MACR (MMD ACCESS CONTROL REGISTER, ADDRESS 0X0D) ..................................................................................39
TABLE 33. MAADR (MMD ACCESS ADDRESS DATA REGISTER, ADDRESS 0X0E) ......................................................................39
TABLE 34. GBESR (1000BASE-T EXTENDED STATUS REGISTER, ADDRESS 0X0F)......................................................................40
TABLE 35. INER (INTERRUPT ENABLE REGISTER, PAGE 0XA42, ADDRESS 0X12) ........................................................................40
TABLE 36. PHYCR1 (PHY SPECIFIC CONTROL REGISTER 1, PAGE 0XA43, ADDRESS 0X18)........................................................41
TABLE 37. PHYCR2 (PHY SPECIFIC CONTROL REGISTER 2, PAGE 0XA43, ADDRESS 0X19)........................................................42

Integrated 10/100/1000M Ethernet Precision Transceiver

v

Track ID: JATR-8275-15   Rev. 1.2

RTL8211F(I)/RTL8211FD(I)
Datasheet

TABLE 38. PHYSR (PHY SPECIFIC STATUS REGISTER, PAGE 0XA43, ADDRESS 0X1A) ...............................................................42
TABLE 39. INSR (INTERRUPT STATUS REGISTER, PAGE 0XA43, ADDRESS 0X1D) ........................................................................43
TABLE 40. PAGSR (PAGE SELECT REGISTER, PAGE 0XA43, ADDRESS 0X1F) ..............................................................................44
TABLE 41. PHYSCR (PHY SPECIFIC COFIG REGISTER, PAGE 0XA46, ADDRESS 0X14)................................................................44
TABLE 42. LCR (LED CONTROL REGISTER, PAGE 0XD04, ADDRESS 0X10) .................................................................................44
TABLE 43. EEELCR (EEE LED CONTROL REGISTER, PAGE 0XD04, ADDRESS 0X11) .................................................................45
TABLE 44. INTBCR (INTB PIN CONTROL REGISTER, PAGE 0XD40, ADDRESS 0X16) ..................................................................45
TABLE 45. PC1R (PCS CONTROL 1 REGISTER, MMD DEVICE 3, ADDRESS 0X00)........................................................................45
TABLE 46. PS1R (PCS STATUS 1 REGISTER, MMD DEVICE 3, ADDRESS 0X01) ...........................................................................46
TABLE 47. EEECR (EEE CAPABILITY REGISTER, MMD DEVICE 3, ADDRESS 0X14) ...................................................................46
TABLE 48. EEEWER (EEE WAKE ERROR REGISTER, MMD DEVICE 3, ADDRESS 0X16).............................................................46
TABLE 49. EEEAR (EEE ADVERTISEMENT REGISTER, MMD DEVICE 7, ADDRESS 0X3C) ...........................................................47
TABLE 50. EEELPAR (EEE LINK PARTNER ABILITY REGISTER, MMD DEVICE 7, ADDRESS 0X3D)............................................47
TABLE 51. POWER SEQUENCE PARAMETERS .................................................................................................................................49
TABLE 52. ABSOLUTE MAXIMUM RATINGS ..................................................................................................................................51
TABLE 53. RECOMMENDED OPERATING CONDITIONS ...................................................................................................................51
TABLE 54. CRYSTAL REQUIREMENTS............................................................................................................................................52
TABLE 55. OSCILLATOR/EXTERNAL CLOCK REQUIREMENTS ........................................................................................................52
TABLE 56. DC CHARACTERISTICS.................................................................................................................................................53
TABLE 57. MDC/MDIO MANAGEMENT TIMING PARAMETERS ....................................................................................................54
TABLE 58. RGMII TIMING PARAMETERS......................................................................................................................................57
TABLE 59. ORDERING INFORMATION ............................................................................................................................................59

List of Figures
FIGURE 1.   APPLICATION DIAGRAM – RTL8211F(I) ......................................................................................................................3
FIGURE 2.   APPLICATION DIAGRAM - RTL8211FD(I) ....................................................................................................................4
FIGURE 3.   BLOCK DIAGRAM..........................................................................................................................................................5
FIGURE 4.   PIN ASSIGNMENTS (40-PIN QFN) .................................................................................................................................6
FIGURE 5.   LED AND LDO CONFIGURATION ................................................................................................................................16
FIGURE 6.   MDC/MDIO READ TIMING ........................................................................................................................................19
FIGURE 7.   MDC/MDIO WRITE TIMING.......................................................................................................................................19
FIGURE 8.   EEE LED BEHAVIOR ..................................................................................................................................................27
FIGURE 9.   PHY RESET TIMING ....................................................................................................................................................28
FIGURE 10. POWER SEQUENCE (I/O PAD POWER SOURCED FROM INTERNAL LDO)......................................................................49
FIGURE 11. POWER SEQUENCE (I/O PAD POWER SOURCED EXTERNALLY) ...................................................................................49
FIGURE 12. MDC/MDIO SETUP, HOLD TIME, AND VALID FROM MDC RISING EDGE TIME DEFINITIONS ....................................54
FIGURE 13. MDC/MDIO MANAGEMENT TIMING PARAMETERS ...................................................................................................54
FIGURE 14. RGMII TIMING MODES (FOR TXC) ...........................................................................................................................55
FIGURE 15. RGMII TIMING MODES (FOR RXC) ...........................................................................................................................56

Integrated 10/100/1000M Ethernet Precision Transceiver

vi

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

1.  General Description

The  Realtek  RTL8211F-CG/RTL8211FD-CG/RTL8211FI-CG/RTL8211FDI-CG  is  a  highly  integrated
Ethernet transceiver that complies with 10Base-T, 100Base-TX, and 1000Base-T IEEE 802.3 standards. It
provides all the necessary physical layer functions to transmit and receive Ethernet packets over CAT.5
UTP cable. The RTL8211FI and RTL8211FDI are manufactured to industrial grade standards.

The RTL8211F(I)/RTL8211FD(I) uses state-of-the-art DSP technology and an Analog Front End (AFE) to
enable high-speed data transmission and reception over UTP cable. Functions such as Crossover Detection
& Auto-Correction, polarity correction, adaptive equalization, cross-talk cancellation, echo cancellation,
timing  recovery,  and  error  correction  are  implemented  in  the  RTL8211F(I)/RTL8211FD(I)  to  provide
robust transmission and reception capabilities at 10Mbps, 100Mbps, or 1000Mbps.

Data transfer between MAC and PHY is via the Reduced Gigabit Media Independent Interface (RGMII) for
1000Base-T,  10Base-T,  and  100Base-TX.  The  RTL8211F(I)/RTL8211FD(I)  supports  various  RGMII
signaling voltages, including 3.3, 2.5, 1.8, and 1.5V.

Integrated 10/100/1000M Ethernet Precision Transceiver

1

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

2.

Features

(cid:132)  1000Base-T IEEE 802.3ab Compliant

(cid:132)  Selectable 3.3/2.5/1.8/1.5V signaling for

(cid:132)  100Base-TX IEEE 802.3u Compliant

(cid:132)  10Base-T IEEE 802.3 Compliant

(cid:132)  Supports RGMII

(cid:132)  Supports IEEE 802.3az-2010 (Energy

Efficient Ethernet)

RGMII

(cid:132)  Supports 25MHz external crystal or OSC

(cid:132)  Provides 125MHz clock source for MAC

(cid:132)  Provides 3 network status LEDs

(cid:132)  Supports Link Down power saving

(cid:132)  Built-in Wake-on-LAN (WOL)

(cid:132)  Green Ethernet (1000/100Mbps mode only)

(cid:132)  Supports Interrupt function

(cid:132)  Built-in Switching Regulator and LDO

(cid:132)  Supports Parallel Detection

(cid:132)  40-pin QFN Green Package

(cid:132)  Crossover Detection & Auto-Correction

(cid:132)  55 nm process with ultra-low power

(cid:132)  Automatic polarity correction

(cid:132)  Supports PHYRSTB core power Turn-Off

(cid:132)  Baseline Wander Correction

(cid:132)  Supports 120m for CAT.5 cable in

1000Base-T

consumption

(cid:132)

Industrial grade manufacturing process
(RTL8211FI/RTL8211FDI)

Integrated 10/100/1000M Ethernet Precision Transceiver

2

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

3.

System Applications

(cid:132)  DTV (Digital TV)

(cid:132)  MAU (Media Access Unit)

(cid:132)  CNR (Communication and Network Riser)

(cid:132)  Game Console

(cid:132)  Ethernet Hub

(cid:132)  Ethernet Switch

(cid:132)  DVD Player and Recorder

(cid:132)  Printer and Office Machine

In addition, the RTL8211F(I)/RTL8211FD(I) can be used in any embedded system with an Ethernet MAC
that needs a UTP physical connection.

Realtek
CONFIDENTIAL

3.1.  Application Diagram - RTL8211F(I)

*Note:  3.3/2.5/1.8/1.5V  power  here  means  I/O  pad  power  sourced  from  external  power,  not  from  the
internal LDO.

Figure 1.   Application Diagram – RTL8211F(I)

Integrated 10/100/1000M Ethernet Precision Transceiver

3

Track ID: JATR-8275-15   Rev. 1.2

3.2.  Application Diagram - RTL8211FD(I)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

*Note:  3.3/2.5/1.8/1.5V  power  here  means  I/O  pad  power  sourced  from  external  power,  not  from  the
internal LDO.

Realtek
CONFIDENTIAL

Figure 2.   Application Diagram - RTL8211FD(I)

Integrated 10/100/1000M Ethernet Precision Transceiver

4

Track ID: JATR-8275-15   Rev. 1.2

4.  Block Diagram

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Realtek
CONFIDENTIAL

Figure 3.   Block Diagram

Integrated 10/100/1000M Ethernet Precision Transceiver

5

Track ID: JATR-8275-15   Rev. 1.2

5.

Pin Assignments

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Realtek
CONFIDENTIAL

Figure 4.   Pin Assignments (40-Pin QFN)

5.1.  Package Identification

Green package is indicated by the ‘G’ in GXXXV (Figure 4).

Integrated 10/100/1000M Ethernet Precision Transceiver

6

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

6.

Pin Descriptions

Some  pins  have  multiple  functions.  Refer  to  the  Pin  Assignments  figure  on  page  6  for  a  graphical
representation.

I:  Input

O:  Output

P:  Power

LI: Latched Input During Power up or Reset

IO: Bi-Directional Input and Output

PD:

Internal Pull Down During Power On Reset

6.1.  Transceiver Interface

4

2

IO

IO

MDIP1

MDIN0

G:  Ground

Pin No.
1

Pin Name
MDIP0

Table 1.   Transceiver Interface

Type  Description
IO

PU:  Internal Pull Up During Power On Reset OD: Open Drain

In MDI mode, this is the first pair in 1000Base-T, i.e., the BI_DA+/- pair, and is the
transmit pair in 10Base-T and 100Base-TX.
In MDI crossover mode, this pair acts as the BI_DB+/- pair, and is the receive pair in
10Base-T and 100Base-TX.

Realtek
CONFIDENTIAL

In MDI mode, this is the second pair in 1000Base-T, i.e., the BI_DB+/- pair, and is
the receive pair in 10Base-T and 100Base-TX.
In MDI crossover mode, this pair acts as the BI_DA+/- pair, and is the transmit pair
in 10Base-T and 100Base-TX.

In MDI mode, this is the fourth pair in 1000Base-T, i.e., the BI_DD+/- pair.
In MDI crossover mode, this pair acts as the BI_DC+/- pair.

In MDI mode, this is the third pair in 1000Base-T, i.e., the BI_DC+/- pair.
In MDI crossover mode, this pair acts as the BI_DD+/- pair.

MDIP2
MDIN2
MDIP3
MDIN3

Pin Name
XTAL_IN

Type  Description

Pin No.
36

Table 2.   Clock

IO
IO
IO
IO

6
7
9
10

MDIN1

IO

5

I

6.2.  Clock

37

XTAL_OUT/
EXT_CLK

O

35

CLKOUT

O

25MHz Crystal Input.
Connect to GND if an external 25MHz oscillator drives XTAL_OUT/EXT_CLK.
25MHz Crystal Output.
If a 25MHz oscillator is used, connect XTAL_OUT/EXT_CLK to the oscillator’s
output (see section 10.3, page 52 for clock source specifications).
125/25MHz Reference Clock Generated from Internal PLL.
This pin should be kept floating if this clock is not used by MAC.

Integrated 10/100/1000M Ethernet Precision Transceiver

7

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Table 3.   RGMII

Description
The transmit reference clock will be 125MHz, 25MHz, or 2.5MHz depending
on speed.
Transmit Data.
Data is transmitted from MAC to PHY via TXD[3:0].

6.3.  RGMII

Pin No.
20

Pin Name
TXC

Type
I

18
17
16
15
19
27

TXD0
TXD1
TXD2
TXD3
TXCTL
RXC

I
I
I
I
I

6.4.  Management Interface

25
24
23
22
26

Receive Control Signal from the MAC.

RXD0
RXD1
RXD2
RXD3
RXCTL

O/LI/PD  The continuous receive reference clock will be 125MHz, 25MHz, or 2.5MHz,

and is derived from the received data stream.
Receive Data.
Data is transmitted from PHY to MAC via RXD[3:0].

O/LI/PU
O/LI/PD
O/LI/PD
O/LI/PU
O/LI/PD  Transmit Control Signal to the MAC.

Realtek
CONFIDENTIAL

Table 4.   Management Interface
Description
Management Data Clock.
Input/Output of Management Data.
Pull up 3.3/2.5/1.8/1.5V for 3.3/2.5/1.8/1.5V I/O, respectively.
1. Interrupt (supports 3.3V pull up).
Set low if status changed; active low.
2. Power Management Event (supports 3.3V pull up).
Set low if received a magic packet or wake up frame; active low.
Keep this pin floating if either of the functions is not used.
Note 1: The behavior of this pin is level-triggered.
Note 2: The function of this pin (INTB/PMEB) can be assigned by Page 0xd40,
Reg.22, bit[5]:
1: Pin 31 functions as PMEB.
0: Pin 31 functions as INTB (default)

Pin Name
MDC
MDIO

Pin No.
13
14

Type
I
IO/PU

INTB/PMEB

O/OD

31

Integrated 10/100/1000M Ethernet Precision Transceiver

8

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

6.5.  Reset

Pin No.
12

Pin Name
PHYRSTB

Type
I

Table 5.   Reset

Description
Hardware Reset. Active low.
For a complete PHY reset, this pin must be asserted low for at least 10ms.
All registers will be cleared after a hardware reset.

6.6.  Mode Selection

25

24

TXDLY

Type  Description

Table 6.   Mode Selection

PHYAD[2:0]. PHY Address Configuration.

O/LI/PD  RGMII Transmit Clock Timing Control.

Pin No.
22
27
26
23

Pin Name
PHYAD0
PHYAD1
PHYAD2
PLLOFF

O/LI/PU
O/LI/PD
O/LI/PD
O/LI/PD  ALDPS Mode PLL Off Configuration.

Realtek
CONFIDENTIAL

Pull up to stop PLL when entering ALDPS mode.
Note:
Whole system power consumption in typical ALDPS mode is 43.8mW for the
RTL8211F(I), and 90mW for the RTL8211FD(I).
Whole system power consumption in ALDPS low power mode (with PLL turned
off) is 13.6mW for the RTL8211F(I), and 26.8 mW for the RTL8211FD(I).
All with 1.8V RGMII.

Pull up to use the external power source for the IO pad.
Pull down to use the integrated LDO to transform the desired voltage for the IO
pad.
LDO Output Voltage Selection for I/O Pad/
External Power Source Voltage Selection for I/O Pad.
When pulling down CFG_EXT pin, CFG_LDO[1:0] represent LDO output
voltage setting for IO pad:
2’b00: Reserved.
2’b01: 2.5V.
2’b10: 1.8V.
2’b11: 1.5V.
When pulling up CFG_EXT pin, CFG_LDO[1:0] stand for input voltage
selection of the external power for IO pad:
2’b00: 3.3V.
2’b01: 2.5V.
2’b10: 1.8V.
2’b11: 1.5V.

 O/LI/PD  IO Pad External Power Source Mode Configuration.

CFG_LDO0  O/LI/PU
CFG_LDO1  O/LI/PD

O/LI/PU  RGMII Receiver Clock Timing Control.

Pull up to add 2ns delay to RXC for RXD latching

Pull up to add 2ns delay to TXC for TXD latching

CFG_EXT

RXDLY

33
34

32

Integrated 10/100/1000M Ethernet Precision Transceiver

9

Track ID: JATR-8275-15   Rev. 1.2

6.7.  LED Default Settings

Table 7.   LED Default Settings

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Pin No.
32

Pin Name
LED0

Type
O/LI/PD

33

34

LED1

O/LI/PU

LED2

O/LI/PD

Description
High=Link Up at 10Mbps
Blinking=Transmitting or Receiving.
Low=Link Up at 100Mbps
Blinking=Transmitting or Receiving.
High=Link Up at 1000Mbps
Blinking=Transmitting or Receiving.

6.8.  Regulator and Reference

O

30

REG_OUT

Type
O

Pin No.
39

Pin Name
RSET

Table 8.   Regulator and Reference

Note 1: High/Low active depends on hardware configuration setting (see section 7.9, page 16).
Note 2: See section 7.14 LED Configuration, page 26 for more LED setting details.

Realtek
CONFIDENTIAL

Description
Reference.
External Resistor Reference.
For RTL8211F(I):
Switching Regulator 1.0V Output. Connect to a 2.2µH or 4.7µH inductor.
For RTL8211FD(I):
Low-dropout Regulator 1.0V Output.

Table 9.   Power and Ground
Description
Digital Power. 3.3V.
Digital I/O Pad Power.
When pulling high CFG_EXT pin during Hardware Configuration (External
Power mode), connect this pin to the external power source for
3.3/2.5/1.8/1.5V RGMII I/O.
Digital Core Power. 1.0V.
Analog Power. 3.3V.
Analog Power. 1.0V.
Ground.
Exposed Pad (E-Pad) is Analog and Digital Ground (see section 11
Mechanical Dimensions, page 58).

DVDD10
AVDD33
AVDD10
GND

Pin Name
DVDD33
DVDD_RG

21
11, 40
3, 8, 38
41

Pin No.
29
28

Type
P
P

P
P
P
G

6.9.  Power and Ground

Integrated 10/100/1000M Ethernet Precision Transceiver

10

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.

Function Description

7.1.  Transmitter

10Mbps Mode

100Mbps Mode

1000Mbps Mode

7.1.1.
The  RTL8211F(I)/RTL8211FD(I)’s  PCS  layer  receives  data  bytes  from  the  MAC  through  the  RGMII
interface and performs generation of continuous code-groups through 4D-PAM5 coding technology. These
code groups are passed through a waveform-shaping filter to minimize EMI effect, and are transmitted onto
the 4-pair CAT.5 cable at 125MBaud/s through a D/A converter.

7.1.3.
The transmit 4-bit nibbles (TXD[3:0]) from the MAC, clocked at 2.5MHz (TXCLK), are serialized into
10Mbps serial data. The 10Mbps serial data is converted into a Manchester-encoded data stream and is
transmitted onto the media by the D/A converter.

7.1.2.
The transmitted 4-bit nibbles (TXD[3:0]) from the MAC, clocked at 25MHz (TXCLK), are converted into
5B symbol code through 4B/5B coding technology, then through scrambling and serializing, are converted
to 125MHz NRZ and NRZI signals. The NRZI signals are passed to the MLT3 encoder, then to the D/A
converter and transmitted onto the media.

Realtek
CONFIDENTIAL

7.2.1.
Input  signals  from  the  media  first  pass  through  the  on-chip  sophisticated  hybrid  circuit  to  subtract  the
transmitted signal from the input signal for effective reduction of near-end echo. The received signal is
processed  with  state-of-the-art  technology,  such  as  adaptive  equalization,  BLW  (Baseline  Wander)
correction,  cross-talk  cancellation,  echo  cancellation,  timing  recovery,  error  correction,  and  4D-PAM5
decoding. The 8-bit-wide data is recovered and is sent to the RGMII interface at a clock speed of 125MHz.
The Rx MAC retrieves the packet data from the receive RGMII interface and sends it to the Rx Buffer
Manager.

1000Mbps Mode

7.2.  Receiver

100Mbps Mode

7.2.2.
The  MLT3  signal  is  processed  with  an  ADC,  equalizer,  BLW  (Baseline  Wander)  correction,  timing
recovery,  MLT3  and  NRZI  decoder,  descrambler,  4B/5B  decoder,  and  is  then  presented  to  the  RGMII
interface in 4-bit-wide nibbles at a clock speed of 25MHz.

Integrated 10/100/1000M Ethernet Precision Transceiver

11

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

10Mbps Mode

7.2.3.
The received differential signal is converted into a Manchester-encoded stream first. Next, the stream is
processed with a Manchester decoder, and is de-serialized into 4-bit-wide nibbles. The 4-bit nibbles are
presented to the RGMII interface at a clock speed of 2.5MHz.

7.3.  Energy Efficient Ethernet (EEE)

EEE also specifies a negotiation method to enable link partners to determine whether EEE is supported.

To save power, when the system is in Low Power Idle mode, most of the circuits are disabled, however, the
transition  time  to/from  Low  Power  Idle  mode  is  kept  small  enough  to  be  transparent  to  upper  layer
protocols and applications.

The RTL8211F(I)/RTL8211FD(I) supports IEEE 802.3az-2010, also known as Energy Efficient Ethernet
(EEE),  at  10Mbps,  100Mbps,  and  1000Mbps.  It  provides  a  protocol  to  coordinate  transitions  to/from  a
lower power consumption level (Low Power Idle mode) based on link utilization. When no packets are
being  transmitted,  the  system  goes  to  Low  Power  Idle  mode  to  save  power.  Once  packets  need  to  be
transmitted, the system returns to normal mode, and does this without changing the link status and without
dropping/corrupting frames.

Realtek
CONFIDENTIAL

Refer to http://www.ieee802.org/3/az/index.html for more details.

Integrated 10/100/1000M Ethernet Precision Transceiver

12

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.4.  Wake-On-LAN (WOL)

The RTL8211F(I)/RTL8211FD(I) can monitor the network for a Wakeup Frame or a Magic Packet, and
notify the system via the PMEB (Power Management Event; ‘B’ means low active) pin when such a packet
or event occurs1. The system can then be restored to a normal state to process incoming jobs. The PMEB
pin needs to be connected with a 4.7k-ohm resistor and pulled up to 3.3V. When the Wakeup Frame or a
Magic Packet is sent to the PHY, the PMEB pin will be set low to notify the system to wake up. Refer to the
WOL application note for details.

any part of a valid Ethernet packet.

•  The received Magic Packet does not contain a CRC error.

Magic Packet Wakeup occurs only when the following conditions are met:

A Wakeup Frame event occurs only when the following conditions are met:

•  The Magic Packet pattern matches; i.e., 6 * FFh + MISC (can be none) + 16 * DID (Destination ID) in

•  The destination address of the received Magic Packet is acceptable to the RTL8211F(I)/RTL8211FD(I),
e.g., a broadcast, multicast, or unicast packet addressed to the current RTL8211F(I)/RTL8211FD(I).

Realtek

RTL8211F(I)/RTL8211FD(I), e.g., a broadcast, multicast, or unicast address to the current
RTL8211F(I)/RTL8211FD(I).

•  The 16-bit CRC2 of the received Wakeup Frame matches the 16-bit CRC of the sample Wakeup Frame
pattern given by the local machine’s OS. Or, the RTL8211F(I)/RTL8211FD(I) is configured to allow
direct packet wakeup, e.g., a broadcast, multicast, or unicast network packet.

•  The destination address of the received Wakeup Frame is acceptable to the

•  The received Wakeup Frame does not contain a CRC error.

Note 1: The INTB and PMEB functions share the same pin (pin 31), and can be determined by Page 0xd40,
Reg.22, bit[5].
Note 2: 16-bit CRC: The RTL8211F(I)/RTL8211FD(I) supports eight long wakeup frames (covering 128
mask bytes from offset 0 to 127 of any incoming network packet). CRC16 polynomial=x16+x12+x5+1.

Integrated 10/100/1000M Ethernet Precision Transceiver

13

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.5.  Interrupt

Whenever there is a status change on the media detected by the RTL8211F(I)/RTL8211FD(I), they will
drive  the  interrupt  pin  (INTB)  low  to  issue  an  interrupt  event.  The  MAC  senses  the  status  change  and
accesses  the  status  registers  (see  section  8.3.19  INSR  (Interrupt  Status  Register,  Page  0xa43,  Address
0x1D), page 43) through the MDC/MDIO interface in response.

7.6.  INTB/PMEB Pin Usage

Once these status registers have been read by the MAC through the MDC/MDIO, the INTB is de-asserted.
The RTL8211F(I) /RTL8211FD(I) interrupt function removes the need for continuous polling through the
MDC/MDIO management interface.

Note 1: The interrupt of the RTL8211F(I)/RTL8211FD(I) is a level-triggered mechanism.
Note 2: The INTB and PMEB functions share the same pin (pin 31), and can be determined by Page 0xd40,
Reg.22, bit[5].

The INTB/PMEB pin (pin 31) of the RTL8211F(I)/RTL8211FD(I) is designed to notify in cases of both
interrupt and WOL events. The default mode of this pin is INTB (Page 0xd40, Reg.22, bit[5] = 0). For
general use, indication of a WOL event is also integrated into one of the interrupt events (Page 0, Reg 18,
bit[7]  which  is  triggered  when  any  specified  WOL  event  occurs.  However,  the  ‘Low  Pulse’  waveform
format is not supported during this mode; only the active low, level-triggered waveform is provided.

Realtek
CONFIDENTIAL

This interface consists of four signal pairs; MDI0, MDI1, MDI2, and MDI3. Each signal pair consists of
two  bi-directional  pins  that  can  transmit  and  receive  at  the  same  time.  The  MDI  interface  has  internal
termination resistors to reduce BOM cost and PCB complexity. For 1000Base-T, all four pairs are used in
both directions at the same time. For 10/100 links and during auto-negotiation, only pairs A and B are used.

If PMEB mode is selected (Page 0xd40, Reg.22, bit[5] = 1), pin 31 becomes a fully functional PMEB pin.
Note that the interrupt function is disabled in this mode.

7.7.  MDI Interface

Integrated 10/100/1000M Ethernet Precision Transceiver

14

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.8.  Hardware Configuration

The I/O pad voltage, interface mode, and PHY address can be set by the CONFIG pins. The respective
value mapping of CONFIG with the configurable vector is listed in Table 10. To set the CONFIG pins, an
external pull-high or pull-low via resistor is required.

Configuration
PHYAD[2:0]

Table 11. Configuration Register Definitions

CONFIG Pin
RXD3
RXC
RXCTL
RXD2
RXD1
RXD0
LED0
LED1
LED2

Table 10. CONFIG Pins vs. Configuration Register
Configuration
PHYAD[0]
PHYAD[1]
PHYAD[2]
PLLOFF
TXDLY
RXDLY
CFG_EXT
CFG_LDO[0]
CFG_LDO[1]

Realtek
CONFIDENTIAL

Description
PHY Address.
PHYAD sets the PHY address for the device. The RTL8211F(I)/ RTL8211FD(I)  supports PHY
addresses from 00001 to 00111.
Note 1: An MDIO command with PHY address=0 is a broadcast from the MAC; each PHY
device should respond. This function can be disabled by setting Reg24.13=0 (See Table 36).
Note 2: The RTL8211F(I)/ RTL8211FD(I)  with PHYAD[2:0]=000 can automatically
remember the first non-zero PHY address. This function can be enabled by setting Reg24.6 = 1
(See Table 36).
ALDPS Mode PLL Off Configuration.
1: Stop PLL when entering ALDPS mode (via 4.7k-ohm to DVDD_RG)
0: PLL continue toggling when entering ALDPS mode (via 4.7k-ohm to GND)
RGMII Transmit Clock Timing Control.
1: Add 2ns delay to TXC for TXD latching (via 4.7k-ohm to DVDD_RG)
0: No delay (via 4.7k-ohm to GND)
RGMII Receive Clock Timing Control.
1: Add 2ns delay to RXC for RXD latching (via 4.7k-ohm to DVDD_RG)
0: No delay (via 4.7k-ohm to GND)
I/O Pad External Power Source Mode Configuration.
1: Use the external power source for the IO pad (via 4.7k-ohm to 3.3V)
0: Use the integrated LDO to transform the desired voltage for the IO pad (via 4.7k-ohm to
GND)

CFG_EXT

PLLOFF

RXDLY

TXDLY

Integrated 10/100/1000M Ethernet Precision Transceiver

15

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Configuration
CFG_LDO[1:0]

7.9.  LED and LDO Configuration

Description
LDO Output Voltage Selection for I/O pad/
External Power Source Voltage Selection for I/O pad.
When pulling down CFG_EXT pin, CFG_LDO[1:0] represent LDO output voltage setting for
IO pad: (via 4.7k-ohm to GND)
00: Reserved.
01: 2.5V
10: 1.8V
11: 1.5V
When pulling up CFG_EXT pin, CFG_LDO[1:0] stand for external power voltage selection for
IO pad: (via 4.7k-ohm to 3.3V)
00: 3.3V
01: 2.5V
10: 1.8V
11: 1.5V

In order to reduce the pin count on the RTL8211F(I)/RTL8211FD(I), the LED pins are duplexed with the
CFG_EXT and CFG_LDO pins. As the Hardware Configuration shares the LED output pins, the external
combinations  required  for  strapping  and  LED  usage  must  be  considered  in  order  to  avoid  contention.
Specifically, when the LED outputs are used to drive LEDs directly, the active state of each output driver is
dependent  on  the  logic  level  sampled  by  the  corresponding  CFG_EXT/CFG_LDO  inputs  upon
power-on/reset.

Realtek
CONFIDENTIAL

For example, as Figure 5 (left-side) shows, if a given CFG_EXT/CFG_LDO inputs are resistively pulled
high then the corresponding LED outputs will be configured as an active low driver. On the right side, we
can  see  that  if  a  given  CFG_EXT/CFG_LDO  inputs  are  resistively  pulled  low  then  the  corresponding
output  will  be  configured  as  an  active  high  driver.  The  Hardware  Configuration  pins  should  not  be
connected to GND or VCC directly, but must be pulled high or low through a resistor (e.g., 4.7KΩ). If no
LED indications are needed, the components of the LED path (LED+510Ω) can be removed.

CFG_LDO[1:0] = Logical 1
CFG_EXT = Logical 1
LED Indication=Active low

CFG_LDO[1:0] = Logical 0
CFG_EXT = Logical 0
LED Indication=Active High

Figure 5.   LED and LDO Configuration

Integrated 10/100/1000M Ethernet Precision Transceiver

16

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.10. Green Ethernet (1000/100Mbps Mode Only)

7.10.1.  Cable Length Power Saving
In 1000/100Mbps mode the RTL8211F(I)/RTL8211FD(I) provides dynamic detection of cable length and
dynamic adjustment of power required for the detected cable length. This feature provides intermediate
performance with minimum power consumption.

7.10.2.  Register Setting

Write Reg28, Data=0x573f

Write Reg16, Data=0xd73f

Write Reg27, Data=0x8011

Write Reg27, Data=0x8011

Follow the register settings below to ENABLE Green Ethernet (Default is ‘Enabled’)

Follow the register settings below to DISABLE Green Ethernet (Default is ‘Enabled’)

Realtek
CONFIDENTIAL

Integrated 10/100/1000M Ethernet Precision Transceiver

17

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.11. MAC/PHY Interface

The RTL8211F(I)/RTL8211FD(I) supports industry standards and is suitable for most off-the-shelf MACs
with an RGMII interface.

7.11.1.  RGMII
Among the RGMII interface in 100Base-TX and 10Base-T modes, TXC and RXC sources are 25MHz and
2.5MHz respectively; while in 1000Base-T mode, TXC and RXC sources are 125MHz. TXC will always
be generated by the MAC and RXC will always be generated by the PHY. TXD[3:0] and RXD[3:0] signals
are used for data transitions on the rising and falling edge of the clock.

The RTL8211F(I)/RTL8211FD(I) can share the same MDIO line. In switch/router applications, each port
should be assigned a unique address during the hardware reset sequence, and it can only be addressed via
that unique PHY address. For detailed information on the management registers, see section 8 Register
Descriptions, page 29.

7.11.2.  Management Interface
The management interface provides access to the internal registers through the MDC and MDIO pins as
described in IEEE 802.3u section 22. The MDC signal, provided by the MAC, is the management data
clock reference to the MDIO signal. The MDIO is the management data input/output and is a bi-directional
signal that runs synchronously to MDC. The MDIO pin needs a 1.5k Ohm pull-up resistor to maintain the
MDIO high during idle and turnaround.

Realtek
CONFIDENTIAL

Description
32 Contiguous Logical 1’s Sent by the MAC on MDIO, along with 32 Corresponding Cycles on MDC.
This provides synchronization for the PHY.
Start of Frame.
Indicated by a 01 pattern.
Operation Code.
Read: 10
Write: 01
PHY Address.
Up to eight PHYs can be connected to one MAC. This 3-bit field selects which PHY the frame is directed to.
Register Address.
This is a 5-bit field that sets which of the 32 registers of the PHY this operation refers to.

DATA
DDDDDDDDDDDDDDDD
DDDDDDDDDDDDDDDD

PHYAD  REGAD  TA
Z0
AAAAA  RRRRR
10
AAAAA  RRRRR

Table 12. Management Frame Format
Management Frame Fields

ST

OP

PHYAD

REGAD

Table 13. Management Frame Description

Preamble
1…1
1…1

Name
Preamble

IDLE
Z
Z

OP
10
01

Read
Write

ST
01
01

Integrated 10/100/1000M Ethernet Precision Transceiver

18

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Name
TA

DATA
IDLE

Description
Turnaround.
This is a 2-bit-time spacing between the register address and the data field of a frame to avoid contention
during a read transaction. For a read transaction, both the STA and the PHY remain in a high-impedance state
for the first bit time of the turnaround. The PHY drives a zero bit during the second bit time of the turnaround
of a read transaction.
Data. These are the 16 bits of data.
Idle Condition.
Not truly part of the management frame. This is a high impedance state. Electrically, the PHY’s pull-up
resistor will pull the MDIO line to a logical ‘1’.

Realtek
CONFIDENTIAL

Figure 7.   MDC/MDIO Write Timing

Figure 6.   MDC/MDIO Read Timing

Reg.  Address
0x00(BMCR)

PHY Address
0x01

0 0 0 0 0

0 0 0 0 0

Write
OP
(Code)

Reg. Data
0x 1340

0 0 0 0

0 0 0 0

Turn
Around

0 1 0

0 0

1...1

Start

Pre

0

1

1

1

0

1

1

1

1

z

z

Idle

MDC

MDIO(MAC)

7.11.3.  Change Page
Set MDIO commands as shown below in order to switch to the desired Page 0xXYZ (in Hex).

1. Write Register 31 Data = 0x0XYZ (Page 0xXYZ)

2. Read/Write the target Register Data

3. Write Register 31 Data = 0x0000 or 0xa42 (switch back to IEEE Standard Registers)

Integrated 10/100/1000M Ethernet Precision Transceiver

19

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.11.4.  Access to MDIO Manageable Device (MMD)
The  MDIO  Manageable  Device  (MMD)  is  an  extension  to  the  management  interface  that  provides  the
ability to access more device registers while still retaining logical compatibility with the MDIO interface,
defined  in  section  8.1  Register  Mapping  and  Definitions,  page  29.  Access  to  MMD  configuration  is
provided via Registers 13 and 14.

MMD Read/Write Operation

4. Read: Go to step 5. Write: Go to step 6.

5. Read the content of the selected register in MMD (Register 14).

6. Write the content of the selected register in MMD (Register 14).

1. Write Function field to 00 (address mode) and DEVAD field to the device address value for the desired
MMD (Register 13).

2. Write the desired address value to the MMD’s address register (Register 14).

3. Write Function field to 01 (data mode; no post increment) and DEVAD field to the same device address
for the desired MMD (Register 13).

Realtek
CONFIDENTIAL

Auto-Negotiation is a mechanism to determine the fastest connection between two link partners. For copper
media  applications,  it  was  introduced  in  IEEE  802.3u  for  Ethernet  and  Fast  Ethernet,  and  then  in
IEEE 802.3ab to address extended functions for Gigabit Ethernet. It performs the following:

•  Auto-Negotiation PAUSE/ASYMMETRIC PAUSE Resolution

•  Crossover Detection & Auto-Correction Resolution

Upon  de-assertion  of  a  hardware  reset,  the  RTL8211F(I)/RTL8211FD(I)  can  be  configured  to  have
auto-negotiation  enabled,  or  be  set  to  operate  in  10Base-T,  100Base-TX,  or  1000Base-T  mode  via  the
ANAR and GBCR register (register 4 and 9).

7.12. Auto-Negotiation

•  Auto-Negotiation Master/Slave Resolution

•  Auto-Negotiation Priority Resolution

The auto-negotiation process is initiated automatically upon any of the following:

•  Power-up

•  Hardware reset

•  Software reset (register 0.15)

Integrated 10/100/1000M Ethernet Precision Transceiver

20

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

•  Restart auto-negotiation (register 0.9)

•  Transition from power down to power up (register 0.11)

•  Entering the link fail state

Table 14. 1000Base-T Base and Next Page Bit Assignments

Bit

Name  Bit Description

Base Page

Register Location

-

-

-

RF

Ack

D13

D14

S[4:0]

D[4:0]

D[12:5]

D15

NP

A[7:0]  Technology Ability Field.

Register 4.[12:5]
Table 25, page 34.

Indicates to its link partner the supported technologies specific to
the selector field value.
Selector Field.
Always 00001.
Indicates to its link partner that it is an IEEE 802.3 device.

Next Page.
1: Indicates that Next Pages follow
0: Indicates that no Next Pages follow
Acknowledge.
1: Indicates that a device has successfully received its link
partner’s Link Code Word (LCW)
Remote Fault.
1: Indicates to its link partner that a device has encountered a fault
condition

Realtek
CONFIDENTIAL

Next Page.
1: Indicates that Next Pages follow
0: Indicates that no Next Pages follow
Acknowledge.
1: Indicates that a device has successfully received its link
partner’s Link Code Word (LCW)
Message Page.
1: Indicates to its link partner that this is a message page, not an
unformatted page.

1: Indicates to its link partner that the device has the ability to
comply with the message.
Toggle.
Used by the NWay arbitration function to ensure synchronization
with its link partner during Next Page exchange.
1000Base-T Message Code (Always 8).

Register 4.[4:0]
Table 25, page 34.

PAGE 0 (Message Next Page)

Ack2  Acknowledge 2.

M12

M14

M15

M13

M11

Ack

MP

NP

T

-

-

-

-

-

M[10:0]

-

U15

NP

U14

Ack

PAGE 1 (Unformatted Next Page)

Next Page.
1: Indicates that Next Pages follow
0: Indicates that no Next Pages follow
Acknowledge.
1: Indicates that a device has successfully received its link
partner’s Link Code Word (LCW)

-

-

-

Integrated 10/100/1000M Ethernet Precision Transceiver

21

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Register Location
-

-

-

Bit
U13

Name  Bit Description
MP

Message Page.
1: Indicates to its link partner that this is a message page, not an
unformatted page.

U12

Ack2  Acknowledge 2.

-

-

-

-

-
-

-
-

U0

U1

U2

U3

U11

T

0: No full duplex

0: No half duplex

U[10:5]
U4

0: Single-port device

1: Indicates to its link partner that the device has the ability to
comply with the message.
Toggle.
Used by the NWay arbitration function to ensure synchronization
with its link partner during Next Page exchange.
Reserved. Transmit as 0
1000Base-T Half Duplex.
1: Half duplex
1000Base-T Full Duplex.
1: Full duplex
1000Base-T Port Type Bit.
1: Multi-port device
1000Base-T Master-Slave Manual Configuration Value.
1: Master
This bit is ignored if bit 9.12=0
1000Base-T Master-Slave Manual Configuration Enable.
1: Manual Configuration Enable
This bit is intended to be used for manual selection in
Master-Slave mode, and is to be used in conjunction with bit 9.11

Realtek
CONFIDENTIAL

Next Page.
1: Indicates that Next Pages follow
0: Indicates that no Next Pages follow
Acknowledge.
1: Indicates that a device has successfully received its link
partner’s Link Code Word (LCW)
Message Page.
1: Indicates to its link partner that this is a message page, not an
unformatted page
Ack2  Acknowledge 2.

Register 9.10 (GBCR)
Table 30, page 38.
Register 9.11 (GBCR)
Table 30, page 38.

Register 9.12 (GBCR)
Table 30, page 38.

PAGE 2 (Unformatted Next Page)

0: Slave

U12

U14

U15

U13

Ack

MP

NP

-

-

-

-

-

U11

U[10:0]

T

-

1: Indicates to its link partner that the device has the ability to
comply with the message
Toggle.
Used by the NWay arbitration function to ensure synchronization
with its link partner during Next Page exchange.
1000Base-T Master-Slave Seed Bit[10:0]

-

Master-Slave
Seed Value SB[10:0]

Integrated 10/100/1000M Ethernet Precision Transceiver

22

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.12.1.  Auto-Negotiation Priority Resolution
Upon the start of auto-negotiation, to advertise its capabilities each station transmits a 16-bit packet called
a  Link  Code  Word  (LCW),  within  a  burst  of  17  to  33  Fast  Link  Pulses  (FLP).  A  device  capable  of
auto-negotiation transmits and receives the FLPs. The receiver must identify three identical LCWs before
the information is authenticated and used in the arbitration process. The devices decode the base LCW and
select capabilities with the highest common denominator supported by both devices.

To advertise 1000Base-T capability, both link partners, sharing the same link medium, should engage in
Next Page (1000Base-T Message Page, Unformatted Page 1, and Unformatted Page 2) exchange.

5. 10Base-T Full Duplex

2. 1000Base-T Half Duplex

3. 100Base-TX Full Duplex

4. 100Base-TX Half Duplex

1. 1000Base-T Full Duplex (highest priority)

Auto-negotiation ensures that the highest priority protocol will be selected as the link speed based on the
following priorities advertised through the Link Code Word (LCW) exchange. Refer to IEEE 802.3 Clause
28 for detailed information.

Realtek
CONFIDENTIAL

7.12.2.  Auto-Negotiation Master/Slave Resolution
To  establish  a  valid  1000Base-T  link,  the  Master/Slave  mode  of  both  link  partners  should  be  resolved
through the auto-negotiation process:

(cid:131)  Multi-port > Single-port
(cid:131)  Manual > Non-manual

•  Determination of Master/Slave configuration from LCW

6. 10Base-T Half Duplex (lowest priority)

•  Master Priority

(cid:131)  Manual_MASTER=U0*U1
(cid:131)  Manual_SLAVE=U0*!U1
(cid:131)  Single-port device=!U0*!U2
(cid:131)  Multi-port device=!U0*U2

Where: U0 is bit 0 of the Unformatted Page 1
U1 is bit 1 of the Unformatted Page 1
U2 is bit 2 of the Unformatted Page 1

Integrated 10/100/1000M Ethernet Precision Transceiver

23

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

•  Where there are two stations with the same configuration, the one with higher Master-Slave seed

SB[10:0] in the unformatted page 2 shall become Master.

•  Master-Slave configuration process resolution:

(cid:131)  Successful: Bit 10.15 Master-Slave Configuration Fault is set to logical 0, and bit 10.14 is set to

logical 1 for Master resolution, or set to logical 0 for Slave resolution.

(cid:131)  Unsuccessful: Auto-Negotiation restarts.
(cid:131)  Fault Detect: Bit 10.15 is set to logical 1 to indicate that a configuration fault has been detected.
Auto-Negotiation restarts automatically. This happens when both stations are set to manual
Master mode or manual Slave mode, or after seven attempts to configure the Master-Slave
relationship through the seed method has failed.

7.12.3.  Auto-Negotiation PAUSE/ASYMMETRIC PAUSE Resolution
Auto-negotiation is also used to determine the flow control capability between link partners. Flow control
is  a  mechanism  that  can  force  a  busy  transmitting  link  partner  to  stop  transmitting  in  a  full  duplex
environment by sending special MAC control frames. In IEEE 802.3u, a PAUSE control frame had already
been defined. However, in IEEE 802.3ab, a new ASY-PAUSE control frame was defined; if the MAC can
only generate PAUSE frames but is not able to respond to PAUSE frames generated by the link partner,
then it is called ASYMMETRIC PAUSE.

Realtek
CONFIDENTIAL

PAUSE/ASYMMETRIC PAUSE capability can be configured by setting the ANAR bits 10 and 11 (Table
25, page 34). Link partner PAUSE capabilities can be determined from ANLPAR bits 10 and 11 (Table 26,
page 35). A PHY layer device such as the RTL8211F(I)/RTL8211FD(I) is not directly involved in PAUSE
resolution, but simply advertises and reports PAUSE capabilities during the Auto-Negotiation process. The
MAC is responsible for final PAUSE/ASYMMETRIC PAUSE resolution after a link is established, and is
responsible for correct flow control actions thereafter.

Integrated 10/100/1000M Ethernet Precision Transceiver

24

Track ID: JATR-8275-15   Rev. 1.2

7.13. Crossover Detection and Auto-Correction

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Ethernet  needs  a  crossover  mechanism  between  both  link  partners  to  cross  the  transmit  signal  to  the
receiver when the medium is twisted-pair cable. Crossover  Detection & Auto-Correction Configuration
eliminates the need for crossover cables between devices, such as two computers connected to each other
with a CAT.5 Ethernet cable. The basic concept is to assume the initial default setting is MDI mode, and
then check the link status. If no link is established after a certain time, change to MDI Crossover mode and
repeat the process until a link is established. An 11-bit pseudo-random timer is applied to decide the mode
change time interval.

1. If set to half duplex, then only half duplex is advertised.

2. If set to full duplex, then both full and half duplex are advertised.

Crossover Detection & Auto-Correction is not a part of the Auto-Negotiation process, but it utilizes the
process  to  exchange  the  MDI/MDI  Crossover  configuration.  If  the  RTL8211F(I)/RTL8211FD(I)  is
configured to only operate in 100Base-TX or only in 10Base-T mode, then Auto-Negotiation is disabled
only if the Crossover Detection & Auto-Correction function  is  also  disabled.  If  Crossover  Detection  &
Auto-Correction  are  enabled,  then  Auto-Negotiation  is  enabled  and  the  RTL8211F(I)/RTL8211FD(I)
advertises only 100Base-TX mode or 10Base-T mode. If the speed of operation is configured manually and
Auto-Negotiation is still enabled because the Crossover Detection & Auto-Correction function is enabled,
then the duplex advertised is as follows:

Realtek
CONFIDENTIAL

If  the  user  wishes  to  advertise  only  full  duplex  at  a  particular  speed  with  the  Crossover  Detection  &
Auto-Correction  function  enabled,  then  Auto-Negotiation  should  be  enabled  (register  0.12)  with  the
appropriate  advertising  capabilities  set  in  registers  4  or  9.  The  Crossover  Detection  &  Auto-Correction
function may be enabled/disable by setting (register 24.[9:8]) manually.

After initial configuration following a hardware reset, Auto-Negotiation can be enabled and disabled via
register 0.12, speed via registers 0.13, 0.6, and duplex via register 0.8. The abilities that are advertised can
be changed via registers 4 and 9. Changes to registers 0.12, 0.13, 0.6, and 0.8 do not take effect unless at
least one of the following events occurs:

•  Restart of Auto-Negotiation (register 0.9)

•  Software reset (register 0.15)

•  Transition from power-down to power-up (register 0.11)

Registers 4 and 9 are internally latched once each time Auto-Negotiation enters the ABILITY DETECT
state in the arbitration state machine (IEEE 802.3). Hence a write into register 4 or 9 has no effect once the
RTL8211F(I)/RTL8211FD(I) begins to transmit Fast Link Pulses.

Register  7  is  treated  in  a  similar  manner  as  4  and  9  during  additional  Next  Page  exchanges.  Once  the
RTL8211F(I)/RTL8211FD(I) completes Auto-Negotiation, it updates the various statuses in registers 1, 5,
6, and 10. The speed, duplex, page received, and Auto-Negotiation completed statuses are also available in
registers 26 and 29.

Integrated 10/100/1000M Ethernet Precision Transceiver

25

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.14. LED Configuration

7.14.1.  Customized LED Function
The RTL8211F(I)/RTL8211FD(I) supports three LED pins, suitable for multiple types of applications that
can directly drive the LEDs. The output of these pins is determined by setting the corresponding bits in
Page 0xd04 Register 16. The functionality of the RTL8211F(I)/RTL8211FD(I) LEDs is shown in Table 15.

Table 15. LED Default Definitions

Pin
LED0
LED1
LED2

Description
10M Link and Active (Transmitting or Receiving)
100M Link and Active (Transmitting or Receiving)
1000M Link and Active (Transmitting or Receiving)

Note: To switch to Page 0xd04, set Register 31 Data=0x0d04 (set page). After LED setting, switch back to
the PHY’s IEEE Standard Registers, i.e. Page 0 or Page 0xa42 (Register 31 Data = 0 or 0xa42).

The  LED  pins  can  be  customized  from  Page  0xd04  Register 16.  To  change  the  register  page,  see  note
(below)  and  Table  16  LED  Register  Table.  There  are  16  configuration  types  (see  Table  17  LED
Configuration Table, page 27).

Realtek
CONFIDENTIAL

LINK Speed
100Mbps
Reg16 Bit1
Reg16 Bit6
Reg16 Bit11

1000Mbps
Reg16 Bit3
Reg16 Bit8
Reg16 Bit13

10Mbps
Reg16 Bit0
Reg16 Bit5
Reg16 Bit10

Reg16 Bit4
Reg16 Bit9
Reg16 Bit14

Table 16. LED Register Table

LED0
LED1
LED2

Active (Tx/Rx)

Integrated 10/100/1000M Ethernet Precision Transceiver

26

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Table 17. LED Configuration Table

Active (TX/RX) Bit  Description

Pin

LED

10Mbps
0
0
0
0
0
0
0
0
1
1
1
1
1
1
1
1

LINK Bit
100Mbps
0
0
0
0
1
1
1
1
0
0
0
0
1
1
1
1

1000Mbps
0
0
1
1
0
0
1
1
0
0
1
1
0
0
1
1

0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1

N/A
N/A
Link 1000
Link 1000+Active
Link 100
Link 100+Active
Link 100/1000
Link 100/1000+Active
Link 10
Link 10+Active
Link 10/1000
Link 10/1000+Active
Link 10/100
Link 10/100+Active
Link 10/100/1000
Link 10/100/1000+Active

Realtek
CONFIDENTIAL

7.14.2.  EEE LED Function
EEE Idle mode: LED continuous slow blinking.

EEE Active mode: LED fast and slow blinking (on packet transmitting and receiving).

Refer to Table 44, page 45 for EEE LED enable setting.

Figure 8.   EEE LED Behavior

Integrated 10/100/1000M Ethernet Precision Transceiver

27

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

7.15. Polarity Correction

The RTL8211F(I)/RTL8211FD(I) automatically corrects polarity errors on the receive pairs in 1000Base-T
and 10Base-T modes. In 100Base-TX mode polarity is irrelevant. In 1000Base-T mode, receive polarity
errors are automatically corrected based on the sequence of idle symbols. Once the descrambler is locked,
the polarity is also locked on all pairs. The polarity becomes unlocked only when the receiver loses lock.

7.16. Power

In 10Base-T mode, polarity errors are corrected based on the detection of validly spaced link pulses. The
detection begins during the MDI crossover detection phase and locks when the 10Base-T link is up. The
polarity becomes unlocked when the link is down.

The  RTL8211F(I)/RTL8211FD(I)  implements  an  option  for  the  RGMII  power  pins.  The  standard  I/O
voltage  of  the  RGMII  interface  is  3.3V,  with  support  for  2.5/1.8/1.5V  to  lower  EMI.  The  2.5/1.8/1.5V
power source for RGMII is supplied from an internal LDO or from an external power source.

A voltage regulator is implemented to generate operating power (switching regulator for the RTL8211F(I);
LDO for the RTL8211FD(I)). The system vendor needs to supply a 3.3V, 1A steady power source. The
RTL8211F(I)/RTL8211FD(I)  converts  the  3.3V  steady  power  source  to  1.0V  via  a  switching
regulator/LDO.

Realtek
CONFIDENTIAL

The RTL8211F(I)/RTL8211FD(I) has a PHYRSTB pin to reset the chip. For a complete PHY reset, this pin
must be asserted low for at least 10ms (Tgap in Figure 9) for the internal regulator. Wait for at least 50ms*
(for internal circuits settling time) before accessing the PHY register. All registers will return to default
values after a hardware reset.
* Note: Refer to Note 6 in section 9.3, page 49, and the RTL8211F_Series_Power_Sequence_App_Note for
more detailed information.

7.17. PHY Reset (Hardware Reset)

Figure 9.   PHY Reset Timing

Integrated 10/100/1000M Ethernet Precision Transceiver

28

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.  Register Descriptions

8.1.  Register Mapping and Definitions

Table 18. Register Access Types

Type
LH
RC
RO
RW
SC

Table 19. Register Mapping and Definitions

Description
Latch high. If the status is high, this field is set to ‘1’ and remains set.
Read-cleared. The register field is cleared after read.
Read only.
Read and Write
Self-cleared. Writing a ‘1’  to this register field causes the function to be activated immediately, and then the
field will be automatically cleared to’0’ .

Realtek
CONFIDENTIAL

Description
Basic Mode Control Register.
Basic Mode Status Register.
PHY Identifier Register 1.
PHY Identifier Register 2.
Auto-Negotiation Advertising Register.
Auto-Negotiation Link Partner Ability Register.
Auto-Negotiation Expansion Register.
Auto-Negotiation Next Page Transmit Register.
Auto-Negotiation Next Page Receive Register.
1000Base-T Control Register.
1000Base-T Status Register.
Reserved.
MMD Access Control Register.
MMD Access Address Data Register.
1000Base-T Extended Status Register.

Access  Name
BMCR
RW
BMSR
RO
PHYID1
RO
PHYID2
RO
ANAR
RW
ANLPAR
RO
ANER
RO
ANNPTR
RW
ANNPRR
RO
GBCR
RW
GBSR
RO
RSVD
RO
WO  MACR
RW
RO

Offset
0
1
2
3
4
5
6
7
8
9
10
11~12
13
14
15

Page
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0

MAADR
GBESR

0xa42
0xa42
0xa42
0xa43
0xa43
0xa43
0xa43
0xa43
0xa43
0xa43

16~17
18
19~23
24
25
26
27~28
29
30
31

RO
RW
RO
RW
RW
RO
RO
RO
RO
RW

RSVD
INER
RSVD
PHYCR1
PHYCR2
PHYSR
RSVD
INSR
RSVD
PAGSR

Reserved.
Interrupt Enable Register.
Reserved.
PHY Specific Control Register 1.
PHY Specific Control Register 2.
PHY Specific Status Register.
Reserved.
Interrupt Status Register.
Reserved.
Page Select Register.

0xa46

0xd04

20

16

RW

RW

PHYSCR

LCR

PHY Special Cofig Register

LED Control Register.

Integrated 10/100/1000M Ethernet Precision Transceiver

29

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Page
0xd04

0xd40

Offset
17

22

Access  Name

RW

RW

EEELCR

INTBCR

Description
EEE LED Control Register.

INTB Pin Control Register.

Note 1: To access the IEEE Standard Registers 0 to 15, the Page Select Register (PAGSR, Register 31) should be set as ‘0’
or ‘0xa42’(default value).
Note 2: For example, to switch to Page 0xd04, set Register 31 Data=0x0d04 (change to Page 0xd04). After LED setting,
switch back to the PHY’s IEEE Standard Registers, i.e. Page 0 or Page 0xa42 (Register 31 Data = 0 or 0xa42).

Realtek
CONFIDENTIAL

Integrated 10/100/1000M Ethernet Precision Transceiver

30

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.2.  MMD Register Mapping and Definitions

Table 20. MMD Register Mapping and Definitions

Device
3
3
3
3
7
7

Offset
0
1
20
22
60
61

Access  Name
PC1R
PS1R
EEECR
EEEWER
EEEAR
EEELPAR

RW
RW
RO
RC
RW
RO

Description
PCS Control 1 Register.
PCS Status 1 Register.
EEE Capability Register.
EEE Wake Error Register.
EEE Advertisement Register.
EEE Link Partner Ability Register.

0

RW, SC

Bit
0.15

Name
Reset

8.3.  Register Tables

8.3.1.  BMCR (Basic Mode Control Register, Address 0x00)

Type  Default Description

Table 21. BMCR (Basic Mode Control Register, Address 0x00)

Realtek
CONFIDENTIAL

Reset.
1: PHY reset
0: Normal operation
Register 0 (BMCR) and register 1 (BMSR) will return to default
values after a software reset (set Bit15 to 1).
This action may change the internal PHY state and the state of the
physical link associated with the PHY.
Loopback Mode.
1: Enable PCS loopback mode
0: Disable PCS loopback mode
The loopback function enables RGMII transmit data to be routed to the
RGMII receive data path.
Speed Select Bit 0.
In forced mode, i.e., when Auto-Negotiation is disabled, bits 6 and 13
determine device speed selection.

Loopback

Speed[0]

0.14

0.13

RW

RW

0

0

Speed[1]
1
1
0
0

Speed[0]
1
0
1
0

Speed Enabled
Reserved
1000Mbps
100Mbps
10Mbps

0.12  ANE

0.11

PWD

RW

RW

1

0

Auto-Negotiation Enable.
1: Enable Auto-Negotiation
0: Disable Auto-Negotiation
Power Down.
1: Power down (only Management Interface and logic are active; link
is down)
0: Normal operation

Integrated 10/100/1000M Ethernet Precision Transceiver

31

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Bit
0.10

Name
Isolate

Type  Default Description
RW

0

0

0

0.6

0.8

0.7

RW

RW

Duplex

Speed[1]

Collision Test

0.9

Restart_AN

RW, SC

0

Isolate.
1: RGMII interface is isolated; the serial management interface (MDC,
MDIO) is still active. When this bit is asserted, the
RTL8211F(I)/RTL8211FD(I) ignores TXD[3:0], and TXCTL inputs,
and presents a high impedance on TXC, RXC, RXCTL, RXD[3:0].
0: Normal operation
Restart Auto-Negotiation.
1: Restart Auto-Negotiation
0: Normal operation
Duplex Mode.
1: Full Duplex operation
0: Half Duplex operation
This bit is valid only in force mode, i.e., NWay is disabled.
Collision Test.
1: Collision test enabled
0: Normal operation
Speed Select Bit 1.
Refer to bit 0.13.
Uni-Directional Enable
1: Enable packet transmit without respect to linkok status
0: Packet transmit permitted when link is established

Realtek
CONFIDENTIAL

Note 1: When the RTL8211F(I)/RTL8211FD(I) is switched from power down to normal operation, a software reset and
restart auto-negotiation is performed, even if bits Reset (0.15) and Restart_AN (0.9) are not set by the user.
Note 2: Auto-Negotiation is enabled when speed is set to 1000Base-T. Crossover Detection & Auto-Correction takes
precedence over Auto-Negotiation disable (0.12=0). If ANE is disabled, speed and duplex capabilities are advertised by
0.13, 0.6, and 0.8. Otherwise, register 4.8:5 and 9.9:8 take effect.
Note 3: Auto-Negotiation automatically restarts after hardware or software reset regardless of whether or not the restart bit
(0.9) is set.

8.3.2.  BMSR (Basic Mode Status Register, Address 0x01)
Table 22. BMSR (Basic Mode Status Register, Address 0x01)

Uni-directional
enable

Name
100Base-T4

Default Description

00000  Reserved.

0.4:0  RSVD

Type
RO

Bit
1.15

RW

RW

RO

0.5

0

0

1

1.14

100Base-TX (full)

RO

1.13

100Base-TX (half)

RO

1

1

100Base-T4 Capability.
The RTL8211F(I)/RTL8211FD(I) does not support 100Base-T4
mode. This bit should always be 0.
100Base-TX Full Duplex Capability.
1: Device is able to perform 100Base-TX in full duplex mode
0: Device is not able to perform 100Base-TX in full duplex mode
100Base-TX Half Duplex Capability.
1: Device is able to perform 100Base-TX in half duplex mode
0: Device is not able to perform 100Base-TX in half duplex mode

Integrated 10/100/1000M Ethernet Precision Transceiver

32

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Default Description

1

1

0

1.6

1.8

1.7

1.9

RO

RO

RO

1

1

0

10Base-T2 (half)

Preamble
Suppression

Uni-directional
ability

1000Base-T
Extended Status

Bit
1.12

Name
10Base-T (full)

Type
RO

1.11

10Base-T (half)

RO

1.10

10Base-T2 (full)

RO

Realtek
CONFIDENTIAL

10Base-T Full Duplex Capability.
1: Device is able to perform 10Base-T in full duplex mode.
0: Device is not able to perform 10Base-T in full duplex mode.
10Base-T Half Duplex Capability.
1: Device is able to perform 10Base-T in half duplex mode
0: Device is not able to perform 10Base-T in half duplex mode
10Base-T2 Full Duplex Capability.
The RTL8211F(I)/RTL8211FD(I) does not support 10Base-T2
mode and this bit should always be 0.
10Base-T2 Half Duplex Capability.
The RTL8211F(I)/RTL8211FD(I) does not support 10Base-T2
mode. This bit should always be 0.
1000Base-T Extended Status Register.
1: Device supports Extended Status Register 0x0F (15)
0: Device does not support Extended Status Register 0x0F
This register is read-only and is always set to 1.
Uni-directional ability.
1: PHY able to transmit from RGMII without linkok
0: PHY not able to transmit from RGMII without linkok
Preamble Suppression Capability.
The RTL8211F(I)/RTL8211FD(I) default will not accept
MDC/MDIO transactions with preamble suppressed.
Auto-Negotiation Complete.
1: Auto-Negotiation process complete, and contents of registers
5, 6, 8, and 10 are valid
0: Auto-Negotiation process not complete
Remote Fault.
1: Remote fault condition detected (cleared on read or by reset).
Indication or notification of remote fault from Link Partner
0: No remote fault condition detected
Auto Configured Link.
1: Device is able to perform Auto-Negotiation
0: Device is not able to perform Auto-Negotiation
Link Status.
1: Linked
0: Not Linked
This register indicates whether the link was lost since the last read.
For the current link status, either read this register twice or read
register bit 17.10 Link Real Time.
Jabber Detect.
1: Jabber condition detected
0: No Jabber occurred
1: Extended register capabilities, always 1

1.1

Jabber Detect

RC, LH

0

1.0

Extended Capability

RO

1

Auto-Negotiation
Complete

Auto-Negotiation
Ability

Remote Fault

Link Status

RC, LH

RO

RO

RO

RO

1.5

1.3

1.4

1.2

0

0

1

0

0

Integrated 10/100/1000M Ethernet Precision Transceiver

33

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.3.3.  PHYID1 (PHY Identifier Register 1, Address 0x02)

Table 23. PHYID1 (PHY Identifier Register 1, Address 0x02)

Bit

Name

2.15:0  OUI_MSB

Type
RO

Default

Description

0000000000011100  Organizationally Unique Identifier Bit 3:18.

Always 0000000000011100.

Note: Realtek OUI is 0x000732.

Bit

0110

Name

Name

RO
RO

Type
RW

Type
RO

Always 110010.

3.15:10  OUI_LSB

Default  Description

8.3.4.  PHYID2 (PHY Identifier Register 2, Address 0x03)

8.3.5.  ANAR (Auto-Negotiation Advertising Register, Address 0x04)

Bit
4.15  NextPage

3.9:4  Model Number
3.3:0  Revision Number

Table 24. PHYID2 (PHY Identifier Register 2, Address 0x03)

Table 25. ANAR (Auto-Negotiation Advertising Register, Address 0x04)

010001  Manufacture’s Model Number
Revision Number

Default  Description
110010  Organizationally Unique Identifier Bit 19:24.

Realtek
CONFIDENTIAL

1: Additional next pages exchange desired
0: No additional next pages exchange desired
Reserved.
1: Set Remote Fault bit
0: No remote fault detected
Reserved.
1: Advertise support of asymmetric pause
0: No support of asymmetric pause
1: Advertise support of pause frames
0: No support of pause frames
1: 100Base-T4 support
0: 100Base-T4 not supported
1: Advertise support of 100Base-TX full-duplex mode
0: Not advertised
1: Advertise support of 100Base-TX half-duplex mode
0: Not advertised
1: Advertise support of 10Base-TX full-duplex mode
0: Not advertised

4.7

100Base-TX (Half)

RW

4.6

10Base-T (Full)

RW

1

1

4.12
4.11  Asymmetric PAUSE

RSVD
Remote Fault

100Base-TX (Full)

100Base-T4

4.14
4.13

RO
RW

RO
RW

PAUSE

RSVD

4.10

0
0

0
0

RW

RW

RO

4.9

4.8

0

0

1

0

Integrated 10/100/1000M Ethernet Precision Transceiver

34

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Default  Description

Bit
4.5

Name
10Base-T (Half)

Type
RW

1

4.4:0

Selector Field

1: Advertise support of 10Base-TX half-duplex mode
0: Not advertised
Indicates the RTL8211F(I)/RTL8211FD(I) supports IEEE 802.3
Note 1: The setting of Register 4 has no effect unless NWay is restarted or the link goes down, i.e., software reset (0.15) is
asserted, Restart_AN (0.9) is asserted, or PWD (0.11) transitions from power down to normal operation.
Note 2: If 1000Base-T is advertised, then the required next pages are automatically transmitted. Register 4.15 should be set
to 0 if no additional next pages are needed.

00001

RO

0

0

0

RO

RO

5.13

Name

RSVD

Type
RO

Remote Fault

5.14  ACK

Default  Description

Bit
5.15  Next Page

8.3.6.  ANLPAR (Auto-Negotiation Link Partner Ability Register,

5.12
5.11:5  Technology Ability Field
Selector Field
5.4:0

Address 0x05)
Table 26. ANLPAR (Auto-Negotiation Link Partner Ability Register, Address 0x05)

Next Page Indication.
Received Code Word Bit 15.
Acknowledge.
Received Code Word Bit 14.
Remote Fault indicated by Link Partner.
Received Code Word Bit 13.
Reserved.

Realtek
CONFIDENTIAL

00000000  Received Code Word Bit 12:5.
Received Code Word Bit 4:0.

Note: Register 5 is not valid until the Auto-Negotiation complete bit 1.5 indicates completed.

RO
RO
RO

00000

0

Integrated 10/100/1000M Ethernet Precision Transceiver

35

Track ID: JATR-8275-15   Rev. 1.2

8.3.7.  ANER (Auto-Negotiation Expansion Register, Address 0x06)

Table 27. ANER (Auto-Negotiation Expansion Register, Address 0x06)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

1

0

0

6.5

6.2

6.3

6.4

RO

RO

RC, LH

Default  Description
0x000
1

Bit

Name
6.15:5  RSVD

6.6

RX NP location ability

Type
RO
RO

RX NP location

Local Next Page Able

Parallel Detection Fault

Link Partner Next Page Able

Reserved.
Received next page storage location ability.
1: Received next page storage location is specified by
    bit 6.5
0: Received next page storage location is not specified by
bit 6.5
Received next page storage location.
1: Link partner next pages are stored in Register 8
0: Link partner next pages are stored in Register 5
1: A fault has been detected via the Parallel Detection
function
0: A fault has not been detected via the Parallel Detection
function
1: Link Partner supports Next Page exchange
0: Link Partner does not support Next Page exchange
1: Local Device is able to send Next Page
Always 1.
1: A New Page (new LCW) has been received
0: A New Page has not been received
1: Link Partner supports Auto-Negotiation
0: Link Partner does not support Auto-Negotiation

Realtek
CONFIDENTIAL

Link Partner
Auto-Negotiation capable

Note: Register 6 is not valid until the Auto-Negotiation complete bit 1.5 indicates completed.

Page Received

RC, LH

RO

RO

6.0

6.1

0

1

0

Integrated 10/100/1000M Ethernet Precision Transceiver

36

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.3.8.  ANNPTR (Auto-Negotiation Next Page Transmit Register,

Address 0x07)
Table 28. ANNPTR (Auto-Negotiation Next Page Transmit Register, Address 0x07)

Name

Bit
7.15  Next Page

Type
RW

Default  Description

0

0

RW

0
1

7.11

Toggle

RO
RW

7.12  Acknowledge 2

7.14
RSVD
7.13  Message Page

Next Page Indication.
0: No more next pages to send
1: More next pages to send
Transmit Code Word Bit 15.
Transmit Code Word Bit 14.
Message Page.
0: Unformatted Page
1: Message Page
Transmit Code Word Bit 13.
Acknowledge2.
0: Local device has no ability to comply with the
message received
1: Local device has the ability to comply with the
message received
Transmit Code Word Bit 12.
Toggle Bit.
Transmit Code Word Bit 11.
Content of Message/Unformatted Page.
Transmit Code Word Bit 10:0.

Realtek
CONFIDENTIAL

Type
RO
RO
RO
RO
RO
RO
Note: Register 8 is not valid until the Auto-Negotiation complete bit 1.5 indicates completed.

Bit
8.15  Next Page
8.14  Acknowledge
8.13  Message Page
8.12  Acknowledge 2
Toggle
8.11
8.10:0  Message/Unformatted Field

Address 0x08)
Table 29. ANNPRR (Auto-Negotiation Next Page Receive Register, Address 0x08)

Received Link Code Word Bit 15.
Received Link Code Word Bit 14.
Received Link Code Word Bit 13.
Received Link Code Word Bit 12.
Received Link Code Word Bit 11.
Received Link Code Word Bit 10:0.

8.3.9.  ANNPRR (Auto-Negotiation Next Page Receive Register,

0
0
0
0
0
0x00

7.10:0  Message/Unformatted Field

Default  Description

0x001

Name

RW

RO

0

Integrated 10/100/1000M Ethernet Precision Transceiver

37

Track ID: JATR-8275-15   Rev. 1.2

8.3.10.  GBCR (1000Base-T Control Register, Address 0x09)

Table 30. GBCR (1000Base-T Control Register, Address 0x09)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Default  Description

Bit

Name

9.15:13  Test Mode

Type
RW

9.12  MASTER/SLAVE Manual

RW

Configuration Enable

9.11  MASTER/SLAVE

RW

Configuration Value

0

0

0

Test Mode Select.
000: Normal Mode
001: Test Mode 1 – Transmit Jitter Test
010: Test Mode 2 – Transmit Jitter Test (MASTER mode)
011: Test Mode 3 – Transmit Jitter Test (SLAVE mode)
100: Test Mode 4 – Transmit Distortion Test
101, 110, 111: Reserved
Enable Manual Master/Slave Configuration.
1: Manual MASTER/SLAVE configuration
0: Automatic MASTER/SLAVE
Advertise Master/Slave Configuration Value.
1: Manual configure as MASTER
0: Manual configure as SLAVE
Advertise Device Type Preference.
1: Prefer multi-port device (MASTER)
0: Prefer single port device (SLAVE)
Advertise 1000Base-T Full-Duplex Capability.
1: Advertise
0: Do not advertise
Reserved.
Reserved.

1

0

9.9

RW

RW

9.10

Port Type

RW
RO

1000Base-T Full Duplex

9.8
RSVD
9.7:0  RSVD

Note 1: Values set in register 9.12:9 have no effect unless Auto-Negotiation is restarted (Reg0.9) or the link goes down.
Note 2: Bits 9.11 and 9.10 are ignored when bit 9.12=0.

CONFIDENTIAL

8.3.11.  GBSR (1000Base-T Status Register, Address 0x0A)
Table 31. GBSR (1000Base-T Status Register, Address 0x0A)
Default  Description

Type
RO, RC,
LH

10.15  MASTER/SLAVE

Configuration Fault

Name

0
0

Bit

0

10.14  MASTER/SLAVE

RO

0

Configuration Resolution

10.13  Local Receiver Status

RO

10.12  Remote Receiver Status

RO

0

0

Master/Slave Manual Configuration Fault Detected.
1: MASTER/SLAVE configuration fault detected
0: No MASTER/SLAVE configuration fault detected
Master/Slave Configuration Result.
1: Local PHY configuration resolved to MASTER
0: Local PHY configuration resolved to SLAVE
Local Receiver Status.
1: Local Receiver OK
0: Local Receiver Not OK
Remote Receiver Status.
1: Remote Receiver OK
0: Remote Receiver Not OK

Integrated 10/100/1000M Ethernet Precision Transceiver

38

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Bit

Name

10.11  Link Partner 1000Base-T

Full Duplex Capability

Type
RO

10.10  Link Partner 1000Base-T

RO

Half Duplex Capability

10.9:8  RSVD
10.7:0

Idle Error Count

RO
RO, RC

Default  Description

0

0

00

Link Partner 1000Base-T Full Duplex Capability.
1: Link Partner is capable of 1000Base-T full duplex
0: Link Partner is not capable of 1000Base-T full duplex
Link Partner 1000Base-T Half Duplex Capability.
1: Link Partner is capable of 1000Base-T half duplex
0: Link Partner is not capable of 1000Base-T half duplex
Reserved.

0x00  MSB of Idle Error Counter.

The counter stops automatically when it reaches 0xff.

0

Bit

Name

Type
WO

13.15:14  Function

8.3.12.  MACR (MMD Access Control Register, Address 0x0D)

Note 1: Values set in register 10.11:10 are not valid until register 6.1 is set to 1.
Note 2: Register 10 is not valid until the Auto-Negotiation complete bit 1.5 indicates completed.

Table 32. MACR (MMD Access Control Register, Address 0x0D)
Default  Description
00: Address
01: Data with no post increment
10: Data with post increment on reads and writes
11: Data with post increment on writes only

Realtek
CONFIDENTIAL

Note 1: This register is used in conjunction with the MAADR (Register 14) to provide access to the MMD address space.
Note 2: If the MAADR accesses for address (Function=00), then it is directed to the address register within the MMD
associated with the value in the DEVAD field.
Note 3: If the MAADR accesses for data (Function≠00), both the DEVAD field and MMD’s address register direct the
MAADR data accesses to the appropriate registers within the MMD.

8.3.13.  MAADR (MMD Access Address Data Register, Address 0x0E)

Table 33. MAADR (MMD Access Address Data Register, Address 0x0E)

Type  Default  Description
RW

13.13:5  RSVD
13.4:0  DEVAD

14.15:0  Address Data

000000000  Reserved.

Device Address.

RO
WO

0x0000

Name

Bit

0

13.15:14 = 00
(cid:198) MMD DEVAD’s address register
13.15:14 = 01, 10, or 11
(cid:198) MMD DEVAD’s data register as indicated by the contents of its
address register

Note: This register is used in conjunction with the MACR (Register 13; Table 32) to provide access to the MMD address
space.

Integrated 10/100/1000M Ethernet Precision Transceiver

39

Track ID: JATR-8275-15   Rev. 1.2

8.3.14.  GBESR (1000Base-T Extended Status Register, Address 0x0F)

Table 34. GBESR (1000Base-T Extended Status Register, Address 0x0F)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Name
1000Base-X FD
1000Base-X HD
1000Base-T FD
1000Base-T HD

Bit
15.15
15.14
15.13
15.12
15.11:0  RSVD

Type  Default Description
RO
RO
RO
RO
RO

0x000  Reserved.

0
0
1
0

0: Not 1000Base-X full duplex capable
0: Not 1000Base-X half duplex capable
1: 1000Base-T full duplex capable
1: 1000Base-T half duplex capable

0

0

Bit

RW

Name
18.15:12  RSVD

8.3.15.  INER (Interrupt Enable Register, Page 0xa42, Address 0x12)

18.10

18.8
18.7

Jabber Interrupt

0: Interrupt Disable

0: Interrupt Disable

Type
RW
RW

18.9  ALDPS State Change Interrupt

Default  Description
00000  Reserved.

Table 35. INER (Interrupt Enable Register, Page 0xa42, Address 0x12)

RSVD
PME (Power Management Event
of WOL)

Realtek
CONFIDENTIAL

1: Interrupt Enable
Setting this bit to 0 only masks a jabber interrupt
event in the INT interface.
Reg29 Bit10 always reflects the jabber interrupt
behavior.
1: Interrupt Enable
Setting this bit to 0 only masks an ALDPS state
change interrupt event in the INT interface.
Reg29 Bit9 always reflects the ALDPS state change
interrupt behavior.
Reserved.
1: Interrupt Enable
Setting this bit to 0 only masks a PME interrupt
event in the INT interface.
Reg29 Bit7 always reflects the PME interrupt
behavior.
Reserved.
1: Interrupt Enable
Setting this bit to 0 only masks a PHY register
access interrupt event in the INT interface.
Reg29 Bit12 always reflects the PHY register access
interrupt behavior.
1: Interrupt Enable
Setting this bit to 0 only masks a link status change
interrupt event in the INT interface.
Reg29 Bit4 always reflects the link change interrupt
behavior.
1: Interrupt Enable
Setting this bit to 0 only masks an auto-negotiation
completed interrupt event in the INT interface.
Reg29 Bit3 always reflects the auto-negotiation
completed interrupt behavior.

18.4

Link Status Change Interrupt

RW

0

18.3  Auto-Negotiation Completed

RW

0

Interrupt

RSVD
PHY Register Accessible Interrupt

0: Interrupt Disable

0: Interrupt Disable

0: Interrupt Disable

0: Interrupt Disable

18.6
18.5

RW
RW

RW
RW

0
1

0
0

Integrated 10/100/1000M Ethernet Precision Transceiver

40

Track ID: JATR-8275-15   Rev. 1.2

Bit
18.2

Name
Page Received Interrupt

Type
RW

RSVD

18.1
18.0  Auto-Negotiation Error Interrupt

RW
RW

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Default  Description

0

0
0

0: Interrupt Disable

1: Interrupt Enable
Setting this bit to 0 only masks a page received
interrupt event in the INT interface.
Reg29 Bit2 always reflects the page received
interrupt behavior.
Reserved.
1: Interrupt Enable
Setting this bit to 0 only masks an auto-negotiation
error interrupt event in the INT interface.
Reg29 Bit0 always reflects the auto-negotiation
error interrupt behavior.

0: Interrupt Disable

8.3.16.  PHYCR1 (PHY Specific Control Register 1, Page 0xa43, Address

0x18)

0

Bit

RW

24.13

Enable

00
0

00
1

RO
RW

24.11:10  RSVD

PHYAD_0 Enable

Name
24.15:14  RSVD

24.12  ALDPS XTAL-OFF Enable

24.9  MDI Mode Manual Configuration

Table 36. PHYCR1 (PHY Specific Control Register 1, Page 0xa43, Address 0x18)

Type  Default  Description
RO
RW

Reserved.
1: A broadcast from MAC (A command with PHY
address = 0) is valid. MDC/MDIO will respond to this
command.
1: Enable XTAL off  when in ALDPS mode
(Reg. 24 bit[2] = 1)
Reserved.
1: Enable Manual Configuration of MDI mode

CONFIDENTIAL

PHYAD Non-zero Detect

24.8  MDI Mode

Set the MDI/MDIX mode.
1: MDI
This bit will take effect only when Reg 24.9 = 1.
1: Assert CRS on transmit
0: Never assert CRS on transmit
1: The RTL8211F(I)/RTL8211FD(I) with
PHYAD[2:0] = 000 will latch the first non-zero PHY
address as its own PHY address
Reserved.
1: Check preamble when receiving an MDC/MDIO
command
1: Enable Jabber Detection
1: Enable Link Down Power Saving Mode
1: Enable PLL off  when in ALDPS mode
(Reg. 24 bit[2] = 1)
Reserved.

24.3
24.2
24.1

Jabber Detection Enable
ALDPS Enable
ALDPS PLL-OFF Enable

24.0

RSVD

RW
RW
RW

1
0
0

RO

00

RSVD
Preamble Check Enable

TX CRS Enable

24.5
24.4

RO
RW

0: MDIX

24.7

24.6

0
1

RW

RW

RW

0

1

0

Note: The method to disable auto-crossover and force MDI or MDIX mode is as follows:
Step 1: Set Page 0x43, Reg24 bit[9]=1 (Manual Configuration of MDI mode) and set Reg24 bit[8]=1 (MDI) or 0 (MDIX).
Step 2: Perform a PHY reset, i.e., set Reg.0 bit[15]=1.

Integrated 10/100/1000M Ethernet Precision Transceiver

41

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.3.17.  PHYCR2 (PHY Specific Control Register 2, Page 0xa43, Address

0x19)

Table 37. PHYCR2 (PHY Specific Control Register 2, Page 0xa43, Address 0x19)

25.7

0
1
1

1
1
0
0

000
0

RO
RW

0000
1

RO
RW
RW

25.10:8  RSVD

25.2
25.1
25.0

CLKOUT SSC Enable

RO
RW
RO
RW

Default  Description

25.6
25.5
25.4
25.3

Bit

Name
25.15:12  RSVD

25.11  CLKOUT Frequency Select

Type
RO
RW

8.3.18.  PHYSR (PHY Specific Status Register, Page 0xa43, Address 0x1A)
Table 38. PHYSR (PHY Specific Status Register, Page 0xa43, Address 0x1A)

RSVD
RXC Enable
CLKOUT Enable

RSVD
PHY-mode EEE Enable
RSVD
RXC SSC Enable

Reserved.
Frequency select of the CLKOUT pin clock output.
0: 25MHz
1: 125MHz
Reserved.
1: Enable Spread-Spectrum Clocking (SSC) on
CLKOUT output clock.
Reserved.
1: Enable EEE in PHY mode.
Reserved.
1: Enable Spread-Spectrum Clocking (SSC) on
RXC clock output.
Reserved.
1: RXC clock output enabled.
1: CLKOUT clock output enabled.

Realtek
CONFIDENTIAL

Reserved.
Link Down Power Saving Mode.
1: Reflects local device entered Link Down Power Saving Mode,
i.e., cable not plugged in (reflected after 3 sec).
0: With cable plugged in
MDI Status.
1: Plugged
Auto-Negotiation (NWay) Status.
1: Enable
Device is in Master/Slave Mode.
1: Master mode
Reserved.
1: Both local and link-partner have EEE capability of current speed
Rx Flow Control.
1: Enable
Tx Flow Control.
1: Enable
Link Speed.
11: Reserved
01: 100Mbps

26.10:9  RSVD

26.8
26.7

EEE capability
Rxflow Enable

26.6

Txflow Enable

26.5:4  Speed

RO
RO
RO

RO

RO

00
0
0

0

00

Type  Default  Description
RO
RO

Name
26.15  RSVD
26.14  ALDPS State

10: 1000Mbps
00: 10Mbps

26.12  NWay Enable

26.11  Master Mode

26.13  MDI Plug

0: Unplugged

0: Slave mode

0: Disable

0: Disable

0: Disable

0
0

RO

RO

RO

Bit

0

1

0

Integrated 10/100/1000M Ethernet Precision Transceiver

42

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Bit
Name
26.3  Duplex

Type  Default  Description
RO

0

26.2

Link (Real Time)

26.1  MDI Crossover
Status

RO

RO

26.0

Jabber (Real Time)

RO

0

1

0

Full/Half Duplex Mode.
1: Full duplex
Real Time Link Status.
1: Link OK
MDI/MDI Crossover Status.
1: MDI
Real Time Jabber Indication.
1: Jabber Indication

0: Half duplex

0: Link not OK

0: MDI Crossover

0: No Jabber Indication

Bit

29.8
29.7

29.10
29.9

8.3.19.  INSR (Interrupt Status Register, Page 0xa43, Address 0x1D)

Note 1: Bit 26.11 valid only when in Giga mode.
Note 2: Bit 26.8 assert at 10M speed when local device is EEE capable.

RO, RC 00000  Reserved.
0
RO, RC
0
RO, RC

Name
29.15:11  RSVD
Jabber
ALDPS State Change

Table 39. INSR (Interrupt Status Register, Page 0xa43, Address 0x1D)
Type  Default Description

Realtek
CONFIDENTIAL

Reserved.
1: Can access PHY Register through MDC/MDIO
0: Cannot access PHY Register through MDC/MDIO
1: Link status changed
1: Auto-Negotiation completed
0: Auto-Negotiation not completed
1: Page (a new LCW) received
0: Page not received
Reserved.
1: Auto-Negotiation Error  0: No Auto-Negotiation Error

1: Jabber detected
1: ALDPS state changed
changed
Reserved.
1: WOL event occurred

RSVD
PME (Power Management
Event of WOL)

Link Status Change
RO, RC
Auto-Negotiation Completed  RO, RC

RSVD
PHY Register Accessible

RSVD
Auto-Negotiation Error

0: No jabber detected
0: ALDPS state not

0: Link status not changed

0: WOL event did not occur

RO, RC
RO, RC

RO, RC
RO, RC

RO, RC
RO, RC

Page Received

29.6
29.5

29.1
29.0

29.4
29.3

RO, RC

29.2

0
0

0
0

0
0

0
0

0

Integrated 10/100/1000M Ethernet Precision Transceiver

43

Track ID: JATR-8275-15   Rev. 1.2

8.3.20.  PAGSR (Page Select Register, Page 0xa43, Address 0x1F)

Table 40. PAGSR (Page Select Register, Page 0xa43, Address 0x1F)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Bit

Name
31.15:12  RSVD
31.11:0

PageSel

Type  Default  Description
RO
RW

0
0xa42

Reserved.
Page Select (in HEX).
0xa42: Page 0xa42 (default page)

0

Bit

RO

0
0

20.1

20.0

Name
20.15:2  RSVD

PHY Special Config
Done
RSVD

Table 42. LCR (LED Control Register, Page 0xd04, Address 0x10)

8.3.22.  LCR (LED Control Register, Page 0xd04, Address 0x10)

8.3.21.  PHYSCR (PHY Special Cofig Register, Page 0xa46, Address 0x14)
Table 41. PHYSCR (PHY Specific Cofig Register, Page 0xa46, Address 0x14)

Type  Default  Description
RO
RW

Reserved.
1: Write 1 to indicate the special PHY parameter configuration
has been done.
Reserved.

Realtek
CONFIDENTIAL

Reserved.
LED2 Active (Transmitting or Receiving) Indication
LED2 Link Indication: 1000Mbps
Reserved.
LED2 Link Indication: 100Mbps
LED2 Link Indication: 10Mbps
LED1 Active (Transmitting or Receiving) Indication
LED1 Link Indication: 1000Mbps
Reserved.
LED1 Link Indication: 100Mbps
LED1 Link Indication: 10Mbps
LED0 Active (Transmitting or Receiving) Indication
LED0 Link Indication: 1000Mbps
Reserved.
LED0 Link Indication: 100Mbps
LED0 Link Indication: 10Mbps

Type  Default  Description
RO
RW
RW
RO
RW
RW
RW
RW
RO
RW
RW
RW
RW
RO
RW
RW

Name
RSVD
LED2_ACT
LED2_LINK_1000
RSVD
LED2_LINK_100
LED2_LINK_10
LED2_ACT
LED1_LINK_1000
RSVD
LED1_LINK_100
LED1_LINK_10
LED0_ACT
LED0_LINK_1000
RSVD
LED0_LINK_100
LED0_LINK_10

Bit
16.15
16.14
16.13
16.12
16.11
16.10
16.9
16.8
16.7
16.6
16.5
16.4
16.3
16.2
16.1
16.0

0
1
1
0
0
0
1
0
0
1
0
1
0
0
0
1

Integrated 10/100/1000M Ethernet Precision Transceiver

44

Track ID: JATR-8275-15   Rev. 1.2

8.3.23.  EEELCR (EEE LED Control Register, Page 0xd04, Address 0x11)
Table 43. EEELCR (EEE LED Control Register, Page 0xd04, Address 0x11)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Bit

Name
17.15:4  RSVD

17.3
17.2
17.1
17.0

LED2 EEE Enable
LED1 EEE Enable
LED0 EEE Enable
RSVD

Type  Default Description
RO
RW
RW
RW
RO

Reserved.
1: Enable EEE LED indication of LED2.
1: Enable EEE LED indication of LED1.
1: Enable EEE LED indication of LED0.
Reserved.

0
1
1
1
0

0

Bit

RO

0
0

22.5

22.4:0

RSVD

INTB/PMEB Selection

Name
22.15:6  RSVD

Type  Default Description
RO
RW

8.3.24.  INTBCR (INTB Pin Control Register, Page 0xd40, Address 0x16)
Table 44. INTBCR (INTB Pin Control Register, Page 0xd40, Address 0x16)

Reserved.
Pin 31 of the RTL8211F(D)(I) functions as:
1: PMEB
0: INTB
Reserved.

Realtek
CONFIDENTIAL

8.3.25.  PC1R (PCS Control 1 Register, MMD Device 3, Address 0x00)

Reserved.
1: PHY stops RXC in LPI
0: RXC not stoppable
Reserved.

Type  Default  Description
RW
RW

Table 45. PC1R (PCS Control 1 Register, MMD Device 3, Address 0x00)

Name
3.0.15:11  RSVD

3.0.10  Clock Stop Enable

3.0.9:0  RSVD

0
0

RW

Bit

0

Integrated 10/100/1000M Ethernet Precision Transceiver

45

Track ID: JATR-8275-15   Rev. 1.2

8.3.26.  PS1R (PCS Status1 Register, MMD Device 3, Address 0x01)

Table 46. PS1R (PCS Status 1 Register, MMD Device 3, Address 0x01)

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Default  Description

Bit

Name
3.1.15:12  RSVD

3.1.11

TX LPI Received

Type
RO
RO, LH

3.1.10  RX LPI Received

RO, LH

0
0

0

0

Reserved.
1: TX PCS has received LPI
0: LPI not received
1: RX PCS has received LPI
0: LPI not received
1: TX PCS is currently receiving LPI
0: TX PCS is not currently receiving LPI
1: RX PCS is currently receiving LPI
0: RX PCS is not currently receiving LPI
Reserved.
1: MAC stops TXC in LPI
0: TXC not stoppable
Reserved.

3.19

TX LPI Indication

RO

0

0

RO

RO

0
1

3.1.8

RO
RO

3.1.7
3.1.6

3.1.5:0  RSVD

RX LPI Indication

RSVD
Clock Stop Capable

8.3.27.  EEECR (EEE Capability Register, MMD Device 3, Address 0x14)
Table 47. EEECR (EEE Capability Register, MMD Device 3, Address 0x14)

Realtek
CONFIDENTIAL

Reserved.
1: EEE is supported for 1000Base-T EEE
0: EEE is not supported for 1000Base-T EEE
1: EEE is supported for 100Base-TX EEE
0: EEE is not supported for 100Base-TX EEE
Reserved.

8.3.28.  EEEWER (EEE Wake Error Register, MMD Device 3,

Table 48. EEEWER (EEE Wake Error Register, MMD Device 3, Address 0x16)

Name
3.20.15:3  RSVD

Address 0x16)

Default  Description

Type
RO
RO

100Base-TX EEE

1000Base-T EEE

3.20.0  RSVD

3.20.2

3.20.1

0
1

RO

RO

Bit

0

1

Bit

Name
3.22.15:0  EEE Wake Error

Type  Default Description
RC

0

Counter

Used by PHY types that support EEE to count wake time faults
where the PHY fails to complete its normal wake sequence within
the time required for the specific PHY type.

Integrated 10/100/1000M Ethernet Precision Transceiver

46

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

8.3.29.  EEEAR (EEE Advertisement Register, MMD Device 7,

Address 0x3c)

Table 49. EEEAR (EEE Advertisement Register, MMD Device 7, Address 0x3c)

Bit

Name
7.60.15:3  RSVD

7.60.2

1000Base-T EEE

Type  Default Description
RW
RW

0
1

7.60.1

100Base-TX EEE

RW

1

Reserved.
Advertise 1000Base-T EEE Capability.
1: Advertise
Advertise 100Base-TX EEE Capability.
1: Advertise
Reserved.

0: Do not advertise

0: Do not advertise

0

Bit

RW

0
0

7.60.0  RSVD

7.61.2  LP 1000Base-T EEE

7.61.1  LP 100Base-TX EEE

8.3.30.  EEELPAR (EEE Link Partner Ability Register, MMD Device 7,

Type  Default Description
RO
RO

Address 0x3d)
Table 50. EEELPAR (EEE Link Partner Ability Register, MMD Device 7, Address 0x3d)
Name
7.61.15:3  RSVD

Realtek
CONFIDENTIAL

Reserved.
1: Link Partner is capable of 1000Base-T EEE
0: Link Partner is not capable of 1000Base-T EEE
1: Link Partner is capable of 100Base-TX EEE
0: Link Partner is not capable of 100Base-TX EEE
Reserved.

7.61.0  RSVD

RO

RO

0

0

Integrated 10/100/1000M Ethernet Precision Transceiver

47

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

9.  Regulators and Power Sequence

9.1.  Switching Regulator (RTL8211F(I) only)

The  RTL8211F(I)  incorporates  a  state-of-the-art  switching  regulator  that  requires  a  well-designed  PCB
layout in order to achieve good power efficiency and lower the output voltage ripple and input overshoot.
The switching regulator 1.0V output pin (REG_OUT) should be connected only to DVDD10 and AVDD10
(do not provide this power source to other devices).

Note: Refer to the RTL8211F Series Layout Guide for detailed description.

Use an X5R/X7R low-ESR ceramic capacitor as the output capacitor for switching regulator stability.

9.2.  Low-Dropout Regulator (RTL8211FD(I) Only)

The RTL8211FD(I) incorporates a linear Low-Dropout Regulator (LDO) that features high power supply
ripple rejection and low output noise. The built-in LDO means a power inductor is not required for the
RTL8211FD(I); only an output capacitor is required between the 1.0V output and the analog ground for
phase compensation, which saves cost and PCB real estate.

Realtek
CONFIDENTIAL

Use an X5R/X7R low-ESR ceramic capacitor, with capacitance of at least 0.1uF, to enhance the stability of
output voltage. The bypass capacitors should be placed as close as possible to power pins (AVDD10 and
DVDD10) for adequate filtering.

The regulator 1.0V output pin (LDO_OUT) should be connected only to DVDD10 and AVDD10 pins (do
not provide this power source to other devices).

Integrated 10/100/1000M Ethernet Precision Transceiver

48

Track ID: JATR-8275-15   Rev. 1.2

9.3.  Power Sequence

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Figure 10. Power Sequence (I/O Pad Power Sourced from Internal LDO)

Realtek

Figure 11. Power Sequence (I/O Pad Power Sourced Externally)

Table 51. Power Sequence Parameters

Symbol
Rt1

Rt2
Rt3
Rt4

Description
3.3V Rise Time
External I/O Pad Power Rise Time
3.3V Off Time
Core Logic Ready Time
LDO Ready Time

Min
0.5*

100
45
1.5

Typical
-

Max
100

Units
ms

-
-
-

-
-
-

ms
ms
ms

Integrated 10/100/1000M Ethernet Precision Transceiver

49

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Symbol
Rt5**
Rt6

Description
Reserved for Specific Parameter Configuration
External I/O Pad Power Ready Time after 3.3V
Ready

Min
-
0

Typical
-
-

Max
100
5

Units
ms
ms

 T≧ 3 in Figure 11.

Note 1: The RTL8211F(I)/RTL8211FD(I) does not support fast 3.3V rising. The 3.3V rise time should be controlled over
0.5ms.
* A 3.3V rise time between 0.1ms to 0.5ms is conditionally permitted only if the system 3.3V power budget is sufficient to
ensure that 3.3V Overcurrent Protection (OCP) will NOT be triggered during the power-on procedure. If the rise time is less
than 0.1ms, it will induce a peak voltage in DVDD33 which may cause permanent damage to the regulator.
Note 2: If there is any action that involves consecutive ON/OFF toggling of the switching-regulator source (3.3V), the
design must make sure the OFF state of both the switching-regulator source (3.3V) and output (1.0V) reach 0V, and the time
period between the consecutive ON/OFF toggling action must be longer than 100ms.
Note 3: When using an external oscillator or clock source, on stopping the clock source the RTL8211F(I)/RTL8211FD(I)
must also be powered off.
Note 4: The RTL8211F(I)/ RTL8211FD(I) use the integrated LDO to generate the 2.5V, 1.8V/1.5V voltages for the I/O pad,
the I/O pad voltage can be selected by using the CONFIG pins CFG_LDO[1:0]. Moreover, external power source for the
I/O pad is also supported, please refer to the setting of CFG_EXT and CFG_LDO[1:0] pins (section 7.8 Hardware
Configuration, page 15).
Note 5: When using an external power source for the I/O pad, the power should rise simultaneously or slightly later than
3.3V power, i.e. T4
Furthermore, there are two kinds of timing specifications to supply the external power, respectively:
(a)  Ready time of the external power should be within 5ms after 3.3V is ready. See CASE(I) in  Figure 11, page 49.
(b)  PHYRSTB should be kept low until the external power is ready. See CASE(II) in  Figure 11, page 49. Note that for this

Realtek
CONFIDENTIAL

Violation of these timing constraints may lead to errors.
Note 6: Rt5 is a reserved window for some PHY special parameter configurations with 100ms duration. The parameters, if
needed, can be provided by Realtek. At the point of T2, i.e. the end of this configuration window, all the PHY registers can be
accessed through MDIO
** Currently there is no special configuration needed for the RTL8211F(D)(I); the Rt5 can be skipped by setting
Page 0xa46, Reg. 20, bit[1]=1 (PHY Special Config Done) at the point of T2’. The ‘PHY Register Accessible Interrupt’ will
then trigger accordingly, which indicates the PHY registers can be accessed by MDIO.

case, there is no constraint on the ‘max’ value of Rt6.

Integrated 10/100/1000M Ethernet Precision Transceiver

50

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

10.  Characteristics

10.1. Absolute Maximum Ratings

WARNING: Absolute maximum ratings are limits beyond which permanent damage may be caused to the
device, or device reliability will be affected. All voltages are specified reference to GND unless otherwise
specified.

Table 52. Absolute Maximum Ratings

V

3.6

-0.3

-0.3

Unit
V
V
V
V
V

Minimum
-0.3
-0.3
-0.2
-0.2
-0.2

Maximum
3.6
1.2
2.8
2.3
2.0

Description
Symbol
Supply Voltage 3.3V
VDD33, AVDD33
Supply Voltage 1.0V
AVDD10, DVDD10
Supply Voltage 2.5V
2.5V RGMII/GMII
Supply Voltage 1.8V
1.8V RGMII
Supply Voltage 1.5V
1.5V RGMII
Input Voltage
3.3V DCinput
Output Voltage
3.3V DCoutput
Input Voltage
1.0V DCinput
Output Voltage
1.0V DCoutput
NA
Storage Temperature
Note: Refer to the most updated schematic circuit for correct configuration.

Realtek
CONFIDENTIAL

Pins
DVDD33, AVDD33
AVDD10, DVDD10
2.5V RGMII/GMII
1.8V RGMII
1.5V RGMII
-

Minimum
2.97
0.95
2.25
1.62
1.5
0

Table 53. Recommended Operating Conditions

Description
Supply Voltage VDD

10.2. Recommended Operating Conditions

3.63
1.05
2.75
1.98
1.62
70

3.3
1.0
2.5
1.8
1.56
-

Typical  Maximum Unit

V
V
V
V
V
°C

+125

-40

-55

1.2

°C

85

V

-

-

°C

Ambient Operating Temperature TA
(RTL8211F/RTL8211FD)
Ambient Operating Temperature TA
(RTL8211FI/RTL8211FDI)
Maximum Junction Temperature

-

-

-

125

°C

Integrated 10/100/1000M Ethernet Precision Transceiver

51

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

10.3. Crystal Requirements

Table 54. Crystal Requirements

Symbol
Fref

Fref Tolerance

Description/Condition
Parallel Resonant Crystal Reference Frequency,
Fundamental Mode, AT-Cut Type.
Parallel Resonant Crystal Frequency Tolerance,
Fundamental Mode, AT-Cut Type. Ta=0°C~70°C.

Minimum
-

Typical  Maximum Unit
MHz

25

-

-50

-

+50

ppm

-
-
-
-
-
-

40
-
-
-
1.4
-

60
50
0.5
200
-
0.4

%
Ω
mW
ps
V
V

10.4. Oscillator/External Clock Requirements

Equivalent Series Resistance.
Drive Level.
Broadband Peak-to-Peak Jitter1, 2
Crystal Output High Level
Crystal Output Low Level

Fref Duty Cycle  Reference Clock Input Duty Cycle.
ESR
DL
Jitter
Vih_CKXTAL
Vil_CKXTAL
Note 1: 25kHz  to 25MHz RMS < 3ps.
Note 2: Broadband RMS < 9ps.
Note3: Fref Tolerance +/- 50ppm including effects of aging of the first year, external crystal capacitors, and PCB layout.

Realtek
CONFIDENTIAL

Table 55. Oscillator/External Clock Requirements
Parameter
Condition
Frequency
-
Ta=0°C~70°C
Frequency Tolerance (RTL8211F/RTL8211FD)
Frequency Tolerance (RTL8211FI/RTL8211FDI)  Ta=-40°C~85°C
Duty Cycle
Broadband Peak-to-Peak Jitter 1, 2
Vih
Vil
Rise Time (10%~90%)
Fall Time (10%~90%)
Operating Temperature Range
Note 1: 25kHz to 25MHz RMS < 3ps.
Note 2: Broadband RMS < 9ps.
Note3: Frequency Tolerance +/- 50ppm including effects of aging of the first year, external crystal capacitors, and PCB
layout.

Typical  Maximum
25/50
-
-
-
-
-
-
-
-
-

Minimum
-
-50
-50
40
-
1.4
-
-
-
-40

Unit
MHz
ppm
ppm
%
ps
V
V
ns
ns
°C

-
50
50
60
200
-
0.4
10
10
85

-
-
-
-
-
-
-

Integrated 10/100/1000M Ethernet Precision Transceiver

52

Track ID: JATR-8275-15   Rev. 1.2

Symbol
VDD33, AVDD33
1. MDIO (Table 4,
page 8)
2. RGMII I/O
(Table 3, page 8)
1. MDIO (Table 4,
page 8)
2. RGMII I/O
(Table 3, page 8)
1. MDIO (Table 4,
page 8)
2. RGMII I/O
(Table 3, page 8)
DVDD10,
AVDD10
Voh (3.3V)
Voh (2.5V)
Voh (1.8V)
Voh (1.5V)
Vol (3.3V)
Vol (2.5V)
Vol (1.8V)
Vol (1.5V)
Vih (3.3V)
Vil (3.3V)
Vih (2.5V)
Vil (2.5V)
Vih (1.8V)
Vil (1.8V)
Vih (1.5V)
Vil (1.5V)

10.5. DC Characteristics

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Table 56. DC Characteristics

Parameter
3.3V Supply Voltage

2.5V RGMII Supply Voltage

1.8V RGMII Supply Voltage

1.5V RGMII Supply Voltage

Conditions  Minimum  Typical  Maximum  Units

-

-

-

-

2.97

3.3

3.63

2.25

2.5

2.75

V

V

1.62V

1.8V

1.98V

V

1.5V

1.56V

1.62V

V

-

V

1.0

1.05

0.95

1.0V Supply Voltage

CONFIDENTIAL

Minimum High Level Output Voltage
Minimum High Level Output Voltage
Minimum High Level Output Voltage
Minimum High Level Output Voltage
Maximum Low Level Output Voltage
Maximum Low Level Output Voltage
Maximum Low Level Output Voltage
Maximum Low Level Output Voltage
Minimum High Level Input Voltage
Maximum Low Level Input Voltage
Minimum High Level Input Voltage
Maximum Low Level Input Voltage
Minimum High Level Input Voltage
Maximum Low Level Input Voltage
Minimum High Level Input Voltage
Maximum Low Level Input Voltage

VDD33 + 0.3
VDD25 + 0.3
VDD18 + 0.3
VDD15 + 0.3
0.4
0.4
0.1*VDD18
0.1*VDD15
-
0.8
-
0.7
-
0.5
-
0.3

2.4
2.0
0.9*VDD18
0.9*VDD15
-0.3
-0.3
-0.3
-0.3
2.0
-
1.7
-
1.2
-
1.0
-

-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
Vin=VDD33
or GND

V
V
V
V
V
V
V
V
V
V
V
V
V
V
V
V

-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-

Input Current

µA

0.5

0

-

Iin

Note: Pins not mentioned above remain at 3.3V.

Integrated 10/100/1000M Ethernet Precision Transceiver

53

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

10.6. AC Characteristics

10.6.1.  MDC/MDIO Timing

MDC/MDIO Timing – Management Port

Figure 12. MDC/MDIO Setup, Hold Time, and Valid from MDC Rising Edge Time Definitions

Realtek
CONFIDENTIAL

Figure 13. MDC/MDIO Management Timing Parameters

Table 57. MDC/MDIO Management Timing Parameters

Symbol  Description

t1
t2
t3
t4
t5
t6

MDC High Pulse Width
MDC Low Pulse Width
MDC Period
MDIO Setup to MDC Rising Edge
MDIO Hold Time from MDC Rising Edge
MDIO Valid from MDC Rising Edge

Minimum
32
32
80
10
10
0

Maximum
-
-
-
-
-
300

Unit
ns
ns
ns
ns
ns
ns

Integrated 10/100/1000M Ethernet Precision Transceiver

54

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

10.6.2.  RGMII Timing Modes
Timing for this interface will be such that the clock and data are generated simultaneously by the source of
the signals and therefore skew between the clock and data is critical to proper operation.

Figure 14 shows the effect of adding an internal delay to TXC when in RGMII mode.

Realtek
CONFIDENTIAL

Figure 14. RGMII Timing Modes (For TXC)

Integrated 10/100/1000M Ethernet Precision Transceiver

55

Track ID: JATR-8275-15   Rev. 1.2

Figure 15 shows the effect of adding an internal delay to the RXC flow when in RGMII mode.

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Realtek
CONFIDENTIAL

Figure 15. RGMII Timing Modes (For RXC)

Integrated 10/100/1000M Ethernet Precision Transceiver

56

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Table 58. RGMII Timing Parameters

-

2

2

ns

1.0

1.2

TholdT

TholdR

TsetupR

TskewT **

Symbol
Tcyc *

Duty_G
Duty_T
tR
tF
TsetupT

Min
7.2
36
360
45
40
-
-
1.2

Max
8.8
44
440
55
60
0.75
0.75
-

Units
ns
ns
ns
%
%
ns
ns
ns

Typical
8
40
400
50
50
-
-
2

Description
Clock Cycle Duration (1000Mbps)
Clock Cycle Duration (100Mbps)
Clock Cycle Duration (10Mbps)
Duty Cycle for 1000
Duty Cycle for 10/100
TXC/RXC Rise Time (20%~80%)
TXC/RXC Fall Time (20%~80%)
Data to Clock Output Setup Time at transmitter
(with delay integrated at transmitter)
Clock to Data Output Hold Time at transmitter
(with delay integrated at transmitter)
Data to Clock Input Setup Time at receiver
(with delay integrated at transmitter)
Clock to Data Input Hold Time at receiver
(with delay integrated at transmitter)
Data to Clock Output Skew Time at transmitter
(without delay integrated)
Data to Clock Input Skew Time at receiver
(with PCB delay integrated)
This implies that PC board design will require
clocks to be routed such that an additional trace
delay of greater than 1.5ns and less than 2.0ns
will be added to the associated clock signal.

Realtek
CONFIDENTIAL

*Note: Duty cycle may be stretched/shrunk during speed changes or while transitioning to a received packet's clock domain
as  long  as  minimum  duty  cycle  is  not  violated  and  stretching  occurs  for  no  more  than  three  Tcyc  of  the  lowest  speed
transitioned between.
**Note: For 10/100Mbps, the max value of Skew Time is unspecified.

TskewR **

-0.5

1.8

0.5

2.6

1.0

ns

ns

ns

ns

0

1

2

-

-

Integrated 10/100/1000M Ethernet Precision Transceiver

57

Track ID: JATR-8275-15   Rev. 1.2

11.  Mechanical Dimensions

 RTL8211F(I)/RTL8211FD(I)
Datasheet

Realtek
CONFIDENTIAL

Symbol

11.1. Mechanical Dimensions Notes

Min
0.80
0.00

0.15

3.45

Dimension in mm
Nom
0.85
0.02
0.20REF
0.20
5.00 BSC
3.70
0.40 BSC
0.40

Max
0.90
0.05

0.25

3.95

A
A1
A3
b
D/E
D2/E2
e
L

0.30

0.50
Note 1: CONTROLLING DIMENSION: MILLIMETER (mm).
Note 2: REFERENCE DOCUMENT: JEDEC MO-220.

Min
0.031
0.000

0.006

0.136

0.012

Dimension in inch
Nom
0.033
0.001
0.008REF
0.008
0.197 BSC
0.146
0.016 BSC
0.016

Max
0.035
0.002

0.010

0.156

0.020

Integrated 10/100/1000M Ethernet Precision Transceiver

58

Track ID: JATR-8275-15   Rev. 1.2

 RTL8211F(I)/RTL8211FD(I)
Datasheet

12.  Ordering Information

Table 59. Ordering Information

Part Number
RTL8211F-CG
RTL8211FD-CG
RTL8211FI-CG

RTL8211FDI-CG

Package
40-Pin QFN with ‘Green’ Package (Switching Regulator model)
40-Pin QFN with ‘Green’ Package (LDO model)
40-Pin QFN with ‘Green’ Package (Switching Regulator model)
Industrial grade.
40-Pin QFN with ‘Green’ Package (LDO model). Industrial grade.

Status
MP
MP
-

-

Note: See page 6  for package identification.

Realtek
CONFIDENTIAL

Realtek Semiconductor Corp.
Headquarters
No. 2, Innovation Road II
Hsinchu Science Park, Hsinchu 300, Taiwan
Tel.: +886-3-578-0211   Fax: +886-3-577-6047
www.realtek.com

Integrated 10/100/1000M Ethernet Precision Transceiver

59

Track ID: JATR-8275-15   Rev. 1.2

