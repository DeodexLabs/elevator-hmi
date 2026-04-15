RK3566 Datasheet Rev 1.1
Rockchip
RK3566
Datasheet
Revision 1.1
March. 2021
Copyright 2021 © Rockchip Electronics Co., Ltd. 1

RK3566 Datasheet                                                   Rev 1.1
Revision History
| Date        | Revision                         | Description  |
| ----------- | -------------------------------- | ------------ |
| 2021-3-5    | 1.1  Update marking information  |              |
| 2020-12-10  | 1.0  Initial release             |              |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      2

RK3566 Datasheet Rev 1.1
Table of Content
Table of Content ...................................................................................................... 3
Figure Index ........................................................................................................... 4
Table Index ............................................................................................................. 5
Warranty Disclaimer ................................................................................................. 6
Chapter 1 Introduction ..................................................................................... 7
1.1 Overview ............................................................................................... 7
1.2 Features ................................................................................................ 7
1.3 Block Diagram ...................................................................................... 19
Chapter 2 Package Information......................................................................... 20
2.1 Order Information ................................................................................. 20
2.2 Top Marking ......................................................................................... 20
2.3 FCCSP565L Dimension ........................................................................... 21
2.4 Ball Map .............................................................................................. 23
2.5 Pin Number List .................................................................................... 23
2.6 Power/Ground IO Description .................................................................. 29
2.7 Function IO Description .......................................................................... 32
2.8 IO Pin Name Description ........................................................................ 41
Chapter 3 Electrical Specification ...................................................................... 51
3.1 Absolute Ratings ................................................................................... 51
3.2 Recommended Operating Condition ......................................................... 52
3.3 DC Characteristics ................................................................................. 53
3.4 Electrical Characteristics for General IO .................................................... 54
3.5 Electrical Characteristics for PLL .............................................................. 55
3.6 Electrical Characteristics for USB 2.0 Interface .......................................... 55
3.7 Electrical Characteristics for DDR IO......................................................... 56
3.8 Electrical Characteristics for TSADC.......................................................... 57
3.9 Electrical Characteristics for MIPI DSI ....................................................... 57
3.10 Electrical Characteristics for MIPI CSI ..................................................... 57
3.11 Electrical Characteristics for HDMI .......................................................... 57
3.12 Electrical Characteristics for multi-PHY .................................................... 58
Chapter 4 Thermal Management ....................................................................... 59
4.1 Overview ............................................................................................. 59
4.2 Package Thermal Characteristics ............................................................. 59
Copyright 2021 © Rockchip Electronics Co., Ltd. 3

RK3566 Datasheet Rev 1.1
Figure Index
Fig.1-1 Block Diagram ......................................................................................... 19
Fig.2-1 Package definition .................................................................................... 20
Fig.2-2 Package Top View .................................................................................... 21
Fig.2-3 Package bottom view ................................................................................ 21
Fig.2-4 Package side view .................................................................................... 22
Fig.2-5 Package dimension ................................................................................... 22
Fig.2-6 Ball Map ................................................................................................. 23
Copyright 2021 © Rockchip Electronics Co., Ltd. 4

RK3566 Datasheet Rev 1.1
Table Index
Table 2-1 Pin Number List Information ................................................................... 23
Table 2-2 Power/Ground IO information ................................................................. 29
Table 2-3 Function IO description .......................................................................... 40
Table 2-4 IO function description list ..................................................................... 41
Table 3-1 Absolute ratings.................................................................................... 51
Table 3-2 Recommended operating condition .......................................................... 52
Table 3-3 DC Characteristics ................................................................................. 53
Table 3-4 Electrical Characteristics for Digital General IO .......................................... 54
Table 3-5 Electrical Characteristics for Frac PLL ....................................................... 55
Table 3-6 Electrical Characteristics for Int-PLL ......................................................... 55
Table 3-7 Electrical Characteristics for USB 2.0 Interface .......................................... 55
Table 3-8 Electrical Characteristics for DDR IO ........................................................ 56
Table 3-9 Electrical Characteristics for TSADC ......................................................... 57
Table 3-10 Electrical Characteristics for MIPI DSI .................................................... 57
Table 3-11 Electrical Characteristics for MIPI CSI ..................................................... 57
Table 3-12 Electrical Characteristics for HDMI ......................................................... 57
Table 3-13 Electrical Characteristics for PCIe PHY .................................................... 58
Table 4-1 Thermal Resistance Characteristics .......................................................... 59
Copyright 2021 © Rockchip Electronics Co., Ltd. 5

RK3566 Datasheet Rev 1.1
Warranty Disclaimer
Rockchip Electronics Co., Ltd makes no warranty, representation or guarantee (expressed, implied, statutory, or otherwise)
by or with respect to anything in this document, and shall not be liable for any implied warranties of non-infringement,
merchantability or fitness for a particular purpose or for any indirect, special or consequential damages.
Information furnished is believed to be accurate and reliable. However, Rockchip Electronics Co., Ltd assumes no
responsibility for the consequences of use of such information or for any infringement of patents or other rights of third
parties that may result from its use.
Rockchip Electronics Co., Ltd’s products are not designed, intended, or authorized for using as components in systems
intended for surgical implant into the body, or other applications intended to support or sustain life, or for any other
application in which the failure of the Rockchip Electronics Co., Ltd’s product could create a situation where personal injury or
death may occur, should buyer purchase or use Rockchip Electronics Co., Ltd’s products for any such unintended or
unauthorized application, buyers shall indemnify and hold Rockchip Electronics Co., Ltd and its officers, employees,
subsidiaries, affiliates, and distributors harmless against all claims, costs, damages, expenses, and reasonable attorney fees
arising out of, either directly or indirectly, any claim of personal injury or death that may be associated with such unintended
or unauthorized use, even if such claim alleges that Rockchip Electronics Co., Ltd was negligent regarding the design or
manufacture of the part.
Copyright and Patent Right
Information in this document is provided solely to enable system and software implementers to use Rockchip Electronics Co.,
Ltd ’s products. There are no expressed or implied copyright licenses granted hereunder to design or fabricate any integrated
circuits or integrated circuits based on the information in this document.
Rockchip Electronics Co., Ltd does not convey any license under its patent rights nor the
rights of others.
All copyright and patent rights referenced in this document belong to their respective owners
and shall be subject to corresponding copyright and patent licensing requirements.
Trademarks
Rockchip and RockchipTM logo and the name of Rockchip Electronics Co., Ltd’s products are trademarks of Rockchip
Electronics Co., Ltd. and are exclusively owned by Rockchip Electronics Co., Ltd. References to other companies and their
products use trademarks owned by the respective companies and are for reference purpose only.
Confidentiality
The information contained herein (including any attachments) is confidential. The recipient hereby acknowledges the
confidentiality of this document, and except for the specific purpose, this document shall not be disclosed to any third party.
Reverse engineering or disassembly is prohibited.
ROCKCHIP ELECTRONICS CO.,LTD. RESERVES THE RIGHT TO MAKE CHANGES IN ITS PRODUCTS OR PRODUCT
SPECIFICATIONS WITH THE INTENT TO IMPROVE FUNCTION OR DESIGN AT ANY TIME AND WITHOUT NOTICE
AND IS NOT REQUIRED TO UNDATE THIS DOCUMENTATION TO REFLECT SUCH CHANGES.
Copyright © 2021 Rockchip Electronics Co., Ltd.
All rights reserved. No part of this publication may be reproduced, stored in a retrieval system, or transmitted in any form or
by any means, electric or mechanical, by photocopying, recording, or otherwise, without the prior written consent of Rockchip
Electronics Co., Ltd.
Copyright 2021 © Rockchip Electronics Co., Ltd. 6

RK3566 Datasheet Rev 1.1
Chapter 1 Introduction
1.1 Overview
RK3566 is a high-performance and low power quad-core application processor designed for
personal mobile internet device and AIoT equipment.
Many embedded powerful hardware engines are provided to optimize performance for high-
end application. RK3566 supports almost full-format H.264 decoder by 4K@60fps, H.265
decoder by 4K@60fps, also support H.264/H.265 encoder by 1080p@60fps, high-quality
JPEG encoder/decoder.
Embedded 3D GPU makes RK3566 completely compatible with OpenGL ES 1.1/2.0/3.2,
OpenCL 2.0 and Vulkan 1.1. Special 2D hardware engine will maximize display performance
and provide very smoothly operation.
The build-in NPU supports INT8/INT16/FP16/BFP16 MAC hybrid operation. In addition, with
its strong compatibility, network models based on a series of frameworks such as
TensorFlow/MXNet/PyTorch/Caffe can be easily converted.
RK3566 has high-performance external memory interface(DDR3/DDR3L/DDR4
/LPDDR3/LPDDR4/LPDDR4X) capable of sustaining demanding memory bandwidths.
1.2 Features
The features listed below which may or may not be present in actual product, may be
subject to the third party licensing requirements. Please contact Rockchip for actual product
feature configurations and licensing requirements.
1.2.1 Microprocessor
 Quad-core ARM Cortex-A55 CPU
 ARM Neon Advanced SIMD (single instruction, multiple data) support for accelerated
media and signal processing computation
 Include VFP hardware to support single and double-precision operations
 ARMv8 Cryptography Extensions
 Integrated 32KB L1 instruction cache, 32KB L1 data cache
 512KB unified system L3 cache
 TrustZone technology support
 Separate power domains for CPU core system to support internal power switch and
externally turn on/off based on different application scenario
 PD_A55_0: 1st Cortex-A55 + Neon + FPU + L1 I/D Cache
 PD_A55_1: 2nd Cortex-A55 + Neon + FPU + L1 I/D Cache
 PD_A55_2: 3rd Cortex-A55 + Neon + FPU + L1 I/D Cache
 PD_A55_3: 4th Cortex-A55 + Neon + FPU + L1 I/D Cache
 One isolated voltage domain
1.2.2 Neural Process Unit
 Neural network acceleration engine with processing performance up to 0.8 TOPS
 Support integer 8, integer 16 convolution operation
 Support deeplearning frameworks: TensorFlow, TF-lite, Pytorch, Caffe, ONNX, MXNet,
Keras, Darknet
 One isolated voltage domain
1.2.3 Memory Organization
 Internal on-chip memory
 BootROM
 SYSTEM_SRAM in the voltage domain of VD_LOGIC
Copyright 2021 © Rockchip Electronics Co., Ltd. 7

RK3566 Datasheet Rev 1.1
 PMU_SRAM in the voltage domain of VD_PMU for low power application
 External off-chip memory
 DDR3/DDR3L/DDR4/LPDDR3/LPDDR4/LPDDR4X①
 SPI Nor/Nand Flash
 eMMC
 SD_Card
 8bits Async Nand Flash
 8bits toggle Nand Flash
 8bits ONFI Nand Flash
1.2.4 Internal Memory
 Internal BootRom
 Support system boot from the following device:
 SPI Flash interface
 Nand Flash
 eMMC interface
 SDMMC interface
 Support system code download by the following interface:
 USB OTG interface (Device mode)
 SYSTEM_SRAM
 Size: 64KB
 PMU_SRAM
 Size: 8KB
1.2.5 External Memory or Storage device
 Dynamic Memory Interface
 Compatible with JEDEC standards
 Compatible with DDR3/DDR3L/LPDDR3/DDR4/LPDDR4/LPDDR4X
 Support 32bits data width, 2 ranks (chip selects), total addressing space is
8GB(max) for DDR3/DDR3L/DDR4
 Support 32bits data width, 4 ranks (chip selects), total addressing space is
8GB(max) for LPDDR3/LPDDR4/LPDDR4X
 Low power modes, such as power-down and self-refresh for SDRAM
 Compensation for board delays and variable latencies through programmable
pipelines
 Programmable output and ODT impedance with dynamic PVT compensation
 eMMC Interface
 Compatible with standard iNAND interface
 Compatible with eMMC specification 4.41, 4.51, 5.0 and 5.1
 Support three data bus width: 1bit, 4bits or 8bits
 Support HS200;
 Support CMD Queue
 SD/MMC Interface
 Compatible with SD3.0, MMC ver4.51
 Data bus width is 4bits
 Nand Flash Interface
 Support async nand flash, each channel 8bits, up to 4 banks
 Support ONFI Synchronous Flash Interface, each channel 8bits, up to 4 banks
 Support Toggle Flash Interface, each channel 8bits, up to 4 banks
 Support sync DDR nand flash, each channel 8bits, up to 4 banks
 Support LBA nand flash in async or sync mode
Copyright 2021 © Rockchip Electronics Co., Ltd. 8

RK3566 Datasheet Rev 1.1
 Support SLC,MLC,2D/3D TLC nand flash
 Up to 70bits/1KB hardware ECC
 For DDR nand flash, support DLL bypass and 1/4 or 1/8 clock adjust, maximum
clock rate is 75MHz
 For async nand flash, support configurable interface timing , maximum data rate is
16bits/cycle
 SPI Flash Interface
 Support Serial NOR Flash, NAND Flash, pSRAM and SRAM
 Support SDR mode
 Support 1bit/2bit/4bit data width
1.2.6 System Component
 CRU (clock & reset unit)
 Support clock gating control for individual components
 One oscillator with 24MHz clock input
 Support global soft-reset control for whole chip, also individual soft-reset for each
component
 MCU
 32bits microcontroller core
 Harvard architecture separate Instruction and Data memories
 Integrated Programmable Interrupt Controller (IPIC)
 Integrated Debug Controller with JTAG interface
 PMU(power management unit)
 5 separate voltage domains(VD_CORE/VD_LOGIC/VD_NPU/VD_GPU/VD_PMU)
 15 separate power domains, which can be power up/down by software based on
different application scenes
 Multiple configurable work modes to save power by different frequency or
automatic clock gating control or power domain on/off control
 Timer
 Six 64bits timers with interrupt-based operation for non-secure application
 Two 64bits timers with interrupt-based operation for secure application
 Support two operation modes: free-running and user-defined count
 Support timer work state checkable
 Watchdog
 32bits watchdog counter
 Counter counts down from a preset value to 0 to indicate the occurrence of a
timeout
 WDT can perform two types of operations when timeout occurs:
 Generate a system reset
 First generate an interrupt and if this is not cleared by the service routine by
the time a second timeout occurs then generate a system reset
 Programmable reset pulse length
 Totally 16 defined-ranges of main timeout period
 One Watchdog for non-secure application
 One Watchdog for secure application
 Interrupt Controller
 Support 3 PPI interrupt sources and 256 SPI interrupt sources input from different
components
 Support 16 software-triggered interrupts
 Two interrupt outputs (nFIQ and nIRQ) separately for each Cortex-A55, both are
low-level sensitive
 Support different interrupt priority for each interrupt source, and they are always
Copyright 2021 © Rockchip Electronics Co., Ltd. 9

RK3566 Datasheet Rev 1.1
software-programmable
 Mailbox
 One Mailbox in SoC to service Cortex-A55 and MCU communication
 Support four mailbox elements per mailbox, each element includes one data word,
one command word register and one flag bit that can represent one interrupt
 Provide 32 lock registers for software to use to indicate whether mailbox is
occupied
 DMAC
 Two identical DMAC blocks supported(DMAC0/DMAC1)
 Micro-code programming based DMA
 The specific instruction set provides flexibility for programming DMA transfers
 Linked list DMA function is supported to complete scatter-gather transfer
 Support internal instruction cache
 Embedded DMA manager thread
 Support data transfer types with memory-to-memory, memory-to-peripheral,
peripheral-to-memory
 Signals the occurrence of various DMA events using the interrupt output signals
 Mapping relationship between each channel and different interrupt outputs is
software-programmable
 One embedded DMA controller for system
 DMAC features:
 8 channels totally
 23 hardware request from peripherals
 2 interrupt outputs
 Trust Execution Environment system
 Support TrustZone technology for the following components
 Cortex-A55, support security and non-security mode, switch by software
 System general DMAC, support some dedicated channels work only in security
mode
 Secure OTP, only can be accessed by Cortex-A55 in secure mode and secure
key reader block
 SYSTEM_SRAM, part of space is addressed only in security mode, detailed size
is software-programmable together with TZMA (TrustZone memory adapter)
 Cipher engine
 Support SHA-1, SHA-256/224, SHA-512/384, MD5 with hardware padding
 Support HMAC of SHA-1, SHA-256, SHA-512, MD5 with hardware padding
 Support AES-128, AES-192, AES-256 encrypt & decrypt cipher
 Support DES & TDES cipher
 Support AES ECB/CBC/OFB/CFB/CTR/CTS/XTS/CCM/GCM/CBC-MAC/CMAC
mode
 Support DES/TDES ECB/CBC/OFB/CFB mode
 Support up to 4096 bits PKA mathematical operations for RSA/ECC
 Support data scrambling for DDR SDRAM device
 Support up to 256 bits TRNG Output
 Support secure OTP
 Support secure boot
 Support secure debug
 Support secure OS
1.2.7 Video CODEC
 Video Decoder
 H.265 HEVC/MVC Main10 Profile yuv420@L5.1 up to 4096x2304@60fps
 H.264 AVC/MVC Main10 Profile yuv400/yuv420/yuv422/@L5.1 up to
4096x2304@60fps
Copyright 2021 © Rockchip Electronics Co., Ltd. 10

RK3566 Datasheet Rev 1.1
 VP9 Profile0/2 yuv420@L5.1 up to 4096x2304@60fps
 VP8 verision2,up to 1920x1088@60fps
 VC1 Simple Profile@low, medium, high levels, Main Profile@low, medium, high
levels, Advanced Profile@level0~3,up to 1920x1088@60fps
 MPEG-4 Simple Profile@L0~6,Advanced Simple Profile@L0~5,up to
1920x1088@60fps
 MPEG-2 Main Profile, low, medium and high levels, up to 1920x1088@60fps
 MPEG-1 Main Profile, low, medium and high levels, up to 1920x1088@60fps
 H.263 Profile0,levels 10-70,up to 720x576@60fps
 Video Encoder
 H.264/AVC BP/MP/HP@level4.2，up to 1920x1080@100fps
 H.265/HEVC MP@level4.1, up to 1920x1080@100fps (4096x4096@10fps with
TILE)
 Support YUV/RGB video source with rotation and mirror
1.2.8 JPEG CODEC
 JPEG decoder
 Decoder size is from 48x48 to 65536x65536
 Support YUV400/YUV411/YUV420/YUV422/YUV440/YUV444
 Support 1920x1080@120fps
 Support MJPEG
 JPEG encoder
 Baseline Non-progressive
 up to 8192x8192
 up to 90 million pixels per second
1.2.9 Image Enhancement (IEP module)
 Image format support
 Input data: YUV420/YUV422 ; semi-planar/planar; UV swap
 Output data: YUV420/YUV422 ; semi-planar; UV swap; Tile mode
 YUV down sampling conversion from 422 to 420
 Max resolution for dynamic image up to 1920x1080
 De-interlace
 I5O2: Input 5 Fields Output 2 frames mode
 I5O1T: Input 5 Fields Output 1 Top frame mode
 I5O1B: Input 5 Fields Output 1 Bottom frame mode
 I2O2: Input 2 Fields Output 2 frames mode
 I1O1T: Input 1 Field Output 1 Top frame mode
 I1O1B: Input 1 Field Output 1 Bottom frame mode
 PULLDOWN_REC: Pull down Recovery mode
 DETECT_ONLY: Detect Only mode
 MVHIST: De-interlace MV Histogram
 MD: Motion Detection
 ME: Motion Estimate
 MC: Motion Compensation
 EEDI: Enhanced Edge based Interpolation
 OSD DETECT: On-Screen Display Detection
 FF DETECT: Frame Field Detection
 FO DETECT: Field Order Detection
 PD DETECT: Pull down Detection
 CC: Combining Check
1.2.10 Graphics Engine
 3D Graphics Engine:
Copyright 2021 © Rockchip Electronics Co., Ltd. 11

RK3566 Datasheet Rev 1.1
 Mali-G52 1-Core-2EE
 Support OpenGL ES 1.1, 2.0, and 3.2
 Support Vulkan 1.0 and 1.1
 Support OpenCL 2.0 Full Profile
 Support 1600Mpix/s fill rate when 800MHz clock frequency
 Support 38.4GLOPs when 800MHz clock frequency
 2D Graphics Engine:
 Data format
 Support input of
ARGB/RGB888/RGB565/RGB4444/RGB5551/YUV420/YUV422/YUYV；
 Support input of YUV422SP10bit/YUV420SP10bit(YUV-8bits out)
 Support output of
ARGB/RGB888/RGB565/RGB4444/RGB5551/YUV420/YUV422/YUYV；
 Pixel Format conversion, BT.601/BT.709
 Dither operation, Y dither update;
 Max resolution: 8192x8192 source, 4096x4096 destination
 Scaling
 Down-scaling: Average filter
 Up-scaling: Bi-cubic filter(source>2048 would use Bi-linear)
 Arbitrary non-integer scaling ratio，from 1/16 to 16
 Rotation
 0, 90, 180, 270 degree rotation
 x-mirror, y-mirror& rotation operation
 BitBLT
 Block transfer
 Color palette/Color fill, support with alpha
 Transparency mode (color keying/stencil test, specified value/value range)
 Two source BitBLT:
 A+B=B only BitBLT, A support rotate&scale when B fixed
 A+B=C second source (B) has same attribute with (C) plus rotation function
 Alpha Blending
 New comprehensive per-pixel alpha(color/alpha channel separately)
 Fading
 SRC1(R2Y)&&SRC0(YUV)—alpha->DST(YUV)
1.2.11 Video input interface
 Interface and video input processor
 Support up to 16bit DVP interface (digital parallel input)
 Support MIPI CSI RX interface
 Support VICAP block(Video Input Processor)
 Support video data from DVP
 Support video data from MIPI CSI
 Support DVP and MIPI CSI simultaneously
 Support ISP block(Image Signal Processor)
 Support video data from DVP
 Support video data from MIPI CSI
 DVP Interface
 Support 8bits/10bits/12bits/16bits input
 Support up to 150MHz input data
 MIPI CSI RX Interface
 Compatible with the MIPI Alliance Interface specification v1.2
 Up to 4 data lanes, 2.5Gbps maximum data rate per lane
 Support MIPI-HS, MIPI-LP mode
 Support two mode
Copyright 2021 © Rockchip Electronics Co., Ltd. 12

RK3566 Datasheet Rev 1.1
 One interface with 1 clock lane and 4 data lanes
 Two interface, each with 1 clock lane and 2 data lanes
 VICAP
 Support BT601 YCbCr 422 8bits input、RAW 8/10/12bits input
 Support BT656 YCbCr 422 8bits input
 Support BT1120 YCbCr 422 8/10/12/16bits input, single/dual-edge sampling
 Support 2/4 mixed BT656/BT1120 YCbCr 422 8bit input
 Support YUYV sequence configurable
 Support the polarity of pixel_clk, hsync and vsync configurable
 Support receiving CSI2 protocol data(up to four IDs)
 Support receiving DSI protocol data(Video mode/Command mode)
 Support window cropping
 Support virtual stride when write to DDR
 Support NV16/NV12 output for YUV data
 Support compact/ non-compact output for RAW data
 ISP
 DVP input: ITU-R BT601/656/1120 with raw8/raw10/raw12/raw16, YUV422
 MIPI input: RX data lane x1/x2/x4, raw8/raw10/raw12, YUV422
 3A: include AE/Histogram, AF, AWB statistics output
 FPN: Fixed Pattern Noise removal
 BLC: Black Level Correction
 DPCC: Static/Dynamic defect pixel cluster correction
 LSC: Lens shading correction
 Bayer-2DNR: Bayer-raw De-noising, 2DNR
 Bayer-3DNR: Bayer-raw De-noising, 3DNR
 DRC: 2-Frame Merge Video Tone mapping
 Debayer: Advanced Adaptive Demosaic with Chromatic Aberration Correction
 CCM/CSM: Color correction matrix; RGB2YUV etc.
 Gamma: Gamma out correction
 Dehaze/Enhance: Automatic Dehaze and edge enhancement
 3DLUT: 3D-Lut Color Palette for Customer
 LDCH: Lens-distortion in the horizontal direction
 2DNR: Advanced Spatial Noise reduce in YUV
 Sharp: Picture Sharpening & Edge Enhance in YUV
 CGC: Color Gamut Compression, YUV full range/limit range convert
 Output Scale*2
 Maximum resolution is 4096x2304
1.2.12 Display interface
 Display interface
 Support MIPI_DSI interface
 Support LVDS interface(Combo with MIPI_DSI)
 Support HDMI interface
 Support eDP interface
 Support EBC inteface
 Support two simultaneous displays(same source) in the following interfaces
 MIPI_DSI_TX
 LVDS
 HDMI
 eDP
 MIPI DSI TX interface
 Compatible with MIPI Alliance Interface specification v1.2
 Support 2 channel DSI
 Support 4 data lanes per channel
 Support 2.5Gbps maximum data rate per lane
Copyright 2021 © Rockchip Electronics Co., Ltd. 13

RK3566 Datasheet Rev 1.1
 Up to 1920x1080@60Hz display output for single MIPI mode and 2560*1440@60Hz
for dual-MIPI mode
 Support RGB(up to 8bit) format
 LVDS interface
 Compliant with the TIA/EIA-644-A LVDS specification
 Support RGB888 and RGB666 input for LVDS interface
 Support VESA/JEIDA LVDS data format transfer
 HDMI TX interface
 Single Physical Layer PHY with support for HDMI1.4 and HDMI2.0 operation
 For HDMI operation, support for the following:
 HPD input analog comparator
 13.5–600MHz input reference clock
 Up to 10 bits Deep Color modes
 Up to 18Gbps aggregate bandwidth
 Up to 1080p@120Hz and 4096x2304@60Hz
 3-D video formats
 Support RGB/YUV(up to 10bit) format
 Support HDCP1.4/2.2
 eDP interface
 Support 1 eDP 1.3 interface
 Up to 4 physical lanes of 2.7Gbps
 Supports Panel Self Refresh(PSR)
 Support up to 2560x1600@60Hz
 Support RGB(up to 10bit) format
1.2.13 Video Output Processor
 Video inputs
 Support 1 cluster layer
 Support up to 4096x2160 input resolution
 Support afbcd
 Support RGB/YUV/YUYV format
 Support scale up/down ratio 4~1/4
 Support rotation
 Support 1 esmart layer
 Support up to 4096x2160 input resolution
 Support RGB/YUV/YUYV format
 Support scale up/down ratio 4~1/4
 Support 4 regions
 Support 1 smart layer
 Support up to 4096x2160 input resolution
 Support RGB format
 Support 4 regions
 Overlay
 Support MAX 3 layers overlay: 1 Cluster/1 ESMART/1 SMART
 Support RGB/YUV domain overlay
 Post process
 HDR
 HDR10/HDR HLG
 HDR2SDR/SDR2HDR
 3D-LUT/P2I/CSC/BCSH/DITHER/CABC/GAMMA/COLORBAR
 Write back
 Format: ARGB8888/RGB888/RGB565/YUV420
 Max resolution: 1920x1080
 Video outputs
 Video output0, up to 4096x2304@60Hz resolution
 Video output1, up to 2048x1536@60Hz resolution
 Support dual display with same source, the same screen direction and max 1080P
Copyright 2021 © Rockchip Electronics Co., Ltd. 14

RK3566 Datasheet Rev 1.1
1.2.14 Audio Interface
 I2S0 with 8 channel
 Up to 8 channels TX and 8 channels RX path
 Audio resolution from 16bits to 32bits
 Sample rate up to 192KHz
 Provides master and slave work mode, software configurable
 Support 3 I2S formats (normal, left-justified, right-justified)
 Only for HDMI
 I2S1 with 8 channel
 Up to 8 channels TX and 8 channels RX path
 Audio resolution from 16bits to 32bits
 Sample rate up to 192KHz
 Provides master and slave work mode, software configurable
 Support 3 I2S formats (normal, left-justified, right-justified)
 Support 4 PCM formats (early, late1, late2, late3)
 I2S and PCM mode cannot be used at the same time
 I2S2/I2S3 with 2 channel
 Up to 2 channels for TX and 2 channels RX path
 Audio resolution from 16bits to 32bits
 Sample rate up to 192KHz
 Provides master and slave work mode, software configurable
 Support 3 I2S formats (normal, left-justified, right-justified)
 Support 4 PCM formats (early, late1, late2, late3)
 I2S and PCM cannot be used at the same time
 PDM
 Up to 8 channels
 Audio resolution from 16bits to 24bits
 Sample rate up to 192KHz
 Support PDM master receive mode
 TDM
 supports up to 8 channels for TX and 8 channels RX path
 Audio resolution from 16bits to 32bits
 Sample rate up to 192KHz
 Provides master and slave work mode, software configurable
 Support 3 I2S formats (normal, left-justified, right-justified)
 Support 4 PCM formats (early, late1, late2, late3)
 Digital Audio Codec
 Support 3 channels digital ADC
 Support 2 channels digital DAC
 Support I2S/PCM interface
 Support I2S/PCM master and slave mode
 Support 4 channels audio transmitting in I2S mode
 Support 2 channels audio receiving in I2S mode
 Support 2 channels audio transmitting or receiving in PCM mode
 Support 16~24 bits sample resolution for both digital ADC and digital DAC
 Both digital ADC and digital DAC support three groups of sample rates. Group 0 are
8KHz/16KHz/32KHz/64KHz/128KHz, group 1 are
11.025KHz/22.05KHz/44.1KHz/88.2KHz/176.4KHz and group 2 are
12KHz/24KHz/48KHz/96KHz/192KHz
 The passband of digital ADC filters is 0.45625*fs
 Support digital ADC pass-band ripple within +/-0.1dB
Copyright 2021 © Rockchip Electronics Co., Ltd. 15

RK3566 Datasheet Rev 1.1
 The stop-band of digital ADC filters is 0.5*fs
 Support digital ADC stop-band attenuation at least 60dB
 Support volume control for both digital ADC and digital DAC
 Support Automatic Level Control (ALC)and noise gate for digital ADC
 Support communication with Analog Codec through I2C bus
 Voice Activity Detection(VAD)
 Support read voice data from I2S/PDM
 Support voice amplitude detection
 Support Multi-Mic array data storing
 Support a level combined interrupt
1.2.15 Connectivity
 SDIO interface
 Compatible with SDIO3.0 protocol
 4bits data bus widths
 MAC 10/100/1000 Ethernet Controller
 Support 10/100/1000 Mbps data transfer rates with the RGMII interfaces
 Support 10/100 Mbps data transfer rates with the RMII interfaces
 Support both full-duplex and half-duplex operation
 Supports IEEE 802.1Q VLAN tag detection for reception frames
 Support detection of LAN wake-up frames and AMD Magic Packet frames
 Support checking IPv4 header checksum and TCP, UDP, or ICMP checksum
