Aug. 2024
EM3566
Hardware User Manual
Rockchip RK3566 Quad-core platform

Customize the embedded system based on Your Idea
1. Introduction
1.1. About this Manual
This manual is intended to provide the user with an overview of the board and benefits, complete
features specifications, and set up procedures. It contains important safety information as well.
1.2. Feedback and Update to this Manual
To help our customers make the most of our products, we are continually making additional and
updated resources available on the Boardcon website (www.boardcon.com , www.armdesigner.com).
These include manuals, application notes, programming examples, and updated software and
hardware. Check in periodically to see what’s new!
When we are prioritizing work on these updated resources, feedback from customers is the number
one influence, If you have questions, comments, or concerns about your product or project, please
no hesitate to contact us at support@armdesigner.com.
1.3. Limited Warranty
Boardcon warrants this product to be free of defects in material and workmanship for a period of one
year from date of buy. During this warranty period Boardcon will repair or replace the defective unit
in accordance with the following process:
A copy of the original invoice must be included when returning the defective unit to Boardcon. This
limited warranty does not cover damages resulting from lighting or other power surges, misuse,
abuse, abnormal conditions of operation, or attempts to alter or modify the function of the product.
This warranty is limited to the repair or replacement of the defective unit. In no event shall Boardcon
be liable or responsible for any loss or damages, including but not limited to any lost profits, incidental
or consequential damages, loss of business, or anticipatory profits arising from the use or inability
to use this product.
Repairs make after the expiration of the warranty period are subject to a repair charge and the cost
of return shipping. Please contact Boardcon to arrange for any repair service and to obtain repair
charge information.
1

Customize the embedded system based on Your Idea
Content
1 EM3566 Introduction ...................................................................................................................... 3
1.1 Summary .............................................................................................................................. 3
1.2 RK3566 Specifications ......................................................................................................... 3
1.3 EM3566 Features ................................................................................................................. 4
1.4 PCB Dimension .................................................................................................................... 5
1.5 Block Diagram ...................................................................................................................... 6
1.6 CPU module Introduction ..................................................................................................... 6
2 Peripherals Introduction ............................................................................................................... 14
2.1 Power (P1) ......................................................................................................................... 14
2.2 Audio I/O ............................................................................................................................ 14
2.3 HDMI OUT (J4) .................................................................................................................. 15
2.4 USB OTG (J29) .................................................................................................................. 15
2.5 USB HOST (P3, J6, J17) .................................................................................................... 16
2.6 USB3.0 (J25) ...................................................................................................................... 17
2.7 Ethernet (JP1) .................................................................................................................... 17
2.8 eDP/LVDS/MIPI Panel (CON1) .......................................................................................... 18
2.9 BT656 (J26) ....................................................................................................................... 19
2.10 GPIO (CON4) ................................................................................................................... 20
2.11 ADC (J18) ......................................................................................................................... 20
2.12 MIPI Camera (J30, J31) ................................................................................................... 20
2.13 IR (J24) ............................................................................................................................ 22
2.14 UART (J10, J11, J12) ....................................................................................................... 22
2.15 RS485 (J32, JP2) ............................................................................................................. 23
2.16 Button (K3) ....................................................................................................................... 24
2.17 4G Module (CON2, P4) .................................................................................................... 24
2.18 Micro SD (J3) ................................................................................................................... 25
2.19 WiFi&Bluetooth (U20) ...................................................................................................... 26
2.20 SSD (CON3) .................................................................................................................... 27
2.21 RTC (BT1) ........................................................................................................................ 29
3 Product Configurations ................................................................................................................. 30
3.1 Standard Contents ............................................................................................................. 30
3.2 Optional Parts .................................................................................................................... 30
2

Customize the embedded system based on Your Idea
1 EM3566 Introduction
1.1 Summary
The EM3566 is a single-board computer powered by Rockchip RK3566 processor featuring four
ARM Cortex-A55 CPU cores and Mali-G52-2EE graphics and designed for AIoT applications such
as AI robot, smart POS machine, face recognition terminal, and business display integrated
equipment.
This SBC features 2GB memory (up to 8GB), comes with MIPI/LVDS, HDMI and eDP video out, and
offers Gigabit Ethernet port, as well as M.2 socket which enables expansion with a large hard drive
and plus a miniPCIe, a Nano SIM card socket for 4G cellular connectivity. Display and camera
capabilities with graphics and video hardware acceleration make it suitable for machine vision
applications. And built-in independent NPU, computing power of 0.8 TOPS for AI accelerator extend
the reach of AI solutions. EM3566 supports microphone array input, with high dynamic noise
reduction algorithm, it can accurately recognize human voices even in noisy environments, and
achieve precise voice control of the devices.
1.2 RK3566 Specifications
Feature Specifications
SOC Rockchip RK3566
CPU Quad-core 64-bit Cortex-A55, 22nm lithography process, frequency up to 1.8GHz
ARM G52 2EE
GPU Supports OpenGL ES 1.1/2.0/3.2. OpenCL 2.0. Vulkan 1.1
Embedded high-performance 2D acceleration hardware
1Tops@INT8, integrated high-performance AI accelerator RKNN NPU
NPU Supports one-click switching of
Caffe/TensorFlow/TFLite/ONNX/PyTorch/Keras/Darknet
Supports 4K 60fps H.265/H.264/VP9 video decoding
VPU Supports 1080P 100fps H.265/H.264 video encoding
Supports 8M ISP
Hardware Features
3

Customize the embedded system based on Your Idea
1.3 EM3566 Features
Specifications
CPU Rockchip RK3566 quad-core Cortex-A55 @ up to 1.8GHz
2GB/ 4GB/ 8GB.
Memory
32bit, supports all-data-link ECC
8GB/ 32GB/ 64GB/ 128GB eMMC
Storage M.2 PCIe 2.0 socket NVMe SSD (Expand with 2242 NVMe SSD)
MicroSD card slot (Expand with TF card)
4

Customize the embedded system based on Your Idea
Power Supply 12V/3A DC input jack
1x USB OTG 2.0
USB 4x USB Host 2.0 (USB-AF or 4-pin connector)
1x USB 3.0
Gigabit Ethernet RJ45 ports via Realtek RTL8211F-CG controller
Connectivity 2.4G WiFi(802.11b/g/n) with Bluetooth 4.0
mPCIe socket with Nano SIM card port to support 4G&GPS module
1x Serial port for debug, 3-pin connector
Serial 2x UART, 4-pin connectors
1x RS485, 2-pin header or 3-pin connector
HDMI 2.0, 4Kp60
Video MIPI DSI/LVDS, 1080p60
eDP 1.3, 2560x1600@60Hz
3.5mm audio I/O jack. ES8388 audio codec
Audio
8-channel audio via HDMI
Camera(optional) 2x Cameras via MIPI CSI (24pin FPC connector)
Keys & Switch 1x Recover Key
Other features RTC with battery connector; IR receiver; GPIO; ADC
Dimension 135 x 95 mm
1.4 PCB Dimension
135mm
95mm
5

Customize the embedded system based on Your Idea

1.5 Block Diagram
|     |     |     | 4 x  A R     | M           |     |          |
| --- | --- | --- | ------------ | ----------- | --- | -------- |
|     |     |     | C o rte x -A | 5 5 P o w e | r   |          |
|     |     |     |              |             |     | D C /D C |
|     |     |     | L P D D R 4  | iN A N D    |     |          |
C a m e ra 1
|              |              |            | u p  to  8 G B      | u p  to  1 2 8 G B |          |                      |
| ------------ | ------------ | ---------- | ------------------- | ------------------ | -------- | -------------------- |
|              |              |            |                     | D e b u g          |          | D e b u g            |
|              | C a m e ra   | 2          | M IP I C S I        |                    |          |                      |
|              |              |            |                     | U A R T 2          |          | U S B -to -U A R T   |
|              | m P C Ie     |            |                     | U A R T 4          |          |                      |
| S IM  c a rd |              |            | U S B 2 .0  H O S T |                    |          | 2 x  U A R T         |
|              | 4 G & G P    | S          |                     | U A R T 5          |          |                      |
|              |              | U S B  H U | B                   | U A R T 1 /        |          | W iF i& B T          |
|              | 4 x  U S B 2 | .0         | U S B 2 .0  H O S T |                    |          |                      |
|              |              |            |                     | S D M M C 2        |          | B L -R 8 7 2 3 R D 2 |
|              | U S B 2 .0   |            |                     |                    |          | M .2                 |
|              |              |            | U S B 2 .0  O T G   | P C Ie /S A T A 2  |          |                      |
|              | O T G        |            |                     |                    |          | N V M e              |
|              | U S B 3 .0   | /          | U S B 3 .0 /        |                    |          |                      |
|              |              |            |                     | S D M M C 1        |          | M ic ro  S D         |
|              | S A T A      |            | S A T A 1           |                    |          |                      |
|              |              | G b E      |                     | M IP I D S I/      |          |                      |
|              | R J 4 5      |            | R G M II            |                    | M IP I/L | V D S                |
L V D S
o p tio n
4 0 p in  h e a d e r
|     | R S 4 8 5 |     | U A R T 3 | e D P | e D P |     |
| --- | --------- | --- | --------- | ----- | ----- | --- |
B T 6 5 6
|     | H D M I O U | T   | H D M I | V O P |     | 1 4 p in  h e a d e r |
| --- | ----------- | --- | ------- | ----- | --- | --------------------- |
C o d e c
|     | A u d io  I/O   |       | I2 S         | R T C        |     | R T C  b a tte ry |
| --- | --------------- | ----- | ------------ | ------------ | --- | ----------------- |
|     | 1 4 p in  h e a | d e r | C IF /G P IO | S A R A D C  |     | A D C             |
|     | O P T           |       | S P D IF     | P W M 3 _ IR |     | IR  IN            |
|     |                 |       | C M          | 3 5 6 6      |     |                   |

