CM3566 Reference User Manual

V3.20220326

Boardcon Embedded Design

www.armdesigner.com

Customize the embedded system based on Your Idea

1. Introduction

1.1. About this Manual

This manual is intended to provide the user with an overview of the board and benefits, complete features

specifications, and set up procedures. It contains important safety information as well.

1.2. Feedback and Update to this Manual

To help our customers make the most of our products, we are continually making additional and updated

resources available on the Boardcon website (www.boardcon.com , www.armdesigner.com).

These include manuals, application notes, programming examples, and updated software and hardware.

Check in periodically to see what’s new!

When we are prioritizing work on these updated resources, feedback from customers is the number one

influence,  If  you  have  questions,  comments,  or  concerns  about  your  product  or  project,  please  no

hesitate to contact us at support@armdesigner.com.

1.3. Limited Warranty

Boardcon warrants this product to be free of defects in material and workmanship for a period of one year

from  date  of  buy.  During  this  warranty  period  Boardcon  will  repair  or  replace  the  defective  unit  in

accordance with the following process:

A copy of the original invoice must be included when returning the defective unit to Boardcon. This limited

warranty  does  not  cover  damages  resulting  from  lighting  or  other  power  surges,  misuse,  abuse,

abnormal conditions of operation, or attempts to alter or modify the function of the product.

This warranty is limited to the repair or replacement of the defective unit. In no event shall Boardcon be

liable or responsible for any loss or damages, including but not limited to any lost profits, incidental or

consequential damages, loss of business, or anticipatory profits arising from the use or inability to use

this product.

Repairs make after the expiration of the warranty period are subject to a repair charge and the cost of

return shipping. Please contact Boardcon to arrange for any repair service and to obtain repair charge

information.

1

Customize the embedded system based on Your Idea

Content

1 CM3566 Introduction .............................................................................................................................. 3
1.1 Summary ..................................................................................................................................... 3
1.2 Features ....................................................................................................................................... 3
1.3 CM3566 Block Diagram ............................................................................................................... 5
1.4 CM3566 specifications ................................................................................................................. 6
1.5 CM3566 PCB Dimension ............................................................................................................. 7
1.6 CM3566 Pin Definition ................................................................................................................. 7
1.7 Development Kit (EM3566) ........................................................................................................ 14
2 Hardware Design Guide ....................................................................................................................... 15
2.1 Peripheral Circuit Reference ...................................................................................................... 15
2.2 PCB Footprint ............................................................................................................................ 16
3 Product Electrical Characteristics ........................................................................................................ 17
3.1 Dissipation and Temperature ..................................................................................................... 17
3.2 Reliability of Test ........................................................................................................................ 17
3.3 Certifications .............................................................................................................................. 18

2

Customize the embedded system based on Your Idea

1 CM3566 Introduction

1.1 Summary

The CM3566 system-on-module is equipped with Rockchip’s RK3566 with quad-core Cortex-A55 CPU,

Mali-G52 GPU, and 1 TOPs NPU.

It is designed specifically for the AI devices such as industrial controller, IoT devices, intelligent interactive

devices,  personal  computers  and  robots.  The  high  performance  and  low  power  solution  can  help

customers to introduce new technologies more quickly and enhance the overall solution efficiency.

1.2 Features

•  Microprocessor

- Quad-core Cortex-A55 up to 1.8G

- 32KB I-cache and 32KB D-cache for each core, 512KB L3 cache

- 1 TOPS Neural Process Unit

- Mali-G52 up to 0.8G

Memory Organization

- LPDDR4 or LPDDR4X RAM up to 8GB

- eMMC up to 128GB

•  Boot ROM

- Supports system code download through USB OTG or SD

•  Trust Execution Environment system

- Supports secure OTP and multiple cipher engine

•  Video Decoder/Encoder

- Supports video decoding up to 4K@50fps

- Supports H.264 encode

- H.264 HP encoding up to 1080p@100fps