encapsulated in IPv4 or IPv6 datagram
 Support for TCP Segmentation Offload (TSO) and UDP Fragmentation Offload (UFO)
 USB 2.0 OTG
 Compatible Specification
 Universal Serial Bus Specification, Revision 2.0
 Extensible Host Controller Interface for Universal Serial Bus (xHCI), Revision
1.1
 Support Control/Bulk/Interrupt/Isochronous Transfer
 USB 2.0 Host
 Support two USB2.0 Host
 Compatible with USB 2.0 specification
 Supports high-speed(480Mbps), full-speed(12Mbps) and low-speed(1.5Mbps) mode
 Support Enhanced Host Controller Interface Specification (EHCI), Revision 1.0
 Support Open Host Controller Interface Specification (OHCI), Revision 1.0a
 Multi-PHY Interface
 Support three multi-PHYs with PCIe2.1/SATA3.0/USB3.0
 Up to one USB3 Host controller
 Up to one PCIe2.1 controller
 Up to two SATA controller
 Multi-PHY1 support one of the following interfaces
 USB3.0 Host
 SATA1
 Multi-PHY2 support one of the following interfaces
 PCIe2.1
 SATA2
 USB 3.0 xHCI Host Controller
 Support 1 USB2.0 port and 1 Super-Speed port
 Concurrent USB3.0/USB2.0 traffic, up to 8.48Gbps bandwidth
 Support standard or open-source xHCI and class driver
 PCIe2.1 interface
 Compatible with PCI Express Base Specification Revision 3.0
 Support Root Complex(RC) mode
Copyright 2021 © Rockchip Electronics Co., Ltd. 16

RK3566 Datasheet Rev 1.1
 Support 2.5Gbps and 5.0Gbps serial data transmission rate per lane per
direction
 Support one lane
 SATA interface
 Compatible with Serial ATA 3.3 and AHCI Revision 1.3.1
 Support eSATA
 Support 1.5Gb/s, 3.0Gb/s, 6.0Gb/s
 Support 3 SATA controller
 SPI interface
 Support four SPI Controller
 Support one chip-select output and the other support two chip-select output
 Support serial-master and serial-slave mode, software-configurable
 I2C interface
 Support six I2C interface
 Support 7bits and 10bits address mode
 Software programmable clock frequency
 Data on the I2C-bus can be transferred at rates of up to 100Kbit/s in the Standard-
mode, up to 400Kbit/s in the Fast-mode or up to 1 Mbit/s in Fast-mode Plus.
 UART Controller
 Support ten UART interfaces
 Embedded two 64-byte FIFO for TX and RX operation respectively
 Support 5bits,6bits,7bits,8bits serial data transmit or receive
 Standard asynchronous communication bits such as start, stop and parity
 Support different input clock for UART operation to get up to 4Mbps baud rate
 Support auto flow control mode for UART0/UART1/UART3/UART4/UART5
 PWM
 Sixteen on-chip PWMs(PWM0~PWM15) with interrupt-based operation
 Programmable pre-scaled operation to bus clock and then further scaled
 Embedded 32bits timer/counter facility
 Support capture mode
 Support continuous mode or one-shot mode
 Provides reference mode and output various duty-cycle waveform
 Optimized for IR application for PWM3,PWM7,PWM11 and PWM15
 Smart Card
 Support ISO-7816
 support card activation and deactivation
 support cold/warm reset
 support Answer to Reset(ATR) response reception
 support T0 for asynchronous half-duplex character transmission
 support T1 for asynchronous half-duplex block transmission
 support automatic operating voltage class selection
 support adjustable clock rate and bit (baud) rate
 support configurable automatic byte repetition
1.2.16 Others
 Multiple group of GPIO
 All of GPIOs can be used to generate interrupt to CPU
 Support level trigger and edge trigger interrupt
 Support configurable polarity of level trigger interrupt
 Support configurable rising edge, falling edge and both edge trigger interrupt
 Temperature Sensor(TSADC)
Copyright 2021 © Rockchip Electronics Co., Ltd. 17

RK3566 Datasheet Rev 1.1
 Up to 50KS/s sampling rate
 Support two temperature sensor
 -20~120℃ temperature range and 5℃ temperature resolution
 Support two channels
 Successive Approximation ADC (SARADC)
 10bits resolution
 Up to 1MS/s sampling rate
 4 single-ended input channels
 OTP
 Support 8K bits Size, 7K bits for secure application
 Support Program/Read/Idle mode
 Package Type
 FCCSP565L (body: 15.5mm x 14.4mm; ball size: 0.3mm; ball pitch: 0.65&0.4mm)
Notes:
 DDR3/DDR3L/DDR4/LPDDR3/LPDDR4/LPDDR4X are not used simultaneously
 LVDS interface can not be used when dual-mipi mode enable
Copyright 2021 © Rockchip Electronics Co., Ltd. 18

RK3566 Datasheet                                                   Rev 1.1
1.3 Block Diagram
The following diagram shows the basic block diagram.
|     |             |                |     |            | R            | K 3             | 5 6 6              |                    |       |            |                        |
| --- | ----------- | -------------- | --- | ---------- | ------------ | --------------- | ------------------ | ------------------ | ----- | ---------- | ---------------------- |
|     | S y         | s t e m        |     |            |              |                 |                    |                    |       |            |                        |
|     |             |                |     |            |              |                 |                    |                    |       | C o n n    | e c t iv it y          |
|     | C lo c k    |  &  R e s e t  |     |            |              |                 |                    |                    |       |            |                        |
|     |             |                |     |            |              |                 |                    |                    | P     | C I e 2 .1 | / S A T A 3 .0         |
|     | W           | D T            |     |            |              |                 |                    |                    |       |            |                        |
|     |             |                |     |            | C o          | r t e x - A 5 5 |  Q u a d - C o r e |                    |       |            |                        |
|     |             |                |     |            |              |                 |                    |                    | U S B | 3 .0  H O  | S T / S A T A 3 .0     |
|     | P           | L L  x 9       |     |            |              |                 |                    |                    |       |            |                        |
|     |             |                |     | C o        | r e 0        |                 |                    | C o r e 1          |       |            |                        |
|     |             |                |     |            |              |                 |                    |                    |       | U S B 2 .0 |  H O S T  x 2          |
|     | T im        | e r  x 6       | 3   | 2 K B  L 1 |  I - C a c h | e               | 3 2 K B  L         | 1  I - C a c h e   |       |            |                        |
|     |             |                | 3   | 2 K B  L 1 |  D - C a c h | e               | 3 2 K B  L         | 1  D - C a c h e   |       | U S B 2    | .0  O T G              |
|     | S e c u r e |  T im e r  x 2 |     |            |              |                 |                    |                    |       |            |                        |
|     |             |                |     |            |              |                 |                    |                    | I 2 S | / T D M (  | 8 c h )  x 2 , o n e   |
|     |             |                | N O | E N / F P  | U / C r y p  | to              | N O E N /          | F P U / C r y p to |       |            |                        |
|     | P           | M U            |     |            |              |                 |                    |                    |       | fo r  H    | D M I                  |
|     |             |                |     | C o        | r e 2        |                 |                    | C o r e 3          |       |            |                        |
C r y p to 3 2 K B  L 1  I - C a c h e 3 2 K B  L 1  I - C a c h e I 2 S / P C M ( 2 c h )  x 2
I n t e r ru p t  C o n t r o lle r 3 2 K B  L 1  D - C a c h e 3 2 K B  L 1  D - C a c h e P D M ( 8 c h )
|     |             |                         | N O   | E N / F P | U / C r y p | to             | N O E N /          | F P U / C r y p to   |     | S P D I     | F ( 8 c h )    |
| --- | ----------- | ----------------------- | ----- | --------- | ----------- | -------------- | ------------------ | -------------------- | --- | ----------- | -------------- |
|     | D M         | A C  x 2                |       |           |             |                |                    |                      |     |             |                |
|     | S A R       | A D C  x 4              |       |           |             | 5 1 2 K B  L   | 3 - C a c h e      |                      |     | A u d io    |  P W M         |
|     |             |                         |       |           |             |                |                    |                      |     | D ig ita    | l A c o d e c  |
|     | T           | S A D C                 |       |           |             |                |                    |                      |     |             |                |
|     |             |                         |       |           |             |                |                    |                      |     | V           | A D            |
|     |             |                         |       |           |             | N              | P U                |                      |     |             |                |
|     | M           | C U                     |       |           |             |                |                    |                      |     |             |                |
|     |             |                         |       |           |             |                |                    |                      |     | I S O       | 7 8 1 6        |
|     |             |                         |       |           | M u         | lt i- M e d ia |  P r o c e s s o r |                      |     |             |                |
|     | M a         | ilb o x                 |       |           |             |                |                    |                      |     |             |                |
|     |             |                         |       |           |             |                |                    |                      |     | U A R       | T  x 1 0       |
|     |             |                         | 4 K   |  V id e o |   D e c o d | e r            | G P U  M           | a li- G 5 2 - 2 E E  |     |             |                |
| M   | u lt i- M e | d ia  I n t e r f a c e |       |           |             |                |                    |                      |     | S P         | I  x 4         |
|     |             |                         |       |           |             |                |                    |                      |     | S D I       | O  3 .0        |
|     |             |                         | 1 0 8 | 0 p  V id | e o   E n c | o d e r        | 2 D  G r a         | p h ic s  E n g in e |     |             |                |
|     |             | V O P                   |       |           |             |                |                    |                      | E   | t h e r n e | t G M A C  x 1 |
|     |             |                         |       | J P E G   |  C o d e c  |                |                    | I E P                |     |             |                |
( S a m e  S o u r c e , D u a l  ( 1 0 / 1 0 0 / 1 0 0 0 M )
|     | D         | is p la y )         |     |       |         |               |                      |                       |     |         |                  |
| --- | --------- | ------------------- | --- | ----- | ------- | ------------- | -------------------- | --------------------- | --- | ------- | ---------------- |
|     |           |                     |     |       |         |               |                      |                       |     | I 2     | C  x 6           |
|     |           |                     |     | 8 M   |  I S P  |               |                      |                       |     |         |                  |
|     | H D       | M I 2 .0 a          |     |       |         |               |                      |                       |     |         |                  |
|     |           |                     |     |       |         |               |                      |                       |     | P W M   |  x 1 6           |
|     | e         | D P 1 .3            |     |       |         |               |                      |                       |     | G P I O |  x 1 4 2         |
|     |  S in g   | le   L V D S /      |     |       | E x t e | r n a l M e m | o r y  I n t e r f a | c e                   |     |         |                  |
|     | D u a l M | I P I - D S I _ T X |     |       |         |               |                      |                       | E m | b e d d | e d  M e m o r y |
|     |           |                     |     | e M M | C  5 .1 |               | N o r  F la s h      |  / A s y n c  S R A M |     |         |                  |
|     | E - I n k |  I n t e r fa c e   |     |       |         |               |                      |                       |     |         |                  |
|     |           |                     |     |       |         |               |                      |                       |     | S R A M |  ( 6 4 K B )     |
1 6 b it s  C a m e r a  I / F S D 3 .0 / M M C 4 .5 1 S D R / D D R / L B A  N a n d  F la s h
|     |               |                     |     |     |             |               |                           |         |     | R O M   |  ( 3 2 K B ) |
| --- | ------------- | ------------------- | --- | --- | ----------- | ------------- | ------------------------- | ------- | --- | ------- | ------------ |
|     | M I P I - C S | I _ R X  4  L a n e |     |     |             |               |                           |         |     |         |              |
|     |               |                     |     |     | 3           | 2 B it  D D R |  C o n tr o lle r         |         |     |         |              |
|     |               |                     |     |     |             |               |                           |         |     | O T P ( | 8 K  b it)   |
|     |               |                     |     | ( D | D R 3 / D D | R 3 L / D D R | 4 / L P D D R 4 / L P D D | R 4 X ) |     |         |              |

Fig.1-1 Block Diagram
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      19

RK3566 Datasheet Rev 1.1
Chapter 2 Package Information
2.1 Order Information
Orderable RoHS
Package Package QTY Device Feature
Device status
RK3566 RoHS FCCSP565L 960pcs Quad core application processor
Quad core application processor
RK3566-D RoHS FCCSP565L 960pcs
with Dolby
2.2 Top Marking
The first pin
Rockchip : Brand Name
RKXXXX : Part Number
ABC : Internal Control Code
123456 : Die Lot NO # maybe
letter
YYWW : Date Code
NXXXXXX FXX: Sub-lot info in
OSAT
Fig.2-1 Package definition
The first pin
Rockchip : Brand Name
RKXXXX : Part Number
ABC : Internal Control Code
123456 : Die Lot NO # maybe
letter
YYWW : Date Code
NXXXXXX FXX: Sub-lot info in
OSAT
Copyright 2021 © Rockchip Electronics Co., Ltd. 20

RK3566 Datasheet Rev 1.1
2.3 FCCSP565L Dimension
Fig.2-2 Package Top View
Fig.2-3 Package bottom view
Copyright 2021 © Rockchip Electronics Co., Ltd. 21

RK3566 Datasheet Rev 1.1
Fig.2-4 Package side view
Fig.2-5 Package dimension
Copyright 2021 © Rockchip Electronics Co., Ltd. 22

RK3566 Datasheet                                                   Rev 1.1
2.4 Ball Map

Fig.2-6 Ball Map
2.5 Pin Number List
Table 2-1 Pin Number List Information
| Pin Name  | PIN  Pin Name  | PIN  |
| --------- | -------------- | ---- |
DDR4_A16_RASn/LPDDR4_A5_A/DDR3_RASn/L
|     | 1A1  PWM0_M0/CPUAVS/GPIO0_B7_d  | 1R17  |
| --- | ------------------------------- | ----- |
PDDR3_A7/AC16
DDR4_ACTn/LPDDR4_CKE1_B/DDR3_CASn/- PWM2_M0/NPUAVS/UART0_TX/MCU_JTAG_TDI/G
|        | 1A2        | 1R18  |
| ------ | ---------- | ----- |
| /AC17  | PIO0_C1_d  |       |
DDR4_A10/LPDDR4_CKE0_B/DDR3_A10/-
|     | 1A3  GPIO0_A3_u  | 1R19  |
| --- | ---------------- | ----- |
/AC10
DDR4_BG0/LPDDR4_ODT1_CA_B/DDR3_WEn/- TSADC_SHUT_M0/TSADC_SHUT_ORG/GPIO0_A1
|        | 1A4  | 1R20  |
| ------ | ---- | ----- |
| /AC20  | _z   |       |
DDR4_ODT0/LPDDR4_CS1n_B/DDR3_ODT0/LP CIF_D7/EBC_SDDO7/SDMMC2_PWREN_M0/I2S1
|                 | 1A5                                  | 1T1  |
| --------------- | ------------------------------------ | ---- |
| DDR3_CS1n/AC27  | _SDI3_M1/VOP_BT656_D7_M1/GPIO3_D5_d  |      |
DDR4_BA1/LPDDR4_A4_B/DDR3_A12/LPDDR3 CIF_D0/EBC_SDDO0/SDMMC2_D0_M0/I2S1_MCL
|           | 1A6                              | 1T2  |
| --------- | -------------------------------- | ---- |
| _A4/AC19  | K_M1/VOP_BT656_D0_M1/GPIO3_C6_d  |      |
DDR_DQ3_B/DDR4_DQU1_B/LPDDR4_DQ3_B/
|     | 1A7  VSS_127  | 1T3  |
| --- | ------------- | ---- |
DDR3_DQ19/LPDDR3_DQ4
DDR_DQ2_B/DDR4_DQU3_B/LPDDR4_DQ2_B/ VOP_BT1120_D11/GMAC1_TXD0_M0/I2C3_SCL_
|                       | 1A8                     | 1T4  |
| --------------------- | ----------------------- | ---- |
| DDR3_DQ18/LPDDR3_DQ6  | M1/PWM10_M0/GPIO3_B5_d  |      |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      23

RK3566 Datasheet                                                   Rev 1.1
| Pin Name  | PIN  Pin Name  | PIN  |
| --------- | -------------- | ---- |
DDR_DQ7_B/DDR4_DQU2_B/LPDDR4_DQ7_B/
|     | 1A9  VSS_128  | 1T5  |
| --- | ------------- | ---- |
DDR3_DQ23/LPDDR3_DQ0
DDR_DQ5_B/DDR4_DQU6_B/LPDDR4_DQ5_B/ PWM13_M1/SPI3_CS0_M1/SATA0_ACT_LED/UAR
|                       | 1A10                             | 1T6  |
| --------------------- | -------------------------------- | ---- |
| DDR3_DQ21/LPDDR3_DQ3  | T9_RX_M1/I2S3_SDI_M1/GPIO4_C6_d  |      |
DDR_DM1_B/DDR4_DML_B/LPDDR4_DM1_B/D
|     | 1A11  AVSS_21  | 1T7  |
| --- | -------------- | ---- |
DR3_DM3/LPDDR3_DM2
I2S1_SCLK_RX_M0/UART4_RX_M0/PDM_CLK1_
|     | 1A13  AVSS_22  | 1T8  |
| --- | -------------- | ---- |
M0/SPDIF_TX_M0/GPIO1_A4_d
I2S1_LRCK_RX_M0/UART4_TX_M0/PDM_CLK0_
|     | 1A14  AVSS_23  | 1T9  |
| --- | -------------- | ---- |
M0/AUDIOPWM_ROUT_P/GPIO1_A6_d
| FSPI_CLK/FLASH_ALE/GPIO1_D0_d  | 1A15  AVSS_24  | 1T10  |
| ------------------------------ | -------------- | ----- |
EMMC_DATA_STROBE/FSPI_CS1n/FLASH_CLE/
|     | 1A16  AVSS_25  | 1T11  |
| --- | -------------- | ----- |
GPIO1_C6_d
| FSPI_D0/FLASH_RDY/GPIO1_D1_u      | 1A17  AVSS_26  | 1T12  |
| --------------------------------- | -------------- | ----- |
| FSPI_D1/FLASH_RDn/GPIO1_D2_u      | 1A18  AVSS_27  | 1T13  |
| SARADC_VIN3                       | 1A19  AVSS_28  | 1T14  |
| SDMMC1_D3/UART7_TX_M0/GPIO2_A6_u  | 1A20  AVSS_29  | 1T15  |
DDR4_A14_WEn/LPDDR4_A4_A/DDR3_A15/LP
|     | 1B1  AVSS_30  | 1T16  |
| --- | ------------- | ----- |
DDR3_A5/AC14
| DDR4_A12/LPDDR4_A3_A/DDR3_BA2/-/AC12  | 1B3  AVSS_31  | 1T17  |
| ------------------------------------- | ------------- | ----- |
DDR4_ODT1/LPDDR4_CS0n_B/DDR3_CS0n/LP
|     | 1B5  PWM7_IR/SPI0_CS0_M0/GPIO0_C6_d  | 1T18  |
| --- | ------------------------------------ | ----- |
DDR3_CS0n/AC28
DDR4_A4/LPDDR4_A3_B/DDR3_BA1/LPDDR3_
|     | 1B6  PWM1_M0/GPUAVS/UART0_RX/GPIO0_C0_d  | 1T19  |
| --- | ---------------------------------------- | ----- |
A3/AC4
DDR4_BA0/LPDDR4_A2_B/DDR3_A1/-/AC18  1B7  CLK32K_IN/CLK32K_OUT0/GPIO0_B0_u  1T20
DDR_DM0_B/DDR4_DMU_B/LPDDR4_DM0_B/D CIF_D1/EBC_SDDO1/SDMMC2_D1_M0/I2S1_SCL
|                     | 1B8                                 | 1U1  |
| ------------------- | ----------------------------------- | ---- |
| DR3_DM2/LPDDR3_DM0  | K_TX_M1/VOP_BT656_D1_M1/GPIO3_C7_d  |      |
DDR_DQ6_B/DDR4_DQU4_B/LPDDR4_DQ6_B/
|     | 1B9  VSS_129  | 1U2  |
| --- | ------------- | ---- |
DDR3_DQ22/LPDDR3_DQ7
VOP_BT1120_D10/GMAC1_RXER_M0/I2C5_SDA_
| VSS_30  | 1B10  | 1U3  |
| ------- | ----- | ---- |
M0/PDM_SDI1_M2/GPIO3_B4_d
VOP_BT1120_CLK/GMAC1_TXCLK_M0/I2S3_SDI_
| VSS_31  | 1B11  | 1U4  |
| ------- | ----- | ---- |
M0/SDMMC2_CLK_M1/GPIO3_A6_d
I2S1_SDO1_M0/I2S1_SDI3_M0/PDM_SDI3_M0 VOP_BT1120_D0/SPI1_CS0_M1/SDMMC2_D0_M1
|                                | 1B13         | 1U5  |
| ------------------------------ | ------------ | ---- |
| /PCIE20_CLKREQn_M2/GPIO1_B0_d  | /GPIO3_A1_d  |      |
PWM12_M1/SPI3_MISO_M1/SATA1_ACT_LED/UA
| I2S1_SDI0_M0/PDM_SDI0_M0/GPIO1_B3_d  | 1B14  | 1U6  |
| ------------------------------------ | ----- | ---- |
RT9_TX_M1/I2S3_SDO_M1/GPIO4_C5_d
PWM14_M1/SPI3_CLK_M1/I2S3_MCLK_M1/GPIO
| VSS_32  | 1B15  | 1U7  |
| ------- | ----- | ---- |
4_C2_d
EMMC_RSTn/FSPI_D2/FLASH_WPn/GPIO1_C7_
|     | 1B16  MIPI_CSI_RX_CLK1N  | 1U8  |
| --- | ------------------------ | ---- |
d
FSPI_CS0n/FLASH_CS0n/GPIO1_D3_u  1B17  MIPI_CSI_RX_CLK0N  1U9
| SARADC_VIN2  | 1B18  MIPI_DSI_TX1_CLKN  | 1U11  |
| ------------ | ------------------------ | ----- |
| VSS_33       | 1B19  AVSS_32            | 1U12  |
I2S2_SDO_M0/UART9_CTSn_M0/SPI2_CS0_M0
|     | 1B20  AVSS_33  | 1U13  |
| --- | -------------- | ----- |
/GPIO2_C4_d
DDR4_A15_CASn/LPDDR4_A2_A/DDR3_A0/-
|     | 1C1  AVSS_34  | 1U15  |
| --- | ------------- | ----- |
/AC15
DDR4_BG1/LPDDR4_ODT1_CA_A/DDR3_BA0/-
|     | 1C2  HDMI_TX_REXT  | 1U16  |
| --- | ------------------ | ----- |
/AC21
| DDR4_A3/LPDDR4_CKE1_A/DDR3_A3/-/AC3  | 1C3  AVSS_35                       | 1U17  |
| ------------------------------------ | ---------------------------------- | ----- |
| VSS_34                               | 1C4  UART2_TX_M0/GPIO0_D1_u        | 1U18  |
| VSS_35                               | 1C5  PWM6/SPI0_MISO_M0/GPIO0_C5_d  | 1U19  |
I2C2_SCL_M0/SPI0_CLK_M0/PCIE20_WAKEn_M0
| VSS_36  | 1C6  | 1U20  |
| ------- | ---- | ----- |
/PWM1_M1/GPIO0_B5_u
DDR4_RESETn/LPDDR4_RESETn/DDR3_RESETn
|     | 1C7  VSS_130  | 1V1  |
| --- | ------------- | ---- |
/AC29
VOP_BT1120_D12/GMAC1_TXD1_M0/I2C3_SDA_
| VSS_37  | 1C8  | 1V2  |
| ------- | ---- | ---- |
M1/PWM11_IR_M0/GPIO3_B6_d
VOP_BT1120_D5/GMAC1_RXCLK_M0/SDMMC2_D
| VSS_38  | 1C9  | 1V3  |
| ------- | ---- | ---- |
ET_M1/GPIO3_A7_d
DDR_DQ14_B/DDR4_DQL1_B/LPDDR4_DQ14_
|     | 1C10  VSS_131  | 1V4  |
| --- | -------------- | ---- |
B/DDR3_DQ30/LPDDR3_DQ20
| VDD_CPU_1  | 1C12  HDMITX_CEC_M0/SPI3_CS1_M1/GPIO4_D1_u  | 1V5  |
| ---------- | ------------------------------------------- | ---- |
EDP_HPDIN_M0/SPDIF_TX_M2/SATA2_ACT_LED/
| VCCIO2  | 1C13  | 1V6  |
| ------- | ----- | ---- |
I2S3_LRCK_M1/GPIO4_C4_d
| VSS_39                         | 1C14  AVSS_36            | 1V7   |
| ------------------------------ | ------------------------ | ----- |
| FSPI_D3/FLASH_CS1n/GPIO1_D4_u  | 1C15  MIPI_CSI_RX_CLK1P  | 1V8   |
| VSS_40                         | 1C16  MIPI_CSI_RX_CLK0P  | 1V9   |
| SARADC_VIN1                    | 1C17  MIPI_DSI_TX1_CLKP  | 1V11  |
| VSS_41                         | 1C18  AVSS_37            | 1V12  |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      24

RK3566 Datasheet                                                   Rev 1.1
| Pin Name                          | PIN  Pin Name  | PIN   |
| --------------------------------- | -------------- | ----- |
| SDMMC1_D0/UART6_RX_M0/GPIO2_A3_u  | 1C19  AVSS_38  | 1V13  |
UART1_RX_M0/GPIO2_B3_u  1C20  MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN  1V15
| VSS_42                   | 1D1  MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP  | 1V16  |
| ------------------------ | ------------------------------------- | ----- |
| DDR4_A1/-/DDR3_A2/-/AC1  | 1D2  HDMI_TX_HPDIN                    | 1V17  |
| VSS_43                   | 1D3  AVSS_39                          | 1V18  |
| DDR_AVSS                 | 1D4  UART2_RX_M0/GPIO0_D0_u           | 1V19  |
HDMITX_CEC_M1/PWM0_M1/UART0_CTSn/GPIO0
| DDRPHY_VDDQ_1  | 1D5  | 1V20  |
| -------------- | ---- | ----- |
_C7_d
| DDRPHY_VDDQ_2  | 1D6  VSS_1  | A1  |
| -------------- | ----------- | --- |
| DDRPHY_VDDQ_3  | 1D7  VSS_2  | A2  |
DDR4_CS1n/LPDDR4_CS1n_A/DDR3_CS1n/LPDD
| DDRPHY_VDDQ_4  | 1D8  | A3  |
| -------------- | ---- | --- |
R3_ODT1/AC26
DDR4_CLKP/LPDDR4_CLKP_A/DDR3_CLKP/LPDD
| DDRPHY_VDDQ_5  | 1D9  | A5  |
| -------------- | ---- | --- |
R3_CLKP/AC23
| VSS_44  | 1D10  DDR4_A0/LPDDR4_CLKP_B/DDR3_A9/-/AC0  | A7  |
| ------- | ------------------------------------------ | --- |
DDR4_A13/LPDDR4_A0_B/DDR3_A14/LPDDR3_A
| VDD_CPU_2  | 1D11  | A9  |
| ---------- | ----- | --- |
0/AC13
VDD_CPU_3  1D12  DDR4_A7/LPDDR4_ODT0_CA_B/DDR3_A8/-/AC7  A10
DDR_DQS0N_B/DDR4_DQSU_N_B/LPDDR4_DQS
| VCCIO1  | 1D13  | A12  |
| ------- | ----- | ---- |
0N_B/DDR3_DQS2N/LPDDR3_DQS0N
DDR_DQS0P_B/DDR4_DQSU_P_B/LPDDR4_DQS0
| VSS_45  | 1D14  | A13  |
| ------- | ----- | ---- |
P_B/DDR3_DQS2P/LPDDR3_DQS0P
DDR_DQ12_B/DDR4_DQL7_B/LPDDR4_DQ12_B/
| OTP_VCC18  | 1D15  | A15  |
| ---------- | ----- | ---- |
DDR3_DQ28/LPDDR3_DQ16
DDR_DQS1P_B/DDR4_DQSL_P_B/LPDDR4_DQS1
| SARADC_AVDD_1V8  | 1D16  | A17  |
| ---------------- | ----- | ---- |
P_B/DDR3_DQS3P/LPDDR3_DQS2P
DDR_DQ9_B/DDR4_DQL2_B/LPDDR4_DQ9_B/DD
| SARADC_VIN0  | 1D17  | A19  |
| ------------ | ----- | ---- |
R3_DQ25/LPDDR3_DQ19
DDR_DQ10_B/DDR4_DQL4_B/LPDDR4_DQ10_B/
| SDMMC1_D2/UART7_RX_M0/GPIO2_A5_u  | 1D18  | A20  |
| --------------------------------- | ----- | ---- |
DDR3_DQ26/LPDDR3_DQ22
I2S2_LRCK_TX_M0/UART9_RTSn_M0/SPI2_MO I2C3_SDA_M0/UART3_RX_M0/AUDIOPWM_LOUT
|                   | 1D19           | A22  |
| ----------------- | -------------- | ---- |
| SI_M0/GPIO2_C3_d  | _P/GPIO1_A0_u  |      |
SDMMC0_D2/ARM_JTAG_TCK/UART5_CTSn_M0 I2S1_MCLK_M0/UART3_RTSn_M0/SCR_CLK/GPIO
|              | 1D20    | A23  |
| ------------ | ------- | ---- |
| /GPIO1_D7_u  | 1_A2_d  |      |
DDR_DQ7_A/DDR4_DQL1_A/LPDDR4_DQ7_A/D I2S1_SDO2_M0/I2S1_SDI2_M0/PDM_SDI2_M0/P
|                      | 1E1                        | A26  |
| -------------------- | -------------------------- | ---- |
| DR3_DQ7/LPDDR3_DQ11  | CIE20_WAKEn_M2/GPIO1_B1_d  |      |
DDR_DM0_A/DDR4_DML_A/LPDDR4_DM0_A/D
|     | 1E2  EMMC_CMD/FLASH_WRn/GPIO1_C4_u  | A27  |
| --- | ----------------------------------- | ---- |
DR3_DM0/LPDDR3_DM1
| VSS_46          | 1E3  EMMC_CLKOUT/FLASH_DQS/GPIO1_C5_d  | A29  |
| --------------- | -------------------------------------- | ---- |
| DDRPHY_VDDQ_6   | 1E4  EMMC_D5/FLASH_D5/GPIO1_C1_u       | A30  |
| DDRPHY_VDDQL_1  | 1E6  EMMC_D0/FLASH_D0/GPIO1_B4_u       | A32  |
| DDRPHY_VDDQL_2  | 1E7  EMMC_D7/FLASH_D7/GPIO1_C3_u       | A33  |
SDMMC1_PWREN/I2C4_SDA_M1/UART8_RTSn_M
| VSS_47  | 1E8  0/GPIO2_B1_d  | A35  |
| ------- | ------------------ | ---- |
I2S2_LRCK_RX_M0/UART6_CTSn_M0/SPI1_CS0_
| DDRPHY_VDDQL_3  | 1E9  M0/GPIO2_C0_d          | A37   |
| --------------- | --------------------------- | ----- |
| VSS_48          | 1E10  VSS_3                 | A38   |
| VDD_CPU_4       | 1E11  VSS_18                | AA2   |
| VDD_CPU_5       | 1E12  PCIE20_TXP/SATA2_TXP  | AA37  |
| VDD_CPU_6       | 1E13  PCIE20_TXN/SATA2_TXN  | AA38  |
CIF_CLKIN/EBC_SDCLK/GMAC1_MCLKINOUT_M1
| VSS_49  | 1E14  /UART1_CTSn_M1/I2S2_SCLK_RX_M1/GPIO4_C1 | AB1  |
| ------- | --------------------------------------------- | ---- |
_d
CIF_CLKOUT/EBC_GDCLK/PWM11_IR_M1/GPIO4
| VSS_50  | 1E15  | AB2  |
| ------- | ----- | ---- |
_C0_d
| VCCIO4  | 1E16  PCIE20_RXP/SATA2_RXP  | AB37  |
| ------- | --------------------------- | ----- |
| VSS_51  | 1E17  PCIE20_RXN/SATA2_RXN  | AB38  |
CIF_VSYNC/EBC_SDOE/GMAC1_MDIO_M1/I2S2_
| SDMMC1_D1/UART6_TX_M0/GPIO2_A4_u  | 1E18  | AC2  |
| --------------------------------- | ----- | ---- |
SCLK_TX_M1/GPIO4_B7_d
SDMMC0_CMD/PWM10_M1/UART5_RX_M0/GPI
|     | 1E19  VSS_24  | AC37  |
| --- | ------------- | ----- |
O2_A1_u
SDMMC0_D0/UART2_TX_M1/UART6_TX_M1/PW I2C2_SCL_M1/EBC_SDSHR/I2S1_SDO3_M1/GPI
|                   | 1E20     | AD1  |
| ----------------- | -------- | ---- |
| M8_M1/GPIO1_D5_u  | O4_B5_d  |      |
DDR_DQ14_A/DDR4_DQU6_A/LPDDR4_DQ14_
|     | 1F1  VSS_19  | AD2  |
| --- | ------------ | ---- |
A/DDR3_DQ14/LPDDR3_DQ30
DDR_DQ13_A/DDR4_DQU4_A/LPDDR4_DQ13_
|     | 1F2  XIN24M  | AD37  |
| --- | ------------ | ----- |
A/DDR3_DQ13/LPDDR3_DQ31
| DDR_RZQ  | 1F3  XOUT24M  | AD38  |
| -------- | ------------- | ----- |
I2C4_SCL_M0/EBC_GDOE/ETH1_REFCLKO_25M_
| DDRPHY_VDDQ_7  | 1F4  | AE2  |
| -------------- | ---- | ---- |
M1/SPI3_CLK_M0/I2S2_SDO_M1/GPIO4_B3_d
| DDRPHY_VDDQL_4  | 1F5  VSS_25  | AE37  |
| --------------- | ------------ | ----- |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      25

