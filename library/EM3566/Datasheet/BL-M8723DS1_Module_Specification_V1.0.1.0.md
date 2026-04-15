BL-M8723DS1

802.11n 150Mbps SDIO

WiFi and BT Combo Module Specification

SHENZHEN BILIAN ELECTRONIC CO., LTD
Add: 10~11/F, Building 1A, Huaqiang idea park, Guangming district, Shenzhen. Guangdong, China

Web: www.b-link.net.cn

Module Name: BL-M8723DS1

Module Type: 802.11b/g/n 150Mbps 1T1R SDIO WiFi and BT combo Module

Revision: V1.0

Customer Approval:

Company:

Title:

Signature:

BL-link Approval:

Title:

Signature:

Date:

Date:

Revision History

Revision

Summary

1.0

Official release

Release Date

2020-07-03

1                                                                                                                                                                    http://www.b-link.net.cn

1. Introduction

BL-M8723DS1 is a highly integrated WiFi+BT combo module, it contains a WLAN and a BT MAC,

a 1T1R capable base band. It supports IEEE 802.11b/g/n standard and provides the highest PHY

rate up to 150Mbps, and Bluetooth can support BT2.1+EDR/BT3.0 and BT4.2. This module can

offering feature-rich wireless connectivity and reliable throughput from an extended distance.

1.1 Features

 Operating Frequencies: 2.4~2.4835GHz

 Host Interface is SDIO 2.0 and UART

 IEEE Standards: IEEE 802.11b/g/n

 BT2.1+EDR/BT3.0 and BT LE4.2

 Wireless data rate can reach up to 150Mbps

 Connect to external antenna through half hole pad

 Power Supply: 3.3±0.2V main power and VDIO power supply

1.2 Block Diagram

2                                                                                                                                                                    http://www.b-link.net.cn

1.3 General Specifications

Module Name

BL-M8723DS1 WiFi and BT combo Module

Chipset

RTL8723DS-CG

WiFi Standards

IEEE802.11b/g/n/, 1T1R, 2.4GHz, 150Mbps (Max)

BT Standards

BT 4.2/4.2LE/2.1EDR/2.1BR

Host Interface

SDIO 2.0 for WIFI; UART for BT

Antenna

Connect to the external antennas through half hole pad

Dimension

SMD 44Pins, 12*12*1.6mm (L*W*H)

Power Supply

DC 3.3±0.2V(main power and VDIO power) @ 350 mA (Max)

Operation Temperature

-10℃ to +70℃

Storage temperature

-45℃  to +85℃

Operation Humidity

10% to 95% RH (Non-Condensing)

2. Pin Assignments

          Top view

2.1 Pin Definition

No

Pin Name

Type  Description

Supply

1

2

3

GND

WLAN/BT ANT

GND

RF

RF

RF

Ground connections

WLAN and BT RF port

Ground connections

3                                                                                                                                                                    http://www.b-link.net.cn

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

NC

NC

HOST wake-up Bluetooth device

Bluetooth device to wake-up HOST

VDIO

VDIO

NC

NC

BT_WAKE

BT_WAKE_HOST

NC

VDD33

NC

NC

WL_DSI#

/

/

I

O

/

P

/

/

I

NC

3.3V Main power supply

NC

NC

WLAN radio off (active low)

VDD33

VDIO

WL_WAKE_HOST    O

WLAN to wake-up HOST

SD_D2

SD_D3

I/O

SDIO data line

I/O

SDIO data line

SD_CMD

I/O

SDIO command line

SD_CLK

I

SDIO clock line

SD_D0

SD_D1

GND

NC

VDIO

NC

SUSCLK_IN

I/O

SDIO data line

I/O

SDIO data line

P

/

P

/

I

Ground connections

NC

  3.3V SDIO power supply

NC

Shared with GPIO6.

External 32K or RTC clock input with 1.8V ~ 3.3V swing.

This clock source is configured by BT and WL FW,

respectively.

PCM_DOUT

O

PCM Data output

PCM_CLK

I/O

PCM Clock

PCM_DIN

PCM_SYNC

NC

NC

GND

NC

GND

BT_DIS#

NC

GND

I

O

/

/

P

/

P

I

/

P

PCM data input

PCM sync signal

NC

NC

Ground connections

NC

Ground connections

Shut down BT function (active low)

VDD33

NC

Ground connections

4                                                                                                                                                                    http://www.b-link.net.cn

37

38

39

40

41

42

43

44

NC

NC

NC

NC

GND

UART_OUT

UART_IN

UART_CTS

/

/

/

/

P

O

I

I

NC

NC

NC

NC

Ground connections

HOST Data output

HOST Data input

HOST_CTS

P: Power, I: Input, O: Output, I/O: In/Output, RF: Analog RF Port

3. Electrical and Thermal Specifications

3.1 Recommended Operating Conditions

Parameters

Min

Typ

Max

Units

Ambient Operating Temperature

External Antenna VSWR

Supply Voltage

VDD33/VDIO

-10

1

3.1

25

1.7

3.3

70

2

3.5

℃

/

V