- Picture size up t0 8192x8192

•  Display Subsystem

-

Video Output

Supports HDMI 2.0 transmitter with HDCP 1.4/2.2, up to 4K@50fps

Supports 4 lanes MIPI DSI up to 2560x1440@60Hz

Or LVDS interface up to 1920x1080@60Hz

Supports ePD1.3 interface up to 2560x1600@60fps

Supports BT-656 8bit output

-

Image in

Supports up to 16bit DVP interface

  Supports MIPI CSI 4lanes interface

  Or 2ch MIPI CSI 2lanes interfaces

•

I2S/PCM/ AC97

- Four I2S/PCM interface

3

Customize the embedded system based on Your Idea

- Support Mic array Up to 8ch PDM/TDM interface

- One SPDIF output

•  USB and PCIE

- Three 2.0 USB interfaces

- One USB 2.0 OTG, and two 2.0 USB hosts

-One USB 3.0 host or SATA interface.

-One 1lane PCIE or SATA interface.

•  Ethernet

- GMAC/EMAC

- Support 10/100/1000Mbit/s data transfer rates

- Support MII/RMII/RGMII PHY interface

•

I2C

- Up to Four I2C

- Support standard mode and fast mode(up to 400kbit/s)

•  SDIO

- Support SDIO 3.0 protocol

•  SPI

- Up to four SPI controllers,

- Full-duplex synchronous serial interface

•  UART

- Support up to 9 UARTs

- UART2 with 2 wires for debug tools

- Embedded two 64byte FIFO

- Support auto flow control mode for UART1-5

•  SATA

- Two SATA host controller

- Support SATA 1.5Gb/s, 3.0Gb/s and SATA 6.0Gb/s

•  ADC

- Up to Three ADC channels

- 10-bit resolution

- Voltage input range between 0V to 1.8V

- Support up to 1MS/s sampling rate

•  PWM

- 14 on-chip PWMs with interrupt-based operation

- Support 32bit time/counter facility

- IR option on PWM3/7/11/15

•

Power unit

- Discrete Power on board

- Single 3.3V input

- Very low RTC consume current, less 5uA at 3V button Cell

4

Customize the embedded system based on Your Idea

1.3 CM3566 Block Diagram

1.3.1 RK3566 Block Diagram

5

1.3.2 Development board (EM3566) Block Diagram

Customize the embedded system based on Your Idea

1.4 CM3566 specifications

Feature

Specifications

CPU

DDR

Quad-core Cortex-A55

2GB (up to 8GB)

eMMC FLASH

8GB (up to 128GB)

Power

DC 3.3V

LVDS/MIPI DSI

4-Lane

I2S

MIPI CSI

SATA

HDMI out

Camera

USB

Ethernet

3-CH

4-Lane

2-CH

1-CH

1-CH(DVP) and 2-CH(CSI)

2-CH (USB HOST2.0), 1-CH(OTG 2.0) and 1-CH(USB 3.0)

10/100/1000M MAC

If MAC is not needed, it can be designed to 2x UART and 2x SPI.

SDMMC

2-CH

6

Customize the embedded system based on Your Idea

SPDIF TX

I2C

SPI

UART

PWM

ADC IN

1-CH

4-CH

4-CH

8-CH, 1-CH(DEBUG)

14-CH

3-CH

Board Dimension

40 x 47mm

1.5 CM3566 PCB Dimension

1.6 CM3566 Pin Definition

Pin

Signal

Description or functions

GPIO serial

IO Voltage

1

2

3

4

VCC3V3_SYS

3.3V Main Power input

VCC3V3_SYS

3.3V Main Power input

VCC3V3_SYS

3.3V Main Power input

VCC_RTC

RTC button Cell Power input

3.3V

3.3V

3.3V

3.0V

7

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

5

6

7

8

9

PMIC_32KOUT

32.768khz OD output(PU 10K)

GND