RK3566 Datasheet                                                   Rev 1.1
| Pin Name  | PIN  Pin Name  | PIN  |
| --------- | -------------- | ---- |
I2C2_SDA_M1/EBC_GDSP/ISP_FLASH_TRIGIN/V
| VSS_52  | 1F6  | AF1  |
| ------- | ---- | ---- |
OP_BT656_CLK_M1/GPIO4_B4_d
I2C4_SDA_M0/EBC_VCOM/GMAC1_RXER_M1/SPI
| VSS_53  | 1F7  | AF2  |
| ------- | ---- | ---- |
3_MOSI_M0/I2S2_SDI_M1/GPIO4_B2_d
| VSS_54  | 1F8  SDMMC0_DET/SATA_CP_DET/GPIO0_A4_u  | AF37  |
| ------- | --------------------------------------- | ----- |
| VSS_55  | 1F9  FLASH_VOL_SEL/GPIO0_A7_u           | AF38  |
ISP_PRELIGHT_TRIG/EBC_SDCE3/GMAC1_RXDV
| VSS_56  | 1F10  | AG2  |
| ------- | ----- | ---- |
_CRS_M1/I2S1_SDO2_M1/GPIO4_B1_d
SDMMC0_PWREN/SATA_MP_SWITCH/PCIE20_CL
| VDD_CPU_7  | 1F11  | AG37  |
| ---------- | ----- | ----- |
KREQn_M0/GPIO0_A5_d
| VDD_CPU_8  | 1F12  nPOR_u  | AG38  |
| ---------- | ------------- | ----- |
ISP_FLASHTRIGOUT/EBC_SDCE0/GMAC1_TXEN_
VDD_CPU_9  1F13  M1/SPI3_CS0_M0/I2S1_SCLK_RX_M1/GPIO4_A6 AH2
_d
| VDD_CPU_10  | 1F14  VSS_26  | AH37  |
| ----------- | ------------- | ----- |
CIF_D15/EBC_SDDO15/GMAC1_TXD1_M1/UART9
| VSS_57  | 1F15  | AJ1  |
| ------- | ----- | ---- |
_RX_M2/I2S2_LRCK_RX_M1/GPIO4_A5_d
CIF_D13/EBC_SDDO13/GMAC1_RXCLK_M1/UART
| VSS_58  | 1F16  | AJ2  |
| ------- | ----- | ---- |
7_RX_M2/PDM_SDI3_M1/GPIO4_A3_d
| VCCIO3  | 1F17  I2C0_SCL/GPIO0_B1_u  | AJ37  |
| ------- | -------------------------- | ----- |
SDMMC0_D3/ARM_JTAG_TMS/UART5_RTSn_M0
|     | 1F18  GPU_PWREN/SATA_CP_POD/GPIO0_A6_d  | AJ38  |
| --- | --------------------------------------- | ----- |
/GPIO2_A0_u
SDMMC0_D1/UART2_RX_M1/UART6_RX_M1/P CIF_D10/EBC_SDDO10/GMAC1_TXCLK_M1/PDM_
|                    | 1F19                                    | AK2   |
| ------------------ | --------------------------------------- | ----- |
| WM9_M1/GPIO1_D6_u  | CLK1_M1/GPIO4_A0_d                      |       |
| AVSS1_6            | 1F20  I2C1_SCL/MCU_JTAG_TDO/GPIO0_B3_u  | AK37  |
DDR_DM1_A/DDR4_DMU_A/LPDDR4_DM1_A/D
|     | 1G1  I2C0_SDA/GPIO0_B2_u  | AK38  |
| --- | ------------------------- | ----- |
DR3_DM1/LPDDR3_DM3
DDR_DQ15_A/DDR4_DQU0_A/LPDDR4_DQ15_ CIF_D9/EBC_SDDO9/GMAC1_TXD3_M1/UART1_R
|                          | 1G2                          | AL1  |
| ------------------------ | ---------------------------- | ---- |
| A/DDR3_DQ15/LPDDR3_DQ27  | X_M1/PDM_SDI0_M1/GPIO3_D7_d  |      |
CIF_D8/EBC_SDDO8/GMAC1_TXD2_M1/UART1_T
| VSS_59  | 1G3  | AL2  |
| ------- | ---- | ---- |
X_M1/PDM_CLK0_M1/GPIO3_D6_d
| DDRPHY_VDDQ_8  | 1G4  VSS_27  | AL37  |
| -------------- | ------------ | ----- |
CIF_D5/EBC_SDDO5/SDMMC2_CLK_M0/I2S1_SD
| DDRPHY_VDDQL_5  | 1G5  | AM1  |
| --------------- | ---- | ---- |
I1_M1/VOP_BT656_D5_M1/GPIO3_D3_d
CIF_D4/EBC_SDDO4/SDMMC2_CMD_M0/I2S1_S
| VSS_60  | 1G6  | AM2  |
| ------- | ---- | ---- |
DI0_M1/VOP_BT656_D4_M1/GPIO3_D2_d
PWM3_IR/EDP_HPDIN_M1/MCU_JTAG_TMS/GPIO
| VSS_61  | 1G7  | AM37  |
| ------- | ---- | ----- |
0_C2_d
I2C1_SDA/PCIE20_BUTTONRSTn/MCU_JTAG_TCK
| VSS_62  | 1G8  | AM38  |
| ------- | ---- | ----- |
/GPIO0_B4_u
CIF_D3/EBC_SDDO3/SDMMC2_D3_M0/I2S1_SD
| VSS_63  | 1G9  | AN2  |
| ------- | ---- | ---- |
O0_M1/VOP_BT656_D3_M1/GPIO3_D1_d
| VSS_64  | 1G10  PWM5/SPI0_CS1_M0/UART0_RTSn/GPIO0_C4_d  | AN37  |
| ------- | --------------------------------------------- | ----- |
PWM4/VOP_PWM_M0/MCU_JTAG_TRSTn/GPIO0_
| VSS_65  | 1G11  | AN38  |
| ------- | ----- | ----- |
C3_d
CIF_D2/EBC_SDDO2/SDMMC2_D2_M0/I2S1_LRC
| VSS_66  | 1G12  | AP1  |
| ------- | ----- | ---- |
K_TX_M1/VOP_BT656_D2_M1/GPIO3_D0_d
| VDD_CPU_11  | 1G13  VSS_20  | AP2  |
| ----------- | ------------- | ---- |
VOP_BT1120_D14/SPI1_MISO_M1/UART5_TX_M
| VSS_67  | 1G14  | AP3  |
| ------- | ----- | ---- |
1/I2S1_SDO3_M2/GPIO3_C2_d
VOP_BT1120_D13/SPI1_MOSI_M1/PCIE20_PERS
| VDD_NPU_1  | 1G15  | AP4  |
| ---------- | ----- | ---- |
Tn_M1/I2S1_SDO2_M2/GPIO3_C1_d
PWM12_M0/GMAC1_TXEN_M0/UART3_TX_M1/PD
| AVSS1_7  | 1G16  | AP5  |
| -------- | ----- | ---- |
M_SDI2_M2/GPIO3_B7_d
VOP_BT1120_D9/GMAC1_RXDV_CRS_M0/I2C5_S
| EDP_TX_AVDD_1V8  | 1G17  | AP6  |
| ---------------- | ----- | ---- |
CL_M0/PDM_SDI0_M2/GPIO3_B3_d
VOP_BT1120_D7/GMAC1_RXD0_M0/UART4_RX_
| AVSS1_8  | 1G18  | AP7  |
| -------- | ----- | ---- |
M1/PWM8_M0/GPIO3_B1_d
| AVSS1_9  | 1G19  VSS_22  | AP8  |
| -------- | ------------- | ---- |
VOP_BT1120_D4/GMAC1_RXD3_M0/I2S3_SDO_
| AVSS1_10  | 1G20  | AP9  |
| --------- | ----- | ---- |
M0/SDMMC2_CMD_M1/GPIO3_A5_d
VOP_BT1120_D2/GMAC1_TXD3_M0/I2S3_SCLK_
| VSS_68  | 1H1  | AP10  |
| ------- | ---- | ----- |
M0/SDMMC2_D2_M1/GPIO3_A3_d
| VSS_69  | 1H2  HDMITX_SDA/I2C5_SDA_M1/GPIO4_D0_u  | AP11  |
| ------- | --------------------------------------- | ----- |
PWM15_IR_M1/SPI3_MOSI_M1/I2S3_SCLK_M1/
| DDR_VREFOUT  | 1H3  | AP12  |
| ------------ | ---- | ----- |
GPIO4_C3_d
| SYSPLL_AVDD_1V8  | 1H4  AVSS_1           | AP13  |
| ---------------- | --------------------- | ----- |
| SYSPLL_AVDD_0V9  | 1H5  MIPI_CSI_RX_D3N  | AP14  |
| VSS_70           | 1H6  MIPI_CSI_RX_D2P  | AP15  |
| VDD_LOGIC_1      | 1H7  AVSS_2           | AP16  |
| VDD_LOGIC_2      | 1H8  MIPI_CSI_RX_D1N  | AP17  |
| VDD_LOGIC_3      | 1H9  MIPI_CSI_RX_D0P  | AP18  |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      26

RK3566 Datasheet                                                   Rev 1.1
| Pin Name         | PIN  Pin Name                        | PIN   |
| ---------------- | ------------------------------------ | ----- |
| VDD_LOGIC_4      | 1H10  AVSS_3                         | AP19  |
| VSS_71           | 1H11  MIPI_DSI_TX1_D3N               | AP20  |
| VSS_72           | 1H12  MIPI_DSI_TX1_D2P               | AP21  |
| VSS_73           | 1H13  AVSS_4                         | AP22  |
| VDD_NPU_2        | 1H14  MIPI_DSI_TX1_D1N               | AP23  |
| VDD_NPU_3        | 1H15  MIPI_DSI_TX1_D0P               | AP24  |
| USB_AVDD1_1V8    | 1H16  AVSS_5                         | AP25  |
| EDP_TX_AVDD_0V9  | 1H17  MIPI_DSI_TX0_D3N/LVDS_TX0_D3N  | AP26  |
| USB_AVDD1_3V3    | 1H18  MIPI_DSI_TX0_D2P/LVDS_TX0_D2P  | AP27  |
| EDP_TX_AUXP      | 1H19  AVSS_6                         | AP28  |
| EDP_TX_AUXN      | 1H20  MIPI_DSI_TX0_D1N/LVDS_TX0_D1N  | AP29  |
| VSS_74           | 1J1  MIPI_DSI_TX0_D0P/LVDS_TX0_D0P   | AP30  |
| USB_AVDD2_3V3    | 1J2  AVSS_7                          | AP31  |
| USB_AVDD2_1V8    | 1J3  HDMI_TX_CLKN                    | AP32  |
| USB_AVDD2_0V9    | 1J4  HDMI_TX_D0P                     | AP33  |
| SYSPLL_AVSS      | 1J5  AVSS_8                          | AP34  |
| VSS_75           | 1J6  HDMI_TX_D1N                     | AP35  |
| VDD_LOGIC_5      | 1J7  HDMI_TX_D2P                     | AP36  |
| VSS_76           | 1J8  VSS_28                          | AP37  |
| VSS_77           | 1J9  VSS_21                          | AR1   |
VOP_BT1120_D15/SPI1_CLK_M1/UART5_RX_M1/
| VDD_LOGIC_6  | 1J10  | AR2  |
| ------------ | ----- | ---- |
I2S1_SCLK_RX_M2/GPIO3_C3_d
PWM13_M0/GMAC1_MCLKINOUT_M0/UART3_RX_
| VSS_78  | 1J11  | AR4  |
| ------- | ----- | ---- |
M1/PDM_SDI3_M2/GPIO3_C0_d
VOP_BT1120_D8/GMAC1_RXD1_M0/UART4_TX_
| VSS_79  | 1J12  | AR6  |
| ------- | ----- | ---- |
M1/PWM9_M0/GPIO3_B2_d
VOP_BT1120_D6/ETH1_REFCLKO_25M_M0/SDM
| VSS_80  | 1J13  | AR7  |
| ------- | ----- | ---- |
MC2_PWREN_M1/GPIO3_B0_d
VOP_BT1120_D3/GMAC1_RXD2_M0/I2S3_LRCK_
| VDD_NPU_4  | 1J14  | AR9  |
| ---------- | ----- | ---- |
M0/SDMMC2_D3_M1/GPIO3_A4_d
VOP_BT1120_D1/GMAC1_TXD2_M0/I2S3_MCLK_
| VDD_NPU_5  | 1J15  | AR10  |
| ---------- | ----- | ----- |
M0/SDMMC2_D1_M1/GPIO3_A2_d
| AVSS1_11            | 1J16  HDMITX_SCL/I2C5_SCL_M1/GPIO4_C7_u  | AR12  |
| ------------------- | ---------------------------------------- | ----- |
| USB_AVDD1_0V9       | 1J17  MIPI_CSI_RX_D3P                    | AR14  |
| AVSS1_12            | 1J18  MIPI_CSI_RX_D2N                    | AR15  |
| USB3_HOST1_DP       | 1J19  MIPI_CSI_RX_D1P                    | AR17  |
| USB3_HOST1_DM       | 1J20  MIPI_CSI_RX_D0N                    | AR18  |
| VSS_81              | 1K2  MIPI_DSI_TX1_D3P                    | AR20  |
| VSS_82              | 1K3  MIPI_DSI_TX1_D2N                    | AR21  |
| VSS_83              | 1K4  MIPI_DSI_TX1_D1P                    | AR23  |
| VSS_84              | 1K5  MIPI_DSI_TX1_D0N                    | AR24  |
| VSS_85              | 1K6  MIPI_DSI_TX0_D3P/LVDS_TX0_D3P       | AR26  |
| VDD_LOGIC_7         | 1K7  MIPI_DSI_TX0_D2N/LVDS_TX0_D2N       | AR27  |
| VSS_86              | 1K8  MIPI_DSI_TX0_D1P/LVDS_TX0_D1P       | AR29  |
| VSS_87              | 1K9  MIPI_DSI_TX0_D0N/LVDS_TX0_D0N       | AR30  |
| VDD_LOGIC_8         | 1K10  HDMI_TX_CLKP                       | AR32  |
| VSS_88              | 1K11  HDMI_TX_D0N                        | AR33  |
| VSS_89              | 1K12  HDMI_TX_D1P                        | AR35  |
| VSS_90              | 1K13  HDMI_TX_D2N                        | AR36  |
| VSS_91              | 1K14  VSS_29                             | AR38  |
| VSS_92              | 1K15  VSS_4                              | B1    |
| MULTI_PHY_AVDD_0V9  | 1K16  VSS_5                              | B2    |
DDR4_CS0n/LPDDR4_CS0n_A/DDR3_ODT1/LPDD
| MULTI_PHY_AVDD_1V8  | 1K17  | B3  |
| ------------------- | ----- | --- |
R3_ODT0/AC25
DDR4_CKE/LPDDR4_CKE0_A/DDR3_CKE/LPDDR3
| AVSS1_13  | 1K18  | B4  |
| --------- | ----- | --- |
_CKE/AC22
DDR4_CLKN/LPDDR4_CLKN_A/DDR3_CLKN/LPDD
| PCIE20_REFCLKP  | 1K19  | B5  |
| --------------- | ----- | --- |
R3_CLKN/AC24
| PCIE20_REFCLKN  | 1K20  VSS_6  | B6  |
| --------------- | ------------ | --- |
CIF_HREF/EBC_SDLE/GMAC1_MDC_M1/UART1_
|     | 1L1  DDR4_A9/LPDDR4_CLKN_B/DDR3_A5/-/AC9  | B7  |
| --- | ----------------------------------------- | --- |
RTSn_M1/I2S2_MCLK_M1/GPIO4_B6_d
CAM_CLKOUT1/EBC_SDCE2/GMAC1_RXD1_M1/ DDR4_A5/LPDDR4_A5_B/DDR3_A11/LPDDR3_A2
|                                       | 1L2   | B8  |
| ------------------------------------- | ----- | --- |
| SPI3_MISO_M0/I2S1_SDO1_M1/GPIO4_B0_d  | /AC5  |     |
DDR4_A6/LPDDR4_A1_B/DDR3_A13/LPDDR3_A1
| VSS_93  | 1L3  | B9  |
| ------- | ---- | --- |
/AC6
DDR_DQ1_B/DDR4_DQU5_B/LPDDR4_DQ1_B/DD
| VCCIO6_1  | 1L4  | B10  |
| --------- | ---- | ---- |
R3_DQ17/LPDDR3_DQ5
| VCCIO6_2  | 1L5  VSS_7  | B11  |
| --------- | ----------- | ---- |
DDR_DQ0_B/DDR4_DQU7_B/LPDDR4_DQ0_B/DD
| VSS_94  | 1L6  | B12  |
| ------- | ---- | ---- |
R3_DQ16/LPDDR3_DQ1
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      27

RK3566 Datasheet                                                   Rev 1.1
| Pin Name  | PIN  Pin Name  | PIN  |
| --------- | -------------- | ---- |
DDR_DQ4_B/DDR4_DQU0_B/LPDDR4_DQ4_B/DD
| VDD_LOGIC_9  | 1L7  | B13  |
| ------------ | ---- | ---- |
R3_DQ20/LPDDR3_DQ2
| VDD_GPU_1  | 1L8  VSS_8  | B14  |
| ---------- | ----------- | ---- |
DDR_DQ13_B/DDR4_DQL5_B/LPDDR4_DQ13_B/
| VDD_GPU_2  | 1L9  | B15  |
| ---------- | ---- | ---- |
DDR3_DQ29/LPDDR3_DQ17
DDR_DQ15_B/DDR4_DQL3_B/LPDDR4_DQ15_B/
| VSS_95  | 1L10  | B16  |
| ------- | ----- | ---- |
DDR3_DQ31/LPDDR3_DQ21
DDR_DQS1N_B/DDR4_DQSL_N_B/LPDDR4_DQS
| VSS_96  | 1L11  | B17  |
| ------- | ----- | ---- |
1N_B/DDR3_DQS3N/LPDDR3_DQS2N
| VSS_97  | 1L12  VSS_9  | B18  |
| ------- | ------------ | ---- |
DDR_DQ8_B/DDR4_DQL0_B/LPDDR4_DQ8_B/DD
| VSS_98  | 1L13  | B19  |
| ------- | ----- | ---- |
R3_DQ24/LPDDR3_DQ18
DDR_DQ11_B/DDR4_DQL6_B/LPDDR4_DQ11_B/
| VSS_99  | 1L14  | B20  |
| ------- | ----- | ---- |
DDR3_DQ27/LPDDR3_DQ23
| VSS_100  | 1L15  VSS_10  | B21  |
| -------- | ------------- | ---- |
I2C3_SCL_M0/UART3_TX_M0/AUDIOPWM_LOUT_
| AVSS1_14  | 1L19  | B22  |
| --------- | ----- | ---- |
N/GPIO1_A1_u
I2S1_SCLK_TX_M0/UART3_CTSn_M0/SCR_IO/GP
| VSS_101  | 1M3  | B23  |
| -------- | ---- | ---- |
IO1_A3_d
I2S1_LRCK_TX_M0/UART4_RTSn_M0/SCR_RST/G
| VSS_102  | 1M4  | B24  |
| -------- | ---- | ---- |
PIO1_A5_d
I2S1_SDO0_M0/UART4_CTSn_M0/SCR_DET/AUD
| VSS_103  | 1M5  | B25  |
| -------- | ---- | ---- |
IOPWM_ROUT_N/GPIO1_A7_d
I2S1_SDO3_M0/I2S1_SDI1_M0/PDM_SDI1_M0/P
| VSS_104  | 1M6  | B26  |
| -------- | ---- | ---- |
CIE20_PERSTn_M2/GPIO1_B2_d
| VDD_GPU_3  | 1M7  EMMC_D1/FLASH_D1/GPIO1_B5_u   | B27  |
| ---------- | ---------------------------------- | ---- |
| VDD_GPU_4  | 1M8  VSS_11                        | B28  |
| VDD_GPU_5  | 1M9  EMMC_D3/FLASH_D3/GPIO1_B7_u   | B29  |
| VSS_105    | 1M10  EMMC_D6/FLASH_D6/GPIO1_C2_u  | B30  |
| VSS_106    | 1M11  VSS_12                       | B31  |
| VSS_107    | 1M12  EMMC_D2/FLASH_D2/GPIO1_B6_u  | B32  |
| VSS_108    | 1M13  EMMC_D4/FLASH_D4/GPIO1_C0_u  | B33  |
SDMMC1_DET/I2C4_SCL_M1/UART8_CTSn_M0/G
| VSS_109  | 1M14  | B34  |
| -------- | ----- | ---- |
PIO2_B2_u
| VSS_110  | 1M15  SDMMC1_CMD/UART9_RX_M0/GPIO2_A7_u  | B35  |
| -------- | ---------------------------------------- | ---- |
I2S2_MCLK_M0/ETH0_REFCLKO_25M/UART7_RT
| VSS_111  | 1M16  | B36  |
| -------- | ----- | ---- |
Sn_M0/SPI2_CLK_M0/GPIO2_C1_d
| VSS_112  | 1M17  SDMMC1_CLK/UART9_TX_M0/GPIO2_B0_d  | B37  |
| -------- | ---------------------------------------- | ---- |
CLK32K_OUT1/UART8_RX_M0/SPI1_CS1_M0/GPI
| TVSS  | 1M18  | B38  |
| ----- | ----- | ---- |
O2_C6_d
DDR4_A2/LPDDR4_A1_A/DDR3_A4/LPDDR3_A6/
| GPIO0_D4_d  | 1M19  | C1  |
| ----------- | ----- | --- |
AC2
DDR4_A11/LPDDR4_A0_A/DDR3_A7/LPDDR3_A8
| VSS_113  | 1M20  | C2  |
| -------- | ----- | --- |
/AC11
CAM_CLKOUT0/EBC_SDCE1/GMAC1_RXD0_M1/ I2S2_SCLK_TX_M0/UART7_CTSn_M0/SPI2_MISO
|                                         | 1N1             | C37  |
| --------------------------------------- | --------------- | ---- |
| SPI3_CS1_M0/I2S1_LRCK_RX_M1/GPIO4_A7_d  | _M0/GPIO2_C2_d  |      |
CIF_D14/EBC_SDDO14/GMAC1_TXD0_M1/UAR
|     | 1N2  VSS_13  | D2  |
| --- | ------------ | --- |
T9_TX_M2/I2S2_LRCK_TX_M1/GPIO4_A4_d
I2S2_SDI_M0/UART8_TX_M0/SPI2_CS1_M0/GPI
| VSS_114  | 1N3  | D37  |
| -------- | ---- | ---- |
O2_C5_d
I2S2_SCLK_RX_M0/UART6_RTSn_M0/SPI1_MOSI
| VSS_115  | 1N4  | D38  |
| -------- | ---- | ---- |
_M0/GPIO2_B7_d
DDR_DQ3_A/DDR4_DQL6_A/LPDDR4_DQ3_A/DD
| VCCIO5_1  | 1N5  | E1  |
| --------- | ---- | --- |
R3_DQ3/LPDDR3_DQ9
DDR4_A8/LPDDR4_ODT0_CA_A/DDR3_A6/LPDDR
| VCCIO5_2  | 1N6  | E2  |
| --------- | ---- | --- |
3_A9/AC8
| VSS_116  | 1N7  VSS_23  | E37  |
| -------- | ------------ | ---- |
DDR_DQ2_A/DDR4_DQL4_A/LPDDR4_DQ2_A/DD
| VCCIO7  | 1N8  | F1  |
| ------- | ---- | --- |
R3_DQ2/LPDDR3_DQ10
DDR_DQ1_A/DDR4_DQL2_A/LPDDR4_DQ1_A/DD
| MIPI_CSI_RX_AVDD_0V9  | 1N9  | F2  |
| --------------------- | ---- | --- |
R3_DQ1/LPDDR3_DQ14
MIPI_DSI_TX1_AVDD_0V9  1N10  UART1_RTSn_M0/SPI1_CLK_M0/GPIO2_B5_u  F37
| AVSS_9  | 1N11  UART1_TX_M0/GPIO2_B4_u  | F38  |
| ------- | ----------------------------- | ---- |
DDR_DQ0_A/DDR4_DQL0_A/LPDDR4_DQ0_A/DD
| AVSS_10  | 1N12  | G2  |
| -------- | ----- | --- |
R3_DQ0/LPDDR3_DQ15
HDMI_TX_AVDD_0V9_2  1N13  UART1_CTSn_M0/SPI1_MISO_M0/GPIO2_B6_u  G37
HDMI_TX_AVDD_0V9_1  1N14  SDMMC0_CLK/TEST_CLKOUT/UART5_TX_M0/GPI G38
O2_A2_d
| PMUIO2  | 1N15  DDR_DQS0N_A/DDR4_DQSL_N_A/LPDDR4_DQS | H1  |
| ------- | ------------------------------------------ | --- |
0N_A/DDR3_DQS0N/LPDDR3_DQS1N
PMU_VDD_LOGIC_0V9  1N16  DDR_DQS0P_A/DDR4_DQSL_P_A/LPDDR4_DQS0 H2
P_A/DDR3_DQS0P/LPDDR3_DQS1P
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      28