3.2 Current Consumption

Conditions : VDD33=3.3V ; Ta:25℃

Use Case

WiFi Radio Off (Linux Driver)

WiFi Unassociated (Linux Driver)

2.4G 1Mbps TX (RF-Test)

2.4G 1Mbps RX (RF-Test)

2.4G 11Mbps TX (RF-Test)

2.4G 11Mbps RX (RF-Test)

2.4G 6Mbps TX (RF-Test)

VDD33 Current (average)

Typ

Max

Units

42

40

285

60

280

59

250

50

60

310

70

310

70

280

mA

mA

mA

mA

mA

mA

mA

5                                                                                                                                                                    http://www.b-link.net.cn

2.4G 6Mbps RX (RF-Test)

2.4G 54Mbps TX (RF-Test)

2.4G 54Mbps RX (RF-Test)

2.4G MCS0(HT20) TX (RF-Test)

2.4G MCS0(HT20) RX (RF-Test)

2.4G MCS7(HT20) TX (RF-Test)

2.4G MCS7(HT20) RX (RF-Test)

2.4G MCS7(HT40) TX (RF-Test)

2.4G MCS7(HT40) RX (RF-Test)

BT BR_1M DH5 TX(RF-Test)

BT EDR_3M DH5 TX(RF-Test)

BT LE_1M TX(RF-Test)

BT BR_1M DH5 RX Active(RF-Test)

BT EDR_3M DH5 RX Active(RF-Test)

BT LE_1M RX Active(RF-Test)

63

260

60

255

65

220

63

220

63

125

119

122

103

102

110

77

270

65

272

70

285

70

270

80

152

147

161

127

130

133

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

mA

4. Interface Functional and Timing Specifications

4.1 SDIO Power On Sequence

6                                                                                                                                                                    http://www.b-link.net.cn

4.2 SDIO Timing

5. WiFi RF Specifications

5.1 2.4G WiFi RF Specification

Conditions : VDD33=3.3V ; Ta:25℃

Features

Description

WLAN Standard

IEEE 802.11b/g/n CSMA/CA

Frequency Range

2.4~2.4835GHz (2.4GHz ISM Band)

Channels

Ch1~Ch13 (For 20MHz Channels)

Modulation

802.11g (OFDM): BPSK, QPSK, 16QAM, 64QAM;

802.11n (OFDM): BPSK, QPSK, 16QAM, 64QAM;

802.11b (DSSS): DBPSK, DQPSK, CCK;

7                                                                                                                                                                    http://www.b-link.net.cn

Date Rate

802.11b: 1, 2, 5.5, 11Mbps;

802.11g: 6, 9, 12, 18, 24, 36, 48, 54Mbps;

802.11n (HT20): MCS0~MCS7(1T1R_SISO) 6.5~72.2Mbps;

802.11n (HT40): MCS0~MCS7(1T1R_SISO) 13.5~150Mbps;

Frequency Tolerance

≦ ±15ppm

2.4G Transmitter Specifications

TX Rate

TX Power

TX Power Tolerance

EVM

802.11b@1~11Mbps

802.11g@6Mbps

802.11g@54Mbps

802.11n@HT20_MCS0

802.11n@HT20_MCS7

802.11n@HT40_MCS0

802.11n@HT40_MCS7

17dBm

17dBm

14dBm

16dBm

14dBm

16dBm

13dBm

±2.0dBm

±1.5dBm

±1.5dBm

±1.5dBm

±1.5dBm

±1.5dBm

±1.5dBm

2.4G Receiver Specifications

RX Rate

Min Input Level(Typ)

Max Input Level(Typ)

802.11b@1Mbps

802.11b@11Mbps

802.11g@6Mbps

802.11g@54Mbps

802.11n@HT20_MCS0

802.11n@HT20_MCS7

802.11n@HT40_MCS0

802.11n@HT40_MCS7

-93dBm

-86dBm

-90dBm

-72dBm

-88dBm

-67dBm

-86dBm

-66dBm

5.2 Bluetooth RF Specifications

Conditions : VDD33=3.3V ; Ta:25℃

Features

Description

-10dBm

-10dBm

-15dBm

-15dBm

-15dBm

-15dBm

-15dBm

-15dBm

≦-10dB

≦-10dB

≦-25dB

≦-10dB

≦-28dB

≦-10dB

≦-28dB

PER

< 8%

< 8%

< 10%

< 10%

< 10%

< 10%

< 10%

< 10%

Bluetooth Specification

Bluetooth v2.1+EDR/3.0+HS (Bluetooth Classic _ BT BR/EDR),

Bluetooth 4.2 (Bluetooth Low Energy _ BT_LE) FHSS

Frequency Range

2.4~2.4835GHz (2.4GHz ISM Band)

Channels

Bluetooth Classic: Ch0~Ch78 (For 1MHz Channels);

Bluetooth Low Energy: Ch0~Ch39 (For 2MHz Channels);

8                                                                                                                                                                    http://www.b-link.net.cn

Power Classes

Bluetooth Classic: Class1;

Bluetooth Low Energy: Class1.5;

