Rockchip Quick Start For Camera

文件标识：RK-XX-XX-nnn

发布版本：V1.0.0

日期：2024-04-07

文件密级：□绝密   □秘密   □内部资料   ■公开

免责声明

本文档按“现状”提供，瑞芯微电子股份有限公司（“本公司”，下同）不对本文档的任何陈述、信息和内容
的准确性、可靠性、完整性、适销性、特定目的性和非侵权性提供任何明示或暗示的声明或保证。本文

档仅作为使用指导的参考。

由于产品版本升级或其他原因，本文档将可能在未经任何通知的情况下，不定期进行更新或修改。

商标声明

“Rockchip”、“瑞芯微”、“瑞芯”均为本公司的注册商标，归本公司所有。

本文档可能提及的其他所有注册商标或商标，由其各自拥有者所有。

版权所有 © 2023 瑞芯微电子股份有限公司

超越合理使用范畴，非经本公司书面许可，任何单位和个人不得擅自摘抄、复制本文档内容的部分或全

部，并不得以任何形式传播。

瑞芯微电子股份有限公司

Rockchip Electronics Co., Ltd.

地址：     福建省福州市铜盘路软件园A区18号

网址：     www.rock-chips.com

客户服务电话： +86-4007-700-590

客户服务传真： +86-591-83951833

客户服务邮箱： fae@rock-chips.com

前言

概述

本文描述camera工具使用，rk各平台camera链路，以及调试方法，新驱动编写等，旨在帮助开发者快
速开发camera模块。

产品版本

芯片名称

rv11xx/rv110x/rk356x/rk3588

读者对象

本文档（本指南）主要适用于以下工程师：

内核版本

Linux 4.19 以上

技术支持工程师

软件开发工程师

修订记录

版本号

V1.0.0

目录

作者

让凌鹏

修改日期

2024-04-07

修改说明

初始版本

Rockchip Quick Start For Camera

调试工具

Media-ctl

v4l2-ctl

新camera调试过程
准备的资料

驱动编写

摄像头重要参数部分

摄像头曝光和gain
其他ctrl寄存器

iq效果文件修改
调试过程建议

不同平台的sensor链路情况
yuv422/rgb888输入
raw格式输入
主控内部pipeline
phy链路
csi2链路
vicap链路
isp链路
各芯片总链路

调试工具

v4l2-utils编译后会生成两个工具:media-ctl以及v4l2-ctl，一般sdk默认编译，在buildroot系统里默认开
启的BR2_PACKAGE_LIBV4L_UTILS=y
这里只做简单介绍，工具网上有详细的使用说明。

Media-ctl

用media-ctl -p命令可以列出当前系统上可用的媒体设备及其相关信息,如设备名称、驱动程序等。
以及用来配置各个节点的fmt，size，link。
在CIF或ISP加载成功后会创建media设备,如/dev/media0 /dev/media1..
如果redmine提问，请务必提供所有media节点的拓扑打印。
3588为例，执行media-ctl -d /dev/media0 -p 可以看到

Media controller API version 5.10.198

Media device information

------------------------

driver          rkcif

model           rkcif-mipi-lvds

serial

bus info

hw revision     0x0

driver version  5.10.198

Device topology

- entity 1: stream_cif_mipi_id0 (1 pad, 11 links)

            type Node subtype V4L flags 0

            device node name /dev/video0

    pad0: Sink

        <- "rockchip-mipi-csi2":1 [ENABLED]

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 5: stream_cif_mipi_id1 (1 pad, 11 links)

            type Node subtype V4L flags 0

            device node name /dev/video1

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 [ENABLED]

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 9: stream_cif_mipi_id2 (1 pad, 11 links)

            type Node subtype V4L flags 0

            device node name /dev/video2

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 [ENABLED]

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 13: stream_cif_mipi_id3 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video3

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 [ENABLED]

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 17: rkcif_scale_ch0 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video4

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 [ENABLED]

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 21: rkcif_scale_ch1 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video5

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 [ENABLED]

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 25: rkcif_scale_ch2 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video6

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 [ENABLED]

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 29: rkcif_scale_ch3 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video7

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 [ENABLED]

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 33: rkcif_tools_id0 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video8

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 [ENABLED]

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 []

- entity 37: rkcif_tools_id1 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video9

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 [ENABLED]

        <- "rockchip-mipi-csi2":11 []

- entity 41: rkcif_tools_id2 (1 pad, 11 links)

             type Node subtype V4L flags 0

             device node name /dev/video10

    pad0: Sink

        <- "rockchip-mipi-csi2":1 []

        <- "rockchip-mipi-csi2":2 []

        <- "rockchip-mipi-csi2":3 []

        <- "rockchip-mipi-csi2":4 []

        <- "rockchip-mipi-csi2":5 []

        <- "rockchip-mipi-csi2":6 []

        <- "rockchip-mipi-csi2":7 []

        <- "rockchip-mipi-csi2":8 []

        <- "rockchip-mipi-csi2":9 []

        <- "rockchip-mipi-csi2":10 []

        <- "rockchip-mipi-csi2":11 [ENABLED]