RK3566 Datasheet                                                   Rev 1.1
| Pin Name         |     | PIN  Pin Name     |     | PIN  |
| ---------------- | --- | ----------------- | --- | ---- |
| PMUPLL_AVSS      |     | 1N17  AVSS1_1     |     | H37  |
| PMUPLL_AVDD_1V8  |     | 1N18  VSS_14      |     | J2   |
| GPIO0_D3_d       |     | 1N19  EDP_TX_D0P  |     | J37  |
| GPIO0_D5_d       |     | 1N20  EDP_TX_D0N  |     | J38  |
DDR_DQ5_A/DDR4_DQL5_A/LPDDR4_DQ5_A/DD
| VSS_117  |     | 1P1  |     | K1  |
| -------- | --- | ---- | --- | --- |
R3_DQ5/LPDDR3_DQ12
CIF_D11/EBC_SDDO11/GMAC1_RXD2_M1/PDM DDR_DQ6_A/DDR4_DQL3_A/LPDDR4_DQ6_A/DD
|                      |     | 1P2                |     | K2  |
| -------------------- | --- | ------------------ | --- | --- |
| _SDI1_M1/GPIO4_A1_d  |     | R3_DQ6/LPDDR3_DQ8  |     |     |
PWM14_M0/VOP_PWM_M1/GMAC1_MDC_M0/U
|     |     | 1P3  EDP_TX_D1N  |     | K37  |
| --- | --- | ---------------- | --- | ---- |
ART7_TX_M1/PDM_CLK1_M2/GPIO3_C4_d
PWM15_IR_M0/SPDIF_TX_M1/GMAC1_MDIO_M
| 0/UART7_RX_M1/I2S1_LRCK_RX_M2/GPIO3_C |     | 1P4  EDP_TX_D1P  |     | K38  |
| ------------------------------------- | --- | ---------------- | --- | ---- |
5_d
| VSS_118  |     | 1P5  VSS_15   |     | L2   |
| -------- | --- | ------------- | --- | ---- |
| VSS_119  |     | 1P6  AVSS1_2  |     | L37  |
DDR_DQ12_A/DDR4_DQU2_A/LPDDR4_DQ12_A/
| VSS_120  |     | 1P7  |     | M1  |
| -------- | --- | ---- | --- | --- |
DDR3_DQ12/LPDDR3_DQ26
DDR_DQ4_A/DDR4_DQL7_A/LPDDR4_DQ4_A/DD
| AVSS_11  |     | 1P8  |     | M2  |
| -------- | --- | ---- | --- | --- |
R3_DQ4/LPDDR3_DQ13
| MIPI_CSI_RX_AVDD_1V8  |     | 1P9  EDP_TX_D2P   |     | M37  |
| --------------------- | --- | ----------------- | --- | ---- |
| AVSS_12               |     | 1P10  EDP_TX_D2N  |     | M38  |
DDR_DQS1P_A/DDR4_DQSU_P_A/LPDDR4_DQS1
| MIPI_DSI_TX0/LVDS_TX0_AVDD_0V9  |     | 1P11  |     | N1  |
| ------------------------------- | --- | ----- | --- | --- |
P_A/DDR3_DQS1P/LPDDR3_DQS3P
DDR_DQS1N_A/DDR4_DQSU_N_A/LPDDR4_DQS
| MIPI_DSI_TX0/LVDS_TX0_AVDD_1V8  |     | 1P12  |     | N2  |
| ------------------------------- | --- | ----- | --- | --- |
1N_A/DDR3_DQS1N/LPDDR3_DQS3N
| HDMI_TX_AVDD_1V8  |     | 1P13  EDP_TX_D3P  |     | N37  |
| ----------------- | --- | ----------------- | --- | ---- |
| AVSS_13           |     | 1P14  EDP_TX_D3N  |     | N38  |
DDR_DQ8_A/DDR4_DQU3_A/LPDDR4_DQ8_A/DD
| VSS_121  |     | 1P15  |     | P2  |
| -------- | --- | ----- | --- | --- |
R3_DQ8/LPDDR3_DQ25
| PMUIO1  |     | 1P16  AVSS1_3  |     | P37  |
| ------- | --- | -------------- | --- | ---- |
DDR_DQ9_A/DDR4_DQU1_A/LPDDR4_DQ9_A/DD
| PMUPLL_AVDD_0V9  |     | 1P17  |     | R1  |
| ---------------- | --- | ----- | --- | --- |
R3_DQ9/LPDDR3_DQ24
DDR_DQ10_A/DDR4_DQU7_A/LPDDR4_DQ10_A/
| REFCLK_OUT/GPIO0_A0_d  |     | 1P18  |     | R2  |
| ---------------------- | --- | ----- | --- | --- |
DDR3_DQ10/LPDDR3_DQ28
| PMIC_SLEEP/TSADC_SHUT_M1/GPIO0_A2_d  |     | 1P19  USB_OTG0_DP  |     | R37  |
| ------------------------------------ | --- | ------------------ | --- | ---- |
| GPIO0_D6_d                           |     | 1P20  USB_OTG0_DM  |     | R38  |
CIF_D12/EBC_SDDO12/GMAC1_RXD3_M1/UAR DDR_DQ11_A/DDR4_DQU5_A/LPDDR4_DQ11_A/
|                                  |     | 1R1                    |     | T2  |
| -------------------------------- | --- | ---------------------- | --- | --- |
| T7_TX_M2/PDM_SDI2_M1/GPIO4_A2_d  |     | DDR3_DQ11/LPDDR3_DQ29  |     |     |
CIF_D6/EBC_SDDO6/SDMMC2_DET_M0/I2S1_
|     |     | 1R2  USB_OTG0_ID  |     | T37  |
| --- | --- | ----------------- | --- | ---- |
SDI2_M1/VOP_BT656_D6_M1/GPIO3_D4_d
| VSS_122                |     | 1R3  USB_OTG0_VBUSDET             |     | T38  |
| ---------------------- | --- | --------------------------------- | --- | ---- |
| VSS_123                |     | 1R4  VSS_16                       |     | U2   |
| VSS_124                |     | 1R5  AVSS1_4                      |     | U37  |
| VSS_125                |     | 1R6  USB_HOST2_DM                 |     | V1   |
| VSS_126                |     | 1R7  USB_HOST2_DP                 |     | V2   |
| AVSS_14                |     | 1R8  USB3_HOST1_SSRXN/SATA1_RXN   |     | V37  |
| AVSS_15                |     | 1R9  USB3_HOST1_SSRXP/SATA1_RXP   |     | V38  |
| MIPI_DSI_TX1_AVDD_1V8  |     | 1R10  VSS_17                      |     | W2   |
| AVSS_16                |     | 1R11  USB3_HOST1_SSTXP/SATA1_TXP  |     | W37  |
| AVSS_17                |     | 1R12  USB3_HOST1_SSTXN/SATA1_TXN  |     | W38  |
| AVSS_18                |     | 1R13  USB_HOST3_DM                |     | Y1   |
| AVSS_19                |     | 1R14  USB_HOST3_DP                |     | Y2   |
| AVSS_20                |     | 1R15  AVSS1_5                     |     | Y37  |
I2C2_SDA_M0/SPI0_MOSI_M0/PCIE20_PERSTn
|     |     | 1R16      |     |     |
| --- | --- | --------- | --- | --- |
_M0/PWM2_M1/GPIO0_B6_u

2.6 Power/Ground IO Description
Table 2-2 Power/Ground IO information
|     | Group  | Ball#  | Descriptions  |     |
| --- | ------ | ------ | ------------- | --- |
A1 B21 1L15 1M3 1M4 1M5 1M6 1M10
1M11 1M12 1M13 1M14 B28 1M15 1M16
|     | 1M17 1M20 1N3 1N4 1N7 1P1 1P5 1P6  | Internal Core Ground,   |     |     |
| --- | ---------------------------------- | ----------------------- | --- | --- |
VSS
|     | B31 1P7 1P15 1R3 1R4 1R5 1R6 1R7  | Digital IO Ground,  |     |     |
| --- | --------------------------------- | ------------------- | --- | --- |
1T3 1T5 1U2 D2 1V1 1V4 J2 L2 U2 W2
AA2 AD2 A2 AP2 AR1 AP8 E37 AC37
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      29

RK3566 Datasheet                                                   Rev 1.1
| Group  |     | Ball#  | Descriptions  |
| ------ | --- | ------ | ------------- |
AE37 AH37 AL37 AP37 AR38 A38 1B10
1B11 1B15 1B19 1C4 1C5 1C6 1C8 1C9
1C14 B1 1C16 1C18 1D1 1D3 1D10
1D14 1E3 1E8 1E10 1E14 B2 1E15 1E17
1F6 1F7 1F8 1F9 1F10 1F15 1F16 1G3
B6 1G6 1G7 1G8 1G9 1G10 1G11 1G12
1G14 1H1 1H2 B11 1H6 1H11 1H12
1H13 1J1 1J6 1J8 1J9 1J11 1J12 B14
1J13 1K2 1K3 1K4 1K5 1K6 1K8 1K9
1K11 1K12 B18 1K13 1K14 1K15 1L3
1L6 1L10 1L11 1L12 1L13 1L14
AP13 1N12 1P8 1P10 1P14 1R8 1R9
1R11 1R12 1R13 1R14 AP16 1R15 1T7
1T8 1T9 1T10 1T11 1T12 1T13 1T14
| AVSS  |     |     | Analog Ground  |
| ----- | --- | --- | -------------- |
1T15 AP19 1T16 1T17 1U12 1U13 1U15
1U17 1V7 1V12 1V13 1V18 AP22 AP25
AP28 AP31 AP34 1N11
H37 1G20 1J16 1J18 1K18 1L19 L37 P37
| AVSS1  |     |     | Analog Ground  |
| ------ | --- | --- | -------------- |
U37 Y37 1F20 1G16 1G18 1G19
| DDR_AVSS    |     | 1D4   | Analog Ground  |
| ----------- | --- | ----- | -------------- |
| PMUPLL_VSS  |     | 1N17  | Analog Ground  |
Analog Ground
| SYSPLL_VSS  |     | 1J5  |     |
| ----------- | --- | ---- | --- |

1C12 1F14 1G13 1D11 1D12 1E11 1E12
| VDD_CPU  |     |     | CPU Core Power  |
| -------- | --- | --- | --------------- |
1E13 1F11 1F12 1F13
| VDD_GPU  | 1L8 1L9 1M7 1M8 1M9       |     | GPU Core Power  |
| -------- | ------------------------- | --- | --------------- |
| VDD_NPU  | 1G15 1H14 1H15 1J14 1J15  |     | NPU Core Power  |
1H7 1H8 1H9 1H10 1J7 1J10 1K7 1K10
| VDD_LOGIC  |     |     | Logic Power  |
| ---------- | --- | --- | ------------ |
1L7
| PMU_VDD_LOGIC_0V9  |     | 1N16  | PMU digital Power  |
| ------------------ | --- | ----- | ------------------ |

| VCCIO1  |     | 1D13     | VCCIO1 Power Domain Power  |
| ------- | --- | -------- | -------------------------- |
| VCCIO2  |     | 1C13     | VCCIO2 Power Domain Power  |
| VCCIO3  |     | 1F17     | VCCIO3 Power Domain Power  |
| VCCIO4  |     | 1E16     | VCCIO4 Power Domain Power  |
| VCCIO5  |     | 1N5 1N6  | VCCIO5 Power Domain Power  |
| VCCIO6  |     | 1L4 1L5  | VCCIO6 Power Domain Power  |
| VCCIO7  |     | 1N8      | VCCIO7 Power Domain Power  |
|         |     | 1P16     | PMU VCCIO1 Power Domain    |
PMUIO1
Power
|     |     | 1N15  | PMU VCCIO2 Power Domain  |
| --- | --- | ----- | ------------------------ |
PMUIO2
Power

DDRPHY _VDDQ  1D5 1D6 1D7 1D8 1D9 1E4 1F4 1G4  DDR PHY Power
| DDRPHY_VDDQL  | 1E6 1E7 1E9 1F5 1G5  |     | DDR PHY Power  |
| ------------- | -------------------- | --- | -------------- |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      30

RK3566 Datasheet                                                   Rev 1.1
| Group  | Ball#  | Descriptions  |
| ------ | ------ | ------------- |

| PMUPLL_AVDD_0V9  | 1P17  | PLL Analog Power  |
| ---------------- | ----- | ----------------- |
| PMUPLL_AVDD_1V8  | 1N18  | PLL Analog Power  |

| SYSPLL_AVDD_0V9  | 1H5  | PLL Analog Power  |
| ---------------- | ---- | ----------------- |
| SYSPLL_AVDD_1V8  | 1H4  | PLL Analog Power  |

| USB_AVDD2_0V9  | 1J4  | USB2.0 analog Power   |
| -------------- | ---- | --------------------- |
| USB_AVDD2_1V8  | 1J3  | USB2.0 analog Power   |
| USB_AVDD2_3V3  | 1J2  | USB2.0 analog Power   |

| USB_AVDD1_0V9  | 1J17  | USB3.0 analog Power   |
| -------------- | ----- | --------------------- |
| USB_AVDD1_1V8  | 1H16  | USB3.0 analog Power   |
| USB_AVDD1_3V3  | 1H18  | USB3.0 analog Power   |

| MULTI_PHY_AVDD_0V9  | 1K16  | Multi-Phy analog Power   |
| ------------------- | ----- | ------------------------ |
| MULTI_PHY_AVDD_1V8  | 1K17  | Multi-Phy analog Power   |

| MIPI_CSI_RX_AVDD_0V9  | 1N9  | MIPI CSI RX Analog Power  |
| --------------------- | ---- | ------------------------- |
| MIPI_CSI_RX_AVDD_1V8  | 1P9  | MIPI CSI RX Analog Power  |

MIPI_DSI_TX0/LVDS_TX0_AVDD_0V9  1P11  MIPI DSI TX analog Power
MIPI_DSI_TX0/LVDS_TX0_AVDD_1V8  1P12  MIPI DSI TX analog Power
| MIPI_DSI_TX1_AVDD_0V9  |     | MIPI DSI TX analog Power   |
| ---------------------- | --- | -------------------------- |
1N10
| MIPI_DSI_TX1_AVDD_1V8  |     | MIPI DSI TX analog Power  |
| ---------------------- | --- | ------------------------- |
1R10

| EDP_TX_AVDD_0V9  | 1H17  | EDP Analog Power   |
| ---------------- | ----- | ------------------ |
| EDP_TX_AVDD_1V8  | 1G17  | EDP Analog Power   |

| HDMI_TX_AVDD_0V9  | 1N14  1N13  | HDMI PHY analog Power  |
| ----------------- | ----------- | ---------------------- |
| HDMI_TX_AVDD_1V8  | 1P13        | HDMI PHY analog Power  |

| SARADC_AVDD_1V8  | 1D16  | SARADC Analog Power  |
| ---------------- | ----- | -------------------- |

| OTP_VCC_1V8  | 1D15  | OTP Analog Power  |
| ------------ | ----- | ----------------- |

Copyright 2021 © Rockchip Electronics Co., Ltd.                                                      31

RK3566 Datasheet                                                                                             Rev 1.1
2.7 Function IO Description

 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ |
Domain
| AD37  XIN24M  | XIN24M  |     |     |     |     |     |
| ------------- | ------- | --- | --- | --- | --- | --- |
PMUIO
| XOUT24M  | XOUT24M  |     |     |     |     |     |
| -------- | -------- | --- | --- | --- | --- | --- |
0
| 1N19  GPIO0_D3_d  | GPIO0_D3_d  |     |     |     |     |     |
| ----------------- | ----------- | --- | --- | --- | --- | --- |
PMUIO0
| 1M19  GPIO0_D4_d  | GPIO0_D4_d  |     |     |     |     |     |
| ----------------- | ----------- | --- | --- | --- | --- | --- |
| 1N20  GPIO0_D5_d  | GPIO0_D5_d  |     |     |     |     |     |
| 1P20  GPIO0_D6_d  | GPIO0_D6_d  |     |     |     |     |     |
| 1M18  TVSS        | TVSS        |     |     |     |     |     |
| AG38  nPOR_u      | nPOR_u      |     |     |     |     |     |
PMUIO
1  REFCLK_OUT/GPIO0_A0_d  GPIO0_A0_d  REFCLK_OUT
TSADC_SHUT_M
1R20  TSADC_SHUT_M0/TSADC_SHUT_ORG/GPIO0_A1_z  GPIO0_A1_z  TSADC_SHUT_ORG
0
1P19  PMIC_SLEEP/TSADC_SHUT_M1/GPIO0_A2_d  GPIO0_A2_d  PMIC_SLEEP  TSADC_SHUT_M1
PMUIO1
| 1R19  GPIO0_A3_u  | GPIO0_A3_u  |     |     |     |     |     |
| ----------------- | ----------- | --- | --- | --- | --- | --- |
AF37  SDMMC0_DET/SATA_CP_DET/GPIO0_A4_u  GPIO0_A4_u  SDMMC0_DET  SATA_CP_DET
AG37  SDMMC0_PWREN/SATA_MP_SWITCH/PCIE20_CLKREQn_M0/GPIO0_A5_d  GPIO0_A5_d  SDMMC0_PWRE SATA_MP_SWITCH  PCIE20_CLKREQn_
|     |     | N   |     | M0  |     |     |
| --- | --- | --- | --- | --- | --- | --- |
AJ38  GPU_PWREN/SATA_CP_POD/GPIO0_A6_d  GPIO0_A6_d  GPU_PWREN  SATA_CP_POD
AF38  FLASH_VOL_SEL/GPIO0_A7_u  GPIO0_A7_u  FLASH_VOL_SEL
1T20  CLK32K_IN/CLK32K_OUT0/GPIO0_B0_u  GPIO0_B0_u  CLK32K_IN  CLK32K_OUT0
PMUIO
| I2C0_SCL/GPIO0_B1_u  | GPIO0_B1_u  | I2C0_SCL  |     |     |     |     |
| -------------------- | ----------- | --------- | --- | --- | --- | --- |
2
AK38  I2C0_SDA/GPIO0_B2_u  GPIO0_B2_u  I2C0_SDA
AK37  I2C1_SCL/MCU_JTAG_TDO/GPIO0_B3_u  GPIO0_B3_u  I2C1_SCL  MCU_JTAG_TDO
PCIE20_BUTTONRS
AM38  I2C1_SDA/PCIE20_BUTTONRSTn/MCU_JTAG_TCK/GPIO0_B4_u  GPIO0_B4_u  I2C1_SDA  Tn  MCU_JTAG_TCK
PCIE20_WAKEn_M
1U20  I2C2_SCL_M0/SPI0_CLK_M0/PCIE20_WAKEn_M0/PWM1_M1/GPIO0_B5_u  GPIO0_B5_u  I2C2_SCL_M0  SPI0_CLK_M0  PWM1_M1
0
I2C2_SDA_M0/SPI0_MOSI_M0/PCIE20_PERSTn_M0/PWM2_M1/GPIO0_B6_ PCIE20_PERSTn_M
| 1R16  | GPIO0_B6_u  | I2C2_SDA_M0  | SPI0_MOSI_M0  |     | PWM2_M1  |     |
| ----- | ----------- | ------------ | ------------- | --- | -------- | --- |
| u     |             |              |               | 0   |          |     |
1R17  PWM0_M0/CPUAVS/GPIO0_B7_d  GPIO0_B7_d  PWM0_M0  CPUAVS              PMUIO2
1T19  PWM1_M0/GPUAVS/UART0_RX/GPIO0_C0_d  GPIO0_C0_d  PWM1_M0  GPUAVS  UART0_RX
1R18  PWM2_M0/NPUAVS/UART0_TX/MCU_JTAG_TDI/GPIO0_C1_d  GPIO0_C1_d  PWM2_M0  NPUAVS  UART0_TX  MCU_JTAG_TDI
AM37  PWM3_IR/EDP_HPDIN_M1/MCU_JTAG_TMS/GPIO0_C2_d  GPIO0_C2_d  PWM3_IR  EDP_HPDIN_M1  MCU_JTAG_TMS
AN38  PWM4/VOP_PWM_M0/MCU_JTAG_TRSTn/GPIO0_C3_d  GPIO0_C3_d  PWM4  VOP_PWM_M0  MCU_JTAG_TRSTn
AN37  PWM5/SPI0_CS1_M0/UART0_RTSn/GPIO0_C4_d  GPIO0_C4_d  PWM5  SPI0_CS1_M0  UART0_RTSn
1U19  PWM6/SPI0_MISO_M0/GPIO0_C5_d  GPIO0_C5_d  PWM6  SPI0_MISO_M0
1T18  PWM7_IR/SPI0_CS0_M0/GPIO0_C6_d  GPIO0_C6_d  PWM7_IR  SPI0_CS0_M0
1V20  HDMITX_CEC_M1/PWM0_M1/UART0_CTSn/GPIO0_C7_d  GPIO0_C7_d  HDMITX_CEC_M PWM0_M1  UART0_CTSn
1
1V19  UART2_RX_M0/GPIO0_D0_u  GPIO0_D0_u  UART2_RX_M0
1U18  UART2_TX_M0/GPIO0_D1_u  GPIO0_D1_u  UART2_TX_M0
AUDIOPWM_LOUT_
A22  I2C3_SDA_M0/UART3_RX_M0/AUDIOPWM_LOUT_P/GPIO1_A0_u  GPIO1_A0_u  I2C3_SDA_M0  UART3_RX_M0
P
| VCCIO |     |     |     | AUDIOPWM_LOUT_ |     |     |
| ----- | --- | --- | --- | -------------- | --- | --- |
1  I2C3_SCL_M0/UART3_TX_M0/AUDIOPWM_LOUT_N/GPIO1_A1_u  GPIO1_A1_u  I2C3_SCL_M0  UART3_TX_M0  N      VCCIO1
A23  I2S1_MCLK_M0/UART3_RTSn_M0/SCR_CLK/GPIO1_A2_d  GPIO1_A2_d  I2S1_MCLK_M0  UART3_RTSn_M0  SCR_CLK
|     |     | I2S1_SCLK_TX_ |     |     |     |     |
| --- | --- | ------------- | --- | --- | --- | --- |
B23  I2S1_SCLK_TX_M0/UART3_CTSn_M0/SCR_IO/GPIO1_A3_d  GPIO1_A3_d  M0  UART3_CTSn_M0  SCR_IO
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            32