Ground

HDMITX_CEC_M0

GPIO4_D1_u

HDMITX_SDA

Pull up 2.2K onboard

GPIO4_D0_u

HDMITX_SCL

Pull up 2.2K onboard

GPIO4_C7_u

10  GMAC1_RXER_M0  RMII receive error(V3 changed)  GPIO3_B4_d

GPIO3_C0_d

GPIO3_B5_d

GPIO3_B6_d

GPIO3_B7_d

GPIO3_B3_d

GPIO3_B2_d

GPIO3_B1_d

GPIO3_A5_d

GPIO3_A4_d

GPIO3_A7_d

GPIO3_A2_d

GPIO3_A3_d

GPIO3_A6_d

11

GMAC1_MCLKINO

RGMII reference clock

UT_M0

input(125Mhz)

12  GND

Ground

13  GMAC1_TXD0_M0

14  GMAC1_TXD1_M0

15  GMAC1_TXEN_M0

16

GMAC1_RXDV_CR

S_M0

17  GMAC1_RXD1_M0

18  GMAC1_RXD0_M0

19  GMAC1_RXD3_M0

20  GMAC1_RXD2_M0

21  GMAC1-RXCLK_M0

22  GMAC1_TXD2_M0

23  GMAC1_TXD3_M0

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

GMAC1_TXCLK_M

0

MIPI_DSI_TX0_D3

N/LVDS_TX0_D3N

MIPI_DSI_TX0_D3P

/LVDS_TX0_D3P

MIPI_DSI_TX0_D2

N/LVDS_TX0_D2N

MIPI_DSI_TX0_D2P

/LVDS_TX0_D2P

MIPI_DSI_TX0_D1

N/LVDS_TX0_D1N

MIPI_DSI_TX0_D1P

/LVDS_TX0_D1P

MIPI_DSI_TX0_D0

N/LVDS_TX0_D0N

MIPI_DSI_TX0_D0P

/LVDS_TX0_D0P

MIPI_DSI_TX0_CLK

N/LVDS_TX0_CLKN

MIPI DSI or LVDS TXD3N

MIPI DSI or LVDS TXD3P

MIPI DSI or LVDS TXD2N

MIPI DSI or LVDS TXD2P

MIPI DSI or LVDS TXD1N

MIPI DSI or LVDS TXD1P

MIPI DSI or LVDS TXD1N

MIPI DSI or LVDS TXD1P

MIPI DSI or LVDS TXD1N

34  MIPI_DSI_TX0_CLK MIPI DSI or LVDS TXD1P

8

3.3V

0V

3.3V

3.3V

3.3V

3.3V

3.3V

0V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

P/LVDS_TX0_CLKP

35  HDMI_TX_HPDIN

HDMI HPD input

36  HDMI_TXCLKN

37  HDMI_TXCLKP

38  HDMI_TX0N

39  HDMI_TX0P

40  HDMI_TX1N

41  HDMI_TX1P

42  HDMI_TX2N

43  HDMI_TX2P

44

45

MIPI_CSI_RX_CLK

1N

MIPI_CSI_RX_CLK

1P

MIPI CSI1 CLKN

MIPI CSI1 CLKP

46  MIPI_CSI_RX_D3N  CSI0 RXD3N or CSI1 RXD1N

47  MIPI_CSI_RX_D3P  CSI0 RXD3P or CSI1 RXD1P

48  MIPI_CSI_RX_D2N  CSI0 RXD2N or CSI1 RXD0N

49  MIPI_CSI_RX_D2P  CSI0 RXD2P or CSI1 RXD0P

50  MIPI_CSI_RX_D1P  CSI0 RXD1P

51  MIPI_CSI_RX_D1N  CSI0 RXD1N

52  MIPI_CSI_RX_D0N  CSI0 RXD0N

53  MIPI_CSI_RX_D0P  CSI0 RXD0P

54

55

MIPI_CSI_RX_CLK