| 1.6 CPU module Introduction  |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | --- | --- | --- |
CM3566 specifications
Pin number – 186 pins, 0.9mm pitch
Dimension – 47 x 40mm
Layer – 8 Layers, complying with EMS/EMI
Power supply – DC 3.3V
Application – smart Device, advertising devices, TV box, POS systems, vehicle control terminals,
AI robot, business display integrated equipment, etc.

|     |     |     | 6   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |

Customize the embedded system based on Your Idea

Pin Definition
Pin  Signal  Description or functions  GPIO serial  IO Voltage
| 1  VCC3V3_SYS      | 3.3V Main Power input        |             | 3.3V  |
| ------------------ | ---------------------------- | ----------- | ----- |
| 2  VCC3V3_SYS      | 3.3V Main Power input        |             | 3.3V  |
| 3  VCC3V3_SYS      | 3.3V Main Power input        |             | 3.3V  |
| 4  VCC_RTC         | RTC button Cell Power input  |             | 3.0V  |
| 5  PMIC_32KOUT     | 32.768khz OD output(PU 10K)  |             | 3.3V  |
| 6  GND             | Ground                       |             | 0V    |
| 7  HDMITX_CEC_M0   |                              | GPIO4_D1_u  | 3.3V  |
| 8  HDMITX_SDA      | Pull up 2.2K onboard         | GPIO4_D0_u  | 3.3V  |
| 9  HDMITX_SCL      | Pull up 2.2K onboard         | GPIO4_C7_u  | 3.3V  |
| GMAC1_RXER_M       | RMII receive error(V3        |             |       |
| 10                 |                              | GPIO3_B4_d  | 3.3V  |
| 0                  | changed)                     |             |       |
| GMAC1_MCLKINO      | RGMII reference clock        |             |       |
| 11                 |                              | GPIO3_C0_d  | 3.3V  |
| UT_M0              | input(125Mhz)                |             |       |
| 12  GND            | Ground                       |             | 0V    |
| 13  GMAC1_TXD0_M0  |                              | GPIO3_B5_d  | 3.3V  |
| 14  GMAC1_TXD1_M0  |                              | GPIO3_B6_d  | 3.3V  |
GMAC1_TXEN_M
| 15  |     | GPIO3_B7_d  | 3.3V  |
| --- | --- | ----------- | ----- |
0
GMAC1_RXDV_C
| 16  |     | GPIO3_B3_d  | 3.3V  |
| --- | --- | ----------- | ----- |
RS_M0
GMAC1_RXD1_M
| 17  |     | GPIO3_B2_d  | 3.3V  |
| --- | --- | ----------- | ----- |
0
GMAC1_RXD0_M
| 18  |     | GPIO3_B1_d  | 3.3V  |
| --- | --- | ----------- | ----- |
0
GMAC1_RXD3_M
| 19  |     | GPIO3_A5_d  | 3.3V  |
| --- | --- | ----------- | ----- |
0
  7

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
GMAC1_RXD2_M
| 20  |     | GPIO3_A4_d  | 3.3V  |
| --- | --- | ----------- | ----- |
0
GMAC1-
| 21  |     | GPIO3_A7_d  | 3.3V  |
| --- | --- | ----------- | ----- |
RXCLK_M0
| 22  GMAC1_TXD2_M0  |     | GPIO3_A2_d  | 3.3V  |
| ------------------ | --- | ----------- | ----- |
| 23  GMAC1_TXD3_M0  |     | GPIO3_A3_d  | 3.3V  |
GMAC1_TXCLK_
| 24  |     | GPIO3_A6_d  | 3.3V  |
| --- | --- | ----------- | ----- |
M0
MIPI_DSI_TX0_D3
| 25  | MIPI DSI or LVDS TXD3N  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
N/LVDS_TX0_D3N
MIPI_DSI_TX0_D3
| 26  | MIPI DSI or LVDS TXD3P  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
P/LVDS_TX0_D3P
MIPI_DSI_TX0_D2
| 27  | MIPI DSI or LVDS TXD2N  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
N/LVDS_TX0_D2N
MIPI_DSI_TX0_D2
| 28  | MIPI DSI or LVDS TXD2P  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
P/LVDS_TX0_D2P
MIPI_DSI_TX0_D1
| 29  | MIPI DSI or LVDS TXD1N  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
N/LVDS_TX0_D1N
MIPI_DSI_TX0_D1
| 30  | MIPI DSI or LVDS TXD1P  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
P/LVDS_TX0_D1P
MIPI_DSI_TX0_D0
| 31  | MIPI DSI or LVDS TXD1N  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
N/LVDS_TX0_D0N
MIPI_DSI_TX0_D0
| 32  | MIPI DSI or LVDS TXD1P  |     | 1.8V  |
| --- | ----------------------- | --- | ----- |
P/LVDS_TX0_D0P
MIPI_DSI_TX0_CL
| 33  KN/LVDS_TX0_CL | MIPI DSI or LVDS TXD1N  |     | 1.8V  |
| ------------------ | ----------------------- | --- | ----- |
KN
MIPI_DSI_TX0_CL
| 34  KP/LVDS_TX0_CL | MIPI DSI or LVDS TXD1P  |     | 1.8V  |
| ------------------ | ----------------------- | --- | ----- |
KP
| 35  HDMI_TX_HPDIN  | HDMI HPD input  |     | 3.3V  |
| ------------------ | --------------- | --- | ----- |
| 36  HDMI_TXCLKN    |                 |     | 1.8V  |
| 37  HDMI_TXCLKP    |                 |     | 1.8V  |
| 38  HDMI_TX0N      |                 |     | 1.8V  |
| 39  HDMI_TX0P      |                 |     | 1.8V  |
| 40  HDMI_TX1N      |                 |     | 1.8V  |
| 41  HDMI_TX1P      |                 |     | 1.8V  |
| 42  HDMI_TX2N      |                 |     | 1.8V  |
| 43  HDMI_TX2P      |                 |     | 1.8V  |
MIPI_CSI_RX_CL
| 44  | MIPI CSI1 CLKN  |     | 1.8V  |
| --- | --------------- | --- | ----- |
K1N
| 45  MIPI_CSI_RX_CL | MIPI CSI1 CLKP  |     | 1.8V  |
| ------------------ | --------------- | --- | ----- |
  8

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
K1P
MIPI_CSI_RX_D3
| 46  | CSI0 RXD3N or CSI1 RXD1N  |     | 1.8V  |
| --- | ------------------------- | --- | ----- |
N
MIPI_CSI_RX_D3
| 47  | CSI0 RXD3P or CSI1 RXD1P  |     | 1.8V  |
| --- | ------------------------- | --- | ----- |
P
MIPI_CSI_RX_D2
| 48  | CSI0 RXD2N or CSI1 RXD0N  |     | 1.8V  |
| --- | ------------------------- | --- | ----- |
N
MIPI_CSI_RX_D2
| 49  | CSI0 RXD2P or CSI1 RXD0P  |     | 1.8V  |
| --- | ------------------------- | --- | ----- |
P
MIPI_CSI_RX_D1
| 50  | CSI0 RXD1P  |     | 1.8V  |
| --- | ----------- | --- | ----- |
P
MIPI_CSI_RX_D1
| 51  | CSI0 RXD1N  |     | 1.8V  |
| --- | ----------- | --- | ----- |
N
MIPI_CSI_RX_D0
| 52  | CSI0 RXD0N  |     | 1.8V  |
| --- | ----------- | --- | ----- |
N
MIPI_CSI_RX_D0
| 53  | CSI0 RXD0P  |     | 1.8V  |
| --- | ----------- | --- | ----- |
P
MIPI_CSI_RX_CL
| 54  | MIPI CSI0 CLKN  |     | 1.8V  |
| --- | --------------- | --- | ----- |
K0N
MIPI_CSI_RX_CL
| 55  | MIPI CSI0 CLKP  |     | 1.8V  |
| --- | --------------- | --- | ----- |
K0P
| 56  GND         | Ground  |             | 0V    |
| --------------- | ------- | ----------- | ----- |
| 57  PWM5        |         | GPIO0_C4_d  | 3.3V  |
| 58  LCD_BL_PWM  | PWM4    | GPIO0_C3_d  | 3.3V  |
| 59  PWM3_IR     |         | GPIO0_C2_d  | 3.3V  |
PCIE20_SATA2_R
| 60  | PCIE or SATA2 RXP  |     | 1.8V  |
| --- | ------------------ | --- | ----- |
XP
PCIE20_SATA2_R
| 61  | PCIE or SATA2 RXN  |     | 1.8V  |
| --- | ------------------ | --- | ----- |
XN
PCIE20_SATA2_T
| 62  | PCIE or SATA2 TXN  |     | 1.8V  |
| --- | ------------------ | --- | ----- |
XN
PCIE20_SATA2_T
| 63  | PCIE or SATA2 TXP  |     | 1.8V  |
| --- | ------------------ | --- | ----- |
XP
| 64  PCIE20_REFCLKP  |     |     | 1.8V  |
| ------------------- | --- | --- | ----- |
| 65  PCIE20_REFCLKN  |     |     | 1.8V  |
USB3_HOST1_SS
| 66  | USB3.0 or SATA1 TXP  |     | 1.8V  |
| --- | -------------------- | --- | ----- |
TXP
USB3_HOST1_SS
| 67  | USB3.0 or SATA1 TXN  |     | 1.8V  |
| --- | -------------------- | --- | ----- |
TXN
USB3_HOST1_SS
| 68  | USB3.0 or SATA1 RXN  |     | 1.8V  |
| --- | -------------------- | --- | ----- |
RXP
| 69  USB3_HOST1_SS | USB3.0 or SATA1 RXP  |     | 1.8V  |
| ----------------- | -------------------- | --- | ----- |
  9

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
RXN
| 70  USB_OTG0_DM    |                |             | 1.8V  |
| ------------------ | -------------- | ----------- | ----- |
| 71  USB_OTG0_DP    |                |             | 1.8V  |
| 72  USB3_HOST1_DP  |                |             | 1.8V  |
| 73  USB3_HOST1_DM  |                |             | 1.8V  |
| 74  EDP_TX_D2N     |                |             | 1.8V  |
| 75  EDP_TX_D2P     |                |             | 1.8V  |
| 76  EDP_TX_D1N     |                |             | 1.8V  |
| 77  EDP_TX_D1P     |                |             | 1.8V  |
| 78  EDP_TX_D0N     |                |             | 1.8V  |
| 79  EDP_TX_D0P     |                |             | 1.8V  |
| 80  EDP_TX_D3N     |                |             | 1.8V  |
| 81  EDP_TX_D3P     |                |             | 1.8V  |
| 82  EDP_TX_AUXN    |                |             | 1.8V  |
| 83  EDP_TX_AUXP    |                |             | 1.8V  |
| 84  SDMMC0_DET_L   |                | GPIO0_A4_u  | 3.3V  |
| 85  SDMMC0_CLK     | UART5_TX_M0    | GPIO2_A2_d  | 3.3V  |
| 86  GND            | Ground         |             | 0V    |
| 87  SDMMC0_CMD     | UART5_RX_M0    | GPIO2_A1_u  | 3.3V  |
| 88  SDMMC0_D3      | UART5_RTSn_M0  | GPIO2_A0_u  | 3.3V  |
| 89  SDMMC0_D2      | UART5_CTSn_M0  | GPIO1_D7_u  | 3.3V  |
| 90  SDMMC0_D1      | UART6_RX_M1    | GPIO1_D6_u  | 3.3V  |
| 91  SDMMC0_D0      | UART6_TX_M1    | GPIO1_D5_u  | 3.3V  |
| 92  USB_OTG0_ID    |                |             | 3.3V  |
USB_OTG0_VBUS
| 93  | USB OTG VBUS input  |     | 3.3V  |
| --- | ------------------- | --- | ----- |
DET
| 94  UART1_RX_M0    |                  | GPIO2_B3_u  | 1.8V  |
| ------------------ | ---------------- | ----------- | ----- |
| 95  UART1_TX_M0    |                  | GPIO2_B4_u  | 1.8V  |
| 96  UART1_RTSn_M0  |                  | GPIO2_B5_u  | 1.8V  |
| 97  UART1_CTSn_M0  |                  | GPIO2_B6_u  | 1.8V  |
| 98  BT_REG_ON_H    | I2S2_SCLK_RX_M0  | GPIO2_B7_d  | 1.8V  |
BT_WAKE_HOST_
| 99  | I2S2_LRCLK_RX_M0  | GPIO2_C0_d  | 1.8V  |
| --- | ----------------- | ----------- | ----- |
H
HOST_WAKE_BT_
| 100  | I2S2_MCLK_M0  | GPIO2_C1_d  | 1.8V  |
| ---- | ------------- | ----------- | ----- |
H
WIFI_WAKE_HOS
| 101  | I2C4_SCL_M1  | GPIO2_B2_d  | 1.8V  |
| ---- | ------------ | ----------- | ----- |
T_H
| 102  WIFI_REG_ON_H  | UART8_RX_M0  | GPIO2_C6_d  | 1.8V  |
| ------------------- | ------------ | ----------- | ----- |
I2S2_SCLK_TX_M
| 103  | SPI2_MISO_M0  | GPIO2_C2_d  | 1.8V  |
| ---- | ------------- | ----------- | ----- |
0
I2S2_LRCK_TX_M
| 104  | SPI2_MOSI_M0  | GPIO2_C3_d  | 1.8V  |
| ---- | ------------- | ----------- | ----- |
0
  10

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
| 105  I2S2_SDO_M0  | SPI2_CS0_M0  | GPIO2_C4_d  | 1.8V  |
| ----------------- | ------------ | ----------- | ----- |
| 106  I2S2_SDI_M0  | UART8_TX_M0  | GPIO2_C5_d  | 1.8V  |
| 107  SDMMC1_D3    | UART7_TX_M0  | GPIO2_A6_u  | 1.8V  |
| 108  SDMMC1_D2    | UART7_RX_M0  | GPIO2_A5_u  | 1.8V  |
| 109  SDMMC1_D1    | UART6_TX_M0  | GPIO2_A4_u  | 1.8V  |
| 110  SDMMC1_D0    | UART6_RX_M0  | GPIO2_A3_u  | 1.8V  |
| 111  SDMMC1_CMD   | UART9_RX_M0  | GPIO2_A7_u  | 1.8V  |
| 112  SDMMC1_CLK   | UART9_TX_M0  | GPIO2_B0_d  | 1.8V  |
| 113  GND          | Ground       |             | 0V    |
| 114  SARADC_VIN3  |              |             | 1.8V  |
SARADC_VIN2_H
| 115  |     |     | 1.8V  |
| ---- | --- | --- | ----- |
P_HOOK
SARADC_VIN0_K
| 116  | Pull up 10K onboard  |     | 1.8V  |
| ---- | -------------------- | --- | ----- |
EY/RECOVERY
| 117  GND  | Ground  |     | 0V  |
| --------- | ------- | --- | --- |
PCIE20_PERSTn_
| 118  | PDM_SDI1_M0  | GPIO1_B2_d  | 3.3V  |
| ---- | ------------ | ----------- | ----- |
M2
PCIE20_WAKEn_
| 119  | PDM_SDI2_M0  | GPIO1_B1_d  | 3.3V  |
| ---- | ------------ | ----------- | ----- |
M2
PCIE20_CLKREQn
| 120  | PDM_SDI3_M0  | GPIO1_B0_d  | 3.3V  |
| ---- | ------------ | ----------- | ----- |
_M2
AudioPWM_LOUT_P/I2C3_SD
| 121  UART3_RX_M0  |     | GPIO1_A0_u  | 3.3V  |
| ----------------- | --- | ----------- | ----- |
A_M0
AudioPWM_LOUT_N/I2C3_S
| 122  UART3_TX_M0  |     | GPIO1_A1_u  | 3.3V  |
| ----------------- | --- | ----------- | ----- |
CL_M0
PDM_CLK1_M0/SPDIF_TX_M
| 123  UART4_RX_M0  |     | GPIO1_A4_d  | 3.3V  |
| ----------------- | --- | ----------- | ----- |
0
AudioPWM_ROUT_P
| 124  UART4_TX_M0  |     | GPIO1_A6_d  | 3.3V  |
| ----------------- | --- | ----------- | ----- |
/PDM_CLK0_M0
I2S1_LRCK_TX_M
| 125  |     | GPIO1_A5_d  | 3.3V  |
| ---- | --- | ----------- | ----- |
0_PMIC
I2S1_SDI0_M0/PD
| 126  | PDM_SDI0_M0  | GPIO1_B3_d  | 3.3V  |
| ---- | ------------ | ----------- | ----- |
M_SDI0_M0_PMIC
I2S1_SCLK_TX_M
| 127  | UART3_CTSn_M0  | GPIO1_A3_d  | 3.3V  |
| ---- | -------------- | ----------- | ----- |
0_PMIC
| I2S1_SDO0_M0_P | AudioPWM_ROUT_N/UART4_ |             |       |
| -------------- | ---------------------- | ----------- | ----- |
| 128            |                        | GPIO1_A7_d  | 3.3V  |
| MIC            | CTSn_M0                |             |       |
I2S1_MCLK_M0_P
| 129  | UART3_RTSn_M0  | GPIO1_A2_d  | 3.3V  |
| ---- | -------------- | ----------- | ----- |
MIC
| 130  GND           | Ground  |             | 0V    |
| ------------------ | ------- | ----------- | ----- |
| 131  SPI0_CS0_M0   | PWM7    | GPIO0_C6_d  | 3.3V  |
| 132  SPI0_MISO_M0  | PWM6    | GPIO0_C5_d  | 3.3V  |
  11

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
| 133  SPI0_MOSI_M0  | I2C2_SDA_M0      | GPIO0_B6_u   | 3.3V  |
| ------------------ | ---------------- | ------------ | ----- |
| 134  SPI0_CLK_M0   | I2C2_SCL_M0      | GPIO0_B5_u   | 3.3V  |
| 135  SPI3_CS0_M1   | I2S3_SDI _M1     | GPIO4_C6_d   | 3.3V  |
| 136  SPI3_MISO_M1  | I2S3_SDO _M1     | GPIO4_C5_d   | 3.3V  |
| 137  SPI3_MOSI_M1  | I2S3_SCLK_M1     | GPIO4_C3_d   | 3.3V  |
| 138  SPI3_CLK_M1   | I2S3_MCLK_M1     | GPIO4_C2_d   | 3.3V  |
| 139  LCD_PWREN_H   |                  | GPIO0_C7_d   | 3.3V  |
| 140  PWM0_M0       |                  | GPIO0_B7_d   | 3.3V  |
| 141  UART5_RX_M1   |                  | GPIO3_C3_d   | 3.3V  |
| 142  UART5_TX_M1   |                  | GPIO3_C2_d   | 3.3V  |
| 143  UART2DBG_RX   | UART2 for Debug  | GPIO0_D0_u   | 3.3V  |
| 144  UART2DBG_TX   | UART2 for Debug  | GPIO0_D1_u   | 3.3V  |
I2S3_LRCK_M1/EDP_HPDIN_
| 145  SPDIF_TX_M2  |     | GPIO4_C4_d  | 3.3V  |
| ----------------- | --- | ----------- | ----- |
M0
| 146  GPIO0_A6_d      |              |             | 3.3V  |
| -------------------- | ------------ | ----------- | ----- |
| 147  GPIO0_A3_u      |              |             | 3.3V  |
| 148  GPIO0_A0_d      |              |             | 3.3V  |
| 149  CAMERAF_RST_L   | CAM_CLKOUT1  | GPIO4_B0_d  | 1.8V  |
| 150  CAMERAB_RST_L   |              | GPIO4_B1_d  | 1.8V  |
| 151  CIF_8BIT_D7     | CIF_D15      | GPIO4_A5_d  | 1.8V  |
| 152  CIF_8BIT_D6     | CIF_D14      | GPIO4_A4_d  | 1.8V  |
| 153  CIF_8BIT_D5     | CIF_D13      | GPIO4_A3_d  | 1.8V  |
| 154  CIF_8BIT_D4     | CIF_D12      | GPIO4_A2_d  | 1.8V  |
| 155  CIF_8BIT_D3     | CIF_D11      | GPIO4_A1_d  | 1.8V  |
| 156  CIF_8BIT_D2     | CIF_D10      | GPIO4_A0_d  | 1.8V  |
| 157  CIF_8BIT_D1     | CIF_D9       | GPIO3_D7_d  | 1.8V  |
| 158  CIF_8BIT_D0     | CIF_D8       | GPIO3_D6_d  | 1.8V  |
| 159  GND             | Ground       |             | 0V    |
| 160  USB2_HOST2_DM   | HOST2_DM     |             | 1.8V  |
| 161  USB2_HOST2_DP   | HOST2_DP     |             | 1.8V  |
| 162  USB2_HOST3_DP   | HOST3_DP     |             | 1.8V  |
| 163  USB2_HOST3_DM   | HOST3_DM     |             | 1.8V  |
| 164  CIF_8BIT_VSYNC  |              | GPIO4_B7_d  | 1.8V  |
| 165  CIF_8BIT_HREF   |              | GPIO4_B6_d  | 1.8V  |
| 166  CIF_8BIT_CLKIN  |              | GPIO4_C1_d  | 1.8V  |
| 167  GND             | Ground       |             | 0V    |
| 168  CIF_CLKOUT      |              | GPIO4_C0_d  | 1.8V  |
VOP-
| 169  | CIF_D7  | GPIO3_D5_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D7_M1
VOP-
| 170  | CIF_D6  | GPIO3_D4_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D6_M1
| 171  VOP- | CIF_D5  | GPIO3_D3_d  | 1.8V  |
| --------- | ------- | ----------- | ----- |
  12