RK3566 Datasheet Rev 1.1
Power
PIN PIN Name Func1 Func2 Func3 Func4 Func5 Func6
Domain
I2S1_SCLK_RX_M0/UART4_RX_M0/PDM_CLK1_M0/SPDIF_TX_M0/GPIO1_ I2S1_SCLK_RX_
1A13 GPIO1_A4_d UART4_RX_M0 PDM_CLK1_M0 SPDIF_TX_M0
A4_d M0
I2S1_LRCK_TX_
B24 I2S1_LRCK_TX_M0/UART4_RTSn_M0/SCR_RST/GPIO1_A5_d GPIO1_A5_d UART4_RTSn_M0 SCR_RST
M0
I2S1_LRCK_RX_M0/UART4_TX_M0/PDM_CLK0_M0/AUDIOPWM_ROUT_P/G I2S1_LRCK_RX_ AUDIOPWM_RO
1A14 GPIO1_A6_d UART4_TX_M0 PDM_CLK0_M0
PIO1_A6_d M0 UT_P
I2S1_SDO0_M0/UART4_CTSn_M0/SCR_DET/AUDIOPWM_ROUT_N/GPIO1_ AUDIOPWM_RO
B25 GPIO1_A7_d I2S1_SDO0_M0 UART4_CTSn_M0 SCR_DET
A7_d UT_N
I2S1_SDO1_M0/I2S1_SDI3_M0/PDM_SDI3_M0/PCIE20_CLKREQn_M2/GPI PCIE20_CLKREQ
1B13 GPIO1_B0_d I2S1_SDO1_M0 I2S1_SDI3_M0 PDM_SDI3_M0
O1_B0_d n_M2
I2S1_SDO2_M0/I2S1_SDI2_M0/PDM_SDI2_M0/PCIE20_WAKEn_M2/GPIO1 PCIE20_WAKEn_
A26 GPIO1_B1_d I2S1_SDO2_M0 I2S1_SDI2_M0 PDM_SDI2_M0
_B1_d M2
I2S1_SDO3_M0/I2S1_SDI1_M0/PDM_SDI1_M0/PCIE20_PERSTn_M2/GPIO PCIE20_PERSTn
B26 GPIO1_B2_d I2S1_SDO3_M0 I2S1_SDI1_M0 PDM_SDI1_M0
1_B2_d _M2
1B14 I2S1_SDI0_M0/PDM_SDI0_M0/GPIO1_B3_d GPIO1_B3_d I2S1_SDI0_M0 PDM_SDI0_M0
A32 EMMC_D0/FLASH_D0/GPIO1_B4_u GPIO1_B4_u EMMC_D0 FLASH_D0
VCCIO
EMMC_D1/FLASH_D1/GPIO1_B5_u GPIO1_B5_u EMMC_D1 FLASH_D1
2
B32 EMMC_D2/FLASH_D2/GPIO1_B6_u GPIO1_B6_u EMMC_D2 FLASH_D2
B29 EMMC_D3/FLASH_D3/GPIO1_B7_u GPIO1_B7_u EMMC_D3 FLASH_D3
B33 EMMC_D4/FLASH_D4/GPIO1_C0_u GPIO1_C0_u EMMC_D4 FLASH_D4
A30 EMMC_D5/FLASH_D5/GPIO1_C1_u GPIO1_C1_u EMMC_D5 FLASH_D5
B30 EMMC_D6/FLASH_D6/GPIO1_C2_u GPIO1_C2_u EMMC_D6 FLASH_D6
A33 EMMC_D7/FLASH_D7/GPIO1_C3_u GPIO1_C3_u EMMC_D7 FLASH_D7
A27 EMMC_CMD/FLASH_WRn/GPIO1_C4_u GPIO1_C4_u EMMC_CMD FLASH_WRn VCCIO2
A29 EMMC_CLKOUT/FLASH_DQS/GPIO1_C5_d GPIO1_C5_d EMMC_CLKOUT FLASH_DQS
EMMC_DATA_ST
1A16 EMMC_DATA_STROBE/FSPI_CS1n/FLASH_CLE/GPIO1_C6_d GPIO1_C6_d FSPI_CS1n FLASH_CLE
ROBE
1B16 EMMC_RSTn/FSPI_D2/FLASH_WPn/GPIO1_C7_d GPIO1_C7_d EMMC_RSTn FSPI_D2 FLASH_WPn
1A15 FSPI_CLK/FLASH_ALE/GPIO1_D0_d GPIO1_D0_d FSPI_CLK FLASH_ALE
1A17 FSPI_D0/FLASH_RDY/GPIO1_D1_u GPIO1_D1_u FSPI_D0 FLASH_RDY
1A18 FSPI_D1/FLASH_RDn/GPIO1_D2_u GPIO1_D2_u FSPI_D1 FLASH_RDn
1B17 FSPI_CS0n/FLASH_CS0n/GPIO1_D3_u GPIO1_D3_u FSPI_CS0n FLASH_CS0n
1C15 FSPI_D3/FLASH_CS1n/GPIO1_D4_u GPIO1_D4_u FSPI_D3 FLASH_CS1n
1E20 SDMMC0_D0/UART2_TX_M1/UART6_TX_M1/PWM8_M1/GPIO1_D5_u GPIO1_D5_u SDMMC0_D0 UART2_TX_M1 UART6_TX_M1 PWM8_M1
VCCIO
SDMMC0_D1/UART2_RX_M1/UART6_RX_M1/PWM9_M1/GPIO1_D6_u GPIO1_D6_u SDMMC0_D1 UART2_RX_M1 UART6_RX_M1 PWM9_M1
3
1D20 SDMMC0_D2/ARM_JTAG_TCK/UART5_CTSn_M0/GPIO1_D7_u GPIO1_D7_u SDMMC0_D2 ARM_JTAG_TCK UART5_CTSn_M0 VCCIO3
1F18 SDMMC0_D3/ARM_JTAG_TMS/UART5_RTSn_M0/GPIO2_A0_u GPIO2_A0_u SDMMC0_D3 ARM_JTAG_TMS UART5_RTSn_M0
1E19 SDMMC0_CMD/PWM10_M1/UART5_RX_M0/GPIO2_A1_u GPIO2_A1_u SDMMC0_CMD PWM10_M1 UART5_RX_M0
G38 SDMMC0_CLK/TEST_CLKOUT/UART5_TX_M0/GPIO2_A2_d GPIO2_A2_d SDMMC0_CLK TEST_CLKOUT UART5_TX_M0
1C19 SDMMC1_D0/UART6_RX_M0/GPIO2_A3_u GPIO2_A3_u SDMMC1_D0 UART6_RX_M0
VCCIO
SDMMC1_D1/UART6_TX_M0/GPIO2_A4_u GPIO2_A4_u SDMMC1_D1 UART6_TX_M0
4
1D18 SDMMC1_D2/UART7_RX_M0/GPIO2_A5_u GPIO2_A5_u SDMMC1_D2 UART7_RX_M0
1A20 SDMMC1_D3/UART7_TX_M0/GPIO2_A6_u GPIO2_A6_u SDMMC1_D3 UART7_TX_M0
B35 SDMMC1_CMD/UART9_RX_M0/GPIO2_A7_u GPIO2_A7_u SDMMC1_CMD UART9_RX_M0
B37 SDMMC1_CLK/UART9_TX_M0/GPIO2_B0_d GPIO2_B0_d SDMMC1_CLK UART9_TX_M0
VCCIO4
SDMMC1_PWRE
A35 SDMMC1_PWREN/I2C4_SDA_M1/UART8_RTSn_M0/GPIO2_B1_d GPIO2_B1_d I2C4_SDA_M1 UART8_RTSn_M0
N
B34 SDMMC1_DET/I2C4_SCL_M1/UART8_CTSn_M0/GPIO2_B2_u GPIO2_B2_u SDMMC1_DET I2C4_SCL_M1 UART8_CTSn_M0
1C20 UART1_RX_M0/GPIO2_B3_u GPIO2_B3_u UART1_RX_M0
F38 UART1_TX_M0/GPIO2_B4_u GPIO2_B4_u UART1_TX_M0
UART1_RTSn_M
F37 UART1_RTSn_M0/SPI1_CLK_M0/GPIO2_B5_u GPIO2_B5_u SPI1_CLK_M0
0
Copyright 2021 © Rockchip Electronics Co., Ltd. 33

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |     |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ | --- |
Domain
G37  UART1_CTSn_M0/SPI1_MISO_M0/GPIO2_B6_u  GPIO2_B6_u  UART1_CTSn_M SPI1_MISO_M0
0
I2S2_SCLK_RX_
D38  I2S2_SCLK_RX_M0/UART6_RTSn_M0/SPI1_MOSI_M0/GPIO2_B7_d  GPIO2_B7_d  M0  UART6_RTSn_M0  SPI1_MOSI_M0
I2S2_LRCK_RX_
A37  I2S2_LRCK_RX_M0/UART6_CTSn_M0/SPI1_CS0_M0/GPIO2_C0_d  GPIO2_C0_d  UART6_CTSn_M0  SPI1_CS0_M0
M0
| I2S2_MCLK_M0/ETH0_REFCLKO_25M/UART7_RTSn_M0/SPI2_CLK_M0/GPI |     |     | ETH0_REFCLKO_25 |     |     |     |     |
| ----------------------------------------------------------- | --- | --- | --------------- | --- | --- | --- | --- |
B36  GPIO2_C1_d  I2S2_MCLK_M0  UART7_RTSn_M0  SPI2_CLK_M0
| O2_C1_d  |     |     | M   |     |     |     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- |
C37  I2S2_SCLK_TX_M0/UART7_CTSn_M0/SPI2_MISO_M0/GPIO2_C2_d  GPIO2_C2_d  I2S2_SCLK_TX_ UART7_CTSn_M0  SPI2_MISO_M0
M0
I2S2_LRCK_TX_
1D19  I2S2_LRCK_TX_M0/UART9_RTSn_M0/SPI2_MOSI_M0/GPIO2_C3_d  GPIO2_C3_d  M0  UART9_RTSn_M0  SPI2_MOSI_M0
1B20  I2S2_SDO_M0/UART9_CTSn_M0/SPI2_CS0_M0/GPIO2_C4_d  GPIO2_C4_d  I2S2_SDO_M0  UART9_CTSn_M0  SPI2_CS0_M0
D37  I2S2_SDI_M0/UART8_TX_M0/SPI2_CS1_M0/GPIO2_C5_d  GPIO2_C5_d  I2S2_SDI_M0  UART8_TX_M0  SPI2_CS1_M0
B38  CLK32K_OUT1/UART8_RX_M0/SPI1_CS1_M0/GPIO2_C6_d  GPIO2_C6_d  CLK32K_OUT1  UART8_RX_M0  SPI1_CS1_M0
1U5  VOP_BT1120_D0/SPI1_CS0_M1/SDMMC2_D0_M1/GPIO3_A1_d  GPIO3_A1_d  VOP_BT1120_D0  SPI1_CS0_M1  SDMMC2_D0_M1
VCCIO VOP_BT1120_D1/GMAC1_TXD2_M0/I2S3_MCLK_M0/SDMMC2_D1_M1/GPI SDMMC2_D1_M
|             | GPIO3_A2_d  | VOP_BT1120_D1  | GMAC1_TXD2_M0  | I2S3_MCLK_M0  |     |     |     |
| ----------- | ----------- | -------------- | -------------- | ------------- | --- | --- | --- |
| 5  O3_A2_d  |             |                |                |               | 1   |     |     |
VOP_BT1120_D2/GMAC1_TXD3_M0/I2S3_SCLK_M0/SDMMC2_D2_M1/GPI SDMMC2_D2_M
AP10  GPIO3_A3_d  VOP_BT1120_D2  GMAC1_TXD3_M0  I2S3_SCLK_M0
| O3_A3_d  |     |     |     |     | 1   |     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- |
AR9  VOP_BT1120_D3/GMAC1_RXD2_M0/I2S3_LRCK_M0/SDMMC2_D3_M1/GPI GPIO3_A4_d  VOP_BT1120_D3  GMAC1_RXD2_M0  I2S3_LRCK_M0  SDMMC2_D3_M
| O3_A4_d  |     |     |     |     | 1   |     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- |
VOP_BT1120_D4/GMAC1_RXD3_M0/I2S3_SDO_M0/SDMMC2_CMD_M1/GP SDMMC2_CMD_
AP9  IO3_A5_d  GPIO3_A5_d  VOP_BT1120_D4  GMAC1_RXD3_M0  I2S3_SDO_M0  M1
VOP_BT1120_CLK/GMAC1_TXCLK_M0/I2S3_SDI_M0/SDMMC2_CLK_M1/GP VOP_BT1120_CL SDMMC2_CLK_M
| 1U4       | GPIO3_A6_d  |     | GMAC1_TXCLK_M0  | I2S3_SDI_M0  |     |     |     |
| --------- | ----------- | --- | --------------- | ------------ | --- | --- | --- |
| IO3_A6_d  |             | K   |                 |              | 1   |     |     |
1V3  VOP_BT1120_D5/GMAC1_RXCLK_M0/SDMMC2_DET_M1/GPIO3_A7_d  GPIO3_A7_d  VOP_BT1120_D5  GMAC1_RXCLK_M0  SDMMC2_DET_M1
VOP_BT1120_D6/ETH1_REFCLKO_25M_M0/SDMMC2_PWREN_M1/GPIO3_B ETH1_REFCLKO_25 SDMMC2_PWREN_
| AR7  | GPIO3_B0_d  | VOP_BT1120_D6  |       |     |     |     |     |
| ---- | ----------- | -------------- | ----- | --- | --- | --- | --- |
| 0_d  |             |                | M_M0  | M1  |     |     |     |
VOP_BT1120_D7/GMAC1_RXD0_M0/UART4_RX_M1/PWM8_M0/GPIO3_B1_
AP7  GPIO3_B1_d  VOP_BT1120_D7  GMAC1_RXD0_M0  UART4_RX_M1  PWM8_M0
d
AR6  VOP_BT1120_D8/GMAC1_RXD1_M0/UART4_TX_M1/PWM9_M0/GPIO3_B2_ GPIO3_B2_d  VOP_BT1120_D8  GMAC1_RXD1_M0  UART4_TX_M1  PWM9_M0
d
| VOP_BT1120_D9/GMAC1_RXDV_CRS_M0/I2C5_SCL_M0/PDM_SDI0_M2/G |     |     | GMAC1_RXDV_CRS |     |     |     |     |
| --------------------------------------------------------- | --- | --- | -------------- | --- | --- | --- | --- |
AP6  GPIO3_B3_d  VOP_BT1120_D9  I2C5_SCL_M0  PDM_SDI0_M2
| PIO3_B3_d                                                  |     |               | _M0  |     |     |     | VCCIO5  |
| ---------------------------------------------------------- | --- | ------------- | ---- | --- | --- | --- | ------- |
| VOP_BT1120_D10/GMAC1_RXER_M0/I2C5_SDA_M0/PDM_SDI1_M2/GPIO3 |     | VOP_BT1120_D1 |      |     |     |     |         |
1U3  GPIO3_B4_d  GMAC1_RXER_M0  I2C5_SDA_M0  PDM_SDI1_M2
| _B4_d                                                      |             | 0             |                |              |           |     |     |
| ---------------------------------------------------------- | ----------- | ------------- | -------------- | ------------ | --------- | --- | --- |
| VOP_BT1120_D11/GMAC1_TXD0_M0/I2C3_SCL_M1/PWM10_M0/GPIO3_B5 |             | VOP_BT1120_D1 |                |              |           |     |     |
| 1T4                                                        | GPIO3_B5_d  |               | GMAC1_TXD0_M0  | I2C3_SCL_M1  | PWM10_M0  |     |     |
| _d                                                         |             | 1             |                |              |           |     |     |
VOP_BT1120_D12/GMAC1_TXD1_M0/I2C3_SDA_M1/PWM11_IR_M0/GPIO3 VOP_BT1120_D1
1V2  _B6_d  GPIO3_B6_d  2  GMAC1_TXD1_M0  I2C3_SDA_M1  PWM11_IR_M0
AP5  PWM12_M0/GMAC1_TXEN_M0/UART3_TX_M1/PDM_SDI2_M2/GPIO3_B7_d  GPIO3_B7_d  PWM12_M0  GMAC1_TXEN_M0  UART3_TX_M1  PDM_SDI2_M2
PWM13_M0/GMAC1_MCLKINOUT_M0/UART3_RX_M1/PDM_SDI3_M2/GPIO GMAC1_MCLKINOU
AR4  3_C0_d  GPIO3_C0_d  PWM13_M0  T_M0  UART3_RX_M1  PDM_SDI3_M2
VOP_BT1120_D13/SPI1_MOSI_M1/PCIE20_PERSTn_M1/I2S1_SDO2_M2/G VOP_BT1120_D1 PCIE20_PERSTn_M
| AP4                                                         | GPIO3_C1_d  |               | SPI1_MOSI_M1  |     | I2S1_SDO2_M2  |     |     |
| ----------------------------------------------------------- | ----------- | ------------- | ------------- | --- | ------------- | --- | --- |
| PIO3_C1_d                                                   |             | 3             |               | 1   |               |     |     |
| VOP_BT1120_D14/SPI1_MISO_M1/UART5_TX_M1/I2S1_SDO3_M2/GPIO3_ |             | VOP_BT1120_D1 |               |     |               |     |     |
AP3  GPIO3_C2_d  SPI1_MISO_M1  UART5_TX_M1  I2S1_SDO3_M2
| C2_d  |     | 4   |     |     |     |     |     |
| ----- | --- | --- | --- | --- | --- | --- | --- |
AR2  VOP_BT1120_D15/SPI1_CLK_M1/UART5_RX_M1/I2S1_SCLK_RX_M2/GPIO GPIO3_C3_d  VOP_BT1120_D1 SPI1_CLK_M1  UART5_RX_M1  I2S1_SCLK_RX_
| 3_C3_d  |     | 5   |     |     | M2  |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- |
PWM14_M0/VOP_PWM_M1/GMAC1_MDC_M0/UART7_TX_M1/PDM_CLK1_M PDM_CLK1_
1P3  2/GPIO3_C4_d  GPIO3_C4_d  PWM14_M0  VOP_PWM_M1  GMAC1_MDC_M0  UART7_TX_M1  M2
PWM15_IR_M0/SPDIF_TX_M1/GMAC1_MDIO_M0/UART7_RX_M1/I2S1_LRC I2S1_LRCK_
1P4  GPIO3_C5_d  PWM15_IR_M0  SPDIF_TX_M1  GMAC1_MDIO_M0  UART7_RX_M1
| K_RX_M2/GPIO3_C5_d  |     |     |     |     |     | RX_M2  |     |
| ------------------- | --- | --- | --- | --- | --- | ------ | --- |
CIF_D0/EBC_SDDO0/SDMMC2_D0_M0/I2S1_MCLK_M1/VOP_BT656_D0_M VOP_BT656_
1T2  GPIO3_C6_d  CIF_D0  EBC_SDDO0  SDMMC2_D0_M0  I2S1_MCLK_M1
| 1/GPIO3_C6_d  |     |     |     |     |     | D0_M1  | VCCIO6  |
| ------------- | --- | --- | --- | --- | --- | ------ | ------- |
VCCIO CIF_D1/EBC_SDDO1/SDMMC2_D1_M0/I2S1_SCLK_TX_M1/VOP_BT656_D1 GPIO3_C7_d  CIF_D1  EBC_SDDO1  SDMMC2_D1_M0  I2S1_SCLK_TX_ VOP_BT656_
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            34

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ |
Domain
| 6  _M1/GPIO3_C7_d  |     |     |     |     | M1  | D1_M1  |
| ------------------ | --- | --- | --- | --- | --- | ------ |
CIF_D2/EBC_SDDO2/SDMMC2_D2_M0/I2S1_LRCK_TX_M1/VOP_BT656_D2 I2S1_LRCK_TX_ VOP_BT656_
| AP1             | GPIO3_D0_d  | CIF_D2  | EBC_SDDO2  | SDMMC2_D2_M0  |     |        |
| --------------- | ----------- | ------- | ---------- | ------------- | --- | ------ |
| _M1/GPIO3_D0_d  |             |         |            |               | M1  | D2_M1  |
AN2  CIF_D3/EBC_SDDO3/SDMMC2_D3_M0/I2S1_SDO0_M1/VOP_BT656_D3_M GPIO3_D1_d  CIF_D3  EBC_SDDO3  SDMMC2_D3_M0  I2S1_SDO0_M1  VOP_BT656_
| 1/GPIO3_D1_d  |     |     |     |     |     | D3_M1  |
| ------------- | --- | --- | --- | --- | --- | ------ |
CIF_D4/EBC_SDDO4/SDMMC2_CMD_M0/I2S1_SDI0_M1/VOP_BT656_D4_ VOP_BT656_
AM2  M1/GPIO3_D2_d  GPIO3_D2_d  CIF_D4  EBC_SDDO4  SDMMC2_CMD_M0  I2S1_SDI0_M1  D4_M1
CIF_D5/EBC_SDDO5/SDMMC2_CLK_M0/I2S1_SDI1_M1/VOP_BT656_D5_M VOP_BT656_
AM1  GPIO3_D3_d  CIF_D5  EBC_SDDO5  SDMMC2_CLK_M0  I2S1_SDI1_M1
| 1/GPIO3_D3_d  |     |     |     |     |     | D5_M1  |
| ------------- | --- | --- | --- | --- | --- | ------ |
CIF_D6/EBC_SDDO6/SDMMC2_DET_M0/I2S1_SDI2_M1/VOP_BT656_D6_M VOP_BT656_
1R2  GPIO3_D4_d  CIF_D6  EBC_SDDO6  SDMMC2_DET_M0  I2S1_SDI2_M1
| 1/GPIO3_D4_d  |     |     |     |     |     | D6_M1  |
| ------------- | --- | --- | --- | --- | --- | ------ |
1T1  CIF_D7/EBC_SDDO7/SDMMC2_PWREN_M0/I2S1_SDI3_M1/VOP_BT656_D GPIO3_D5_d  CIF_D7  EBC_SDDO7  SDMMC2_PWREN_ I2S1_SDI3_M1  VOP_BT656_
| 7_M1/GPIO3_D5_d  |     |     |     | M0  |     | D7_M1  |
| ---------------- | --- | --- | --- | --- | --- | ------ |
CIF_D8/EBC_SDDO8/GMAC1_TXD2_M1/UART1_TX_M1/PDM_CLK0_M1/GPI PDM_CLK0_
AL2  O3_D6_d  GPIO3_D6_d  CIF_D8  EBC_SDDO8  GMAC1_TXD2_M1  UART1_TX_M1  M1
CIF_D9/EBC_SDDO9/GMAC1_TXD3_M1/UART1_RX_M1/PDM_SDI0_M1/GPI PDM_SDI0_
AL1  GPIO3_D7_d  CIF_D9  EBC_SDDO9  GMAC1_TXD3_M1  UART1_RX_M1
| O3_D7_d  |     |     |     |     |     | M1  |
| -------- | --- | --- | --- | --- | --- | --- |
AK2  CIF_D10/EBC_SDDO10/GMAC1_TXCLK_M1/PDM_CLK1_M1/GPIO4_A0_d  GPIO4_A0_d  CIF_D10  EBC_SDDO10  GMAC1_TXCLK_M1  PDM_CLK1_M1
1P2  CIF_D11/EBC_SDDO11/GMAC1_RXD2_M1/PDM_SDI1_M1/GPIO4_A1_d  GPIO4_A1_d  CIF_D11  EBC_SDDO11  GMAC1_RXD2_M1  PDM_SDI1_M1
CIF_D12/EBC_SDDO12/GMAC1_RXD3_M1/UART7_TX_M2/PDM_SDI2_M1/ PDM_SDI2_
1R1  GPIO4_A2_d  GPIO4_A2_d  CIF_D12  EBC_SDDO12  GMAC1_RXD3_M1  UART7_TX_M2  M1
CIF_D13/EBC_SDDO13/GMAC1_RXCLK_M1/UART7_RX_M2/PDM_SDI3_M1 PDM_SDI3_
AJ2  GPIO4_A3_d  CIF_D13  EBC_SDDO13  GMAC1_RXCLK_M1  UART7_RX_M2
| /GPIO4_A3_d  |     |     |     |     |     | M1  |
| ------------ | --- | --- | --- | --- | --- | --- |
CIF_D14/EBC_SDDO14/GMAC1_TXD0_M1/UART9_TX_M2/I2S2_LRCK_TX_ I2S2_LRCK_
1N2  GPIO4_A4_d  CIF_D14  EBC_SDDO14  GMAC1_TXD0_M1  UART9_TX_M2
| M1/GPIO4_A4_d  |     |     |     |     |     | TX_M1  |
| -------------- | --- | --- | --- | --- | --- | ------ |
AJ1  CIF_D15/EBC_SDDO15/GMAC1_TXD1_M1/UART9_RX_M2/I2S2_LRCK_RX_ GPIO4_A5_d  CIF_D15  EBC_SDDO15  GMAC1_TXD1_M1  UART9_RX_M2  I2S2_LRCK_
| M1/GPIO4_A5_d  |     |     |     |     |     | RX_M1  |
| -------------- | --- | --- | --- | --- | --- | ------ |
ISP_FLASHTRIGOUT/EBC_SDCE0/GMAC1_TXEN_M1/SPI3_CS0_M0/I2S1_S ISP_FLASHTRIG I2S1_SCLK_
| AH2                   | GPIO4_A6_d  |      | EBC_SDCE0  | GMAC1_TXEN_M1  | SPI3_CS0_M0  |        |
| --------------------- | ----------- | ---- | ---------- | -------------- | ------------ | ------ |
| CLK_RX_M1/GPIO4_A6_d  |             | OUT  |            |                |              | RX_M1  |
CAM_CLKOUT0/EBC_SDCE1/GMAC1_RXD0_M1/SPI3_CS1_M0/I2S1_LRCK_ I2S1_LRCK_
1N1  GPIO4_A7_d  CAM_CLKOUT0  EBC_SDCE1  GMAC1_RXD0_M1  SPI3_CS1_M0
| RX_M1/GPIO4_A7_d  |     |     |     |     |     | RX_M1  |
| ----------------- | --- | --- | --- | --- | --- | ------ |
CAM_CLKOUT1/EBC_SDCE2/GMAC1_RXD1_M1/SPI3_MISO_M0/I2S1_SDO I2S1_SDO1_
1L2  GPIO4_B0_d  CAM_CLKOUT1  EBC_SDCE2  GMAC1_RXD1_M1  SPI3_MISO_M0
| 1_M1/GPIO4_B0_d  |     |     |     |     |     | M1  |
| ---------------- | --- | --- | --- | --- | --- | --- |
AG2  ISP_PRELIGHT_TRIG/EBC_SDCE3/GMAC1_RXDV_CRS_M1/I2S1_SDO2_M1 GPIO4_B1_d  ISP_PRELIGHT_ EBC_SDCE3  GMAC1_RXDV_CRS I2S1_SDO2_M1
| /GPIO4_B1_d  |     | TRIG  |     | _M1  |     |     |
| ------------ | --- | ----- | --- | ---- | --- | --- |
I2C4_SDA_M0/EBC_VCOM/GMAC1_RXER_M1/SPI3_MOSI_M0/I2S2_SDI_M I2S2_SDI_M
AF2  GPIO4_B2_d  I2C4_SDA_M0  EBC_VCOM  GMAC1_RXER_M1  SPI3_MOSI_M0
| 1/GPIO4_B2_d  |     |     |     |     |     | 1   |
| ------------- | --- | --- | --- | --- | --- | --- |
I2C4_SCL_M0/EBC_GDOE/ETH1_REFCLKO_25M_M1/SPI3_CLK_M0/I2S2_S ETH1_REFCLKO_25 I2S2_SDO_
| AE2               | GPIO4_B3_d  | I2C4_SCL_M0  | EBC_GDOE  |       | SPI3_CLK_M0  |     |
| ----------------- | ----------- | ------------ | --------- | ----- | ------------ | --- |
| DO_M1/GPIO4_B3_d  |             |              |           | M_M1  |              | M1  |
AF1  I2C2_SDA_M1/EBC_GDSP/ISP_FLASH_TRIGIN/VOP_BT656_CLK_M1/GPIO GPIO4_B4_d  I2C2_SDA_M1  EBC_GDSP  ISP_FLASH_TRIGIN  VOP_BT656_CLK
| 4_B4_d  |     |     |     |     | _M1  |     |
| ------- | --- | --- | --- | --- | ---- | --- |
AD1  I2C2_SCL_M1/EBC_SDSHR/I2S1_SDO3_M1/GPIO4_B5_d  GPIO4_B5_d  I2C2_SCL_M1  EBC_SDSHR  I2S1_SDO3_M1
1L1  CIF_HREF/EBC_SDLE/GMAC1_MDC_M1/UART1_RTSn_M1/I2S2_MCLK_M1/ GPIO4_B6_d  CIF_HREF  EBC_SDLE  GMAC1_MDC_M1  UART1_RTSn_M I2S2_MCLK_
| GPIO4_B6_d  |     |     |     |     | 1   | M1  |
| ----------- | --- | --- | --- | --- | --- | --- |
CIF_VSYNC/EBC_SDOE/GMAC1_MDIO_M1/I2S2_SCLK_TX_M1/GPIO4_B7_ I2S2_SCLK_TX_
AC2  d  GPIO4_B7_d  CIF_VSYNC  EBC_SDOE  GMAC1_MDIO_M1  M1
AB2  CIF_CLKOUT/EBC_GDCLK/PWM11_IR_M1/GPIO4_C0_d  GPIO4_C0_d  CIF_CLKOUT  EBC_GDCLK  PWM11_IR_M1
CIF_CLKIN/EBC_SDCLK/GMAC1_MCLKINOUT_M1/UART1_CTSn_M1/I2S2_S GMAC1_MCLKINOU UART1_CTSn_M I2S2_SCLK_
| AB1                   | GPIO4_C1_d  | CIF_CLKIN  | EBC_SDCLK  |       |     |        |
| --------------------- | ----------- | ---------- | ---------- | ----- | --- | ------ |
| CLK_RX_M1/GPIO4_C1_d  |             |            |            | T_M1  | 1   | RX_M1  |
1U7  PWM14_M1/SPI3_CLK_M1/I2S3_MCLK_M1/GPIO4_C2_d  GPIO4_C2_d  PWM14_M1  SPI3_CLK_M1  I2S3_MCLK_M1
VCCIO
PWM15_IR_M1/SPI3_MOSI_M1/I2S3_SCLK_M1/GPIO4_C3_d  GPIO4_C3_d  PWM15_IR_M1  SPI3_MOSI_M1  I2S3_SCLK_M1
7
EDP_HPDIN_M0/SPDIF_TX_M2/SATA2_ACT_LED/I2S3_LRCK_M1/GPIO4_C VCCIO7
1V6  GPIO4_C4_d  EDP_HPDIN_M0  SPDIF_TX_M2  SATA2_ACT_LED  I2S3_LRCK_M1
4_d
1U6  PWM12_M1/SPI3_MISO_M1/SATA1_ACT_LED/UART9_TX_M1/I2S3_SDO_M GPIO4_C5_d  PWM12_M1  SPI3_MISO_M1  SATA1_ACT_LED  UART9_TX_M1  I2S3_SDO_
| 1/GPIO4_C5_d  |     |     |     |     |     | M1  |
| ------------- | --- | --- | --- | --- | --- | --- |
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            35

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |     |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ | --- |
Domain
1T6  PWM13_M1/SPI3_CS0_M1/SATA0_ACT_LED/UART9_RX_M1/I2S3_SDI_M1/ GPIO4_C6_d  PWM13_M1  SPI3_CS0_M1  SATA0_ACT_LED  UART9_RX_M1  I2S3_SDI_M
| GPIO4_C6_d  |     |     |     |     |     | 1   |     |
| ----------- | --- | --- | --- | --- | --- | --- | --- |
AR12  HDMITX_SCL/I2C5_SCL_M1/GPIO4_C7_u  GPIO4_C7_u  HDMITX_SCL  I2C5_SCL_M1
AP11  HDMITX_SDA/I2C5_SDA_M1/GPIO4_D0_u  GPIO4_D0_u  HDMITX_SDA  I2C5_SDA_M1
HDMITX_CEC_M
1V5  HDMITX_CEC_M0/SPI3_CS1_M1/GPIO4_D1_u  GPIO4_D1_u  SPI3_CS1_M1
0
| AP32  HDMI_TX_CLKN   | HDMI_TX_CLKN   |     |     |     |     |     |       |
| -------------------- | -------------- | --- | --- | --- | --- | --- | ----- |
| HDMI  HDMI_TX_CLKP   | HDMI_TX_CLKP   |     |     |     |     |     |       |
| AR33  HDMI_TX_D0N    | HDMI_TX_D0N    |     |     |     |     |     |       |
| AP33  HDMI_TX_D0P    | HDMI_TX_D0P    |     |     |     |     |     |       |
| AP35  HDMI_TX_D1N    | HDMI_TX_D1N    |     |     |     |     |     | HDMI  |
| AR35  HDMI_TX_D1P    | HDMI_TX_D1P    |     |     |     |     |     |       |
| AR36  HDMI_TX_D2N    | HDMI_TX_D2N    |     |     |     |     |     |       |
| AP36  HDMI_TX_D2P    | HDMI_TX_D2P    |     |     |     |     |     |       |
| 1V17  HDMI_TX_HPDIN  | HDMI_TX_HPDIN  |     |     |     |     |     |       |
| 1U16  HDMI_TX_REXT   | HDMI_TX_REXT   |     |     |     |     |     |       |
MIPI_CSI_RX_CL
| 1U9  MIPI_CSI_RX_CLK0N  |     |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
K0N
| MIPI_C                  | MIPI_CSI_RX_CL |     |     |     |     |     |     |
| ----------------------- | -------------- | --- | --- | --- | --- | --- | --- |
| MIPI_CSI_RX_CLK0P       |                |     |     |     |     |     |     |
| SI                      | K0P            |     |     |     |     |     |     |
| 1U8  MIPI_CSI_RX_CLK1N  | MIPI_CSI_RX_CL |     |     |     |     |     |     |
K1N
MIPI_CSI_RX_CL
| 1V8  MIPI_CSI_RX_CLK1P  | K1P  |     |     |     |     |     |     |
| ----------------------- | ---- | --- | --- | --- | --- | --- | --- |
MIPI_CSI_RX_D0
| AR18  MIPI_CSI_RX_D0N  |     |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- |
N
MIPI_CSI_RX_D0
| AP18  MIPI_CSI_RX_D0P  |     |     |     |     |     |     |        |
| ---------------------- | --- | --- | --- | --- | --- | --- | ------ |
|                        | P   |     |     |     |     |     | MIPI_C |
AP17  MIPI_CSI_RX_D1N  MIPI_CSI_RX_D1                     SI
N
MIPI_CSI_RX_D1
| AR17  MIPI_CSI_RX_D1P  | P   |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- |
MIPI_CSI_RX_D2
| AR15  MIPI_CSI_RX_D2N  |     |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- |
N
MIPI_CSI_RX_D2
| AP15  MIPI_CSI_RX_D2P  |     |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- |
P
| AP14  MIPI_CSI_RX_D3N  | MIPI_CSI_RX_D3 |     |     |     |     |     |     |
| ---------------------- | -------------- | --- | --- | --- | --- | --- | --- |
N
MIPI_CSI_RX_D3
| AR14  MIPI_CSI_RX_D3P  |     |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- |
P
MIPI_DSI_TX0_C
1V15  MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN  LVDS_TX0_CLKN
LKN
MIPI_D
MIPI_DSI_TX0_C
SI0/LV MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP  LVDS_TX0_CLKP
LKP
DS0
MIPI_DSI_TX0_D
AR30  MIPI_DSI_TX0_D0N/LVDS_TX0_D0N  LVDS_TX0_D0N
0N
MIPI_D
AP30  MIPI_DSI_TX0_D0P/LVDS_TX0_D0P  MIPI_DSI_TX0_D LVDS_TX0_D0P                  SI0/LVD
0P
S0
MIPI_DSI_TX0_D
AP29  MIPI_DSI_TX0_D1N/LVDS_TX0_D1N  1N  LVDS_TX0_D1N
MIPI_DSI_TX0_D
AR29  MIPI_DSI_TX0_D1P/LVDS_TX0_D1P  LVDS_TX0_D1P
1P
MIPI_DSI_TX0_D
AR27  MIPI_DSI_TX0_D2N/LVDS_TX0_D2N  LVDS_TX0_D2N
2N
AP27  MIPI_DSI_TX0_D2P/LVDS_TX0_D2P  MIPI_DSI_TX0_D LVDS_TX0_D2P
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            36

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |     |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ | --- |
Domain
2P
MIPI_DSI_TX0_D
AP26  MIPI_DSI_TX0_D3N/LVDS_TX0_D3N  LVDS_TX0_D3N
3N
AR26  MIPI_DSI_TX0_D3P/LVDS_TX0_D3P  MIPI_DSI_TX0_D LVDS_TX0_D3P
3P
MIPI_DSI_TX1_C
| 1U11  MIPI_DSI_TX1_CLKN  | LKN            |     |     |     |     |     |     |
| ------------------------ | -------------- | --- | --- | --- | --- | --- | --- |
| MIPI_D                   | MIPI_DSI_TX1_C |     |     |     |     |     |     |
| MIPI_DSI_TX1_CLKP        |                |     |     |     |     |     |     |
| SI1                      | LKP            |     |     |     |     |     |     |
MIPI_DSI_TX1_D
| AR24  MIPI_DSI_TX1_D0N  |     |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
0N
| AP24  MIPI_DSI_TX1_D0P  | MIPI_DSI_TX1_D |     |     |     |     |     |     |
| ----------------------- | -------------- | --- | --- | --- | --- | --- | --- |
0P
MIPI_DSI_TX1_D
| AP23  MIPI_DSI_TX1_D1N  | 1N  |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
MIPI_D
|                         | MIPI_DSI_TX1_D |     |     |     |     |     | SI1  |
| ----------------------- | -------------- | --- | --- | --- | --- | --- | ---- |
| AR23  MIPI_DSI_TX1_D1P  |                |     |     |     |     |     |      |
1P
MIPI_DSI_TX1_D
| AR21  MIPI_DSI_TX1_D2N  |     |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
2N
| AP21  MIPI_DSI_TX1_D2P  | MIPI_DSI_TX1_D |     |     |     |     |     |     |
| ----------------------- | -------------- | --- | --- | --- | --- | --- | --- |
2P
MIPI_DSI_TX1_D
| AP20  MIPI_DSI_TX1_D3N  | 3N  |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
MIPI_DSI_TX1_D
| AR20  MIPI_DSI_TX1_D3P  |     |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- |
3P
| 1H20  EDP_TX_AUXN  | EDP_TX_AUXN  |     |     |     |     |     |     |
| ------------------ | ------------ | --- | --- | --- | --- | --- | --- |
| EDP  EDP_TX_AUXP   | EDP_TX_AUXP  |     |     |     |     |     |     |
| J38  EDP_TX_D0N    | EDP_TX_D0N   |     |     |     |     |     |     |
| J37  EDP_TX_D0P    | EDP_TX_D0P   |     |     |     |     |     |     |
| K37  EDP_TX_D1N    | EDP_TX_D1N   |     |     |     |     |     |     |
EDP
| K38  EDP_TX_D1P       | EDP_TX_D1P      |     |     |     |     |     |     |
| --------------------- | --------------- | --- | --- | --- | --- | --- | --- |
| M38  EDP_TX_D2N       | EDP_TX_D2N      |     |     |     |     |     |     |
| M37  EDP_TX_D2P       | EDP_TX_D2P      |     |     |     |     |     |     |
| N38  EDP_TX_D3N       | EDP_TX_D3N      |     |     |     |     |     |     |
| N37  EDP_TX_D3P       | EDP_TX_D3P      |     |     |     |     |     |     |
| 1K20  PCIE20_REFCLKN  | PCIE20_REFCLKN  |     |     |     |     |     |     |
| PCIE  PCIE20_REFCLKP  | PCIE20_REFCLKP  |     |     |     |     |     |     |
AB38  PCIE20_RXN/SATA2_RXN  PCIE20_RXN  SATA2_RXN
PCIE
AB37  PCIE20_RXP/SATA2_RXP  PCIE20_RXP  SATA2_RXP
AA38  PCIE20_TXN/SATA2_TXN  PCIE20_TXN  SATA2_TXN
AA37  PCIE20_TXP/SATA2_TXP  PCIE20_TXP  SATA2_TXP
| 1D17  SARADC_VIN0  | SARADC_VIN0  |     |     |     |     |     |     |
| ------------------ | ------------ | --- | --- | --- | --- | --- | --- |
SARAD
| SARADC_VIN1  | SARADC_VIN1  |     |     |     |     |     | SARAD |
| ------------ | ------------ | --- | --- | --- | --- | --- | ----- |
C
| 1B18  SARADC_VIN2   | SARADC_VIN2   |     |     |     |     |     | C     |
| ------------------- | ------------- | --- | --- | --- | --- | --- | ----- |
| 1A19  SARADC_VIN3   | SARADC_VIN3   |     |     |     |     |     |       |
| V1  USB_HOST2_DM    | USB_HOST2_DM  |     |     |     |     |     |       |
| USB2  USB_HOST2_DP  | USB_HOST2_DP  |     |     |     |     |     |       |
| Y1  USB_HOST3_DM    | USB_HOST3_DM  |     |     |     |     |     | USB2  |
| Y2  USB_HOST3_DP    | USB_HOST3_DP  |     |     |     |     |     |       |
USB3_HOST1_D
| 1J20  USB3_HOST1_DM  |     |     |     |     |     |     |     |
| -------------------- | --- | --- | --- | --- | --- | --- | --- |
M
USB3  USB3_HOST1_DP  USB3_HOST1_DP                      USB3
USB3_HOST1_SS
| V37  USB3_HOST1_SSRXN/SATA1_RXN  |     | SATA1_RXN  |     |     |     |     |     |
| -------------------------------- | --- | ---------- | --- | --- | --- | --- | --- |
RXN
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            37

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |     |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ | --- |
Domain
V38  USB3_HOST1_SSRXP/SATA1_RXP  USB3_HOST1_SS SATA1_RXP
RXP
USB3_HOST1_SS
W38  USB3_HOST1_SSTXN/SATA1_TXN  TXN  SATA1_TXN
USB3_HOST1_SS
| W37  USB3_HOST1_SSTXP/SATA1_TXP  |     | SATA1_TXP  |     |     |     |     |     |
| -------------------------------- | --- | ---------- | --- | --- | --- | --- | --- |
TXP
| R38  USB_OTG0_DM       | USB_OTG0_DM   |     |     |     |     |     |     |
| ---------------------- | ------------- | --- | --- | --- | --- | --- | --- |
| R37  USB_OTG0_DP       | USB_OTG0_DP   |     |     |     |     |     |     |
| T37  USB_OTG0_ID       | USB_OTG0_ID   |     |     |     |     |     |     |
| T38  USB_OTG0_VBUSDET  | USB_OTG0_VBUS |     |     |     |     |     |     |
DET
1C7  DDR4_RESETn/LPDDR4_RESETn/DDR3_RESETn/AC29  DDR4_RESETn  LPDDR4_RESETn  DDR3_RESETn  AC29
DDR  DDR_DM0_A/DDR4_DML_A/LPDDR4_DM0_A/DDR3_DM0/LPDDR3_DM1  DDR4_DML_A  LPDDR4_DM0_A  DDR3_DM0  LPDDR3_DM1
1B8  DDR_DM0_B/DDR4_DMU_B/LPDDR4_DM0_B/DDR3_DM2/LPDDR3_DM0  DDR4_DMU_B  LPDDR4_DM0_B  DDR3_DM2  LPDDR3_DM0
1G1  DDR_DM1_A/DDR4_DMU_A/LPDDR4_DM1_A/DDR3_DM1/LPDDR3_DM3  DDR4_DMU_A  LPDDR4_DM1_A  DDR3_DM1  LPDDR3_DM3
1A11  DDR_DM1_B/DDR4_DML_B/LPDDR4_DM1_B/DDR3_DM3/LPDDR3_DM2  DDR4_DML_B  LPDDR4_DM1_B  DDR3_DM3  LPDDR3_DM2
G2  DDR_DQ0_A/DDR4_DQL0_A/LPDDR4_DQ0_A/DDR3_DQ0/LPDDR3_DQ15  DDR4_DQL0_A  LPDDR4_DQ0_A  DDR3_DQ0  LPDDR3_DQ15
B12  DDR_DQ0_B/DDR4_DQU7_B/LPDDR4_DQ0_B/DDR3_DQ16/LPDDR3_DQ1  DDR4_DQU7_B  LPDDR4_DQ0_B  DDR3_DQ16  LPDDR3_DQ1
F2  DDR_DQ1_A/DDR4_DQL2_A/LPDDR4_DQ1_A/DDR3_DQ1/LPDDR3_DQ14  DDR4_DQL2_A  LPDDR4_DQ1_A  DDR3_DQ1  LPDDR3_DQ14
B10  DDR_DQ1_B/DDR4_DQU5_B/LPDDR4_DQ1_B/DDR3_DQ17/LPDDR3_DQ5  DDR4_DQU5_B  LPDDR4_DQ1_B  DDR3_DQ17  LPDDR3_DQ5
R2  DDR_DQ10_A/DDR4_DQU7_A/LPDDR4_DQ10_A/DDR3_DQ10/LPDDR3_DQ DDR4_DQU7_A  LPDDR4_DQ10_ DDR3_DQ10  LPDDR3_DQ28
| 28                                                       |              | A            |            |              |     |     |     |
| -------------------------------------------------------- | ------------ | ------------ | ---------- | ------------ | --- | --- | --- |
| DDR_DQ10_B/DDR4_DQL4_B/LPDDR4_DQ10_B/DDR3_DQ26/LPDDR3_DQ |              | LPDDR4_DQ10_ |            |              |     |     |     |
| A20  22                                                  | DDR4_DQL4_B  | B            | DDR3_DQ26  | LPDDR3_DQ22  |     |     |     |
| DDR_DQ11_A/DDR4_DQU5_A/LPDDR4_DQ11_A/DDR3_DQ11/LPDDR3_DQ |              | LPDDR4_DQ11_ |            |              |     |     |     |
| T2                                                       | DDR4_DQU5_A  |              | DDR3_DQ11  | LPDDR3_DQ29  |     |     |     |
| 29                                                       |              | A            |            |              |     |     |     |
| DDR_DQ11_B/DDR4_DQL6_B/LPDDR4_DQ11_B/DDR3_DQ27/LPDDR3_DQ |              | LPDDR4_DQ11_ |            |              |     |     |     |
| B20                                                      | DDR4_DQL6_B  |              | DDR3_DQ27  | LPDDR3_DQ23  |     |     |     |
| 23                                                       |              | B            |            |              |     |     |     |
M1  DDR_DQ12_A/DDR4_DQU2_A/LPDDR4_DQ12_A/DDR3_DQ12/LPDDR3_DQ DDR4_DQU2_A  LPDDR4_DQ12_ DDR3_DQ12  LPDDR3_DQ26
| 26                                                       |              | A            |            |              |     |     |      |
| -------------------------------------------------------- | ------------ | ------------ | ---------- | ------------ | --- | --- | ---- |
| DDR_DQ12_B/DDR4_DQL7_B/LPDDR4_DQ12_B/DDR3_DQ28/LPDDR3_DQ |              | LPDDR4_DQ12_ |            |              |     |     |      |
| A15  16                                                  | DDR4_DQL7_B  | B            | DDR3_DQ28  | LPDDR3_DQ16  |     |     |      |
| DDR_DQ13_A/DDR4_DQU4_A/LPDDR4_DQ13_A/DDR3_DQ13/LPDDR3_DQ |              | LPDDR4_DQ13_ |            |              |     |     |      |
| 1F2                                                      | DDR4_DQU4_A  |              | DDR3_DQ13  | LPDDR3_DQ31  |     |     | DDR  |
| 31                                                       |              | A            |            |              |     |     |      |
| DDR_DQ13_B/DDR4_DQL5_B/LPDDR4_DQ13_B/DDR3_DQ29/LPDDR3_DQ |              | LPDDR4_DQ13_ |            |              |     |     |      |
| B15                                                      | DDR4_DQL5_B  |              | DDR3_DQ29  | LPDDR3_DQ17  |     |     |      |
| 17                                                       |              | B            |            |              |     |     |      |
1F1  DDR_DQ14_A/DDR4_DQU6_A/LPDDR4_DQ14_A/DDR3_DQ14/LPDDR3_DQ DDR4_DQU6_A  LPDDR4_DQ14_ DDR3_DQ14  LPDDR3_DQ30
| 30                                                       |              | A            |            |              |     |     |     |
| -------------------------------------------------------- | ------------ | ------------ | ---------- | ------------ | --- | --- | --- |
| DDR_DQ14_B/DDR4_DQL1_B/LPDDR4_DQ14_B/DDR3_DQ30/LPDDR3_DQ |              | LPDDR4_DQ14_ |            |              |     |     |     |
| 1C10                                                     | DDR4_DQL1_B  |              | DDR3_DQ30  | LPDDR3_DQ20  |     |     |     |
| 20                                                       |              | B            |            |              |     |     |     |
| DDR_DQ15_A/DDR4_DQU0_A/LPDDR4_DQ15_A/DDR3_DQ15/LPDDR3_DQ |              | LPDDR4_DQ15_ |            |              |     |     |     |
| 1G2                                                      | DDR4_DQU0_A  |              | DDR3_DQ15  | LPDDR3_DQ27  |     |     |     |
| 27                                                       |              | A            |            |              |     |     |     |
| DDR_DQ15_B/DDR4_DQL3_B/LPDDR4_DQ15_B/DDR3_DQ31/LPDDR3_DQ |              | LPDDR4_DQ15_ |            |              |     |     |     |
| B16                                                      | DDR4_DQL3_B  |              | DDR3_DQ31  | LPDDR3_DQ21  |     |     |     |
| 21                                                       |              | B            |            |              |     |     |     |
F1  DDR_DQ2_A/DDR4_DQL4_A/LPDDR4_DQ2_A/DDR3_DQ2/LPDDR3_DQ10  DDR4_DQL4_A  LPDDR4_DQ2_A  DDR3_DQ2  LPDDR3_DQ10
|     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
1A8  DDR_DQ2_B/DDR4_DQU3_B/LPDDR4_DQ2_B/DDR3_DQ18/LPDDR3_DQ6  DDR4_DQU3_B  LPDDR4_DQ2_B  DDR3_DQ18  LPDDR3_DQ6
E1  DDR_DQ3_A/DDR4_DQL6_A/LPDDR4_DQ3_A/DDR3_DQ3/LPDDR3_DQ9  DDR4_DQL6_A  LPDDR4_DQ3_A  DDR3_DQ3  LPDDR3_DQ9
1A7  DDR_DQ3_B/DDR4_DQU1_B/LPDDR4_DQ3_B/DDR3_DQ19/LPDDR3_DQ4  DDR4_DQU1_B  LPDDR4_DQ3_B  DDR3_DQ19  LPDDR3_DQ4
M2  DDR_DQ4_A/DDR4_DQL7_A/LPDDR4_DQ4_A/DDR3_DQ4/LPDDR3_DQ13  DDR4_DQL7_A  LPDDR4_DQ4_A  DDR3_DQ4  LPDDR3_DQ13
|     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
B13  DDR_DQ4_B/DDR4_DQU0_B/LPDDR4_DQ4_B/DDR3_DQ20/LPDDR3_DQ2  DDR4_DQU0_B  LPDDR4_DQ4_B  DDR3_DQ20  LPDDR3_DQ2
K1  DDR_DQ5_A/DDR4_DQL5_A/LPDDR4_DQ5_A/DDR3_DQ5/LPDDR3_DQ12  DDR4_DQL5_A  LPDDR4_DQ5_A  DDR3_DQ5  LPDDR3_DQ12
1A10  DDR_DQ5_B/DDR4_DQU6_B/LPDDR4_DQ5_B/DDR3_DQ21/LPDDR3_DQ3  DDR4_DQU6_B  LPDDR4_DQ5_B  DDR3_DQ21  LPDDR3_DQ3
K2  DDR_DQ6_A/DDR4_DQL3_A/LPDDR4_DQ6_A/DDR3_DQ6/LPDDR3_DQ8  DDR4_DQL3_A  LPDDR4_DQ6_A  DDR3_DQ6  LPDDR3_DQ8
|     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
1B9  DDR_DQ6_B/DDR4_DQU4_B/LPDDR4_DQ6_B/DDR3_DQ22/LPDDR3_DQ7  DDR4_DQU4_B  LPDDR4_DQ6_B  DDR3_DQ22  LPDDR3_DQ7
1E1  DDR_DQ7_A/DDR4_DQL1_A/LPDDR4_DQ7_A/DDR3_DQ7/LPDDR3_DQ11  DDR4_DQL1_A  LPDDR4_DQ7_A  DDR3_DQ7  LPDDR3_DQ11
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            38