0N

MIPI_CSI_RX_CLK

0P

MIPI CSI0 CLKN

MIPI CSI0 CLKP

56  GND

Ground

57

58

59

60

61

62

63

64

65

66

PWM5

LCD_BL_PWM

PWM4

PWM3_IR

PCIE20_SATA2_RX

P

PCIE20_SATA2_RX

N

PCIE20_SATA2_TX

N

PCIE20_SATA2_TX

P

PCIE20_REFCLKP

PCIE20_REFCLKN

USB3_HOST1_SST

XP

PCIE or SATA2 RXP

PCIE or SATA2 RXN

PCIE or SATA2 TXN

PCIE or SATA2 TXP

USB3.0 or SATA1 TXP

9

GPIO0_C4_d

GPIO0_C3_d

GPIO0_C2_d

3.3V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

0V

3.3V

3.3V

3.3V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

USB3.0 or SATA1 TXN

USB3.0 or SATA1 RXN

USB3.0 or SATA1 RXP

67

68

69

USB3_HOST1_SST

XN

USB3_HOST1_SSR

XP

USB3_HOST1_SSR

XN

70  USB_OTG0_DM

71  USB_OTG0_DP

72  USB3_HOST1_DP

73  USB3_HOST1_DM

74

75

76

77

78

79

80

81

82

83

84

85

EDP_TX_D2N

EDP_TX_D2P

EDP_TX_D1N

EDP_TX_D1P

EDP_TX_D0N

EDP_TX_D0P

EDP_TX_D3N

EDP_TX_D3P

EDP_TX_AUXN

EDP_TX_AUXP

SDMMC0_DET_L

SDMMC0_CLK

UART5_TX_M0

86  GND

Ground

87

88

89

90

91

SDMMC0_CMD

UART5_RX_M0

SDMMC0_D3

UART5_RTSn_M0

SDMMC0_D2

UART5_CTSn_M0

SDMMC0_D1

UART6_RX_M1

SDMMC0_D0

UART6_TX_M1

USB OTG VBUS input

92  USB_OTG0_ID

93

USB_OTG0_VBUS

DET

94  UART1_RX_M0

95  UART1_TX_M0

96  UART1_RTSn_M0

97  UART1_CTSn_M0

98

BT_REG_ON_H

I2S2_SCLK_RX_M0

GPIO0_A4_u

GPIO2_A2_d

GPIO2_A1_u

GPIO2_A0_u

GPIO1_D7_u

GPIO1_D6_u

GPIO1_D5_u

GPIO2_B3_u

GPIO2_B4_u

GPIO2_B5_u

GPIO2_B6_u

GPIO2_B7_d

99

100

101

BT_WAKE_HOST_

H

HOST_WAKE_BT_

H

WIFI_WAKE_HOST

_H

I2S2_LRCLK_RX_M0

GPIO2_C0_d

I2S2_MCLK_M0

GPIO2_C1_d

I2C4_SCL_M1

GPIO2_B2_d

10

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

3.3V

3.3V

0V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

GPIO2_C6_d

GPIO2_C2_d

GPIO2_C3_d

GPIO2_C4_d

GPIO2_C5_d

GPIO2_A6_u

GPIO2_A5_u

GPIO2_A4_u

GPIO2_A3_u

GPIO2_A7_u

GPIO2_B0_d

102  WIFI_REG_ON_H

UART8_RX_M0

103

I2S2_SCLK_TX_M0  SPI2_MISO_M0

104

I2S2_LRCK_TX_M0  SPI2_MOSI_M0

105

I2S2_SDO_M0

SPI2_CS0_M0

106

I2S2_SDI_M0

UART8_TX_M0

107  SDMMC1_D3

UART7_TX_M0

108  SDMMC1_D2

UART7_RX_M0

109  SDMMC1_D1

UART6_TX_M0

110  SDMMC1_D0

UART6_RX_M0