Customize the embedded system based on Your Idea

Pin  Signal  Description or functions  GPIO serial  IO Voltage
BT656_D5_M1
VOP-
| 172  | CIF_D4  | GPIO3_D2_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D4_M1
VOP-
| 173  | CIF_D3  | GPIO3_D1_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D3_M1
VOP-
| 174  | CIF_D2  | GPIO3_D0_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D2_M1
VOP-
| 175  | CIF_D1  | GPIO3_C7_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D1_M1
VOP-
| 176  | CIF_D0  | GPIO3_C6_d  | 1.8V  |
| ---- | ------- | ----------- | ----- |
BT656_D0_M1
VOP_BT656_CLK_
| 177  |     | GPIO4_B4_d  | 1.8V  |
| ---- | --- | ----------- | ----- |
M1
| 178  GPIO4_B5_d_1V8  |     |     | 1.8V  |
| -------------------- | --- | --- | ----- |
I2C4_SDA_M0_1V
| 179  | Pull up 2.2K onboard  | GPIO4_B2_d  | 1.8V  |
| ---- | --------------------- | ----------- | ----- |
8
I2C4_SCL_M0_1V
| 180  | Pull up 2.2K onboard  | GPIO4_B3_d  | 1.8V  |
| ---- | --------------------- | ----------- | ----- |
8
| 181  GND            | Ground                |             | 0V    |
| ------------------- | --------------------- | ----------- | ----- |
| 182  I2C1_SDA       | Pull up 2.2K onboard  | GPIO0_B4_u  | 3.3V  |
| 183  I2C1_SCL       | Pull up 2.2K onboard  | GPIO0_B3_u  | 3.3V  |
| 184  GPIO0_A5_d     | PCIE20_CLKREQn_M0     |             | 3.3V  |
| 185  GMAC1_MDIO_M0  |                       | GPIO3_C5_d  | 3.3V  |
| 186  GMAC1_MDC_M0   |                       | GPIO3_C4_d  | 3.3V  |
Note:
I2C1 can’t be used for exclusive bus, Such as CTP.
RGMII default is 3.3V IO, but can change to 1.8V.

  13