RK3566 Datasheet                                                                                             Rev 1.1
 Power
| PIN  PIN Name  | Func1  | Func2  | Func3  | Func4  | Func5  | Func6  |
| -------------- | ------ | ------ | ------ | ------ | ------ | ------ |
Domain
1A9  DDR_DQ7_B/DDR4_DQU2_B/LPDDR4_DQ7_B/DDR3_DQ23/LPDDR3_DQ0  DDR4_DQU2_B  LPDDR4_DQ7_B  DDR3_DQ23  LPDDR3_DQ0
P2  DDR_DQ8_A/DDR4_DQU3_A/LPDDR4_DQ8_A/DDR3_DQ8/LPDDR3_DQ25  DDR4_DQU3_A  LPDDR4_DQ8_A  DDR3_DQ8  LPDDR3_DQ25
B19  DDR_DQ8_B/DDR4_DQL0_B/LPDDR4_DQ8_B/DDR3_DQ24/LPDDR3_DQ18  DDR4_DQL0_B  LPDDR4_DQ8_B  DDR3_DQ24  LPDDR3_DQ18
R1  DDR_DQ9_A/DDR4_DQU1_A/LPDDR4_DQ9_A/DDR3_DQ9/LPDDR3_DQ24  DDR4_DQU1_A  LPDDR4_DQ9_A  DDR3_DQ9  LPDDR3_DQ24
A19  DDR_DQ9_B/DDR4_DQL2_B/LPDDR4_DQ9_B/DDR3_DQ25/LPDDR3_DQ19  DDR4_DQL2_B  LPDDR4_DQ9_B  DDR3_DQ25  LPDDR3_DQ19
| DDR_DQS0N_A/DDR4_DQSL_N_A/LPDDR4_DQS0N_A/DDR3_DQS0N/LPDD | DDR4_DQSL_N_ | LPDDR4_DQS0N |             |               |     |     |
| -------------------------------------------------------- | ------------ | ------------ | ----------- | ------------- | --- | --- |
| H1                                                       |              |              | DDR3_DQS0N  | LPDDR3_DQS1N  |     |     |
| R3_DQS1N                                                 | A            | _A           |             |               |     |     |
A12  DDR_DQS0N_B/DDR4_DQSU_N_B/LPDDR4_DQS0N_B/DDR3_DQS2N/LPD DDR4_DQSU_N_ LPDDR4_DQS0N DDR3_DQS2N  LPDDR3_DQS0N
| DR3_DQS0N                                                | B   | _B           |     |     |     |     |
| -------------------------------------------------------- | --- | ------------ | --- | --- | --- | --- |
| DDR_DQS0P_A/DDR4_DQSL_P_A/LPDDR4_DQS0P_A/DDR3_DQS0P/LPDD |     | LPDDR4_DQS0P |     |     |     |     |
H2  R3_DQS1P  DDR4_DQSL_P_A  _A  DDR3_DQS0P  LPDDR3_DQS1P
| DDR_DQS0P_B/DDR4_DQSU_P_B/LPDDR4_DQS0P_B/DDR3_DQS2P/LPDD | DDR4_DQSU_P_ | LPDDR4_DQS0P |             |               |     |     |
| -------------------------------------------------------- | ------------ | ------------ | ----------- | ------------- | --- | --- |
| A13                                                      |              |              | DDR3_DQS2P  | LPDDR3_DQS0P  |     |     |
| R3_DQS0P                                                 | B            | _B           |             |               |     |     |
| DDR_DQS1N_A/DDR4_DQSU_N_A/LPDDR4_DQS1N_A/DDR3_DQS1N/LPD  | DDR4_DQSU_N_ | LPDDR4_DQS1N |             |               |     |     |
| N2                                                       |              |              | DDR3_DQS1N  | LPDDR3_DQS3N  |     |     |
| DR3_DQS3N                                                | A            | _A           |             |               |     |     |
B17  DDR_DQS1N_B/DDR4_DQSL_N_B/LPDDR4_DQS1N_B/DDR3_DQS3N/LPDD DDR4_DQSL_N_ LPDDR4_DQS1N DDR3_DQS3N  LPDDR3_DQS2N
| R3_DQS2N                                                 | B              | _B           |             |               |     |     |
| -------------------------------------------------------- | -------------- | ------------ | ----------- | ------------- | --- | --- |
| DDR_DQS1P_A/DDR4_DQSU_P_A/LPDDR4_DQS1P_A/DDR3_DQS1P/LPDD | DDR4_DQSU_P_   | LPDDR4_DQS1P |             |               |     |     |
| N1  R3_DQS3P                                             | A              | _A           | DDR3_DQS1P  | LPDDR3_DQS3P  |     |     |
| DDR_DQS1P_B/DDR4_DQSL_P_B/LPDDR4_DQS1P_B/DDR3_DQS3P/LPDD |                | LPDDR4_DQS1P |             |               |     |     |
| A17                                                      | DDR4_DQSL_P_B  |              | DDR3_DQS3P  | LPDDR3_DQS2P  |     |     |
| R3_DQS2P                                                 |                | _B           |             |               |     |     |
A7  DDR4_A0/LPDDR4_CLKP_B/DDR3_A9/-/AC0  DDR4_A0  LPDDR4_CLKP_B  DDR3_A9  -
1D2  DDR4_A1/-/DDR3_A2/-/AC1  DDR4_A1  -  DDR3_A2  -
C1  DDR4_A2/LPDDR4_A1_A/DDR3_A4/LPDDR3_A6/AC2  DDR4_A2  LPDDR4_A1_A  DDR3_A4  LPDDR3_A6
1C3  DDR4_A3/LPDDR4_CKE1_A/DDR3_A3/-/AC3  DDR4_A3  LPDDR4_CKE1_ DDR3_A3  -
A
1B6  DDR4_A4/LPDDR4_A3_B/DDR3_BA1/LPDDR3_A3/AC4  DDR4_A4  LPDDR4_A3_B  DDR3_BA1  LPDDR3_A3
B8  DDR4_A5/LPDDR4_A5_B/DDR3_A11/LPDDR3_A2/AC5  DDR4_A5  LPDDR4_A5_B  DDR3_A11  LPDDR3_A2
B9  DDR4_A6/LPDDR4_A1_B/DDR3_A13/LPDDR3_A1/AC6  DDR4_A6  LPDDR4_A1_B  DDR3_A13  LPDDR3_A1
LPDDR4_ODT0_
A10  DDR4_A7/LPDDR4_ODT0_CA_B/DDR3_A8/-/AC7  DDR4_A7  DDR3_A8  -
CA_B
LPDDR4_ODT0_
E2  DDR4_A8/LPDDR4_ODT0_CA_A/DDR3_A6/LPDDR3_A9/AC8  DDR4_A8  DDR3_A6  LPDDR3_A9
CA_A
B7  DDR4_A9/LPDDR4_CLKN_B/DDR3_A5/-/AC9  DDR4_A9  LPDDR4_CLKN_ DDR3_A5  -
B
LPDDR4_CKE0_
1A3  DDR4_A10/LPDDR4_CKE0_B/DDR3_A10/-/AC10  DDR4_A10  DDR3_A10  -
B
C2  DDR4_A11/LPDDR4_A0_A/DDR3_A7/LPDDR3_A8/AC11  DDR4_A11  LPDDR4_A0_A  DDR3_A7  LPDDR3_A8
1B3  DDR4_A12/LPDDR4_A3_A/DDR3_BA2/-/AC12  DDR4_A12  LPDDR4_A3_A  DDR3_BA2  -
A9  DDR4_A13/LPDDR4_A0_B/DDR3_A14/LPDDR3_A0/AC13  DDR4_A13  LPDDR4_A0_B  DDR3_A14  LPDDR3_A0
1B1  DDR4_A14_WEn/LPDDR4_A4_A/DDR3_A15/LPDDR3_A5/AC14  DDR4_A14_WEn  LPDDR4_A4_A  DDR3_A15  LPDDR3_A5
1C1  DDR4_A15_CASn/LPDDR4_A2_A/DDR3_A0/-/AC15  DDR4_A15_CASn  LPDDR4_A2_A  DDR3_A0  -
1A1  DDR4_A16_RASn/LPDDR4_A5_A/DDR3_RASn/LPDDR3_A7/AC16  DDR4_A16_RASn  LPDDR4_A5_A  DDR3_RASn  LPDDR3_A7
|     |     | LPDDR4_CKE1_ |     |     |     |     |
| --- | --- | ------------ | --- | --- | --- | --- |
1A2  DDR4_ACTn/LPDDR4_CKE1_B/DDR3_CASn/-/AC17  DDR4_ACTn  B  DDR3_CASn  -
1B7  DDR4_BA0/LPDDR4_A2_B/DDR3_A1/-/AC18  DDR4_BA0  LPDDR4_A2_B  DDR3_A1  -
1A6  DDR4_BA1/LPDDR4_A4_B/DDR3_A12/LPDDR3_A4/AC19  DDR4_BA1  LPDDR4_A4_B  DDR3_A12  LPDDR3_A4
LPDDR4_ODT1_
1A4  DDR4_BG0/LPDDR4_ODT1_CA_B/DDR3_WEn/-/AC20  DDR4_BG0  DDR3_WEn  -
CA_B
|     |     | LPDDR4_ODT1_ |     |     |     |     |
| --- | --- | ------------ | --- | --- | --- | --- |
1C2  DDR4_BG1/LPDDR4_ODT1_CA_A/DDR3_BA0/-/AC21  DDR4_BG1  CA_A  DDR3_BA0  -
LPDDR4_CKE0_
B4  DDR4_CKE/LPDDR4_CKE0_A/DDR3_CKE/LPDDR3_CKE/AC22  DDR4_CKE  DDR3_CKE  LPDDR3_CKE
A
LPDDR4_CLKN_
B5  DDR4_CLKN/LPDDR4_CLKN_A/DDR3_CLKN/LPDDR3_CLKN/AC24  DDR4_CLKN  DDR3_CLKN  LPDDR3_CLKN
A
|     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
A5  DDR4_CLKP/LPDDR4_CLKP_A/DDR3_CLKP/LPDDR3_CLKP/AC23  DDR4_CLKP  LPDDR4_CLKP_A  DDR3_CLKP  LPDDR3_CLKP
Copyright 2021 © Rockchip Electronics Co., Ltd.                                                                                                            39

RK3566 Datasheet Rev 1.1
Power
PIN PIN Name Func1 Func2 Func3 Func4 Func5 Func6
Domain
LPDDR4_CS0n_
B3 DDR4_CS0n/LPDDR4_CS0n_A/DDR3_ODT1/LPDDR3_ODT0/AC25 DDR4_CS0n DDR3_ODT1 LPDDR3_ODT0
A
LPDDR4_CS1n_
A3 DDR4_CS1n/LPDDR4_CS1n_A/DDR3_CS1n/LPDDR3_ODT1/AC26 DDR4_CS1n DDR3_CS1n LPDDR3_ODT1
A
LPDDR4_CS1n_
1A5 DDR4_ODT0/LPDDR4_CS1n_B/DDR3_ODT0/LPDDR3_CS1n/AC27 DDR4_ODT0 DDR3_ODT0 LPDDR3_CS1n
B
LPDDR4_CS0n_
1B5 DDR4_ODT1/LPDDR4_CS0n_B/DDR3_CS0n/LPDDR3_CS0n/AC28 DDR4_ODT1 DDR3_CS0n LPDDR3_CS0n
B
1F3 DDR_RZQ DDR_RZQ
1H3 DDR_VREFOUT DDR_VREFOUT
Table 2-3 Function IO description
Notes:
① Pad types: I = digital-input, O = digital-output, I/O = digital input/output (bidirectional) , A=Analog IO
② Def default IO direction for digital IO
③ Output Drive Unit is mA, only Digital IO has drive value;
④ INT: interrupt support.
Copyright 2021 © Rockchip Electronics Co., Ltd. 40

RK3566 Datasheet                                                   Rev 1.1
2.8 IO Pin Name Description
This sub-chapter will focus on the detailed function description of every pins based on
different interface.
Table 2-4 IO function description list

| Interface  | Pin Name    | Dir.                              | Description  |
| ---------- | ----------- | --------------------------------- | ------------ |
|            | XIN24M      | I  Clock input of 24MHz crystal   |              |
|            | XOUT24M     | O  Clock output of 24MHz crystal  |              |
| Misc       | NPOR        | I  Chip hardware reset            |              |
|            | CLK32K_IN   | I  32K clock input                |              |
|            | CLK32K_OUT  | O  32K clock output               |              |

| Interface  | Pin Name     | Dir.                          | Description  |
| ---------- | ------------ | ----------------------------- | ------------ |
|            | ARMJTAG_TCK  | I  SWD interface clock input  |              |
SWJ-DP
|     | ARMJTAG_TMS  | I/O  SWD interface data inout  |     |
| --- | ------------ | ------------------------------ | --- |

| Interface  | Pin Name      | Dir.                           | Description  |
| ---------- | ------------- | ------------------------------ | ------------ |
|            | MCU_JTAGTCK   | I  JTAG interface clock input  |              |
|            | MCU_JTAGTRST  | I  JTAG interface reset input  |              |
| MCU_JTAG   | MCU_JTAGTMS   | I  JTAG interface TMS input    |              |
|            | MCU_JTAGTDO   | O  JTAG interface TDO          |              |
|            | MCU_JTAGTDI   | I  JTAG interface TDI          |              |

| Interface  | Pin Name             | Dir.                 | Description  |
| ---------- | -------------------- | -------------------- | ------------ |
|            | SDMMC[i]_CLK(i=0~2)  | O  sdmmc card clock  |              |
SDMMC[i]_CMD(i=0~2)  I/O  sdmmc card command output and response input
SD/MMC
SDMMC[i] _D[j](i=0~2)
Host
I/O  sdmmc card data input and output
(j=0~3)
Controller
sdmmc card detect signal, 0 represents presence
|     | SDMMC[i]_DETN(i=0~2)  | I   |     |
| --- | --------------------- | --- | --- |
of card

| Interface  | Pin Name     | Dir.                | Description  |
| ---------- | ------------ | ------------------- | ------------ |
|            | EMMC_CLKOUT  | O  emmc card clock  |              |
eMMC
|     | EMMC_CMD  | I/O  emmc card command output and response input  |     |
| --- | --------- | ------------------------------------------------- | --- |
Interface
|     | EMMC_D[i](i=0~7)  | I/O  emmc card data input and output  |     |
| --- | ----------------- | ------------------------------------- | --- |

| Interface  | Pin Name   | Dir.                                    | Description  |
| ---------- | ---------- | --------------------------------------- | ------------ |
|            | FLASH_ALE  | O  Flash address latch enable signal    |              |
|            | FLASH_CLE  | O  Flash command latch enable signal    |              |
|            | FLASH_WRN  | O  Flash write enable and clock signal  |              |
Nand Flash
|     | FLASH_RDN  | O  Flash read enable and write/read signal  |     |
| --- | ---------- | ------------------------------------------- | --- |
Interface
|     | FLASH_D[i] (i=0~7)   | I/O  Flash data inputs/outputs signal  |     |
| --- | -------------------- | -------------------------------------- | --- |
|     | FLASHx_DQS           | I/O  Flash data strobe signal          |     |
|     | FLASHx_RDY           | I  Flash ready/busy signal             |     |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       41

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name             | Dir.                                           | Description  |
| ---------- | -------------------- | ---------------------------------------------- | ------------ |
|            | FLASHx_CSN[i]=0~1)   | O  Flash chip enable signal for chip i, i=0~7  |              |

| Interface  | Pin Name  | Dir.                    | Description  |
| ---------- | --------- | ----------------------- | ------------ |
|            | FSPI_CLK  | I/O  FSPI serial clock  |              |
FSPI
|     | FSPI_CSN[i] (i=0)  | I/O  FSPI chip select signal, low active  |     |
| --- | ------------------ | ----------------------------------------- | --- |
Controller
|     | FSPI_SIO[i] (i=0,3)  | O  FSPI serial data inout  |     |
| --- | -------------------- | -------------------------- | --- |

| Interface  | Pin Name     | Dir.                                               | Description  |
| ---------- | ------------ | -------------------------------------------------- | ------------ |
|            | I2S1_MCLK    | O  I2S/PCM clock source                            |              |
|            | I2S1_SCLKTX  | I/O  I2S/PCM serial clock for transmit data        |              |
|            | I2S1_SCLKRX  | I/O  I2S/PCM serial clock for receive data         |              |
|            |              | I2S/PCM left & right channel signal for receiving  |              |
serial data, synchronous left & right channel in
|     | I2S1_LRCKRX  | I/O                                              |     |
| --- | ------------ | ------------------------------------------------ | --- |
|     |              | I2S mode and the beginning of a group of left &  |     |
right channels in PCM mode
I2S1/PCM
I2S/PCM left & right channel signal for
transmitting serial data, synchronous left & right
| Controller  | I2S1_LRCKTX  | I/O  |     |
| ----------- | ------------ | ---- | --- |
channel in I2S mode and the beginning of a
group of left & right channels in PCM mode
|     | I2S1_SDI[i](i=1~3)  | I  I2S/PCM serial data input   |     |
| --- | ------------------- | ------------------------------ | --- |
|     | I2S1_SDO[i](i=1~3)  | O  I2S/PCM serial data output  |     |

| Interface  | Pin Name     | Dir.                                         | Description  |
| ---------- | ------------ | -------------------------------------------- | ------------ |
|            | I2S2_MCLK    | O  I2S/PCM clock source                      |              |
|            | I2S2_SCLKRX  | I/O  I2S/PCM serial clock for receive data   |              |
|            | I2S2_SCLKTX  | I/O  I2S/PCM serial clock for transmit data  |              |
I2S/PCM left & right channel signal for receiving
serial data, synchronous left & right channel in
|     | I2S2_LRCKRX  | I/O  |     |
| --- | ------------ | ---- | --- |
I2S mode and the beginning of a group of left &
I2S2/PCM
right channels in PCM mode
Controller
I2S/PCM left & right channel signal for
transmitting serial data, synchronous left & right
|     | I2S2_LRCKTX  | I/O  |     |
| --- | ------------ | ---- | --- |
channel in I2S mode and the beginning of a
group of left & right channels in PCM mode
|     | I2S2_SDI  | I  I2S/PCM serial data input   |     |
| --- | --------- | ------------------------------ | --- |
|     | I2S2_SDO  | O  I2S/PCM serial data output  |     |