- entity 45: rockchip-mipi-csi2 (12 pads, 122 links)

             type V4L2 subdev subtype Unknown flags 0

             device node name /dev/v4l-subdev0

    pad0: Sink

        [fmt:SBGGR10_1X10/2688x1520 field:none

         crop.bounds:(0,0)/2688x1520

         crop:(0,0)/2688x1520]

        <- "rockchip-csi2-dphy0":1 [ENABLED]

    pad1: Source

        -> "stream_cif_mipi_id0":0 [ENABLED]

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad2: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 [ENABLED]

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad3: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 [ENABLED]

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad4: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 [ENABLED]

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad5: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 [ENABLED]

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad6: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 [ENABLED]

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad7: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 [ENABLED]

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad8: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 [ENABLED]

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad9: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 [ENABLED]

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 []

    pad10: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 [ENABLED]

        -> "rkcif_tools_id2":0 []

    pad11: Source

        -> "stream_cif_mipi_id0":0 []

        -> "stream_cif_mipi_id1":0 []

        -> "stream_cif_mipi_id2":0 []

        -> "stream_cif_mipi_id3":0 []

        -> "rkcif_scale_ch0":0 []

        -> "rkcif_scale_ch1":0 []

        -> "rkcif_scale_ch2":0 []

        -> "rkcif_scale_ch3":0 []

        -> "rkcif_tools_id0":0 []

        -> "rkcif_tools_id1":0 []

        -> "rkcif_tools_id2":0 [ENABLED]

- entity 58: rockchip-csi2-dphy0 (2 pads, 2 links)

             type V4L2 subdev subtype Unknown flags 0

             device node name /dev/v4l-subdev1

    pad0: Sink

        [fmt:SBGGR10_1X10/2688x1520@10000/302834 field:none]

        <- "m00_b_os04a10 7-0036":0 [ENABLED]

    pad1: Source

        -> "rockchip-mipi-csi2":0 [ENABLED]

- entity 63: m00_b_os04a10 7-0036 (1 pad, 1 link)

             type V4L2 subdev subtype Sensor flags 0

             device node name /dev/v4l-subdev2

    pad0: Source

        [fmt:SBGGR10_1X10/2688x1520@10000/302834 field:none]

        -> "rockchip-csi2-dphy0":0 [ENABLED]

我们在dts里配置的是os04a10->csi2-dphy0->mipi-csi2->stream_cif_mipi_idx（这里有4个节点是因为
支持4个输入(一般是4个虚拟通道，也可以是不同datatype和虚拟通道的组合)的缘故），一般标准
camera，hdmiin转换芯片直接通过video0对应拿raw或者yuv图（取决于输入格式）。至于csi连接到
tool以及scale可以不关心。

正常来说，sensor i2c通信正常，dts配置对了，就能在media节点拓扑看到sesneor的entity如上图的

m00_b_os04a10 7-0036

media-ctl -d /dev/media2 -p 可以看到cif链接到isp节点的拓扑(这里用media2是因为前面media1是另
外一个cif的节点)

Media controller API version 5.10.198

Media device information

------------------------

driver          rkisp0-vir0

model           rkisp0

serial

bus info

hw revision     0x0

driver version  5.10.198

Device topology

- entity 1: rkisp-isp-subdev (4 pads, 10 links)

            type V4L2 subdev subtype Unknown flags 0

            device node name /dev/v4l-subdev3

    pad0: Sink

        [fmt:SBGGR10_1X10/2688x1520 field:none

         crop.bounds:(0,0)/2688x1520

         crop:(0,0)/2688x1520]

        <- "rkisp_rawrd0_m":0 []

        <- "rkisp_rawrd2_s":0 []

        <- "rkisp_rawrd1_l":0 []

        <- "rkcif-mipi-lvds":0 [ENABLED]

    pad1: Sink

        <- "rkisp-input-params":0 [ENABLED]

    pad2: Source

        [fmt:YUYV8_2X8/2688x1520 field:none colorspace:smpte170m

quantization:full-range

         crop.bounds:(0,0)/2688x1520

         crop:(0,0)/2688x1520]

        -> "rkisp_mainpath":0 [ENABLED]

        -> "rkisp_selfpath":0 [ENABLED]

        -> "rkisp_fbcpath":0 [ENABLED]

        -> "rkisp_iqtool":0 [ENABLED]

    pad3: Source

        -> "rkisp-statistics":0 [ENABLED]

- entity 6: rkisp_mainpath (1 pad, 1 link)

            type Node subtype V4L flags 0

            device node name /dev/video22

    pad0: Sink

        <- "rkisp-isp-subdev":2 [ENABLED]