Customize the embedded system based on Your Idea

2 Peripherals Introduction
2.1 Power (P1)
The DC JACK is 5.5 x 2.1mm, 3-pin plug Type. Typical 12V/3A DC adapter.

| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
Main power supply.
| 1  VCC12V_DCIN  |     | 2  GND  | Ground  |
| --------------- | --- | ------- | ------- |
DC 12V power in
| 3  GND         | Ground  |     |     |
| -------------- | ------- | --- | --- |
| 2.2 Audio I/O  |         |     |     |
  Headphone (J7, 3.5mm jack)
3
1
4
2
5

The EM3566 adopts audio codec ES8388 to provide stereo audio output/input.
Feature
Low power
⚫
Integrated ADC and DAC
⚫
⚫  IIS transfer audio data
⚫  Stereo output, support recording
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
Headphone amplifier
| 1  GND  | Ground  | 2  HP_RO  |     |
| ------- | ------- | --------- | --- |
output _Right channel
Headphone amplifier
| 3  HP_LO  |     | 4  PHE_DET  | Headphone Detect  |
| --------- | --- | ----------- | ----------------- |
output _Left channel
| 5  MIC2P  | Single-end input for microphone  |     |     |
| --------- | -------------------------------- | --- | --- |

|     |     | 14  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

2.3 HDMI OUT (J4)
1
19

EM3566 supports HDMI 2.0 transmitter with HDCP 1.4/2.2, up to 4K@60fps.
⚫  HPD input analog comparator
⚫  13.5–600MHz input reference clock
Up to 10-bit Deep Color modes
⚫
Up to 18Gbps aggregate bandwidth
⚫
Up to 1080p at 120Hz and 4kx2k at 60Hz HDTV display resolutions and up to QXGA graphic
⚫
display resolutions
3-D video formats
⚫
Link controller flexible interface with 30-, 60- or 120-bit SDR data access
⚫
| Pin  Signal   | Description  | Pin  Signal  | Description  |
| ------------- | ------------ | ------------ | ------------ |
| 1  HDMI_TX2P  |              | 2  GND       | Ground       |
HDMI data 2 pair
| 3  HDMI_TX2N  |     | 4  HDMI_TX1P  |     |
| ------------- | --- | ------------- | --- |
HDMI data 1 pair
| 5  GND        | Ground  | 6  HDMI_TX1N  |         |
| ------------- | ------- | ------------- | ------- |
| 7  HDMI_TX0P  |         | 8  GND        | Ground  |
HDMI data 0 pair
| 9  HDMI_TX0N  |     | 10  HDMI_TXCLKP  |     |
| ------------- | --- | ---------------- | --- |
HDMI clock pair
| 11  GND  | Ground  | 12  HDMI_TXCLKN  |     |
| -------- | ------- | ---------------- | --- |
Consumer
| 13  HDMITX_CEC_M0  |     | 14  NC  | Not connect  |
| ------------------ | --- | ------- | ------------ |
electronics control
15  HDMI_SCL  HDMI serial clock  16  HDMI_SDA  HDMI serial data
| 17  GND            | Ground            | 18  HDMI_VCC  | 5V power supply  |
| ------------------ | ----------------- | ------------- | ---------------- |
| 19  HDMI_TX_HPDIN  | Hot Plug Detect   |               |                  |
2.4 USB OTG (J29)
5
1