111  SDMMC1_CMD

UART9_RX_M0

112  SDMMC1_CLK

UART9_TX_M0

113  GND

Ground

114  SARADC_VIN3

115

116

SARADC_VIN2_HP

_HOOK

SARADC_VIN0_KE

Y/RECOVERY

Pull up 10K onboard

117  GND

Ground

118

119

120

PCIE20_PERSTn_

M2

PCIE20_WAKEn_M

2

PCIE20_CLKREQn

_M2

121  UART3_RX_M0

122  UART3_TX_M0

PDM_SDI1_M0

GPIO1_B2_d

PDM_SDI2_M0

GPIO1_B1_d

PDM_SDI3_M0

GPIO1_B0_d

AudioPWM_LOUT_P/I2C3_SDA

_M0

AudioPWM_LOUT_N/I2C3_SCL

_M0

GPIO1_A0_u

GPIO1_A1_u

123  UART4_RX_M0

PDM_CLK1_M0/SPDIF_TX_M0  GPIO1_A4_d

124  UART4_TX_M0

AudioPWM_ROUT_P

/PDM_CLK0_M0

GPIO1_A6_d

GPIO1_A5_d

I2S1_LRCK_TX_M0

_PMIC

I2S1_SDI0_M0/PD

M_SDI0_M0_PMIC

I2S1_SCLK_TX_M0

_PMIC

125

126

127

128

129

PDM_SDI0_M0

GPIO1_B3_d

UART3_CTSn_M0

GPIO1_A3_d

I2S1_SDO0_M0_P

AudioPWM_ROUT_N/UART4_C

MIC

TSn_M0

GPIO1_A7_d

I2S1_MCLK_M0_P

MIC

UART3_RTSn_M0

GPIO1_A2_d

130  GND

Ground

11

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

0V

1.8V

1.8V

1.8V

0V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

0V

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

131  SPI0_CS0_M0

132  SPI0_MISO_M0

PWM7

PWM6

133  SPI0_MOSI_M0

I2C2_SDA_M0

134  SPI0_CLK_M0

I2C2_SCL_M0

135  SPI3_CS0_M1

I2S3_SDI _M1

136  SPI3_MISO_M1

I2S3_SDO _M1

GPIO0_C6_d

GPIO0_C5_d

GPIO0_B6_u

GPIO0_B5_u

GPIO4_C6_d

GPIO4_C5_d

137  SPI3_MOSI_M1

I2S3_SCLK_M1

GPIO4_C3_d

138  SPI3_CLK_M1

I2S3_MCLK_M1

139  LCD_PWREN_H

140  PWM0_M0

141  UART5_RX_M1

142  UART5_TX_M1

143  UART2DBG_RX

UART2 for Debug

144  UART2DBG_TX

UART2 for Debug

I2S3_LRCK_M1/EDP_HPDIN_

M0

145  SPDIF_TX_M2

146  GPIO0_A6_d

147  GPIO0_A3_u

148  GPIO0_A0_d

149  CAMERAF_RST_L

CAM_CLKOUT1

150  CAMERAB_RST_L

151  CIF_8BIT_D7

152  CIF_8BIT_D6

153  CIF_8BIT_D5

154  CIF_8BIT_D4

155  CIF_8BIT_D3

156  CIF_8BIT_D2

157  CIF_8BIT_D1

158  CIF_8BIT_D0

159  GND

CIF_D15

CIF_D14

CIF_D13

CIF_D12

CIF_D11

CIF_D10

CIF_D9

CIF_D8

Ground

160  USB2_HOST2_DM

HOST2_DM

161  USB2_HOST2_DP

HOST2_DP

162  USB2_HOST3_DP

HOST3_DP

163  USB2_HOST3_DM

HOST3_DM

164  CIF_8BIT_VSYNC

165  CIF_8BIT_HREF

166  CIF_8BIT_CLKIN

167  GND

Ground