- entity 12: rkisp_selfpath (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video23

    pad0: Sink

        <- "rkisp-isp-subdev":2 [ENABLED]

- entity 18: rkisp_fbcpath (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video24

    pad0: Sink

        <- "rkisp-isp-subdev":2 [ENABLED]

- entity 24: rkisp_iqtool (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video25

    pad0: Sink

        <- "rkisp-isp-subdev":2 [ENABLED]

- entity 30: rkisp_rawrd0_m (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video26

    pad0: Source

        -> "rkisp-isp-subdev":0 []

- entity 36: rkisp_rawrd2_s (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video27

    pad0: Source

        -> "rkisp-isp-subdev":0 []

- entity 42: rkisp_rawrd1_l (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video28

    pad0: Source

        -> "rkisp-isp-subdev":0 []

- entity 48: rkisp-statistics (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video29

    pad0: Sink

        <- "rkisp-isp-subdev":3 [ENABLED]

- entity 54: rkisp-input-params (1 pad, 1 link)

             type Node subtype V4L flags 0

             device node name /dev/video30

    pad0: Source

        -> "rkisp-isp-subdev":1 [ENABLED]

- entity 60: rkcif-mipi-lvds (1 pad, 1 link)

             type V4L2 subdev subtype Unknown flags 0

             device node name /dev/v4l-subdev4

    pad0: Source

        [fmt:SBGGR10_1X10/2688x1520@10000/302834 field:none]

        -> "rkisp-isp-subdev":0 [ENABLED]

在dts 里面对应的rkcif_mipi_lvdsx_sditf连接到isp节点，前面的cif节点用于采集图像，转到isp处理图像
效果3a等等.我们只关注rkcif-mipi-lvd->rkisp-isp-subdev链路，然后isp节点可以从rkisp_mainpath(对
应video22)以及rkisp_selfpath(对应video23)出图,可以同时出图，但是selfpath最大限制到1080p。
media-ctl可以用来切换分辨率，切换方式可以看Rockchip_Driver_Guide_VI_CN_v1.x.x.pdf  18.7章节

v4l2-ctl

V4l2-ctl工具是针对/dev/video0，/dev/video1 等video设备，它在video设备上进行set_fmt，reqbuf，
qbuf，dqbuf，stream_on，stream_off 等一系列操作。
本文介绍v4l2-ctl进行采集帧数据,设置曝光、gain、VTS等v4l2_control。
根据上面打印的media拓扑，我们的抓图节点正常是video0,video22.
video0用于抓raw
根据命令，我们抓raw的命令是

v4l2-ctl -d /dev/video0 --set-fmt-video=width=2688,height=1520,pixelformat=BG10 --stream-

mmap=3 --stream-skip=30 --stream-to=/mnt/output.raw --stream-count=1 --stream-poll
--set-fmt-video=width=2688,height=1520,,pixelformat=BG10这句是设置分辨率，根据sensor实际分
辨以及格式，这里格式注意下

kernel\include\uapi\linux\videodev2.h

#define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR..

*/

#define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG..

*/

#define V4L2_PIX_FMT_SGRBG8  v4l2_fourcc('G', 'R', 'B', 'G') /*  8  GRGR.. BGBG..

*/

#define V4L2_PIX_FMT_SRGGB8  v4l2_fourcc('R', 'G', 'G', 'B') /*  8  RGRG.. GBGB..

*/

#define V4L2_PIX_FMT_SBGGR10 v4l2_fourcc('B', 'G', '1', '0') /* 10  BGBG.. GRGR..

*/

#define V4L2_PIX_FMT_SGBRG10 v4l2_fourcc('G', 'B', '1', '0') /* 10  GBGB.. RGRG..

*/

#define V4L2_PIX_FMT_SGRBG10 v4l2_fourcc('B', 'A', '1', '0') /* 10  GRGR.. BGBG..

*/

#define V4L2_PIX_FMT_SRGGB10 v4l2_fourcc('R', 'G', '1', '0') /* 10  RGRG.. GBGB..

*/

这个是驱动格式和命令下发的fourcc对应，所以对应BG10,其他格式都可以在这个文件里找，不要写错
--stream-mmap=3 是指申请buffer轮转格式，这个可以不用改
--stream-skip=30 是指抓图先丢掉的帧数，一般刚抓图，aiq开始还没收敛，开始的图像效果不好，可以
滤掉一些帧

--stream-to=/mnt/output.raw 表示存储的文件位置
--stream-count=1 存储的帧数
--stream-poll 一定时间内没抓到图自动退出，一般要量波形的时候，不要敲这个，就会一直是抓图状态
抓到图会打印<<<<<表明抓到的帧数。
正常用vooya软件看图

一般能抓raw说明硬件没有问题
如果需要正常能看的yuv图
需要先跑rkaiq_3A_server &  (跑命令前需要有对应的josn文件，没有对应的文件可以看后面章节怎么修
改一个出来)
然后

v4l2-ctl -d /dev/video22--set-fmt-video=width=2688,height=1520,pixelformat=NV12 --stream-

mmap=3 --stream-skip=30 --stream-to=/mnt/output.yuv --stream-count=1 --stream-poll
这样可以拿isp处理好效果的yuv文件。
可以用7yuv yuview等软件看图

设置曝光 gian vts等
下面是imx415的
我们看到上面sensor的节点是/dev/v4l-subdev2
v4l2-ctl -d /dev/v4l-subdev2 --list-ctrls   可以看到当前支持的设置的contorl，最大最小以及当前的值

root@linaro-alip:/# v4l2-ctl -d /dev/v4l-subdev2 --list-ctrls

User Controls

                       exposure 0x00980911 (int)    : min=4 max=2242 step=1

default=2242 value=2242

                horizontal_flip 0x00980914 (bool)   : default=0 value=0

                  vertical_flip 0x00980915 (bool)   : default=0 value=0

Image Source Controls

              vertical_blanking 0x009e0901 (int)    : min=58 max=30575 step=1

default=58 value=58

            horizontal_blanking 0x009e0902 (int)    : min=4936 max=4936 step=1

default=4936 value=4936 flags=read-only

                  analogue_gain 0x009e0903 (int)    : min=0 max=240 step=1

default=0 value=0

Image Processing Controls

                 link_frequency 0x009f0901 (intmenu): min=0 max=4 default=0

value=1

                     pixel_rate 0x009f0902 (int64)  : min=0 max=950400000 step=1

default=356800000 value=356800000 flags=read-only

root@linaro-alip:/# v4l2-ctl  -d /dev/v4l-subdev2 --set-ctrl 'analogue_gain=10'

root@linaro-alip:/# v4l2-ctl  -d /dev/v4l-subdev2 --get-ctrl 'analogue_gain'

analogue_gain: 10

其他的设置都一样。

新camera调试过程

准备的资料

camera的datasheet，一般可以查看曝光 gain vts 测试模式 mirror/flip这些寄存器如何设置
初始化序列表里面是sesnor出图需要写入的寄存器，一般给的文件名带有信息

cleaned_0x2b_SC530AI_27Minput_1080Mbps_2lane_10bit_1920x1080_60fps.ini
i2c地址为0x2b
主控给sensor输入clk为27M
sensor输入给主控的mipidatarate为1080mbps
使用lane数为2
为10bit raw
分辨率为1080p
帧率为60pfs
如果没有这些信息，也需要问厂商，这些都是驱动需要的参数

驱动编写

摄像头重要参数部分

先选择一个模板驱动，驱动目录是kernel\drivers\media\i2c
根据sensor厂家不同，建议选择对应厂家的sensor去修改，因为一般曝光和gain的设置规则比较类似，
甚至类似ov很多寄存器都一样(但请千万注意还是要一个个对下，曾经因为其中某一两个重要寄存器改变
导致出问题)

gc8034/gc2053   ov5695/os04a10  imx415 sc3336/sc4336
然后修改对应camera的特定参数，以os04a10为例

static const struct os04a10_mode supported_modes[] = {

    {

        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,

        .width = 2688,

        .height = 1520,

        .max_fps = {

            .numerator = 10000,

            .denominator = 302834,

        },

        .exp_def = 0x0240,

        .hts_def = 0x02dc * 4,

        .vts_def = 0x0cb0,

        .global_reg_list = os04a10_global_regs,

        .reg_list = os04a10_linear10bit_2688x1520_regs,

        .hdr_mode = NO_HDR,

        .link_freq_idx = 0,

        .bpp = 10,

        .vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_0,

    },

    {

        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,

        .width = 2688,

        .height = 1520,

        .max_fps = {

            .numerator = 10000,

            .denominator = 302834,

            /*.denominator = 151417,*/

        },

        .exp_def = 0x0240,

        .hts_def = 0x02dc * 4,

        .vts_def = 0x0658,

        /*.vts_def = 0x0cb0,*/

        .global_reg_list = os04a10_global_regs,

        .reg_list = os04a10_hdr10bit_2688x1520_regs,

        .hdr_mode = HDR_X2,

        .link_freq_idx = 0,

        .bpp = 10,

        .vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_1,

        .vc[PAD1] = V4L2_MBUS_CSI2_CHANNEL_0,//L->csi wr0

        .vc[PAD2] = V4L2_MBUS_CSI2_CHANNEL_1,

        .vc[PAD3] = V4L2_MBUS_CSI2_CHANNEL_1,//M->csi wr2

    },

.....

#define OS04A10_XVCLK_FREQ      24000000

#define MIPI_FREQ_360M          360000000

#define MIPI_FREQ_648M          648000000

#define MIPI_FREQ_720M          720000000

static const s64 link_freq_menu_items[] = {

    MIPI_FREQ_360M,

    MIPI_FREQ_648M,

    MIPI_FREQ_720M,

};

supported_modes就是sensor支持的不同参数组

bus_fmt是输出格式，一般在sensor给出的序列里面有多少bit(比如10bit)，BGGR是像素排列顺序，这
个不知道要在datasheet里找，但顺序错了不影响出图(色偏)。
width height 有效宽高是最重要的参数，一般是小于hts和vts
max_fps 是denominator/numerator为帧率，一般numerator不改，如果是准确的30帧，
denominator就是300000
exp_def 默认的曝光值（根据初始化寄存器定义的值填写）
hts_def 默认一行的总点数（根据初始化寄存器定义的值填写）
vts_def 默认一帧的总行数（根据初始化寄存器定义的值填写）重要:这个不要写错，会影响帧率
global_reg_list sensor的通用初始化寄存器，如果没有，可以为空。
reg_list  厂商给的寄存器序列
hdr_mode 对应当前参数的hdr模式
link_freq_idx 对应下面link_freq_menu_items的频率，一般厂家给的是mbps,因为mipi双沿采样的原
因，mipi频率是采样率的一半，以第一组线性为例，厂家给的序列里写的频率是720mbps， 我们填的
mipi频率是360000000
重要：这个参数不对容易导致收图失败，要再三确认

bpp 表明像素占用的bit数
vc[PAD0] 线性对应通道0，如果是hdr模式，HDR_X2 HDR_X3等直接照抄其他几个pad
link_freq_menu_items 对应不同配置数组对应的频率
OS04A10_XVCLK_FREQ  这个是24M

比如要调试sc530ai 1080p60帧，根据厂家给的参数

cleaned_0x2b_SC530AI_27Minput_1080Mbps_2lane_10bit_1920x1080_60fps.ini

static const struct sc530ai_mode supported_modes_2lane[] = {

{

/*

        .width = 2880,

        .height = 1620,

        .max_fps = {

            .numerator = 10000,

            .denominator = 300000,

        },

        .exp_def = 0xf6e / 2,

        .hts_def = 0xb40,

        .vts_def = 0x07bc,

        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,

        .reg_list = sc530ai_10_30fps_2880x1620_2lane_regs,

        .mipi_freq_idx = 3,

        .bpp = 10,

        .hdr_mode = NO_HDR,

        .vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_0,

    },

*/

        .width = 1920,

        .height = 1080,

        .max_fps = {

            .numerator = 10000,
            .denominator = 600000,//60帧

        },
        .exp_def = 0x8c0 / 2, //根据曝光寄存器
        .hts_def = 0x780, //根据hts寄存器
        .vts_def = 0x0465,//根据vts寄存器

        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .reg_list = sc530ai_10_30fps_1920x1080_2lane_regs,//添加一个1080p数组，并复
值到这

        .mipi_freq_idx = 4, //对应的频率

        .bpp = 10,

        .hdr_mode = NO_HDR,

        .vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_0,

    },

};
#define SC530AI_XVCLK_FREQ      27000000 //原本也是27M，所以不做修改
#define SC530AI_LINK_FREQ_1080M_2LANE   540000000 // 添加1080Mbps

static const s64 link_freq_items[] = {

    SC530AI_LINK_FREQ_396M,

    SC530AI_LINK_FREQ_792M,

    SC530AI_LINK_FREQ_792M_2LANE,

    SC530AI_LINK_FREQ_936M_2LANE,
    SC530AI_LINK_FREQ_1080M_2LANE, //添加

};

正常来说这些部分填对，set_ctrl函数开始出直接return 0;比如os04a10_set_ctrl函数
抓raw图应该就可以了。因为set_ctrl会改变sesnor的寄存器，如果里面填错了东西，寄存器乱了。接下
来就说这些寄存器的填写

主要看camera的datasheet。

摄像头曝光和gain

#define OS04A10_EXPOSURE_MIN        2   //最小曝光行, 一般不改，除非sensor有最小曝光限
制

#define OS04A10_EXPOSURE_STEP       1   //曝光步进，一般不改
#define OS04A10_VTS_MAX         0xffff  //vts一般可以最大，不用改

#define OS04A10_REG_EXP_LONG_H      0x3501 //sensor曝光寄存器高位,
#define OS04A10_REG_EXP_MID_H       0x3541 //sensor曝光寄存器中位,
#define OS04A10_REG_EXP_VS_H        0x3581 //sensor曝光寄存器低位,  寄存器查询

datasheet

#define OS04A10_REG_HCG_SWITCH      0x376C //有些sensor带HCG，HCG切换寄存器,不带的可
以不用

#define OS04A10_REG_AGAIN_LONG_H    0x3508 //sensor 模拟gain寄存器高位,
#define OS04A10_REG_AGAIN_MID_H     0x3548 //sensor 模拟gain寄存器中位,
#define OS04A10_REG_AGAIN_VS_H      0x3588 //sensor 模拟gain寄存器低位,
#define OS04A10_REG_DGAIN_LONG_H    0x350A //sensor 数字gain寄存器高位,
#define OS04A10_REG_DGAIN_MID_H     0x354A //sensor 数字gain寄存器中位,
#define OS04A10_REG_DGAIN_VS_H      0x358A //sensor 数字gain寄存器低位, 以上都查询

datasheet
#define OS04A10_GAIN_MIN        0x10       //最小gain值，寄存器为倍数x16
// datasheet写0x10 is 1x. Maximum AGC gain is 0xF8 = 15.5x.

#define OS04A10_GAIN_MAX        0xF7C      //sensor最大倍数，again乘dgain,最大倍数也
是从datasheet要知道
#define OS04A10_GAIN_STEP       1          //步进可以不改
#define OS04A10_GAIN_DEFAULT        0x10   //默认的gain倍数，一般都是一倍
//根据寄存器有效位设置，根据实际调用改

#define OS04A10_FETCH_MSB_BYTE_EXP(VAL) (((VAL) >> 8) & 0xFF)   /* 8 Bits */

#define OS04A10_FETCH_LSB_BYTE_EXP(VAL) ((VAL) & 0xFF)  /* 8 Bits */
//根据寄存器有效位获取gain，根据实际调用改

#define OS04A10_FETCH_LSB_GAIN(VAL) (((VAL) << 4) & 0xf0)

#define OS04A10_FETCH_MSB_GAIN(VAL) (((VAL) >> 4) & 0x1f)

    case V4L2_CID_EXPOSURE:

        ret = os04a10_write_reg(os04a10->client,

                    OS04A10_REG_EXP_LONG_H,

                    OS04A10_REG_VALUE_16BIT,
                    ctrl->val);//曝光一般以行为单位，直接写入不会错,极少量sesnor半行为单
位，寄存器x2

        dev_dbg(&client->dev, "set exposure 0x%x\n",

            ctrl->val);

        break;
    //gain是最要注意的地方，一般是优先again，again满了之后才设置dgain
    //上面我们gain都默认乘0x10,传下来的值也乘0x10， 也就是x16
    //下面是将当前倍数转换到寄存器，写入寄存器

    case V4L2_CID_ANALOGUE_GAIN:
        if (ctrl->val > 248) {//可知248/0x10 =15.5倍的时候才启动dgain

            dgain = ctrl->val * 1024 / 248;

            again = 248;
        } else {//小于15.5才是again

            dgain = 1024;

            again = ctrl->val;
        }//对应传下来agian写寄存器

        ret = os04a10_write_reg(os04a10->client,

                    OS04A10_REG_AGAIN_LONG_H,

                    OS04A10_REG_VALUE_16BIT,
                    (again << 4) & 0x1ff0);//左移4是因为低位寄存器高4bit开始，&0x1ff0
是总共9bit有效位

        ret |= os04a10_write_reg(os04a10->client,

                    OS04A10_REG_DGAIN_LONG_H,

                    OS04A10_REG_VALUE_24BIT,
                    (dgain << 6) & 0xfffc0);//同理上面有效位不一样。

        dev_dbg(&client->dev, "set analog gain 0x%x\n",

            ctrl->val);

        break;

其他ctrl寄存器

#define CHIP_ID             0x530441    //读id寄存器的值和这个一样就认为这个sesnor存在
#define OS04A10_REG_CHIP_ID     0x300a  //开机的时候会读这个id寄存器

#define OS04A10_REG_CTRL_MODE       0x0100 //开关流寄存器
#define OS04A10_MODE_SW_STANDBY     0x0    //写0进入standby状态
#define OS04A10_MODE_STREAMING      BIT(0) //写1开流

#define OS04A10_REG_TEST_PATTERN    0x5080 //测试模式寄存器，一般是彩条
#define OS04A10_TEST_PATTERN_ENABLE 0x80   //打开测试模式的值
#define OS04A10_TEST_PATTERN_DISABLE    0x0//关闭测试模式的值

#define OS04A10_REG_VTS         0x380e  //vts寄存器 重要:vts是用来控制帧率，比如默认30
帧，

//vts_30fps * 30fps = vts_25fps * 25fps  所以对应的25帧vts的值=默认30值x30/25
//国内灯光为50HZ,一般开防闪烁会降到25帧，或者环境亮度比较低，需要加大曝光，曝光的最大值一般是
vts-4或者vts-10
//如果需要得到更好的曝光，那么就是加大vts之后才能加大曝光，所以也会降帧，
//V4L2_CID_VBLANK 代码里是设置vblak，最终是把vblank+height(=vts）写入vts

一般我们在给isp做tuning之前，用v4l2-ctl测试下设置曝光和gain从小到大，是否亮度线性变大。如果不
是，考虑设置曝光或者gain有问题。

iq效果文件修改

这里只提供简单让3a跑起来的修改效果文件的方法，要好的效果需要找业务申请调试
跑3a需要效果文件，记录isp矫正的各种参数。一般后缀是.json文件，当然rv110x芯片为了省一点点
flash空间，有些转换成bin。抓图isp的yuv图前，保证有正确的效果文件后，运行rkaiq_3A_server & 然
后启动抓isp的NV12图像
我们一般用sdk板标称支持sesnsor的json文件去修改。比如rk3588用的imx415 rv110x用的sc3336
rk3568用的ov5695
rk3562用的gc8034，这个保证版本是和sdk一致的。
把这些json文件修改成当前sensor的json文件，只能保证图像基本是效果，可以验证sensor流程通了，
后续还是要找业务申请专门的效果调试。

修改方法:
以sc3336_CMK-OT2119-PC1_30IRC-F16.json为例
注意文件命名规则是  sensor型号模块名镜头名.json
  rockchip,camera-module-name = "CMK-OT2119-PC1";

  rockchip,camera-module-lens-name = "30IRC-F16";
对应dts定义如上
分辨率是2304x1296修改成1920x1080的摄像头，一般情况分辨率一样，可以直接改文件名即可。
1.json文件开头有

        "resolution":   {

            "width":    2304,

            "height":   1296

        },

改成对应宽高威1920  1080
2.将所有2304x1296直接替换成1920x1080

3.
将lsc关闭

  "lsc_v2":  {

  "common":  {

  "enable":  1,

enable属性改为0即可
最简单的是做到上面三点即可

如果再完善一点

不关闭lsc，enable保留1

"lsc_sect_size_x":  [144, 144, 144, 144, 144, 144, 144, 144, 144, 144, 144, 144,

144, 144, 144, 144],

"lsc_sect_size_y":  [81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81,

81]

里面的参数实际是将宽高分成16等份，值也就是2304/16 以及1296/16
将值改成1920/16 =120 ,     1080/16=67.5 排除小数，我们写成68 67这样交替
替换成

"lsc_sect_size_x":  [120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120,

120, 120, 120, 120],

"lsc_sect_size_y":  [68, 67, 68, 67, 68, 67, 68, 67, 68, 67, 68, 67, 68, 67, 68,

67]

另外把sensor_calib里面的曝光和gain以及其他参数填入
这个可以查看

Rockchip_Tuning_Guide_ISPxx_CN_v1.x.x.pdf 里面sensor，根据sensor的实际情况来写

调试过程建议

1.按照上述写好驱动文件，以及修改好iq文件(当然iq文件也可以晚一点)。
2.在dts里面定义根据硬件匹配后文的定义的链路，在dts自带的链路里面参照加一个。
3.有驱动以及dts，编译后，先看media-ctl 拓扑，是否有对应sensor的entity比如上面的
m00_b_os04a10 7-0036。如果有链路配置成功了。如果没有，一般是i2c没通，比如sc2310 1-0030:
Unexpected sensor id(0000), ret(-5) 这种log，就去查下i2c地址，以及上电量波形这些，如果没有i2c报
错，一般是没编译进去，或者改动没有烧入的问题。

4.有了链路后，可以用v4l2-ctl去抓cif节点的raw图，如果抓不到，一般先按照前面说的set_ctrl函数开始
出直接return 0，排除曝光/vts/gain等填错了导致寄存器错误。如果是mipi报错，请仔细确认mipi的频
率是否填对，如果填对，那么得确认下其他参数，比如分辨率 格式输入的mclk这些。一般的驱动这些参
数都比较重要，请再三确认。

4.能抓到raw图后，改好iq文件，启动rkaiq_3A_server & ，如果aiq跑不起来，确定是用系统自带的
sensor的iq文件按步骤修改。然后可以用v42-ctl能抓isp mainpath的图。算是基本camera跑起来了。
后续需要联系业务申请camera效果调试。

不同平台的sensor链路情况

yuv422/rgb888输入

对于yuv422/rgb888输入的情况，常见的有三种情况
1.自带isp的或者客户外接isp的摄像头输入yuv422格式
2.hdmi转mipi csi输入，一般如rk628d/f,lt6911xxx等芯片，常见的是转换成yuv422，也可以rgb888格
式

3.多路ahd，serdes，这种一个mipi口，最多可以支持4个虚拟通道
对于这几种情况，是不需要走isp的，只需要到cif即可，所以链路为

sensor->csi2_dphyX->mipiX_csi2->rkcif_mipi_lvdsX
rkcif_mipi_lvdsx_sditf 以及isp节点有可以disabled掉，里面的X根据不同平台，不同硬件接法而定。
抓图使用的节点为rkcif_mipi_lvdsX对应的第一个video节点，这个可以通过media-ctl看拓扑得到，比如
文章一开始拓扑的video0，如果是多路输入，就是对应的前4个，对应上面就是video0-video3

raw格式输入

从rk3588开始，也就是isp3.0开始，isp不带采集功能，只做图像处理，所以整个通路为

sensor->csi2_dphyX->mipiX_csi2->rkcif_mipi_lvdsX

rkcif_mipi_lvdsX_sditf->rkispx_virX

这里需要说明，

1.在不跑aiq的时候，rkcif_mipi_lvdsX是可以拿raw图的，
2.如果isp节点我们只打开vir0即rkispx_vir0，不打开后面的rkispx_vir1/vir2...,这种就是直通的，不跑
aiq，也能拿到nv12图，但是是未经过效果处理，一般是淡绿色。
3.打开其他vir节点，说明isp需要分时复用，isp节点就必须要开启aiq才能拿图(aiq会分时复用isp)
所以如果只有一个camera，其他isp节点建议disabled掉（3588有两个isp，如果两个摄像头一个用
rkisp0_vir0,一个用rkisp1_vir1 也是直通）。

主控内部pipeline

phy链路

phy是与sensor直接连线的控制器，根据mipi特性接收数据
isp3.0之后，mipi口都可以拆分成2x2lane,为了区分不同使用方法，会虚拟出三个csi2_dphyX.一个full模
式，2个拆分模式。
第一个mipi dphy口
csi2_dphy0 表示full模式
csi2_dphy1 表示lane0 lane1口
csi2_dphy2 表示lane2 lane3口
同理第二个mipi口
csi2_dphy3 表示full模式
csi2_dphy4 表示lane0 lane1口
csi2_dphy5 表示lane2 lane3口
full mode也可以选择1lane或者2lane，所以一般同个mipiphy只接了一个sesnor，一般还是选择dphy0
和dphy3.只有在接两个的时候才配置到拆分模式的phy。

csi2链路

csi2是解析mipi csi2协议器
因为full模式和拆分模式是互斥的，对应mipi的csi2协议只需要两个：

csi2_dphy0
csi2_dphy1  //dphy0的dphy1共用一个mipi_csi2(在没有dcphy的芯片，是mipi0_csi2,如果有dphy要往
后排)
csi2_dphy2  //在没有dcphy的芯片，是mipi1_csi2

csi2_dphy3
csi2_dphy4 //同理共用mipi_csi2（在没有dcphy的芯片，是mipi2_csi2）
csi2_dphy5 //在没有dcphy的芯片，是mipi3_csi2

vicap链路

vicap在dts一般叫rkcif，是搬运csi2解析后的数据到ddr，因为每个csi2解析都需要搬运，所以一一对
应。

mipi0_csi2 对应rkcif_mipi_lvds(等同rkcif_mipi_lvds0)
mipi1_csi2 对应rkcif_mipi_lvds1
mipi2_csi2 对应rkcif_mipi_lvds2
rkcif_mipi_lvdsx_sditf可以当作vicap和isp的桥梁，一一对应，命名只多了sdift

isp链路

这里还是强调下，如果只有一个摄像头只开rkispx_vir0
1.vicap和isp并没有对应关系
2.各个vir0/vir1这种关系本质是同一个硬件分时复用，效果等同。多个的时候尽量使用0 1 2 这样去配
置。

各芯片总链路

根据芯片所拥有的mipi口

1.rv1103/rv1106
1个摄像头

sensor->csi2_dphy0->mipi0_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0

双摄

sensor0->csi2_dphy1->mipi0_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0

sensor1->csi2_dphy2->mipi1_csi2->rkcif_mipi_lvds1(sditf)->rkisp_vir1

2.rk3562
单摄接第一个phy

sensor->csi2_dphy0->mipi0_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0
双摄接不同phy(和上面合成一个)

sensor1->csi2_dphy3->mipi2_csi2->rkcif_mipi_lvds2(sditf)->rkisp_vir1

四摄

sensor0->csi2_dphy1->mipi0_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0

sensor1->csi2_dphy2->mipi1_csi2->rkcif_mipi_lvds1(sditf)->rkisp_vir1

sensor2->csi2_dphy4->mipi2_csi2->rkcif_mipi_lvds2(sditf)->rkisp_vir2

sensor3->csi2_dphy5->mipi3_csi2->rkcif_mipi_lvds3(sditf)->rkisp_vir3
如果是三摄对应的只有一个camera的那路对应用dphy0或者dphy3，isp节点也不用跳跃用vir0 1 2即
可。

3.3588
在Rockchip_Driver_Guide_VI_CN_v1.x.x.pdf文档里有详细通路介绍，请仔细查看
但对应关系可以不用那么死，isp以及dphy使用，本文档说明同样适用

4.rv1109/rv1126
是isp2.0，不作为重点说明，这个版本的isp带采集功能，且mipi不能拆分，有两路mipi口.芯片独有
ispp。
所以sensor接dphy是看对应接到哪个，单个的时候dphy选择直通isp还是走csi2到vicap不做限定。
单摄

sensor0->csi2_dphy0->mipi_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0->rkispp_vir0

也可以

sensor0->csi2_dphy0->rkisp_vir0->rkispp_vir0

双摄

sensor0->csi_dphy0->mipi_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir1->rkispp_vir1

sensor1->csi_dphy1->rkisp_vir0->rkispp_vir0

5.rk3568/rk3566
是isp2.1，这个版本的isp带采集功能，只有一路mipi口,但可拆分
单摄

sensor0->csi2_dphy0->rkisp_vir0(推荐)
也可以

sensor0->csi2_dphy0->mipi_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0

双摄

sensor0->csi2_dphy1->mipi_csi2->rkcif_mipi_lvds(sditf)->rkisp_vir0

sensor1->csi2_dphy2->rkisp_vir1

另外每个芯片配有dvp口，dvp链路,dvp协议比较简单，vicap可以直接采集并搬运dvp口上的数据，所以
没有phy和协议解析器

sensor->rkcif_dvp(sditf)->rkisp_vir0
同理dvp是yuv输入也不需要sdift转到isp。