EM3566 OTG is a Micro USB2.0 port, it is used to download image and ADB transfer file.
Feature
Compatible with USB OTG2.0 specification
⚫
Supports USB 2.0 High Speed (480Mbps), Full Speed (12Mbps) and Low Speed (1.5Mbps)
⚫
operation in host mode
|     |     | 15  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

Supports USB 2.0 High Speed (480 Mbps) and Full Speed (12 Mbps) operation in peripheral
⚫
mode.
Hardware support for OTG signaling, session request protocol, and host negotiation protocol.
⚫
| Pin  Signal  | Description    | Pin  Signal    | Description      |
| ------------ | -------------- | -------------- | ---------------- |
| 1  VCC_OTG   | USB OTG Power  | 2  USB_OTG0DM  | USB OTG0 data -  |
USB OTG0 ID
| 3  USB_OTG0DP  | USB OTG0 data+  | 4  USB_OTG0ID  |     |
| -------------- | --------------- | -------------- | --- |
indicator
| 5  GND  | Ground  |     |     |
| ------- | ------- | --- | --- |

2.5 USB HOST (P3, J6, J17)
4
1
8
5
4 3 2 1

EM3566 provides 4x USB2.0 - one dual-USB (P3) and two 4-pin connector (J6, J17).
The 4-ch USB HOST interfaces are extended by GL850G which is a fully compliant with the USB
2.0 hub specification and is designed to work with USB host as a high-speed hub. It is used to
connect USB mouse, U disk, USB camera, and other USB devices. Support hot-plug.
Feature
Supports high-speed (480Mbps), full-speed (12Mbps) and low-speed (1.5Mbps) mode
⚫
Supports automatic switching between bus- and self-powered modes
⚫
Provides 16 host mode channels
⚫
⚫  Support periodic out channel in host mode
P3 (dual-USB)
| Pin  Signal  | Description       | Pin  Signal  | Description  |
| ------------ | ----------------- | ------------ | ------------ |
| 1  VCC_USB   | USB Power. DC 5V  | 2  USB_DM1   | USB data-    |
| 3  USB_DP1   | USB Data+         | 4  GND       | Ground       |
| 5  VCC_USB   | USB Power. DC 5V  | 6  USB_DM2   | USB data-    |
| 7  USB_DP2   | USB Data+         | 8  GND       | Ground       |
J6 / J17 (4-pin connector)
| Pin  Signal      | Description      | Pin  Signal   | Description  |
| ---------------- | ---------------- | ------------- | ------------ |
| VDD5V0_HOST      |                  | USB_DM4(J6)/  |              |
| 1                | 5V power supply  | 2             | USB data-    |
| 2                |                  | USB_DM3(J17)  |              |
| 3  USB_DP4(J6)/  | USB Data+        | 4  GND        | Ground       |
|                  |                  | 16            |              |

Customize the embedded system based on Your Idea

USB_DP3(J17)
2.6 USB3.0 (J25)
2
4
6
8
1
|     |     | 3 9 |     |
| --- | --- | --- | --- |
5
7
|                         |     |     |     |
| ----------------------- | --- | --- | --- |
USB3.0(J25)
| Pin  Signal      | Description       | Pin  Signal  | Description  |
| ---------------- | ----------------- | ------------ | ------------ |
| 1  VCC5V0_HOST1  | USB Power. DC 5V  | 2  USB3_DM   | USB data-    |
| 3  USB3_DP       | USB Data+         | 4  GND       | Ground       |
5  USB3_SSRXN  USB SSRX Data-  6  USB3_SSRXP  USB SSRX Data+
| 7  GND         | Ground          | 8  USB3_SSTXN  | USB SSTX Data-  |
| -------------- | --------------- | -------------- | --------------- |
| 9  USB3_SSTXP  | USB SSTX Data+  |                |                 |
2.7 Ethernet (JP1)
13
8
2
|     |     | 7 12 |     |
| --- | --- | ---- | --- |
1

EM3566 adopts RTL8211F as the Ethernet chip. RJ45 connector.
Feature
Supports 10/100/1000 Mbps data transfer rates with the MII/RGMII interfaces
⚫
Supports both full-duplex and half-duplex operation
⚫
Implements the full 802.3 specification
⚫
| Pin  Signal  | Description              | Pin  Signal  | Description              |
| ------------ | ------------------------ | ------------ | ------------------------ |
|              | Bi-directional           |              | Bi-directional           |
| 1  DA+       |                          | 2  DA-       |                          |
|              | transmit/receive pair A  |              | transmit/receive pair A  |
|              | Bi-directional           |              | Bi-directional           |
| 3  DB+       |                          | 4  DC+       |                          |
|              | transmit/receive pair B  |              | transmit/receive pair C  |
|              | Bi-directional           |              | Bi-directional           |
| 5  DC-       |                          | 6  DB-       |                          |
|              | transmit/receive pair C  |              | transmit/receive pair B  |
| 7  DD+       | Bi-directional           | 8  DD-       | Bi-directional           |
|              |                          | 17           |                          |

Customize the embedded system based on Your Idea

|         |     | transmit/receive pair D  |     |          | transmit/receive pair D  |     |
| ------- | --- | ------------------------ | --- | -------- | ------------------------ | --- |
| 9  GND  |     | Ground                   |     | 10  GND  | Ground                   |     |
LED2/CFG_L
| 11  |     | LED2  |     | 12  GND  | Ground  |     |
| --- | --- | ----- | --- | -------- | ------- | --- |
DO1
LED1/CFG_L
| 13  |     | LED1  |     | 14  GND  | Ground  |     |
| --- | --- | ----- | --- | -------- | ------- | --- |
DO0
2.8 eDP/LVDS/MIPI Panel (CON1)
EM3566 supports 10.1-inch HD capacitive LCD, up to 1280 x 800 resolution.
Power supply
GND
I2C
eDP
LCD
SPI
MIPI DSI
LVDS
Touch
| 1 3 5        | 7 9     | 11 13 15 17 19 2211 | 2233 2255 | 27 29 31 33 35 | 37 39            |     |
| ------------ | ------- | ------------------- | --------- | -------------- | ---------------- | --- |
| 2 4 6        | 8 10 12 | 14 16 18 20 22      | 24 26     | 28 30 32 34 36 | 38 40            |     |
| Pin  Signal  |         | Description         |           | Pin  Signal    | Description      |     |
| 1            |         |                     |           | 2              |                  |     |
| VDD5V        |         | 5V power supply     |           | VDD5V          | 5V power supply  |     |
| 3  GND       |         | Ground              |           | 4  GND         | Ground           |     |
5  VCC3V3_LCD  3.3V power supply  6  VCC3V3_LCD  3.3V power supply
| 7  GND  |     | Ground  |     | 8  GND  | Ground  |     |
| ------- | --- | ------- | --- | ------- | ------- | --- |
TP I2C serial clock
| 9  I2C2_SCL_TP  |     |     |     | 10  I2C2_SDA_TP  | TP I2C data line  |     |
| --------------- | --- | --- | --- | ---------------- | ----------------- | --- |
line
Touch screen
| 11  TOUCH_RST  |     | Touch screen reset  |     | 12  TOUCH_INT  |     |     |
| -------------- | --- | ------------------- | --- | -------------- | --- | --- |
Interrupt
|                  |     | LCD Power enable  |     |                 | LCD Backlight PWM  |     |
| ---------------- | --- | ----------------- | --- | --------------- | ------------------ | --- |
| 13  LCD_PWREN_H  |     |                   |     | 14  LCD_BL_PWM  |                    |     |
|                  |     | high              |     |                 | output             |     |
| 15  GND          |     | Ground            |     | 16  GND         | GND                |     |
|                  |     | eDP CH-AUX        |     |                 | eDP CH-AUX         |     |
EDP_TX_AUX
17  EDP_TX_AUXP  positive differential  18  negative differential
P
|                 |     | output            |     |                 | output            |     |
| --------------- | --- | ----------------- | --- | --------------- | ----------------- | --- |
| 19  GND         |     | Ground            |     | 20  GND         | Ground            |     |
|                 |     | eDP data lane     |     |                 | eDP data lane     |     |
| 21  EDP_TX_D3P  |     |                   |     | 22  EDP_TX_D3N  |                   |     |
|                 |     | positive output   |     |                 | negative output   |     |
|                 |     | eDP data lane     |     |                 | eDP data lane     |     |
| 23  EDP_TX_D2P  |     |                   |     | 24  EDP_TX_D2N  |                   |     |
|                 |     | positive output   |     |                 | negative output   |     |
25  EDP_TX_D1P  eDP data lane  26  EDP_TX_D1N  eDP data lane
|     |     |     | 18  |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |

Customize the embedded system based on Your Idea