168  CIF_CLKOUT

169  VOP-BT656_D7_M1  CIF_D7

170  VOP-BT656_D6_M1  CIF_D6

171  VOP-BT656_D5_M1  CIF_D5

12

GPIO4_C2_d

GPIO0_C7_d

GPIO0_B7_d

GPIO3_C3_d

GPIO3_C2_d

GPIO0_D0_u

GPIO0_D1_u

GPIO4_C4_d

GPIO4_B0_d

GPIO4_B1_d

GPIO4_A5_d

GPIO4_A4_d

GPIO4_A3_d

GPIO4_A2_d

GPIO4_A1_d

GPIO4_A0_d

GPIO3_D7_d

GPIO3_D6_d

GPIO4_B7_d

GPIO4_B6_d

GPIO4_C1_d

GPIO4_C0_d

GPIO3_D5_d

GPIO3_D4_d

GPIO3_D3_d

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

3.3V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

0V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

0V

1.8V

1.8V

1.8V

1.8V

Pin

Signal

Description or functions

GPIO serial

IO Voltage

Customize the embedded system based on Your Idea

172  VOP-BT656_D4_M1  CIF_D4

173  VOP-BT656_D3_M1  CIF_D3

174  VOP-BT656_D2_M1  CIF_D2

175  VOP-BT656_D1_M1  CIF_D1

176  VOP-BT656_D0_M1  CIF_D0

177

VOP_BT656_CLK_

M1

178  GPIO4_B5_d_1V8

179

I2C4_SDA_M0_1V8  Pull up 2.2K onboard

180

I2C4_SCL_M0_1V8  Pull up 2.2K onboard

181  GND

Ground

182

I2C1_SDA

Pull up 2.2K onboard

183

I2C1_SCL

Pull up 2.2K onboard

184  GPIO0_A5_d

PCIE20_CLKREQn_M0

185  GMAC1_MDIO_M0

186  GMAC1_MDC_M0

Note:
I2C1 can’t be used for exclusive bus, Such as CTP.
RGMII default is 3.3V IO, but can change to 1.8V.

GPIO3_D2_d

GPIO3_D1_d

GPIO3_D0_d

GPIO3_C7_d

GPIO3_C6_d

GPIO4_B4_d

GPIO4_B2_d

GPIO4_B3_d

GPIO0_B4_u

GPIO0_B3_u

GPIO3_C5_d

GPIO3_C4_d

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

1.8V

0V

3.3V

3.3V

3.3V

3.3V

3.3V

13

Customize the embedded system based on Your Idea

1.7 Development Kit (EM3566)

14

Customize the embedded system based on Your Idea

2 Hardware Design Guide

2.1 Peripheral Circuit Reference

2.1.1 External Power

2.1.2 Debug Circuit

15

2.1.3 USB OTG Interface Circuit

Customize the embedded system based on Your Idea

2.2 PCB Footprint

16

Customize the embedded system based on Your Idea

3 Product Electrical Characteristics

3.1 Dissipation and Temperature

Symbol

Parameter

Min

VCC3V3_SYS

Isys_in

System IO

Voltage

VCC3V3_SYS

input Current

VCC_RTC

RTC Voltage

Symbol

Parameter

Iirtc

Ta

Tstg

RTC input

Current

Operating

Temperature

Storage

Temperature

3.3-5%

1.8

Min

-0

-40

3.2 Reliability of Test

Typ

3.3

1200

3

Typ

5

Max

3.3+5%

3.4

Max

8

70

85

Unit

V

mA

V

Unit

uA

°C

°C

Contents

Result

Contents

Result

Contents

Result

Low Temperature Operating Test

Operating 4h in Low temperature

-20°C±2°C

High Temperature Operating Test

pass

Operating 8h in high temperature

65°C±2°C

pass

Operating Life Test

Operating in room

pass

120h

17

Customize the embedded system based on Your Idea

3.3 Certifications

18