| Interface  | Pin Name     | Dir.                                         | Description  |
| ---------- | ------------ | -------------------------------------------- | ------------ |
|            | I2S3_MCLK    | O  I2S/PCM clock source                      |              |
|            | I2S3_SCLKRX  | I/O  I2S/PCM serial clock for receive data   |              |
|            | I2S3_SCLKTX  | I/O  I2S/PCM serial clock for transmit data  |              |
I2S/PCM left & right channel signal for receiving
serial data, synchronous left & right channel in
|     | I2S3_LRCKRX  | I/O  |     |
| --- | ------------ | ---- | --- |
I2S mode and the beginning of a group of left &
| I2S3/PCM  |     | right channels in PCM mode  |     |
| --------- | --- | --------------------------- | --- |
Controller
I2S/PCM left & right channel signal for
transmitting serial data, synchronous left & right
|     | I2S3_LRCKTX  | I/O  |     |
| --- | ------------ | ---- | --- |
channel in I2S mode and the beginning of a
group of left & right channels in PCM mode
|     | I2S3_SDI  | I  I2S/PCM serial data input   |     |
| --- | --------- | ------------------------------ | --- |
|     | I2S3_SDO  | O  I2S/PCM serial data output  |     |

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       42

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.                   | Description  |
| ---------- | --------- | ---------------------- | ------------ |
| SPDIF      | SPDIF_TX  | O  S/PDIF data output  |              |

| Interface  | Pin Name  | Dir.                   | Description  |
| ---------- | --------- | ---------------------- | ------------ |
|            | PDM_CLK   | O  PDM sampling clock  |              |
PDM
|     | PDM_SDI[i](i=0~3)  | I  PDM data  |     |
| --- | ------------------ | ------------ | --- |

| Interface  | Pin Name  | Dir.  Description    |     |
| ---------- | --------- | -------------------- | --- |
|            | CAN_RXD   | I  CAN receive data  |     |
CAN
|     | CAN_TXD  | O  CAN transmit data  |     |
| --- | -------- | --------------------- | --- |

| Interface  | Pin Name          | Dir.  Description                 |     |
| ---------- | ----------------- | --------------------------------- | --- |
|            | ACODEC_DAC_CLK    | O  CODEC DAC clock output signal  |     |
|            | ACODEC_ADC_CLK    | O  CODEC ADC clock output signal  |     |
| Digital    | ACODEC_DAC_SYNC   | O  CODEC DAC synchronous signal   |     |
| Audio      | ACODEC_ADC_SYNC   | O  CODEC ADC synchronous signal   |     |
| CODEC      | ACODEC_DAC_DATAR  | O  CODEC DAC right channel data   |     |
|            | ACODEC_DAC_DATAL  | O  CODEC DAC left channel data    |     |
|            | ACODEC_ADC_DATA   | I  CODEC ADC data                 |     |

| Interface  | Pin Name  | Dir.                 | Description  |
| ---------- | --------- | -------------------- | ------------ |
|            | SCR_CLK   | O  Smart Card clock  |              |
|            | SCR_RST   | O  Smart Card reset  |              |
Smart Card
|     | SCR_DET  | I  Smart Card detect  |     |
| --- | -------- | --------------------- | --- |
|     | SCR_IO   | I/O  Smart Card data  |     |

| Interface  | Pin Name          | Dir.                                     | Description  |
| ---------- | ----------------- | ---------------------------------------- | ------------ |
|            | SPI0_CLK          | I/O  SPI serial clock                    |              |
|            | SPI0_CSN[i](i=0)  | I/O  SPI chip select signal, low active  |              |
SPI0
|     | SPI0_MOSI  | I/O  SPI serial data   |     |
| --- | ---------- | ---------------------- | --- |
|     | SPI0_MISO  | I/O  SPI serial data   |     |

| Interface  | Pin Name            | Dir.                                     | Description  |
| ---------- | ------------------- | ---------------------------------------- | ------------ |
|            | SPI1_CLK            | I/O  SPI serial clock                    |              |
|            | SPI1_CSN[i](i=0,1)  | I/O  SPI chip select signal, low active  |              |
SPI1
|     | SPI1_MOSI  | I/O  SPI serial data   |     |
| --- | ---------- | ---------------------- | --- |
|     | SPI1_MISO  | I/O  SPI serial data   |     |

| Interface  | Pin Name  | Dir.                   | Description  |
| ---------- | --------- | ---------------------- | ------------ |
| SPI2       | SPI2_CLK  | I/O  SPI serial clock  |              |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       43

RK3566 Datasheet                                                   Rev 1.1
| Interface           | Pin Name  | Dir.                                     | Description  |
| ------------------- | --------- | ---------------------------------------- | ------------ |
| SPI2_CSN[i](i=0,1)  |           | I/O  SPI chip select signal, low active  |              |
| SPI2_MOSI           |           | I/O  SPI serial data                     |              |
| SPI2_MISO           |           | I/O  SPI serial data                     |              |

| Interface           | Pin Name  | Dir.                                     | Description  |
| ------------------- | --------- | ---------------------------------------- | ------------ |
| SPI3_CLK            |           | I/O  SPI serial clock                    |              |
| SPI3_CSN[i](i=0,1)  |           | I/O  SPI chip select signal, low active  |              |
SPI3
| SPI3_MOSI  |     | I/O  SPI serial data   |     |
| ---------- | --- | ---------------------- | --- |
| SPI3_MISO  |     | I/O  SPI serial data   |     |

| Interface  | Pin Name  | Dir.                                           | Description  |
| ---------- | --------- | ---------------------------------------------- | ------------ |
| PWM0       |           | I/O  Pulse Width Modulation input and output   |              |
| PWM1       |           | I/O  Pulse Width Modulation input and output   |              |
| PWM2       |           | I/O  Pulse Width Modulation input and output   |              |
I/O  Pulse Width Modulation input and output, used for
PWM3_IR
IR application recommended
| PWM4  |     | I/O  Pulse Width Modulation input and output  |     |
| ----- | --- | --------------------------------------------- | --- |
| PWM5  |     | I/O  Pulse Width Modulation input and output  |     |
| PWM6  |     | I/O  Pulse Width Modulation input and output  |     |
I/O  Pulse Width Modulation input and output, used for
PWM7_IR
IR application recommended
PWM
| PWM8   |     | I/O  Pulse Width Modulation input and output   |     |
| ------ | --- | ---------------------------------------------- | --- |
| PWM9   |     | I/O  Pulse Width Modulation input and output   |     |
| PWM10  |     | I/O  Pulse Width Modulation input and output   |     |
I/O  Pulse Width Modulation input and output, used for
PWM11_IR
IR application recommended
| PWM12  |     | I/O  Pulse Width Modulation input and output  |     |
| ------ | --- | --------------------------------------------- | --- |
| PWM13  |     | I/O  Pulse Width Modulation input and output  |     |
| PWM14  |     | I/O  Pulse Width Modulation input and output  |     |
I/O  Pulse Width Modulation input and output, used for
PWM15_IR
IR application recommended

| Interface                  | Pin Name  | Dir.           | Description  |
| -------------------------- | --------- | -------------- | ------------ |
| I2C[i]_SDA(i=0,1,2,3,4,5)  |           | I/O  I2C data  |              |
I2C
| I2C[i]_SCL(i=0,1,2,3,4,5)  |     | I/O  I2C clock  |     |
| -------------------------- | --- | --------------- | --- |

| Interface          | Pin Name  | Dir.                        | Description  |
| ------------------ | --------- | --------------------------- | ------------ |
| UART[i]_RX(i=0~9)  |           | I  UART serial data input   |              |
| UART[i]_TX(i=0~9)  |           | O  UART serial data output  |              |
UART
| UART[i]_CTS(i=0~9)  |     | I  UART clear to send modem status input  |     |
| ------------------- | --- | ----------------------------------------- | --- |
UART[i]_RTS(i=0~9)  O  UART modem control request to send output

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       44

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
RMII REC_CLK output or GMAC external clock
| GMAC1_CLK  |     | I/O  |     |
| ---------- | --- | ---- | --- |
input
| GMAC1_TXCLK              |     | O  RGMII TX clock output             |     |
| ------------------------ | --- | ------------------------------------ | --- |
| GMAC1_RXCLK              |     | I  RGMII RX clock input              |     |
| GMAC1_MDC                |     | O  GMAC management interface clock   |     |
| GMAC1_MDIO               |     | I/O  GMAC management interface data  |     |
| GMAC  GMAC1_TXDi(j=0~3)  |     | O  GMAC TX data                      |     |
| GMAC1_RXD[j](j=0~3)      |     | I  GMAC RX data                      |     |
| GMAC1_TXEN               |     | O  GMAC TX data enable               |     |
| GMAC1_RXDV               |     | I  GMAC RX data valid signal         |     |
| GMAC1_RXER               |     | I  GMAC RX error signal              |     |
| GMAC1_COL                |     | I  PHY Collision signal              |     |
| GMAC1_CRS                |     | I  PHY CRS signal                    |     |

| Interface           | Pin Name  | Dir.                                      | Description  |
| ------------------- | --------- | ----------------------------------------- | ------------ |
| MIPI_DSI_TX0_D[i]N  |           | MIPI DSI negative differential data line  |              |
O
| (i=0~3)  |     | transceiver output  |     |
| -------- | --- | ------------------- | --- |
MIPI_DSI_TX0_D[i]P  MIPI DSI positive differential data line transceiver
O
| (i=0~3)  |     | output  |     |
| -------- | --- | ------- | --- |
MIPI_DSI0
MIPI DSI positive differential clock line
| MIPI_DSI_TX0_CLKP  |     | O   |     |
| ------------------ | --- | --- | --- |
transceiver output
MIPI DSI negative differential clock line
| MIPI_DSI_TX0_CLKN  |     | O   |     |
| ------------------ | --- | --- | --- |
transceiver output

| Interface           | Pin Name  | Dir.                                      | Description  |
| ------------------- | --------- | ----------------------------------------- | ------------ |
| MIPI_DSI_TX1_D[i]N  |           | MIPI DSI negative differential data line  |              |
O
| (i=0~3)  |     | transceiver output  |     |
| -------- | --- | ------------------- | --- |
MIPI_DSI_TX1_D[i]P  MIPI DSI positive differential data line transceiver
O
| (i=0~3)  |     | output  |     |
| -------- | --- | ------- | --- |
MIPI_DSI1
MIPI DSI positive differential clock line
| MIPI_DSI_TX1_CLKP  |     | O   |     |
| ------------------ | --- | --- | --- |
transceiver output
MIPI DSI negative differential clock line
| MIPI_DSI_TX1_CLKN  |     | O   |     |
| ------------------ | --- | --- | --- |
transceiver output

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
LVDS negative differential data line transceiver
| LVDS_TX0_D[i]N(i=0~3)  |     | O   |     |
| ---------------------- | --- | --- | --- |
output
LVDS positive differential data line transceiver
| LVDS_TX0_D[i]P(i=0~3)  |     | O   |     |
| ---------------------- | --- | --- | --- |
output
LVDS0
LVDS positive differential clock line transceiver
| LVDS_TX0_CLKP  |     | O   |     |
| -------------- | --- | --- | --- |
output
LVDS negative differential clock line transceiver
| LVDS_TX0_CLKN  |     | O   |     |
| -------------- | --- | --- | --- |
output

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       45

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
MIPI CSI negative differential data line
| MIPI_CSI_D[i]N (i=0~3)  |     | I   |     |
| ----------------------- | --- | --- | --- |
transceiver output
MIPI CSI positive differential data line transceiver
| MIPI_CSI_D[i]P (i=0~3)  |     | I   |     |
| ----------------------- | --- | --- | --- |
output
MIPI_CSI
MIPI CSI positive differential clock line transceiver
| MIPI_CSI_CLK[i]P(i=0~1)  |     | I   |     |
| ------------------------ | --- | --- | --- |
output
MIPI CSI negative differential clock line
| MIPI_CSI_CLK[i]N(i=0~1)  |     | I   |     |
| ------------------------ | --- | --- | --- |
transceiver output

| Interface    | Pin Name  | Dir.                                   | Description  |
| ------------ | --------- | -------------------------------------- | ------------ |
| CIF_CLKIN    |           | I  Camera interface input pixel clock  |              |
| CAM_CLKOUT0  |           | O  Camera interface output work clock  |              |
 Camera   CAM_CLKOUT1  O  Camera interface output work clock
Interface  CIF_VSYNC  I  Camera interface vertical sync signal
| CIF_HREF          |     | I  Camera interface horizontal sync signal  |     |
| ----------------- | --- | ------------------------------------------- | --- |
| CIF_D[i](i=0~15)  |     | I  Camera interface input pixel data        |     |

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
PCIE20_REFCLKN  100MHz  differential  reference  clock  for  PCIe
I/O
| PCIE20_REFCLKP  |     | peripheral  |     |
| --------------- | --- | ----------- | --- |
PCIE20_TXN
O  PCIe differential data output signals
PCIE20_TXP
PCIE20_RXN
| PCIe2  |     | I  PCIe differential data input signals  |     |
| ------ | --- | ---------------------------------------- | --- |
PCIE20_RXP
| PCIE20_BUTTONRSTN  |     | I  PCIe Reset request                       |     |
| ------------------ | --- | ------------------------------------------- | --- |
| PCIE20_WAKENM0     |     | I/O  PCIe wake up                           |     |
| PCIE20_PERSTNM0    |     | I  PCIe warm reset request                  |     |
| PCIE20_CLKREQN     |     | I  PCIe clock request from PCIe peripheral  |     |

| Interface     | Pin Name  | Dir.                         | Description  |
| ------------- | --------- | ---------------------------- | ------------ |
| USB_HOST2_DP  |           | I/O  USB 2.0 Data signal DP  |              |
| USB_HOST2_DM  |           | I/O  USB 2.0 Data signal DM  |              |
USB 2.0
| USB_HOST3_DP  |     | I/O  USB 2.0 Data signal DP  |     |
| ------------- | --- | ---------------------------- | --- |
| USB_HOST3_DM  |     | I/O  USB 2.0 Data signal DM  |     |

| Interface    | Pin Name  | Dir.                         | Description  |
| ------------ | --------- | ---------------------------- | ------------ |
| USB_OTG0_DP  |           | I/O  USB 2.0 Data signal DP  |              |
| USB_OTG0_DM  |           | I/O  USB 2.0 Data signal DM  |              |
USB OTG
| USB_OTG0_VBUSDET  |     | I  Insert detect when act as USB device  |     |
| ----------------- | --- | ---------------------------------------- | --- |
| USB_OTG0_ID       |     | I  USB Mini-Receptacle Identifier        |     |

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       46

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
USB3_HOST1_SSTXP
O  USB 3.0 transmission signal DP/DM,
USB3_ HOST1_SSTXN
USB3_HOST1_SSRXP
I  USB 3.0 receive signal DP/DM
USB3_HOST1_SSRXN
USB3 Host
| USB3_HOST1_DP  |     | I/O  USB 2.0 Data signal DP  |     |
| -------------- | --- | ---------------------------- | --- |
| USB3_HOST1_DM  |     | I/O  USB 2.0 Data signal DM  |     |

| Interface          | Pin Name  | Dir.                              | Description  |
| ------------------ | --------- | --------------------------------- | ------------ |
| EDP_TX[i]P(i=0~3)  |           | O  eDP data lane positive output  |              |
| EDP_TX[i]N(i=0~3)  |           | O  eDP data lane negative output  |              |
eDP
| EDP_AUXP  |     | I/O  eDP CH-AUX positive differential output  |     |
| --------- | --- | --------------------------------------------- | --- |
| EDP_AUXN  |     | I/O  eDP CH-AUX negative differential output  |     |

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
HDMI negative TMDS differential line driver data
| HDMI_TX_D[i]N(i=0~2)  |     | O   |     |
| --------------------- | --- | --- | --- |
output
HDMI positive TMDS differential line driver data
| HDMI_X_D[i]P(i=0~2)  |     | O   |     |
| -------------------- | --- | --- | --- |
output
HDMI negative TMDS differential line driver clock
| HDMI_TX_CLKN  |     | O   |     |
| ------------- | --- | --- | --- |
output
| HDMI          |     | HDMI positive TMDS differential line driver clock  |     |
| ------------- | --- | -------------------------------------------------- | --- |
| HDMI_TX_CLKP  |     | O                                                  |     |
output
| HDMI_TX_REXT   |     | I/O  HDMI reference resistor connection  |     |
| -------------- | --- | ---------------------------------------- | --- |
| HDMI_TX_HPDIN  |     | I/O  HDMI hot plug detect signal         |     |
| HDMITX_SDA     |     | I/O  I2C data line for HDMI              |     |
| HDMITX_SCL     |     | I/O  I2C clock line for HDMI             |     |
| HDMITX_CEC     |     | I/O  HDMI CEC signal                     |     |

| Interface           | Pin Name  | Dir.                             | Description  |
| ------------------- | --------- | -------------------------------- | ------------ |
| ISP_FLASHTRIGOUT    |           | O  Hold signal for flash light   |              |
|   ISP_PRELIGHTTRIG  |           | O  Hold signal for prelight      |              |
| ISP_FLASHTRIGIN     |           | I  External flash trigger pulse  |              |

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
DDR3_CLKP  O  Active-high clock signal to the memory device.
| DDR3_CLKN  |     | O  Active-low clock signal to the memory device.  |     |
| ---------- | --- | ------------------------------------------------- | --- |
Active-high clock enable signal to the memory
| DDR3_CKE  |     | O   |     |
| --------- | --- | --- | --- |
device
DDR3
DDR3_CSN[i] (i=0,1)  O  Active-low chip select signal to the memory device.
Interface
Active-low row address strobe to the memory
| DDR3_RASn  |     | O   |     |
| ---------- | --- | --- | --- |
device.
Active-low column address strobe to the memory
| DDR3_CASn  |     | O   |     |
| ---------- | --- | --- | --- |
device.
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       47

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
Active-low write enable strobe to the memory
| DDR3_WEn  |     | O   |     |
| --------- | --- | --- | --- |
device.
| DDR3_BA[i] (i=0,1,2)  |     | O  Bank address signal to the memory device.   |     |
| --------------------- | --- | ---------------------------------------------- | --- |
| DDR3_A[i] (i=0~15)    |     | O  Address signal to the memory device.        |     |
| DDR3_DQ[i] (i=0~31)   |     | I/O  BiDir.al data line to the memory device.  |     |
DDR3_DQS[i]_P  Active-high biDir.al data strobes to the memory
I/O
| (i=0~3)  |     | device.  |     |
| -------- | --- | -------- | --- |
DDR3_DQS[i]_N  Active-low biDir.al data strobes to the memory
I/O
| (i=0~3)  |     | device.  |     |
| -------- | --- | -------- | --- |
DDR3_DM[i] (i=0~3)  O  Active-low data mask signal to the memory device.
On-Die Termination output signal for two chip
| DDR3_ODT[i] (i=0,1)  |     | O   |     |
| -------------------- | --- | --- | --- |
select.
| DDR3_RESETn  |     | O  Reset signal to the memory device  |     |
| ------------ | --- | ------------------------------------- | --- |

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
DDR4_CLKP  O  Active-high clock signal to the memory device.
| DDR4_CLKN  |     | O  Active-low clock signal to the memory device.  |     |
| ---------- | --- | ------------------------------------------------- | --- |
Active-high clock enable signal to the memory
| DDR4_CKE  |     | O   |     |
| --------- | --- | --- | --- |
device
Active-low chip select signal to the memory device.
| DDR4_CS[i]n (i=0,1)  |     | O   |     |
| -------------------- | --- | --- | --- |
A
| DDR4_BA[i] (i=0,1)  |     | O  Bank address signal to the memory device.  |     |
| ------------------- | --- | --------------------------------------------- | --- |
| DDR4_BG[i] (i=0,1)  |     | O  Bank address signal to the memory device.  |     |
| DDR4_A[i] (i=0~13)  |     | O  Address signal to the memory device.       |     |
Address signal to the memory device/Active-low
| DDR4_A14_Wen  |     | O   |     |
| ------------- | --- | --- | --- |
write enable strobe to the memory device.
Address signal to the memory device/Active-low
| DDR4_A15_CASn  |     | O   |     |
| -------------- | --- | --- | --- |
column address strobe to the memory device.
Address signal to the memory device/Active-low
| DDR4  DDR4_A16_RASn  |     | O   |     |
| -------------------- | --- | --- | --- |
row address strobe to the memory device.
Interface
| DDR4_DQL_A[i] (i=0~7)  |     | I/O  BiDir.al data line to the memory device.  |     |
| ---------------------- | --- | ---------------------------------------------- | --- |
| DDR4_DQH_A[i] (i=0~7)  |     | I/O  BiDir.al data line to the memory device.  |     |
Active-high biDir.al data strobes to the memory
| DDR4_DQSL_P_A  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-low biDir.al data strobes to the memory
| DDR4_DQSL_N_A  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-high biDir.al data strobes to the memory
| DDR4_DQSH_P_A  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-low biDir.al data strobes to the memory
| DDR4_DQSH_N_A  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
DDR4_DML_A  O  Active-low data mask signal to the memory device.
DDR4_DMH_A  O  Active-low data mask signal to the memory device.
| DDR4_DQL_B[i] (i=0~7)  |     | I/O  BiDir.al data line to the memory device.  |     |
| ---------------------- | --- | ---------------------------------------------- | --- |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       48

RK3566 Datasheet                                                   Rev 1.1
| Interface              | Pin Name  | Dir.                                           | Description  |
| ---------------------- | --------- | ---------------------------------------------- | ------------ |
| DDR4_DQH_B[i] (i=0~7)  |           | I/O  BiDir.al data line to the memory device.  |              |
Active-high biDir.al data strobes to the memory
| DDR4_DQSL_P_B  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-low biDir.al data strobes to the memory
| DDR4_DQSL_N_B  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-high biDir.al data strobes to the memory
| DDR4_DQSH_P_B  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
Active-low biDir.al data strobes to the memory
| DDR4_DQSH_N_B  |     | I/O  |     |
| -------------- | --- | ---- | --- |
device.
DDR4_DML_B  O  Active-low data mask signal to the memory device.
DDR4_DMH_B  O  Active-low data mask signal to the memory device.
On-Die Termination output signal for two chip
| DDR4_ODT[i] (i=0,1)  |     | O   |     |
| -------------------- | --- | --- | --- |
select.
| DDR4_RESETn  |     | O  Reset signal to the memory device  |     |
| ------------ | --- | ------------------------------------- | --- |

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
LPDDR3_CLKP  O  Active-high clock signal to the memory device.
LPDDR3_CLKN  O  Active-low clock signal to the memory device.
Active-high clock enable signal to the memory
| LPDDR3_CKE  |     | O   |     |
| ----------- | --- | --- | --- |
device
Active-low chip select signal to the memory device.
| LPDDR3_CS[i]n (i=0,1)  |     | O   |     |
| ---------------------- | --- | --- | --- |
AThere are two chip select.
| LPDDR3_A[i] (i=0~9)  |     | O  Address signal to the memory device.  |     |
| -------------------- | --- | ---------------------------------------- | --- |
LPDDR3  LPDDR3_DQ[i] (i=0~31)  I/O  BiDir.al data line to the memory device.
Interface  LPDDR3_DQS[i]_P  Active-high biDir.al data strobes to the memory
I/O
| (i=0~3)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR3_DQS[i]_N  Active-low biDir.al data strobes to the memory
I/O
| (i=0~3)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR3_DM[i](i=0~3)  O  Active-low data mask signal to the memory device.
On-Die Termination output signal for two chip
| LPDDR3_ODT[i] (i=0,1)  |     | O   |     |
| ---------------------- | --- | --- | --- |
select.
LPDDR3_RESETn  O  LPDDR3/DDR4 reset signal to the memory device

| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
LPDDR4_CLKP_A  O  Active-high clock signal to the memory device.
LPDDR4_CLKN_A  O  Active-low clock signal to the memory device.
Active-high clock enable signal to the memory
| LPDDR4_CKE0_A  |     | O                                              |     |
| -------------- | --- | ---------------------------------------------- | --- |
| LPDDR4         |     | device                                         |     |
| /LPDDR4X       |     | Active-high clock enable signal to the memory  |     |
| LPDDR4_CKE1_A  |     | O                                              |     |
| Interface      |     | device                                         |     |
Active-low chip select signal to the memory device.
| LPDDR4_CS[i]n_A (i=0,1)  |     | O   |     |
| ------------------------ | --- | --- | --- |
AThere are two chip select.
| LPDDR4_A[i] (i=0~15)  |     | O  Address signal to the memory device.  |     |
| --------------------- | --- | ---------------------------------------- | --- |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       49

RK3566 Datasheet                                                   Rev 1.1
| Interface  | Pin Name  | Dir.  | Description  |
| ---------- | --------- | ----- | ------------ |
LPDDR4_DQ[i]_A
I/O  BiDir.al data line to the memory device.
(i=0~15)
LPDDR4_DQS[i]P_A  Active-high biDir.al data strobes to the memory
I/O
| (i=0,1)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR4_DQS[i]N_A  Active-low biDir.al data strobes to the memory
I/O
| (i=0,1)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR4_DM[i](i=0~3)  O  Active-low data mask signal to the memory device.
LPDDR4_ODT[i]_CA_A  On-Die Termination output signal for two chip
O
| (i=0,1)  |     | select.  |     |
| -------- | --- | -------- | --- |
LPDDR4_CLKP_B  O  Active-high clock signal to the memory device.
LPDDR4_CLKN_B  O  Active-low clock signal to the memory device.
Active-high clock enable signal to the memory
| LPDDR4_CKE0_B  |     | O   |     |
| -------------- | --- | --- | --- |
device
Active-high clock enable signal to the memory
| LPDDR4_CKE1_B  |     | O   |     |
| -------------- | --- | --- | --- |
device
LPDDR4_CS[i]n_B (i=0,1)  O  Active-low chip select signal to the memory device.
| LPDDR4_B[i] (i=0~15)  |     | O  Address signal to the memory device.  |     |
| --------------------- | --- | ---------------------------------------- | --- |
LPDDR4_DQ[i]_B
I/O  BiDir.al data line to the memory device.
(i=0~15)
LPDDR4_DQS[i]P_B  Active-high biDir.al data strobes to the memory
I/O
| (i=0,1)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR4_DQS[i]N_B  Active-low biDir.al data strobes to the memory
I/O
| (i=0,1)  |     | device.  |     |
| -------- | --- | -------- | --- |
LPDDR4_DM[i] (i=0~3)  O  Active-low data mask signal to the memory device.
LPDDR4_ODT[i]_CA_B  On-Die Termination output signal for two chip
O
| (i=0,1)        |     | select.                               |     |
| -------------- | --- | ------------------------------------- | --- |
| LPDDR4_RESETn  |     | O  Reset signal to the memory device  |     |

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       50

RK3566 Datasheet                                                   Rev 1.1
Chapter 3 Electrical Specification
3.1 Absolute Ratings
The below table provides the absolute ratings.
Absolute maximum ratings specify the values beyond which the device may be damaged
permanently. Long-term exposure to absolute maximum ratings conditions may affect
device reliability.
Absolute minimum ratings specify the values beyond which the device may be damaged
permanently. Long-term exposure to absolute minimum ratings conditions may affect
device reliability.
Table 3-1 Absolute ratings
| Parameters                     | Related Power Group  | Min  Max   | Unit  |
| ------------------------------ | -------------------- | ---------- | ----- |
| Supply voltage for CPU         | VDD_CPU              | -0.3  1.2  | V     |
| Supply voltage for GPU         | VDD_GPU              | -0.3  1.2  | V     |
| Supply voltage for NPU         | VDD_NPU              | -0.3  1.2  | V     |
| Supply voltage for core logic  | VDD_LOGIC            | -0.3  1.1  | V     |
PMU_VDD_LOGIC_0V9
PMUPLL_AVDD_0V9
USB_AVDD2_0V9
USB_AVDD1_0V9
MULTI_PHY_AVDD_0V9
| 0.9V supply voltage  |     | -0.3  1.1  | V   |
| -------------------- | --- | ---------- | --- |
MIPI_CSI_RX_AVDD_0V9
MIPI_DSI_TX0/LVDS_TX0_AVDD_0V9
MIPI_DSI_TX1
EDP_TX_AVDD_0V9
HDMI_TX_AVDD_0V9
PMUPLL_AVDD_1V8
SYSPLL_AVDD_1V8
MULTI_PHY_AVDD_1V8
USB_AVDD2_1V8
USB_AVDD1_1V8
MULTI_PHY_AVDD_1V8
| 1.8V supply voltage  |     | -0.3  1.98  | V   |
| -------------------- | --- | ----------- | --- |
MIPI_CSI_RX_AVDD_1V8
MIPI_DSI_TX0/LVDS_TX0_AVDD_1V8
MIPI_DSI_TX1/LVDS_TX1_AVDD_1V8
EDP_TX_AVDD_1V8
HDMI_TX_AVDD_1V8
OTP_VCC_1V8
USB_AVDD2_3V3
| 3.3V supply voltage  |     | -0.3  3.63  | V   |
| -------------------- | --- | ----------- | --- |
USB_AVDD1_3V3
| Supply voltage for DDR IO    | DDRPHY_VDDQ  | -0.3  1.65  | V   |
| ---------------------------- | ------------ | ----------- | --- |
| Storage Temperature          | Tstg         | -40  125    | ℃   |
| Max Conjunction Temperature  | Tj           | NA  125     | ℃   |

Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       51