|                   | positive output      |                 | negative output      |
| ----------------- | -------------------- | --------------- | -------------------- |
|                   | eDP data lane        |                 | eDP data lane        |
| 27  EDP_TX_D0P    |                      | 28  EDP_TX_D0N  |                      |
|                   | positive output      |                 | negative output      |
| MIPI_DSI_TX0_     |                      | MIPI_DSI_TX0    |                      |
|                   | MIPI/LVDS clock      |                 | MIPI/LVDS clock      |
| 29  CLKP/LVDS_TX  |                      | 30  _CLKN/LVDS_ |                      |
|                   | positive             |                 | negative             |
| 0_CLKP            |                      | TX0_CLKN        |                      |
| 31  GND           | Ground               | 32  GND         | Ground               |
| MIPI_DSI_TX0_     |                      | MIPI_DSI_TX0    |                      |
|                   | MIPI/LVDS data lane  |                 | MIPI/LVDS data lane  |
| 33  D3P/LVDS_TX0_ |                      | 34  _D3N/LVDS_T |                      |
|                   | positive output      |                 | negative output      |
| D3P               |                      | X0_D3N          |                      |
| MIPI_DSI_TX0_     |                      | MIPI_DSI_TX0    |                      |
|                   | MIPI/LVDS data lane  |                 | MIPI/LVDS data lane  |
| 35  D2P/LVDS_TX0_ |                      | 36  _D2N/LVDS_T |                      |
|                   | positive output      |                 | negative output      |
| D2P               |                      | X0_D2N          |                      |
| MIPI_DSI_TX0_     |                      | MIPI_DSI_TX0    |                      |
|                   | MIPI/LVDS data lane  |                 | MIPI/LVDS data lane  |
| 37  D1P/LVDS_TX0_ |                      | 38  _D1N/LVDS_T |                      |
|                   | positive output      |                 | negative output      |
| D1P               |                      | X0_D1N          |                      |
| MIPI_DSI_TX0_     |                      | MIPI_DSI_TX0    |                      |
|                   | MIPI/LVDS data lane  |                 | MIPI/LVDS data lane  |
| 39  D0P/LVDS_TX0_ |                      | 40  _D0N/LVDS_T |                      |
|                   | positive output      |                 | negative output      |
| D0P               |                      | X0_D0N          |                      |

2.9 BT656 (J26)
P o w e r  s u p p ly
|     | 1 3 5 | 7 9 1 1 1 3 |     |
| --- | ----- | ----------- | --- |
GVN NOC DP
|     | 2 4 6 | 8 1 0 1 2 1 4 |     |
| --- | ----- | ------------- | --- |

J26 is used to connect MEMS module for Video output.
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
| 1            |              | 2            |              |
VCC3V3_SYS  3.3V power supply  VCC3V3_SYS  3.3V power supply
| 3  GND       | Ground      | 4  GND       | Ground      |
| ------------ | ----------- | ------------ | ----------- |
| VOP_BT656_D0 |             | VOP_BT656_D1 |             |
| 5            | BT656 data  | 6            | BT656 data  |
| _M1          |             | _M1          |             |
| VOP_BT656_D2 |             | VOP_BT656_D3 |             |
| 7            | BT656 data  | 8            | BT656 data  |
| _M1          |             | _M1          |             |
| VOP_BT656_D4 |             | VOP_BT656_D5 |             |
| 9            | BT656 data  | 10           | BT656 data  |
| _M1          |             | _M1          |             |
| VOP_BT656_D6 |             | VOP_BT656_D7 |             |
| 11           | BT656 data  | 12           | BT656 data  |
| _M1          |             | _M1          |             |
VOP_BT656_CL
| 13  | BT656 clock  | 14  NC  | Not connect  |
| --- | ------------ | ------- | ------------ |
K_M1
|     |     | 19  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

2.10 GPIO (CON4)
P o w e r  s u p p ly
|     | 1 4 1 2 1 0 | 8 6 4 2 |     |
| --- | ----------- | ------- | --- |
GGC N D
P I O
I F
|     | 1 3 1 1 9 | 7 5 3 1 |     |
| --- | --------- | ------- | --- |

The GPIO is a 14-pin header connector. The pins can be defined as data input / output.
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
1  CIF_8BIT_CLKIN  CIF 8BIT clock/GPIO  2  CIF_8BIT_HREF  GPIO
3  CIF_8BIT_D7  CIF 8BIT data/GPIO  4  CIF_8BIT_D6  CIF 8BIT data/GPIO
5  CIF_8BIT_D5  CIF 8BIT data/GPIO  6  CIF_8BIT_D4  CIF 8BIT data/GPIO
7  CIF_8BIT_D3  CIF 8BIT data/GPIO  8  CIF_8BIT_D2  CIF 8BIT data/GPIO
9  CIF_8BIT_D1  CIF 8BIT data/GPIO  10  CIF_8BIT_D0  CIF 8BIT data/GPIO
11  VDDIO_18  1.8V IO voltage  12  VDDIO_18  1.8V IO voltage
| 13  GND  | Ground  | 14  GND  | Ground  |
| -------- | ------- | -------- | ------- |
2.11 ADC (J18)
4 3 2 1
|                                |     |     |     |
| ------------------------------ | --- | --- | --- |
4pin connector. It is used to connect the ADC device.
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
SARADC_VIN2
| 1  VDDIO_18  | 1.8V power supply  | 2   | ADC signal  |
| ------------ | ------------------ | --- | ----------- |
_HP_HOOK
| 3  SARADC_VIN3  | ADC signal  | 4  GND  | Ground  |
| --------------- | ----------- | ------- | ------- |

2.12 MIPI Camera (J30, J31)
EM3566 features two 26-pin MIPI connectors for camera (OV13850).
Features
⚫  Support 4 data lane, providing up to 6Gbps data rate
⚫  Support 1080p@60fps output
Lane operation ranging from 80 Mbps to 1.5Gbps in forward direction.
⚫
|     |     | 20  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

J30
| Pin  Signal   | Description    | Pin  Signal  | Description           |        |
| ------------- | -------------- | ------------ | --------------------- | ------ |
| 1  GND        | Ground         | 2  GND       | Ground                |        |
| 3  NC         | Not connect    | 4  AF_2V8    | AF 2.8V power supply  |        |
| I2C4_SDA_M0_1 |                | I2C4_SCL_M0  |                       |        |
| 5             | I2C data line  | 6            | I2C clock line        |        |
| V8            |                | _1V8         |                       |        |
|               |                | AVDD2V8_DV   | DVP  2.8V             | power  |
| 7  NC         | Not connect    | 8            |                       |        |
|               |                | P            | supply                |        |
| CAMERAB_RST   |                | CIF_8BIT_VSY |                       |        |
| 9             | Camera reset   | 10           | GPIO4_B7_d            |        |
| _L            |                | NC           |                       |        |
MIPI CSI positive
MIPI_CSI_RX_
| 11  GND  | Ground  | 12  | differential data line  |     |
| -------- | ------- | --- | ----------------------- | --- |
D3P
transceiver output
IMIPI CSI negative
MIPI_CSI_RX_D
| 13  | differential data line   | 14  GND  | Ground  |     |
| --- | ------------------------ | -------- | ------- | --- |
3N
transceiver output
|               | MIPI CSI positive       |              | MIPI CSI negative        |     |
| ------------- | ----------------------- | ------------ | ------------------------ | --- |
| MIPI_CSI_RX_D |                         | MIPI_CSI_RX_ |                          |     |
| 15            | differential data line  | 16           | differential data line   |     |
| 2P            |                         | D2N          |                          |     |
|               | transceiver output      |              | transceiver output       |     |
MIPI CSI positive
MIPI_CSI_RX_
| 17  GND  | Ground   | 18  | differential data line  |     |
| -------- | -------- | --- | ----------------------- | --- |
CLK1P
transceiver output
MIPI CSI negative
MIPI_CSI_RX_C
| 19  | differential data line  | 20  GND  | Ground  |     |
| --- | ----------------------- | -------- | ------- | --- |
LK1N
transceiver output
| 21  DVDD1V2  | VDD 1.2V  | 22  VCC1V8_DVP  | VCC 1.8V    |     |
| ------------ | --------- | --------------- | ----------- | --- |
| 23  GND      | Ground    | 24  MIPI_MCLK1  | MIPI clock  |     |
J31
| Pin  Signal   | Description    | Pin  Signal  | Description             |        |
| ------------- | -------------- | ------------ | ----------------------- | ------ |
| 1             |                | 2            |                         |        |
| GND           | Ground         | GND          | Ground                  |        |
| 3  NC         | Not connect    | 4  AF_2V8    | AF 2.8V power supply    |        |
| I2C4_SDA_M0_1 |                | I2C4_SCL_M0  |                         |        |
| 5             | I2C data line  | 6            | I2C clock line          |        |
| V8            |                | _1V8         |                         |        |
|               |                | AVDD2V8_DV   | DVP  2.8V               | power  |
| 7  NC         | Not connect    | 8            |                         |        |
|               |                | P            | supply                  |        |
| CAMERAF_RST   |                | GPIO4_B5_d_1 |                         |        |
| 9             | Camera reset   | 10           | GPIO                    |        |
| _L            |                | V8           |                         |        |
|               |                | MIPI_CSI_RX_ | MIPI CSI positive       |        |
| 11  GND       | Ground         | 12           |                         |        |
|               |                | D1P          | differential data line  |        |
|               |                | 21           |                         |        |

Customize the embedded system based on Your Idea