Date Rate & Modulation

Bluetooth Transmitter Specifications

BR_1Mbps: GFSK;

EDR_2Mbps: π/4-DQPSK;

EDR_3Mbps: 8DPSK;

LE_1Mbps: GFSK;

Min

Typ

Max

Items

TX Power

BR_1M TX Power

EDR_2/3M TX Power

LE_125K~1M TX Power

1DH1 TX Power

2DH3 TX Power

3DH5 TX Power

1

1

1

1

1

1

BR_1M Modulation Characteristics

Δf1avg

Δf2max [For at least 99.9% of all

Δf2max]

145kHz

143kHz

Δf1avg / Δf2max

1.01

EDR Modulation Accuracy

RMS DEVM (EDR_2M)

99% DEVM (EDR_2M)

Peak DEVM (EDR_2M)

RMS DEVM (EDR_3M)

99% DEVM (EDR_3M)

Peak DEVM (EDR_3M)

--

--

--

--

--

--

LE_Modulation characteristics

Δf1avg (LE_1M)

207kHz

Δf2max[For at least 99.9% of all

195kHz

6

6

6

6

6

6

163kHz

146kHz

0.12

10%

13%

17%

9%

11%

14%

210kHz

194kHz

8

8

8

8

8

8

--

--

--

20%

30%

35%

13%

20%

25%

--

--

9                                                                                                                                                                    http://www.b-link.net.cn

Δf2max] (LE_1M)

Δf1avg / Δf2max(LE_1M)

1.06

1.08

--

Bluetooth Receiver Specifications

Items

BR_1M

EDR_2M

EDR_3M

LE_1M

1DH1

2DH3

3DH5

Sensitivity

Maximum Input Level

Input Level(Typ)

BER

Input Level(Typ)  BER

-92dBm

-90dBm

-86dBm

-92dBm

-92dBm

-90dBm

-86dBm

≦0.1%

-20dBm

≦0.01%

-20dBm

≦0.01%

-20dBm

≦30.8%

-20dBm

≦30.8%

-20dBm

≦30.8%

-20dBm

≦30.8%

-20dBm

≦0.1%

≦0.1%

≦0.1%

≦0.1%

≦0.1%

≦0.1%

≦0.1%

6. Mechanical Specifications

6.1 Module Outline Drawing

Module dimension: 12.0*12.0*1.6mm (L*W*H; Tolerance:  ±0.15mm)

10                                                                                                                                                                    http://www.b-link.net.cn

Module Bow and Twist：≤0.1mm

6.2 Mechanical Dimensions

11                                                                                                                                                                    http://www.b-link.net.cn

7. Application Information

7.1 Typical Application Circuit

12                                                                                                                                                                    http://www.b-link.net.cn

7.2 Recommend PCB Layout Footprint

Design size mm

Top View

13                                                                                                                                                                    http://www.b-link.net.cn

7.3 Reflow Soldering Standard Conditions

Please use the reflow within 2 times.
Set up the highest temperature within 250℃.

8. Key Components Of Module

No.  Parts

Specification

Manufacturer

Note

1

Chipset

RTL8723DS-CG

Realtek

2

PCB

BL-M8723DS1

3

Crystal

24MHz-12pF-10ppm-2520

Shen Zhen Tie Fa Technology limited

Guangdong KINGSHINE ELECTRONICS

CO., LTD

Quzhou Sunlord Electronics Co., Ltd

HUBEI TKD ELECTRONICS

TECHNOLOGY CO., LTD.

LUCKI CM ELECTRONICS CO., LTD

HOSONIC ELECTRONIC CO., LTD.

SHENZHEN KAIYUEXIANG

ELECTRONICS CO., LTD

14                                                                                                                                                                    http://www.b-link.net.cn

9. Package and Storage Information

9.1 Package Dimensions

Package specification:

1. 2,000 modules per roll and 10,000 modules per box.

2. Outer box size: 37.5*36*29cm.

3. The diameter of the blue environment-friendly rubber plate is 13 inches,

with a total thickness of 25.3mm (with a width of 21.3mm carrying belt).

4. Put 1 package of dry agent (20g) and humidity card in each anti-static vacuum bag.

5. Each carton is packed with 5 boxes.

15                                                                                                                                                                    http://www.b-link.net.cn

9.2 Storage Conditions

Absolute Maximum Ratings:

Storage temperature: -45℃  to +85℃
Storage humidity: 10% to 95% RH（Non-Condensing）

Recommended Storage Conditions:

Storage temperature: 5℃  to +40℃
Storage humidity: 20% to 90% RH

Please use this Module within 12month after vacuum-packaged.
The Module shall be stored without opening the packing.
After the packing opened, the Module shall be used within 72hours.
When the color of the humidity indicator in the packing changed,
the Module shall be baked before soldering.
Baking condition: 60℃, 24hours, 1time.

ESD Sensitivity：
The Module is a static-sensitive electronic device.
Do not operate or store near strong electrostatic fields.
Take proper ESD precautions!

16                                                                                                                                                                    http://www.b-link.net.cn