RK3566 Datasheet                                                   Rev 1.1
3.2 Recommended Operating Condition
Following table describes the recommended operating condition.
Table 3-2 Recommended operating condition
| Parameters              | Symbol             | Min  Typ   | Max  Unit  |
| ----------------------- | ------------------ | ---------- | ---------- |
| Voltage for CPU         | VDD_CPU            | 0.81  0.9  | NA  V      |
| Voltage for GPU         | VDD_GPU            | 0.81  0.9  | NA  V      |
| Voltage for NPU         | VDD_NPU            | 0.81  0.9  | NA  V      |
| Voltage for core logic  | VDD_LOGIC          | 0.81  0.9  | 0.99  V    |
| Voltage for PMU         | PMU_VDD_LOGIC_0V9  | 0.81  0.9  | 0.99  V    |
| PMUIO1 GPIO Power       | PMUIO1             | 2.97  3.3  | 3.63  V    |
VCCIO1,VCCIO2, VCCIO3,
|     |     | 2.97  3.3  | 3.63  |
| --- | --- | ---------- | ----- |
Digital GPIO Power (3.3V/1.8V)  VCCIO4VCCIO5, VCCIO6, VCCIO7,  V
|     |     | 1.62  1.8  | 1.98  |
| --- | --- | ---------- | ----- |
PMUIO2
| DDR3 IO VDDQ power     | DDRPHY _VDDQ  | 1.425  1.5   | 1.575  V  |
| ---------------------- | ------------- | ------------ | --------- |
| DDR3L IO VDDQ Power    | DDRPHY _VDDQ  | 1.283  1.35  | 1.417  V  |
| LPDDR3 IO VDDQ Power   | DDRPHY _VDDQ  | 0.994  1.2   | 1.3  V    |
| DDR4 IO VDDQ Power     | DDRPHY _VDDQ  | 0.994  1.2   | 1.3  V    |
| LPDDR4 IO VDDQ Power   | DDRPHY _VDDQ  | 1.0  1.1     | 1.21  V   |
| LPDDR4X IO VDDQ Power  | DDRPHY _VDDQ  | 0.54  0.6    | 0.66      |
PMU PLL Analog Power(0.9V)  PMUPLL_AVDD_0V9  0.81  0.9  0.99  V
PMU PLL Analog Power(1.8V)  PMUPLL_AVDD_1V8  1.62  1.8  1.98  V
System PLL Analog Power(0.9V)  SYSPLL_AVDD_0V9  0.81  0.9  0.99  V
System PLL Analog Power(1.8V)  SYSPLL_AVDD_1V8  1.62  1.8  1.98  V
USB 2.0 Analog Power (0.9V)  USB_AVDD2_0V9  0.81  0.9  0.99  V
USB 2.0 Analog Power (1.8V)  USB_AVDD2_1V8  1.62  1.8  1.98  V
USB 2.0 Analog Power (3.3V)  USB_AVDD2_3V3  2.97  3.3  3.63  V
USB 3.0 Analog Power (0.9V)  USB_AVDD1_0V9  0.81  0.9  0.99  V
USB 3.0 Analog Power (1.8V)  USB_AVDD1_1V8  1.62  1.8  1.98  V
USB 3.0 Analog Power (3.3V)  USB_AVDD1_3V3  2.97  3.3  3.63  V
Multi-phy Analog Power(0.9V)  MULTI_PHY_AVDD_0V9  0.81  0.9  0.99  V
Multi-phy Analog Power(1.8V)  MULTI_PHY_AVDD_1V8  1.62  1.8  1.98  V
MIPI CSI Analog Power(0.9V)  MIPI_CSI_RX_AVDD_0V9  0.81  0.9  0.99  V
MIPI CSI Analog Power(1.8V)  MIPI_CSI_RX_AVDD_1V8  1.62  1.8  1.98  V
MIPI_DSI_TX0/LVDS_TX0_AVDD_0V9
| MIPI DSI Analog Power(0.9V)  |     | 0.81  0.9  | 0.99  V  |
| ---------------------------- | --- | ---------- | -------- |
MIPI_DSI_TX0/LVDS_TX0_AVDD_1V8
| MIPI DSI Analog Power (1.8V)  |     | 1.62  1.8  | 1.98  V  |
| ----------------------------- | --- | ---------- | -------- |
MIPI_DSI_TX1_AVDD_0V9
| MIPI DSI Analog Power(0.9V)  |     | 0.81  0.9  | 0.99  V  |
| ---------------------------- | --- | ---------- | -------- |
MIPI_DSI_TX1_AVDD_1V8
| MIPI DSI Analog Power (1.8V)  |     | 1.62  1.8  | 1.98  V  |
| ----------------------------- | --- | ---------- | -------- |
eDP Analog Power(0.9V)  EDP _TX_AVDD_0V9  0.81  0.9  0.99  V
eDP Analog Power (1.8V)  EDP _TX_AVDD_1V8  1.62  1.8  1.98  V
HDMI Analog Power(0.9V)  HDMI_TX_AVDD_0V9  0.81  0.9  0.99  V
HDMI Analog Power (1.8V)  HDMI_TX_AVDD_1V8  1.62  1.8  1.98  V
SARADC Analog Power(1.8V)  SARADC_AVDD_1V8  1.62  1.8  1.98  V
| OTP Analog Power(1.8V)     | OTP_VCC_1V8  | 1.62  1.8  | 1.98  V  |
| -------------------------- | ------------ | ---------- | -------- |
| OSC input clock frequency  |              | NA  24     | NA  MHz  |
NA
| Max CPU frequency  |     | NA  | TBD  GHz  |
| ------------------ | --- | --- | --------- |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       52

RK3566 Datasheet                                                   Rev 1.1
|                    | Parameters  | Symbol  |     | Min  | Typ  Max  | Unit  |
| ------------------ | ----------- | ------- | --- | ---- | --------- | ----- |
| Max GPU frequency  |             |         |     | NA   | NA  TBD   | MHz   |
NA
| Max NPU frequency              |     |     |     | NA  | TBD     | MHz  |
| ------------------------------ | --- | --- | --- | --- | ------- | ---- |
| Ambient Operating Temperature  |     | TA  |     | 0   | NA  80  | ℃    |
Notes:
①  Symbol name is same as the pin name in the io descriptions
3.3 DC Characteristics
Table 3-3 DC Characteristics
|     | Parameters         | Symbol  | Min   | Typ  | Max  | Unit  |
| --- | ------------------ | ------- | ----- | ---- | ---- | ----- |
|     | Input Low Voltage  | Vil     | -0.3  | NA   | 0.8  | V     |
NA
|     | Input High Voltage  | Vih  | 2.0  |     | VDDO+0.3  | V   |
| --- | ------------------- | ---- | ---- | --- | --------- | --- |
NA
| Digital GPIO  | Output Low Voltage   | Vol  | -0.3  |     | 0.4       | V     |
| ------------- | -------------------- | ---- | ----- | --- | --------- | ----- |
| @3.3V         | Output High Voltage  | Voh  | 2.4   | NA  | VDDO+0.3  | V     |
|               | Pullup Resistor      | Rpu  | 16    | NA  | 43        | Kohm  |
NA
|     | Pulldown Resistor  | Rpd  | 16  |     | 43  | Kohm  |
| --- | ------------------ | ---- | --- | --- | --- | ----- |
NA
|                | Input Low Voltage    | Vil  | -0.3       |     | 0.35*VDDO  | V   |
| -------------- | -------------------- | ---- | ---------- | --- | ---------- | --- |
|                | Input High Voltage   | Vih  | 0.65*VDDO  | NA  | VDDO+0.3   | V   |
| Digital GPIO   | Output Low Voltage   | Vol  | -0.3       | NA  | 0.4        | V   |
| @1.8V          | Output High Voltage  | Voh  | 1.4        | NA  | VDDO+0.3   | V   |
NA
|     | Pullup Resistor    | Rpu  | 16  |     | 43  | Kohm  |
| --- | ------------------ | ---- | --- | --- | --- | ----- |
|     | Pulldown Resistor  | Rpd  | 16  | NA  | 43  | Kohm  |

|     | Parameters  | Symbol  | Min  | Typ  | Max  | Unit  |
| --- | ----------- | ------- | ---- | ---- | ---- | ----- |
DDRPHY_VDD
|          | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |     | V   |
| -------- | ------------------- | -------- | --------- | --- | --- | --- |
| DDR IO   |                     |          |           |     | Q   |     |
@DDR3 mode  Input Low Voltage   Vil_ddr  VSSQ  NA  Vref-0.1  V
|     | output impedence  | Rtt  | 20  | NA  | 60  | Ohm  |
| --- | ----------------- | ---- | --- | --- | --- | ---- |
DDRPHY_VDD
|     | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |     | V   |
| --- | ------------------- | -------- | --------- | --- | --- | --- |
Q
DDR IO
@DDR3L mode  Input Low Voltage   Vil_ddr  VSSQ  NA  Vref-0.1  V
|     | output impedence  | Rtt  | 20  | NA  | 60  | Ohm  |
| --- | ----------------- | ---- | --- | --- | --- | ---- |
DDRPHY_VDD
|     | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |     | V   |
| --- | ------------------- | -------- | --------- | --- | --- | --- |
Q
DDR IO
|     | Input Low Voltage   | Vil_ddr  | VSSQ  | NA  | Vref-0.1  | V   |
| --- | ------------------- | -------- | ----- | --- | --------- | --- |
@DDR4 mode
|     | output impedence  | Rtt  | 20  | NA  | 60  | Ohm  |
| --- | ----------------- | ---- | --- | --- | --- | ---- |
DDRPHY_VDD
|           | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |           | V   |
| --------- | ------------------- | -------- | --------- | --- | --------- | --- |
| DDR IO @  |                     |          |           |     | Q         |     |
|           | Input Low Voltage   | Vil_ddr  | VSSQ      | NA  | Vref-0.1  | V   |
LPDDR3 mode
|     | output impedence  | Rtt  | 20  | NA  | 60  | Ohm  |
| --- | ----------------- | ---- | --- | --- | --- | ---- |
DDRPHY_VDD
|          | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |     | V   |
| -------- | ------------------- | -------- | --------- | --- | --- | --- |
| DDR IO   |                     |          |           |     | Q   |     |
@LPDDR4 mode  Input Low Voltage   Vil_ddr  VSSQ  NA  Vref-0.1  V
|           | output impedence    | Rtt      | 20        | NA  | 60         | Ohm  |
| --------- | ------------------- | -------- | --------- | --- | ---------- | ---- |
| DDR IO    |                     |          |           |     | DDRPHY_VDD |      |
|           | Input High Voltage  | Vih_ddr  | Vref+0.1  | NA  |            | V    |
| @LPDDR4X  |                     |          |           |     | QL         |      |
| mode      | Input Low Voltage   | Vil_ddr  | VSSQ      | NA  | Vref-0.1   | V    |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       53

RK3566 Datasheet                                                   Rev 1.1
|     | Parameters  |                   | Symbol  |     | Min  | Typ  |     | Max  | Unit  |
| --- | ----------- | ----------------- | ------- | --- | ---- | ---- | --- | ---- | ----- |
|     |             | output impedence  | Rtt     |     | 20   | NA   |     | 60   | Ohm   |

|       |     | Parameters                       |     |         | Symbol  | Min   | Typ  | Max        | Unit  |
| ----- | --- | -------------------------------- | --- | ------- | ------- | ----- | ---- | ---------- | ----- |
|       |     | Output High Voltage              |     | Voh     |         | NA    |      | NA  1.475  | V     |
|       |     | Output Low Voltage               |     | Vol     |         | 925   |      | NA  NA     | mV    |
|       |     | Output differential voltage      |     | |VOD|   |         | 250   |      | NA  400    | mV    |
|       |     | Output offset voltage            |     | Vos     |         | 1125  |      | NA  1275   | mV    |
| LVDS  |     | Output impedance, single ended   |     | Ro      |         | 40    |      | NA  140    | Ω     |
|       |     | Ro mismatch between A & B        |     | ΔRo     |         | NA    |      | NA  10     | %     |
|       |     | Change in |Vod| between 0 and 1  |     | |ΔVod|  |         | NA    |      | NA  25     | mV    |
|       |     | Change in Vod between 0 and 1    |     | ΔVos    |         | NA    |      | NA  25     | mV    |

|     |     | Parameters                        |     |        | Symbol  | Min   | Typ  | Max        | Unit  |
| --- | --- | --------------------------------- | --- | ------ | ------- | ----- | ---- | ---------- | ----- |
|     |     | Output High Voltage               |     | Voh    |         | 1.08  |      | 1.2  1.32  | V     |
|     |     | Output Low Voltage                |     | Vol    |         | -50   |      | NA  50     | mV    |
|     |     | HS TX static Common-mode voltage  |     | VCMTX  |         | 150   | 200  | 250        | mV    |
VCMTX mismatch when output is Differential-1
|     |     |     |     | |ΔVCMTX(1,0)|  |     | NA  |     | NA  5  | mV  |
| --- | --- | --- | --- | -------------- | --- | --- | --- | ------ | --- |
or Differential-0
MIPI
|     |     | HS transmit differential voltage  |     | |VOD|  |     | 140  | 200  | 270  | mV  |
| --- | --- | --------------------------------- | --- | ------ | --- | ---- | ---- | ---- | --- |
VOD mismatch when output is Differential-1 or
|     |     |     |     | |ΔVOD|  |     | NA  |     | NA  14  | mV  |
| --- | --- | --- | --- | ------- | --- | --- | --- | ------- | --- |
Differential-0
|     |     | HS output high voltage                  |     | VOHHS  |     | NA  |     | NA  360   | mV  |
| --- | --- | --------------------------------------- | --- | ------ | --- | --- | --- | --------- | --- |
|     |     | Single ended output impedance           |     | ZOS    |     | 40  |     | 50  62.5  | Ω   |
|     |     | Single ended output impedance mismatch  |     | ΔZOS   |     | NA  |     | NA  10    | %   |

3.4 Electrical Characteristics for General IO
Table 3-4 Electrical Characteristics for Digital General IO
|     | Parameters             |     | Symbol  |                   | Test condition  |     | Min  | Typ  Max  | Unit  |
| --- | ---------------------- | --- | ------- | ----------------- | --------------- | --- | ---- | --------- | ----- |
|     | Input leakage current  |     | Ii      | Vin = 3.3V or 0V  |                 |     | NA   | NA  10    | uA    |
Tri-state output leakage current  Ioz  Vout = 3.3V or 0V  NA  NA  10  uA
Vin = 3.3V, pulldown
|     |     |     |     |     |     |     | NA  | NA  10  | uA  |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- |
disabled
|               | High level input current  |     | Iih  |                       |     |     |     |         |     |
| ------------- | ------------------------- | --- | ---- | --------------------- | --- | --- | --- | ------- | --- |
| Digital GPIO  |                           |     |      | Vin = 3.3V, pulldown  |     |     |     |         |     |
|               |                           |     |      |                       |     |     | NA  | NA  10  | uA  |
| @3.3V         |                           |     |      | enabled               |     |     |     |         |     |
Vin = 0V, pullup
|     |     |     |     |     |     |     | NA  | NA  10  | uA  |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- |
disabled
|     | Low level input current  |     | Iil  |     |     |     |     |     |     |
| --- | ------------------------ | --- | ---- | --- | --- | --- | --- | --- | --- |
Vin = 0V, pullup
|     |     |     |     |     |     |     | NA  | NA  10  | uA  |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- |
enabled
|     | Input leakage current  |     | Ii  | Vin = 1.8V or 0V  |     |     | NA  | NA  10  | uA  |
| --- | ---------------------- | --- | --- | ----------------- | --- | --- | --- | ------- | --- |
Digital GPIO
@1.8V  Tri-state output leakage current  Ioz  Vout = 1.8V or 0V  NA  NA  10  uA
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       54

RK3566 Datasheet                                                   Rev 1.1
| Parameters  |     |     | Symbol  | Test condition  | Min  | Typ  Max  Unit  |
| ----------- | --- | --- | ------- | --------------- | ---- | --------------- |
Vin = 1.8V, pulldown
|     |     |     |     |     | NA  | NA  10  uA  |
| --- | --- | --- | --- | --- | --- | ----------- |
disabled
| High level input current  |     |     | Iih  |     |     |     |
| ------------------------- | --- | --- | ---- | --- | --- | --- |
Vin = 1.8V, pulldown
|     |     |     |     |     | NA  | NA  10  uA  |
| --- | --- | --- | --- | --- | --- | ----------- |
enabled
Vin = 0V, pullup
|     |     |     |     |     | NA  | NA  10  uA  |
| --- | --- | --- | --- | --- | --- | ----------- |
disabled
| Low level input current  |     |     | Iil  |     |     |     |
| ------------------------ | --- | --- | ---- | --- | --- | --- |
Vin = 0V, pullup
|     |     |     |     |     | NA  | NA  10  uA  |
| --- | --- | --- | --- | --- | --- | ----------- |
enabled

3.5 Electrical Characteristics for PLL
Table 3-5 Electrical Characteristics for Frac PLL
| Parameters  |                  |     | Symbol  | Test condition  | Min  Typ  | Max  Unit  |
| ----------- | ---------------- | --- | ------- | --------------- | --------- | ---------- |
|             | Input clock      |     |         | Fin = FREF      |           |            |
|             |                  |     | Fin     |                 | 1  NA     | 1200  MHz  |
|             | frequency(Frac)  |     |         | @1.8V/0.99V     |           |            |
Fvco = Fref * FBDIV
|     | VCO operating range  |     | Fvco  |     | 950  NA  | 3800  MHz  |
| --- | -------------------- | --- | ----- | --- | -------- | ---------- |
 @3.3V/0.99V

Fout = Fvco/POSTDIV
|     | Output clock frequency  |     | Fout  |     | 19  NA  | 3800  MHz  |
| --- | ----------------------- | --- | ----- | --- | ------- | ---------- |
@3.3V/0.99V
Input
  @ 3.3V/0.99V,
|     | Lock time  |     | Tlt  |     | NA  250  | 500  clock  |
| --- | ---------- | --- | ---- | --- | -------- | ----------- |
FREF=24M,REFDIV=1
cycles

Table 3-6 Electrical Characteristics for Int-PLL
| Parameters  |                  |     | Symbol  | Test condition  | Min  Typ  | Max  Unit  |
| ----------- | ---------------- | --- | ------- | --------------- | --------- | ---------- |
|             | Input clock      |     |         | Fin = FREF      |           |            |
|             |                  |     | Fin     |                 | 10  NA    | 800  MHz   |
|             | frequency(Frac)  |     |         | @1.8V/0.99V     |           |            |
Fvco = Fref * FBDIV
|     | VCO operating range  |     | Fvco  |     | 475  NA  | 1900  MHz  |
| --- | -------------------- | --- | ----- | --- | -------- | ---------- |
 @3.3V/0.99V
  Fout = Fvco/POSTDIV
|     | Output clock frequency  |     | Fout  |     | 9  NA  | 1900  MHz  |
| --- | ----------------------- | --- | ----- | --- | ------ | ---------- |
@3.3V/0.99V
Input
  @ 3.3V/0.99V,
|     | Lock time  |     | Tlt  |     | NA  1000  | 1500  clock  |
| --- | ---------- | --- | ---- | --- | --------- | ------------ |
FREF=24M,REFDIV=1
cycles
Notes:
①  REFDIV is the input divider value;
②  FBDIV is the feedback divider value;
③  POSTDIV is the output divider value

3.6 Electrical Characteristics for USB 2.0 Interface
Table 3-7 Electrical Characteristics for USB 2.0 Interface
| Parameters  |     | Symbol  | Test condition  |     | Min  Typ  | Max  Unit  |
| ----------- | --- | ------- | --------------- | --- | --------- | ---------- |
Transmitter
Classic mode (Vout = 0 or
|     |     |     |     |     | 40.5  45  | 49.5  ohm  |
| --- | --- | --- | --- | --- | --------- | ---------- |
3.3V)
Output resistance  ROUT
ohm
|     |     |     | HS mode (Vout = 0 to 800mV)  |     | 40.5  45  | 49.5  |
| --- | --- | --- | ---------------------------- | --- | --------- | ----- |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       55

RK3566 Datasheet                                                   Rev 1.1
|     | Parameters  | Symbol  | Test condition  |     | Min  Typ  | Max  Unit  |
| --- | ----------- | ------- | --------------- | --- | --------- | ---------- |
Output Capacitance   COUT  seen from D+ or D-  NA  NA  3  pF
|     |     |     | Classic (LS/FS) mode  |     | 1.45  1.65  | 1.85  V  |
| --- | --- | --- | --------------------- | --- | ----------- | -------- |
Output Common Mode Voltage  VM
|     |     |     | HS mode                  |     | 0.175  0.2  | 0.225  V  |
| --- | --- | --- | ------------------------ | --- | ----------- | --------- |
|     |     |     | Classic (LS/FS); Io=0mA  |     | 2.97  3.3   | 3.63  V   |
Differential output signal high   VOH  Classic (LS/FS); Io=6mA  2.2  NA  NA  V
|     |     |     | HS mode; Io=0mA          |     | 360  400  | 440  mV  |
| --- | --- | --- | ------------------------ | --- | --------- | -------- |
|     |     |     | Classic (LS/FS); Io=0mA  |     | -0.33  0  | 0.33  V  |
Differential output signal low   VOL  Classic (LS/FS); Io=6mA  NA  0.3  0.8  V
|     |     |     | HS mode; Io=0mA  |     | -40  0  | 40  mV  |
| --- | --- | --- | ---------------- | --- | ------- | ------- |
Receiver
|     |     |     | Classic mode  |     | NA  +-250  | NA  mV  |
| --- | --- | --- | ------------- | --- | ---------- | ------- |
Receiver sensitivity   RSENS
|     |     |     | HS mode       |     | NA  +-25   | NA  mV  |
| --- | --- | --- | ------------- | --- | ---------- | ------- |
|     |     |     | Classic mode  |     | 0.8  1.65  | 2.5  V  |
HS mode (differential and
|                       |     |      |                      |     | 0.1  0.2  | 0.3  V  |
| --------------------- | --- | ---- | -------------------- | --- | --------- | ------- |
| Receiver common mode  |     | RCM  | squelch comparator)  |     |           |         |
HS mode (disconnect
|     |     |     |     |     | 0.5  0.6  | 0.7  V  |
| --- | --- | --- | --- | --- | --------- | ------- |
comparator)
Input capacitance (seen at D+ or
|     |     |     |     |     | NA  NA  | 3  pF  |
| --- | --- | --- | --- | --- | ------- | ------ |
D-)
| Squelch threshold       |     |      |     |     | 100  112  | 150  mV  |
| ----------------------- | --- | ---- | --- | --- | --------- | -------- |
| Disconnect threshold    |     |      |     |     | 570  590  | 625  mV  |
| High input level        |     | VIH  |     |     | 0.6  NA   | NA  V    |
| Low input level         |     | VIL  |     |     | NA  NA    | 0.2  V   |

3.7 Electrical Characteristics for DDR IO
Table 3-8 Electrical Characteristics for DDR IO
|     | Parameters  |     | Symbol  | Test condition  | Min  | Typ  Max  Unit  |
| --- | ----------- | --- | ------- | --------------- | ---- | --------------- |
DDR IO
|     |     | Input leakage current  |     |  @ 1.5V , 125℃  | -80  | NA  6  uA  |
| --- | --- | ---------------------- | --- | --------------- | ---- | ---------- |
@DDR3 mode
DDR IO
|     |     | Input leakage current  |     |  @ 1.35V , 125℃  | -65  | NA  5  uA  |
| --- | --- | ---------------------- | --- | ---------------- | ---- | ---------- |
@DDR3L mode
DDR IO
|     |     | Input leakage current  |     | @ 1.2V , 125℃  | -50  | NA  4  uA  |
| --- | --- | ---------------------- | --- | -------------- | ---- | ---------- |
@DDR4 mode
DDR IO
|     |     | Input leakage current  |     |  @ 1.2V , 125℃  | -50  | NA  4  uA  |
| --- | --- | ---------------------- | --- | --------------- | ---- | ---------- |
@LPDDR3 mode
DDR IO
|     |     | Input leakage current  |     |  @ 1.1V , 125℃  | -45  | NA  3.5  uA  |
| --- | --- | ---------------------- | --- | --------------- | ---- | ------------ |
@LPDDR4 mode
DDR IO
|     |     | Input leakage current  |     |  @ 0.6V , 125℃  | -20  | NA  1.5  uA  |
| --- | --- | ---------------------- | --- | --------------- | ---- | ------------ |
@LPDDR4X mode

|     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       56

RK3566 Datasheet                                                   Rev 1.1
3.8 Electrical Characteristics for TSADC
Table 3-9 Electrical Characteristics for TSADC
|     | Parameters  | Symbol  | Test condition  | Min  Typ  | Max  Unit  |
| --- | ----------- | ------- | --------------- | --------- | ---------- |

| Temperature Resolution  |     |     |     | NA  ±5   | NA  ℃   |
| ----------------------- | --- | --- | --- | -------- | ------- |
| Temperature Range       |     |     |     | -20  NA  | 120  ℃  |
3.9 Electrical Characteristics for MIPI DSI
Table 3-10 Electrical Characteristics for MIPI DSI
| Parameters   |                    | Symbol      | Test condition  | Min  Typ  | Max  Units  |
| ------------ | ------------------ | ----------- | --------------- | --------- | ----------- |
| Common-mode  | variations  above  |             |                 |           |             |
|              |                    | ΔVcmtx(HF)  |                 | NA  NA    | 15  mVrms   |
450 MHz
Common-mode variations between
|     |     | ΔVcmtx(LF)  |     | NA  NA  | 25  mVpeak  |
| --- | --- | ----------- | --- | ------- | ----------- |
50MHz – 450MHz
|                                  |     |            |     | NA  NA  | 0.3  UI  |
| -------------------------------- | --- | ---------- | --- | ------- | -------- |
| 20%-80% rise time and fall time  |     | Tr and Tf  |     |         |          |
|                                  |     |            |     | 10  NA  | NA  ps   |
3.10 Electrical Characteristics for MIPI CSI
Table 3-11 Electrical Characteristics for MIPI CSI
| Parameters  |     | Symbol  | Test condition  | Min  Typ  | Max  Units  |
| ----------- | --- | ------- | --------------- | --------- | ----------- |
Common-mode interference beyond
|     |     | ΔVcmrx(HF)  |     | NA  NA  | 100  mV  |
| --- | --- | ----------- | --- | ------- | -------- |
450 MHz
Common-mode interference 50MHz-
|     |     | ΔVcmrx(LF)  |     | NA  NA  | 50  mV  |
| --- | --- | ----------- | --- | ------- | ------- |
450MHz
| Common-mode termination       |     | Ccm      |     | NA  NA   | 60  pF     |
| ----------------------------- | --- | -------- | --- | -------- | ---------- |
| Input pulse rejection         |     | Espike   |     | NA  NA   | 300  V.ps  |
| Minimum pulse width response  |     | Tmin-rx  |     | 20  NA   | NA  ns     |
| Peak interference amplitude   |     | Vint     |     | NA  NA   | 200  mV    |
| Interference frequency        |     | Fint     |     | 450  NA  | NA  MHz    |

3.11 Electrical Characteristics for HDMI
Table 3-12 Electrical Characteristics for HDMI
|     | Parameters  | Symbol  | Test condition  | Min  Typ  | Max  Unit  |
| --- | ----------- | ------- | --------------- | --------- | ---------- |
20~80%
|     |     | tR  |     | 75  NA  | NA  ps  |
| --- | --- | --- | --- | ------- | ------- |
RL=50Ω
20~80%
Differential output signal rise time  tR_DATA  42.5  NA  NA  ps
RL=50Ω
20~80%
|     |     | tR_CLOCK  |     | 75  NA  | NA  ps  |
| --- | --- | --------- | --- | ------- | ------- |
RL=50Ω
20~80%
|     |     | tF  |     | 75  NA  | NA  ps  |
| --- | --- | --- | --- | ------- | ------- |
RL=50Ω
20~80%
Differential output signal fall time  tF_DATA  42.5  NA  NA  ps
RL=50Ω
20~80%
|     |     | tF_CLOCK  |     | 75  NA  | NA  ps  |
| --- | --- | --------- | --- | ------- | ------- |
RL=50Ω
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       57

RK3566 Datasheet                                                   Rev 1.1

3.12 Electrical Characteristics for multi-PHY
Table 3-13 Electrical Characteristics for PCIe PHY
|     | Parameters  | Symbol  | Condition  |     | Min  Typ  | Max  | Unit  |
| --- | ----------- | ------- | ---------- | --- | --------- | ---- | ----- |
Transmitter
Differential p-pTx voltage swing  VTX-DIFF-PP     0.8  NA  1.2  V
Low power differential p-p Tx
|     |     | VTX-DIFF-PP-LOW  |     |     | 0.4  NA  | 1.2  | V   |
| --- | --- | ---------------- | --- | --- | -------- | ---- | --- |
voltage swing
| Tx de-emphasis level ratio  |     | RTX-DIFF-DC  |     |     | 80  NA  | 120  | ohm  |
| --------------------------- | --- | ------------ | --- | --- | ------- | ---- | ---- |
Single Ended Output Resistance
|     |     | RTX-DC-OFFSET  |     |     | NA  NA  | 5   | %   |
| --- | --- | -------------- | --- | --- | ------- | --- | --- |
Matching
The amount of voltage change
| allowed during Receiver  |     | V   |     |     | NA  NA  | 600  | mV  |
| ------------------------ | --- | --- | --- | --- | ------- | ---- | --- |
TX-RCV-DETECT
Detection
Output rising time for 20% to
|     |     | Tr  |     |     | 25  NA  | NA  | ps  |
| --- | --- | --- | --- | --- | ------- | --- | --- |
80%
Output falling time for 20% to
Tf
|     |     |     |     |     | 25  NA  | NA  | ps  |
| --- | --- | --- | --- | --- | ------- | --- | --- |
80%
AC Coupling
|     |     | C TX   |     |     | 75  NA  | 200  | nF  |
| --- | --- | ------ | --- | --- | ------- | ---- | --- |
Capacitor(USB3.0/PCIE2.1)
| AC Coupling Capacitor(SATA3.0)  |     | C TX   |     |     | 6  NA  | 12  | nF  |
| ------------------------------- | --- | ------ | --- | --- | ------ | --- | --- |

|                               | Unit Interval  | UI        |     |     | 399.88  NA  | 400.12  | ps   |
| ----------------------------- | -------------- | --------- | --- | --- | ----------- | ------- | ---- |
| Input Voltage Swing           |                | V rxdpp-c |     |     | 250  NA     | 1200    | mV   |
| Input differential impedance  |                | R         |     |     | 80  NA      | 120     | ohm  |
rxd-c
Single Ended input Resistance
|     |     | T   |     |     | NA  NA  | 5   | %   |
| --- | --- | --- | --- | --- | ------- | --- | --- |
rxd-c-ms
Matching
Copyright 2021 ©Rockchip Electronics Co., Ltd.                                                       58

RK3566 Datasheet Rev 1.1
Chapter 4 Thermal Management
4.1 Overview
For reliability and operability concerns, the absolute maximum junction temperature has to
be below 125℃.
4.2 Package Thermal Characteristics
Table 4-1 provides the thermal resistance characteristics for the package used on the SoC.
The resulting simulation data for reference only, please prevail in kind test.
Table 4-1 Thermal Resistance Characteristics
Parameter Symbol Typical Unit
Junction-to-ambient thermal resistance 𝜽 20.728 (℃/𝑾)
𝑱𝑨
Junction-to-board thermal resistance 𝜽 17.74 (℃/𝑾)
𝑱𝑩
Junction-to-case thermal resistance 𝜽 1.544 (℃/𝑾)
𝑱𝑪
Note: The testing PCB is 4 layers, 114.3mmx101.6mm, 1.6mm thickness, Ambient
temperature is 25℃.
Copyright 2021 ©Rockchip Electronics Co., Ltd. 59