transceiver output
IMIPI CSI negative
MIPI_CSI_RX_D
| 13  | differential data line   | 14  GND  | Ground  |
| --- | ------------------------ | -------- | ------- |
1N
transceiver output
|               | MIPI CSI positive       |              | MIPI CSI negative        |
| ------------- | ----------------------- | ------------ | ------------------------ |
| MIPI_CSI_RX_D |                         | MIPI_CSI_RX_ |                          |
| 15            | differential data line  | 16           | differential data line   |
| 0P            |                         | D0N          |                          |
|               | transceiver output      |              | transceiver output       |
MIPI CSI positive
MIPI_CSI_RX_
| 17  GND  | Ground   | 18  | differential data line  |
| -------- | -------- | --- | ----------------------- |
CLK0P
transceiver output
MIPI CSI negative
MIPI_CSI_RX_C
| 19  | differential data line  | 20  GND  | Ground  |
| --- | ----------------------- | -------- | ------- |
LK0N
transceiver output
| 21  DVDD1V2  | VDD 1.2V  | 22  VCC1V8_DVP  | VCC 1.8V    |
| ------------ | --------- | --------------- | ----------- |
| 23  GND      | Ground    | 24  MIPI_MCLK0  | MIPI clock  |
2.13 IR (J24)
3 2 1

3-pin connector. It is used to connect the IR receiver.
| Pin  Signal    | Description        | Pin  Signal  | Description  |
| -------------- | ------------------ | ------------ | ------------ |
| 1  VCC3V3_SYS  | 3.3V Power supply  | 2  PWM3_IR   | IR in        |
| 3  GND         | Ground             |              |              |

2.14 UART (J10, J11, J12)
UART2 with 2 wires for debug tools
⚫
Embedded two 64byte FIFO
⚫
Support auto flow control mode for UART1-5
⚫
3 2 1

The J10 is 3-pin connector. The debug serial port baud rate is 1500000.
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
| 1            |              | 2            |              |
UART2DBG_RX  Serial data input   UART2DBG_TX  Serial data output
|     |     | 22  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

| 3  GND  | Ground  |     |     |
| ------- | ------- | --- | --- |
3
4 2 1

The J11 J12 used for RS232.
J11
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
1  VCC3V3_SYS  3.3V power supply  2  UART4_TX_M0  Transmit Data
| 3  UART4_RX_M0  | Receive Data  | 4  GND  | Ground  |
| --------------- | ------------- | ------- | ------- |
J12
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
1  VCC3V3_SYS  3.3V power supply  2  UART5_TX_M1  Transmit Data
| 3  UART5_RX_M1  | Receive Data  | 4  GND  | Ground  |
| --------------- | ------------- | ------- | ------- |

2.15 RS485 (J32, JP2)
SN75176B Differential bus transceiver.
Bidirectional Transceivers
⚫
± 200mV Receiver Input Sensitivity
⚫
50mV Type Receiver Input Hysteresis
⚫

J32
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
RS485_B
| 1    |          | 2   |                   |
| ---- | -------- | --- | ----------------- |
| GND  | Ground   |     | RS-485 Data Line  |

| 3  RS485_A                               | RS-485 Data Line  |     |     |
| ---------------------------------------- | ----------------- | --- | --- |
|                                          |                   |     |     |

|     |     | 23  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

JP2
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
RS485_B
| 1  RS485_A  | RS-485 Data Line  | 2   | RS-485 Data Line  |
| ----------- | ----------------- | --- | ----------------- |

2.16 Button (K3)

| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
SARADC_VIN0_
| 1  GND  | Ground  | 2   | RECOVERY  |
| ------- | ------- | --- | --------- |
KEY/RECOVERY
2.17 4G Module (CON2, P4)
EM3566 adopts the standard PCI Express® MiniCard form factor (MiniPCIe) and provides global
network coverage on the connectivity of 4G. It delivers 50Mbps-up and100Mbps-down data rates on
4G FDD networks and can also be fully backward compatible with existing UMTS and GSM/GPRS
networks.
| 2 1 6 1 8 | 5 2 |     |     |
| --------- | --- | --- | --- |
| 1 1 5 1 7 | 5 1 |     |     |

CON2
| Pin  Signal  | Description    | Pin  Signal   | Description  |
| ------------ | -------------- | ------------- | ------------ |
| 1  4G_OUT_P  | Line output +  | 2  3GVCC      | DC 3.3V      |
| 3  4G_OUT_N  | Line output -  | 4  GND        | Ground       |
| 5  MIC1P     | MIC +          | 6  NC         | Not connect  |
| 7  MIC1N     | MIC -          | 8  SIM_VCC    | SIM power    |
| 9  GND       | Ground         | 10  SIM_DATA  | SIM data     |
| 11  NC       | Not connect    | 12  SIM_CLK   | SIM Clock    |
| 13  NC       | Not connect    | 14  SIM_RST   | SIM Reset    |
| 15  GND      | Ground         | 16  NC        | Not connect  |
| 17  NC       | Not connect    | 18  GND       | Ground       |
| 19  NC       | Not connect    | 20  3GVCC     | DC 3.3V      |
| 21  GND      | Ground         | 22  PERST     | GPIO0_A0_d   |
| 23  NC       | Not connect    | 24  3GVCC     | DC 3.3V      |
|              |                | 24            |              |

Customize the embedded system based on Your Idea

| 25  NC   | Not connect  | 26  GND  | Ground       |
| -------- | ------------ | -------- | ------------ |
| 27  GND  | Ground       | 28  NC   | Not connect  |
| 29  GND  | Ground       | 30  NC   | Not connect  |
| 31  NC   | Not connect  | 32  NC   | Not connect  |
| 33  NC   | Not connect  | 34  GND  | Ground       |
USB2_HOST2_
| 35  GND  | Ground  | 36  | Host data DN  |
| -------- | ------- | --- | ------------- |
DM
USB2_HOST2_
| 37  GND  | Ground  | 38  | Host data DP  |
| -------- | ------- | --- | ------------- |
DP
| 39  3GVCC  | DC 3.3V      | 40  GND       | Ground       |
| ---------- | ------------ | ------------- | ------------ |
| 41  3GVCC  | DC 3.3V      | 42  LED_WWAN  | LED          |
| 43  GND    | Ground       | 44  NC        | Not connect  |
| 45  NC     | Not connect  | 46  NC        | Not connect  |
| 47  NC     | Not connect  | 48  NC        | Not connect  |
| 49  NC     | Not connect  | 50  GND       | Ground       |
| 51  NC     | Not connect  | 52  3GVCC     | DC 3.3V      |

P4 is an auto pop-up SIM card slot which is compatible to the standard SIM Card and can be used
for wireless transmission with a 3G/4G module.
1
7

SIM Card slot (P4)
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
send/receiver  data
| 1  SIM_CLK  | Clock  | 2  SIM_DATA  |     |
| ----------- | ------ | ------------ | --- |
I/O control
| 3  SIM_RST  | Reset             | 4  SIM_VCC  | SIM power supply  |
| ----------- | ----------------- | ----------- | ----------------- |
| 5  SIM_VCC  | SIM power supply  | 6  GND      | Ground            |
| 7  NC       | Not connect       |             |                   |
2.18 Micro SD (J3)
The Micro SD card is used as an external storage device. The MMC controller interface supports up to 4-
bit transfer modes. MMC is always accessible through the carrier board interface.
1
9

|     |     | 25  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

| Pin  Signal   | Description   | Pin  Signal   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| 1  SDMMC0_D2  | SD/MMC data2  | 2  SDMMC0_D3  | SD/MMC data3  |
SD/MMC command
| 3  SDMMC0_CMD  |     | 4  VCC3V3_SD  | 3.3V  |
| -------------- | --- | ------------- | ----- |
signal
| 5  SDMMC0_CLK  | SD/MMC clock  | 6  GND        | Ground        |
| -------------- | ------------- | ------------- | ------------- |
| 7  SDMMC0_D0   | SD/MMC data0  | 8  SDMMC0_D1  | SD/MMC data1  |
SDMMC0_DET_
| 9   | SD/MMC detect signal   |     |     |
| --- | ---------------------- | --- | --- |
L
2.19 WiFi&Bluetooth (U20)

The Realtek RTL8723DS is a low-power consumption module which has incorporated Wi-Fi and
Bluetooth into one chip. The integrated module provides SDIO interface for WiFi, UART / PCM for
Bluetooth.
The WIFI throughput can go up to 150Mbps in theory by using 1x1 802.11n b/g/n MIMO
⚫
Full-featured software utility for easy configuration and management
⚫
⚫  RTL8723DS with shared antenna between WLAN and Bluetooth
RTL8723BS Module Specifications
WiFi: IEEE 802.11b/g/n
Standard
|                  | BT: V2.1+EDR/BT v3.0+BT LE4.2  |     |     |
| ---------------- | ------------------------------ | --- | --- |
| Host Interface   | SDIO 2.0 and UART              |     |     |
| Frequency Range  | 2.4GHz~2.4835GHz               |     |     |
Power Consumption  DC 3.3±0.2V(main power and VDIO power) @ 350 mA (Max)
| Dimension      | 12x12x1.6mm      |     |     |
| -------------- | ---------------- | --- | --- |
| Working Temp.  | -10°C to +70°C   |     |     |
| Power supply   | DC 3.3V (±0.2V)  |     |     |

| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
RF I/O (Connect to
| 1  GND  | Ground  | 2  WL_BT_ANT  |     |
| ------- | ------- | ------------- | --- |
IPEX)
| 3  GND        | Ground               | 4  NC       | Not connect       |
| ------------- | -------------------- | ----------- | ----------------- |
|               |                      | HOST_WAKE_B | HOST wake-up      |
| 5  NC         | Not connect          | 6           |                   |
|               |                      | T_H         | Bluetooth device  |
| 7  BT_WAKE_HO | Bluetooth device to  | 8  NC       | Not connect       |
|               |                      | 26          |                   |

Customize the embedded system based on Your Idea

| ST_H  | wake-up HOST  |     |     |     |
| ----- | ------------- | --- | --- | --- |
9  VBAT_WL  3.3V power supply  10  XTAL_IN  Crystal input(NC)
Internal regulators
WIFI_REG_ON_
| 11  XTAL_OUT  | Crystal output(NC)  |     | 12  | power  |
| ------------- | ------------------- | --- | --- | ------ |
H
enable/disable
| WIFI_WAKE_H   | WLAN        | to  wake-up  |               |               |
| ------------- | ----------- | ------------ | ------------- | ------------- |
| 13            |             |              | 14  WIFI_D2   | WiFi data     |
| OST_H         | HOST        |              |               |               |
| 15  WIFI_D3   | WiFi data   |              | 16  WIFI_CMD  | WiFi command  |
| 17  WIFI_CLK  | WiFi clock  |              | 18  WIFI_D0   | WiFi data     |
| 19  WIFI_D1   | WiFi data   |              | 20  GND       | Ground        |
Internal Buck
21  VIN_LDO_OUT  voltage generation  22  VCCIO_WL  1.8 V power supply
pin
PMIC_32KOUT_
Internal Buck voltage
| 23  VIN_LDO  |     |     | 24  SOC  | LPO  |
| ------------ | --- | --- | -------- | ---- |
generation pin

I2S2_LRCK_TX_
| 25  I2S2_SDI_M0  | PCM Data output  |     | 26  | PCM clock  |
| ---------------- | ---------------- | --- | --- | ---------- |
M0
I2S2_SCLK_TX_
| 27  I2S2_SDO_M0  | PCM data input  |     | 28  | PCM sync signal  |
| ---------------- | --------------- | --- | --- | ---------------- |
M0
| 29  NC   | Not connect  |     | 30  TCXO_IN  | NC           |
| -------- | ------------ | --- | ------------ | ------------ |
| 31  GND  | Ground       |     | 32  NC       | Not connect  |
Enable PIN for
| 33  GND  | Ground  |     | 34  BT_REG_ON_H  | WLAN Device   |
| -------- | ------- | --- | ---------------- | ------------- |
ON: Pull high
| 35  NC           | Not connect     |     | 36  GND          | Ground          |
| ---------------- | --------------- | --- | ---------------- | --------------- |
| 37  NC           | Not connect     |     | 38  NC           | Not connect     |
| 39  NC           | Not connect     |     | 40  NC           | Not connect     |
| UART1_CTSn_      | Bluetooth UART  |     |                  | Bluetooth UART  |
| 41               |                 |     | 42  UART1_RX_M0  |                 |
| M0               | interface       |     |                  | interface       |
|                  | Bluetooth UART  |     | UART1_RTSn_M     | Bluetooth UART  |
| 43  UART1_TX_M0  |                 |     | 44               |                 |
|                  | interface       |     | 0                | interface       |

2.20 SSD (CON3)
M.2 M key socket (PCIe) for NVMe SSD.

|     |     |     | 27  |     |
| --- | --- | --- | --- | --- |

Customize the embedded system based on Your Idea

1
|     |     | 1   | 5 7 6 7 7 5 |
| --- | --- | --- | ----------- |
2 7 5
|     |     | 2   | 5 8 6 8  7 4 |
| --- | --- | --- | ------------ |
7 4

PCIe (for SSD module)
| Pin  Signal  | Description  | Pin  Signal   | Description        |
| ------------ | ------------ | ------------- | ------------------ |
| 1  GND       | Ground       | 2  PCIE_3V3   | 3.3V power supply  |
| 3  GND       | Ground       | 4  PCIE_3V3   | 3.3V power supply  |
| 5  NC        | Not connect  | 6  NC         | Not connect        |
| 7  NC        | Not connect  | 8  NC         | Not connect        |
| 9  GND       | Ground       | 10  DAS       | PCIE DAS           |
| 11  NC       | Not connect  | 12  PCIE_3V3  | 3.3V power supply  |
| 13  NC       | Not connect  | 14  PCIE_3V3  | 3.3V power supply  |
| 15  GND      | Ground       | 16  PCIE_3V3  | 3.3V power supply  |
| 17  NC       | Not connect  | 18  PCIE_3V3  | 3.3V power supply  |
| 19  NC       | Not connect  | 20  NC        | Not connect        |
| 21  GND      | Ground       | 22  NC        | Not connect        |
| 23  NC       | Not connect  | 24  NC        | Not connect        |
| 25  NC       | Not connect  | 26  NC        | Not connect        |
| 27  GND      | Ground       | 28  NC        | Not connect        |
| 29  NC       | Not connect  | 30  NC        | Not connect        |
| 31  NC       | Not connect  | 32  NC        | Not connect        |
| 33  GND      | Ground       | 34  NC        | Not connect        |
| 35  NC       | Not connect  | 36  NC        | Not connect        |
|              |              | PCIE_DEVSL    | PCIE Device Sleep  |
| 37  NC       | Not connect  | 38            |                    |
P
| 39  GND  | Ground  | 40  NC  | Not connect  |
| -------- | ------- | ------- | ------------ |
PCIE20_SATA2
| 41  | PCIe RX -  | 42  NC  | Not connect  |
| --- | ---------- | ------- | ------------ |
_RXN
PCIE20_SATA2
| 43  | PCIe RX +  | 44  NC  | Not connect   |
| --- | ---------- | ------- | ------------- |
_RXP
| 45  GND        | Ground     | 46  NC  | Not connect  |
| -------------- | ---------- | ------- | ------------ |
| 47  SATA2_TXN  | PCIe TX -  | 48  NC  | Not connect  |
PCIE20_PER
| 49  SATA2_TXP  | PCIe TX +  | 50  | PCIe reset  |
| -------------- | ---------- | --- | ----------- |
STn_M2
PCIE20_CLK
| 51  GND  | Ground  | 52  | Clock Request   |
| -------- | ------- | --- | --------------- |
REQn_M2
|     |     | 28  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

| PCIE20_REFCL | PCIe  Reference  | PCIE20_WAK |                 |
| ------------ | ---------------- | ---------- | --------------- |
| 53           |                  | 54         | PCIe PME Wake   |
| KN           | Clock signals -  | En_M2      |                 |
| PCIE20_REFCL | PCIe  Reference  |            |                 |
| 55           |                  | 56  NC     | Not connect     |
| KP           | Clock signals +  |            |                 |
| 57  GND      | Ground           | 58  NC     | Not connect     |
PMIC_32KOU
| 67  NC  | Not connect  | 68  | Suspend Clock (32KHz)  |
| ------- | ------------ | --- | ---------------------- |
T_SOC
| 69  NC   | Not connect  | 70  PCIE_3V3  | 3.3V power supply  |
| -------- | ------------ | ------------- | ------------------ |
| 71  GND  | Ground       | 72  PCIE_3V3  | 3.3V power supply  |
| 73  GND  | Ground       | 74  PCIE_3V3  | 3.3V power supply  |
| 75  GND  | Ground       |               |                    |
2.21 RTC (BT1)

The backup battery (3V) is used to ensure the RTC (frequency 32.768KHz) is still able to work after
power off. Lithium cell model: CR1220.
| Pin  Signal  | Description  | Pin  Signal  | Description  |
| ------------ | ------------ | ------------ | ------------ |
| 1  VBuck     | 3V battery   | 2  GND       | Ground       |

|     |     | 29  |     |
| --- | --- | --- | --- |

Customize the embedded system based on Your Idea

3 Product Configurations
3.1 Standard Contents
| NO.               | Item  | Qty. (PCS)                               | Description  |
| ----------------- | ----- | ---------------------------------------- | ------------ |
| 1  EM3566 board   |       | 1  Standard Content (2GB RAM, 8GB eMMC)  |              |
Android/ Debian/ Buildroot BSP, Documents, tools,
| 2  TF card / CD-ROM  |     | 1   |     |
| -------------------- | --- | --- | --- |
Schematic Drawing, datasheets
| 3  Ethernet cable  |     | 1  1.5m Crossover cable  |     |
| ------------------ | --- | ------------------------ | --- |
| 4  Serial Cable    |     | 1  CH9102X               |     |
| 5  USB Cable       |     | 1  USB OTG               |     |
| 6  Power adaptor   |     | 1  12V/3A DC             |     |
3.2 Optional Parts
•  MIPI camera Module (OV13850)
•  LCD Module (10.1-inch MIPI panel, 10.1-inch LVDS panel, 7-inch LVDS panel)
•
4G Module
•  SSD

  30