EM3566 Linux6.1 User Manual
                                                                                                                    V1.0

Boardcon Embedded Designer

Customize the embedded system based on Your Idea

Overview

The  content  of  this  document  is  intended  solely  for  the  EM3566  development  board,

aiming to help users quickly understand, apply, and test the EM3566 development board.

System Support

Development Board

Debian12

Buildroot

CM3566 V3.0

EM3566-V3

Revision History

Y

Y

Version

Date

Author

Revision History

V1.0

2025-03-21

Liu Yuan

Initial version

Disclaimer

The information in this manual is for reference only. While Boardcon strives to ensure

its  accuracy,  no  guarantees  are  made  regarding  its  completeness  or  correctness. All

content is subject to change without prior notice. Boardcon reserves the right to revise

the content of this manual without prior notification.

Boardcon embedded design limited

2508 Haofang Tianji Plaza, 11008 Beihuan Avenue, Nanshan District,

Shenzhen, Guangdong, China. 518051

URL: www.armdesigner.com | www.boardcon.com

Email: market@armdesigner.com

Technical Support Inquiries: support@armdesigner.com

Tel: +86-755-26481393 | +86-755-27571591

1

Customize the embedded system based on Your Idea

Content

1.Introduction ..................................................................................................................... 5

1.1 Overview .............................................................................................................. 5

1.2 Product Parameters .............................................................................................. 5

1.3 Hardware Interface Introduction .......................................................................... 7

2.Install Drivers and Tool .................................................................................................. 9

2.1 Install RK Driver Assitant .................................................................................... 9

2.2 Install CH9102X Driver ..................................................................................... 10

2.2.1 How to Connect the Serial Port Tool .................................................. 10

2.2.2 Install Driver ....................................................................................... 11

2.3 Install Serial Terminal Tool ................................................................................ 12

3.Upgrade Introduction .................................................................................................... 14

3.1 Upgrade Mode ................................................................................................... 14

3.1.1 How to Enter Loader Mode ................................................................ 14

3.1.2 How to Enter MaskRom Mode ........................................................... 16

3.2 Burn firmware .................................................................................................... 16

3.2.1 Burn Update.img Firmware ................................................................ 16

3.2.2 Burn Split Firmware ........................................................................... 18

4.Development Environment ........................................................................................... 19

4.1 Preparing the Development Environment .......................................................... 19

4.2 Installing Libraries and Toolkits ........................................................................ 19

5.Compile Source ............................................................................................................. 20

6.Debian12 Test ............................................................................................................... 23

6.1 Serial Terminal ................................................................................................... 23

6.2 Display ............................................................................................................... 23

6.3 Headset ............................................................................................................... 24

6.4 USB Host ........................................................................................................... 26

6.5 Ethernet .............................................................................................................. 27

2

Customize the embedded system based on Your Idea

6.6 ADB ................................................................................................................... 28

6.7 4G & GPS .......................................................................................................... 29

6.7.1 4G Test ................................................................................................ 29

6.7.2 GPS Test .............................................................................................. 31

6.8 SD Card .............................................................................................................. 31

6.9 M.2 NVME SSD ................................................................................................ 32

6.10 Camera ............................................................................................................. 33

6.11 ADC ................................................................................................................. 35

6.12 RS485 ............................................................................................................... 35

6.14 UART ............................................................................................................... 36

6.15 RTC .................................................................................................................. 37

6.16 IR ..................................................................................................................... 38

6.17 WiFi & Bluetooth ............................................................................................. 39

6.17.1 WiFi .................................................................................................. 39

6.17.2 Bluetooth ........................................................................................... 41

6.18 Video Playback ................................................................................................ 43

7.Buildroot Test ................................................................................................................ 46

7.1 Serial Terminal ................................................................................................... 46

7.2 Display ............................................................................................................... 47

7.3 Headset ............................................................................................................... 48

7.4 USB Host ........................................................................................................... 49

7.5 Ethernet .............................................................................................................. 50

7.6 ADB ................................................................................................................... 51

7.7 4G & GPS .......................................................................................................... 52

7.7.1 4G Test ................................................................................................ 52

7.7.2 GPS Test .............................................................................................. 54

7.8 SD Card .............................................................................................................. 54

7.9 M.2 NVME SSD ................................................................................................ 55

7.10 Camera ............................................................................................................. 56

3

Customize the embedded system based on Your Idea

7.11 ADC ................................................................................................................. 58

7.12 RS485 ............................................................................................................... 58

7.14 UART ............................................................................................................... 59

7.15 RTC .................................................................................................................. 60

7.16 IR ..................................................................................................................... 61

7.17 WiFi & Bluetooth ............................................................................................. 62

7.17.1 WiFi .................................................................................................. 62

7.18.2 Bluetooth ........................................................................................... 64

7.18 Video Playback ................................................................................................ 66

4

Customize the embedded system based on Your Idea

1.Introduction

1.1 Overview

The EM3566 development board is powered by the RK3566 quad-core ARM Cortex-A55

processor  and  adopts  Boardcon’s  CM3566  core  board  solution.  It  delivers  low  power

consumption  and  high  performance,  making  it  ideal  for  mobile  internet  and  AIoT

applications. It supports 4K@60fps H.264/H.265 decoding, 1080p@60fps encoding, and

high-quality  JPEG  codec,  with  a  high-performance  GPU  for  advanced  multimedia

processing. The board integrates a wide range of interfaces, including 4K display, Ethernet,

Wi-Fi, Bluetooth, USB 3.0, and 4G modules, enabling flexible development.

1.2 Product Parameters

SOC

CPU

GPU

NPU

Basic Parameters

• RK3566

• Quad-core 64-bit ARM Cortex-A55@ up to 1.8GHz

• OpenCL 2.0

• OpenGLES 1.1/2.0/3.2

• Vulkan 1.1

• 1 TOPS AI computing power

• Supports int8/int16/fp16/bfp16 MAC operations

5

Customize the embedded system based on Your Idea

• Support 4096x2306@60fps H.265/H.264/VP9 video

decoding

Decoder

• Support 1920x1088@60fps VP8/VC1/MPEG-4,2,1 video

Video

decoding

• Support 720x576@60fps H.263 video decoding

Encoder

• Support 1080P@60fps H.265/H.264 video encoding

• Support YUV/RGB video source with rotation and mirror

RAM

ROM

• 2GB LPDDR4X   (up to 8GB)

• 8GB eMMC (up to 64GB)

Support system

Android, Debian, Buildroot

Extended Storage

Display

Audio

USB

Hardware Parameters

• Support M.2 PCIe NVME SSD

• Support MicroSD Card

• Support HDMI TX 4K@60fps display

• Support LVDS display

• Support HDMI TX audio output

• Support Headphone output/input

• Support USB3.0

• Support 4x USB2.0

• Support Gigabit Ethernet

Network

• Support WIFI/BT module

Camera

Peripheral

• Support 4G module

• Support 1x Camera (ov13850)

• Support RS485

communication

• Support 2xUART

Other parameters

Support Debug, IR, RTC, OTG.

Electrical Parameters

6

Customize the embedded system based on Your Idea

Power supply input

voltage

12V/3A

RTC input voltage

3V/0.6uA

Operating temperature  0 ~ 70º

Storage temperature

-40 ~ 85º

Core board

dimensions

Motherboard

dimensions

Structural Parameters

47.0mm x 40.0mm

135.0mm x 95.0mm

1.3 Hardware Interface Introduction

7

Customize the embedded system based on Your Idea

Power in

Headset

USB3.0

Interface parameters

12V DC power input interface

Headset output/input

USB3.0 Host interface

USB OTG

OTG download interface

HDMI

Ethernet

HDMI TX interface

Gigabit Ethernet RJ45 interface

2xUSB2.0 Host

Dual-layer USB2.0 HOST interface

USB2.0 Host

USB2.0 HOST interface

USB2.0 Host

USB2.0 HOST interface

RTC

Camera0

Camera1

IR

RS485

Debug

RTC coin cell connector

MIPI camera interface

MIPI camera interface

IR interface

RS485 communication interface

UART2, debug the serial port

LVDS/MIPI/eDP

LVDS/MIPI/eDP screen display interface

GPIO

UART2

UART1

Recover

WIFI&BT

Nano SIM

Micro SD

ADC

GPIO extension interface

UART5,TTL level interface

UART4,TTL level interface

Recovery key

Realtek RTL8723DS module

Nano SIM card port

MicroSD card slot

ADC interface

SATA Power

SATA power interface(5V)

8

Customize the embedded system based on Your Idea

M.2 SSD

M.2 SSD interface

mPCIE 4G&GPS

4G module interface

2.Install Drivers and Tool

To download firmware and debug in the terminal, the following drivers and software need

to be installed (for Windows computers):

Number  Driver name

Driver

1

2
3

RK Driver Assitant  DriverInstall.exe

CH9102x
Serial Terminal Tool  SecureCRT.exe

SETUP.EXE

2.1 Install RK Driver Assitant

Step 1: Open DriverAssitant_v5.1.1/DriverInstall.exe.

Use
OTG  USB  driver  installation
assitant
Serial port debugging driver
Debugging tool

Step 2: To avoid driver conflicts, click “Uninstall Driver” to uninstall the driver.

Step 3: Click button “Install Driver” to install.

Step 4: After the installation is complete, connect the board and PC with Micro USB

9

Customize the embedded system based on Your Idea

cable and press the Recovery key and hold then power the board, the following

information is displayed in the Computer Device Manager, indicating that the USB

driver was successfully installed.

Step 5: If the following device information appears in the Device Manager after the

operation in Step 4, user need to proceed to the next step.

Step 6: The WINDOW will pop up found New Hardware Wizard dialog box, choose to

install from the specified location, and then select: DriverAssitant_v5.1.1/ADBDriver.

Step 7: After the installation is completed, the following device information can be seen

in the Computer Device Manager.

2.2 Install CH9102X Driver

2.2.1 How to Connect the Serial Port Tool

Pin

RXD

TXD

Connection Description

Receive, connect to TX pin of the board.

Transmit, connect to RX pin of the board.

10

Customize the embedded system based on Your Idea

GND

3V3

Ground, connect to GND pin of the board.

No need to connect.

2.2.2 Install Driver

Step 1: Plug the CH9102X Module to the PC

Step 2: Unzip CH343SER.ZIP on Windows.

Step 3: Select and install the corresponding SETUP.EXE according to the computer

properties.

Step  4:  After  the  installation  is  completed,  the  device  will  be  listed  under  Device

Manager ports with unique serial port assigned.

11

Customize the embedded system based on Your Idea

2.3 Install Serial Terminal Tool

The serial terminal SecureCRT is used for debugging in Windows. It can be used

directly after decompression.

Step 1: Unzip Platform/SecureCRT.rar on PC.

Step 2: Click SecureCRT/SecureCRT.exe open the SecureCRT.

Step 3: Confirm that the CH9102X driver has been installed and the CH9102X module

is connecting to the PC.

Step 4: Click the “Quick Connect” button to go to the Quick Connect configuration

screen.

12

Customize the embedded system based on Your Idea

Step 5: Configure as shown in the following figure.

Step 6: After clicking “Connect” button, the terminal serial interface will be

successfully accessed.

13

Customize the embedded system based on Your Idea

3.Upgrade Introduction

3.1 Upgrade Mode

The firmware can be upgraded via USB cable in two modes:

1.  Loader Mode:

The standard mode used for firmware upgrades.

2.  MaskRom Mode:

A last-resort mode used when the device is bricked. Entering MaskRom mode requires

hardware manipulation, which involves certain risks. It should only be attempted if

Loader mode is unavailable.

• Prerequisite

Before  upgrading  the  firmware  via  USB  cable,  ensure  that  the  necessary  drivers  are

installed. For installation instructions, refer to the section Install RK Driver Assistant.

3.1.1 How to Enter Loader Mode

3.1.1.1 Hardware

Step 1: Disconnect the power adapter.

14

Customize the embedded system based on Your Idea

Step 2: Connect one end of the Micro cable to the host and the other end to the

development board.

Step 3: Press and hold the Recovery button on the board

Step 4: Connect the power supply.

Step 5: After a few seconds, release the Recovery button when the flashing tool shows

“Found one LOADER Devic”.

3.1.1.2 Software

After  connecting  the  Micro  cable,  execute  the  following  command  in  the  serial  debug

terminal or adb shell.

# reboot loader

15

Customize the embedded system based on Your Idea

3.1.2 How to Enter MaskRom Mode

Step 1: Disconnect the power adapter.

Step  2:  Connect  one  end  of  the  Micro  cable  to  the  host  and  the  other  end  to  the

development board.

Step 3: Use tweezers to short the two test points on the CM3568.

Step 4: After connecting the power cable, the device will enter MaskRom mode.

3.2 Burn firmware

Environment: Windows OS (Operating System).

3.2.1 Burn Update.img Firmware

Step 1: Unzip RKDevTool.rar on Windows.

Step 2: Open RKDevTool\RKDevTool_Release\RKDevTool.exe.

16

Customize the embedded system based on Your Idea

Step 3: Switch to loader mode. (How to Enter Loader Mode)

Step 4: Click Upgrade Firmware -> Firmware, select update.img, then click Upgrade

to flash.

After the flashing is complete, the board will automatically reboot.

17

Customize the embedded system based on Your Idea

3.2.2 Burn Split Firmware

Step 1: Switch to Loader mode.

Step 2: Check the partitions to be flashed, multiple partitions can be selected.

Step 3: Ensure the image file path is correct. If necessary, click the blank cell next to the

path to reselect it.

Step 4: Click the Run button to flash the image.

After the flashing is complete, the board will automatically reboot.

18

Customize the embedded system based on Your Idea

4.Development Environment

4.1 Preparing the Development Environment

It is recommended to use Ubuntu 22.04 or higher version for compilation. If you encounter

an  error  during  compilation,  user  can  check  the  error  message  and  install  the

corresponding software packages accordingly. Other Linux versions may need to adjust

the software package accordingly. In addition to the system requirements, there are other

hardware and software requirements.

Hardware requirements

Software requirements

64-bit system, hard disk space should be greater

than 120G. If you do multiple builds, you will

Ubuntu 22.04

need more hard drive space.

4.2 Installing Libraries and Toolkits

The contents of this directory only provide the software package installation commands

that are needed to build the compiled SDK environment. Please install other tools such

as samba and ssh yourself.

PC OS

Ubuntu 22.04

Network

online

Permission

root

To install the required tools, execute the following commands:

19

Customize the embedded system based on Your Idea

$ sudo apt-get install git ssh make gcc libssl-dev liblz4-tool libmpc-dev

$ sudo apt-get install expect g++ patchelf chrpath gawk texinfo chrpath diffstat

$ sudo apt-get install binfmt-support live-build bison flex fakeroot libgmp-dev

$ sudo apt-get install cmake gcc-multilib g++-multilib unzip device-tree-compiler

$ sudo apt-get install ncurses-dev libgucharmap-2-90-dev bzip2 expat gpgv2

$ sudo apt-get install cpp-aarch64-linux-gnu g++-aarch64-linux-gnu

$ sudo apt install python2 python-is-python3

5.Compile Source

Note: The Debian system and Buildroot system use the same SDK source package. The

difference lies in the rootfs.img used, meaning the steps for building the filesystem are

different, while the other steps are the same.

Step 1: Unzip the Source

To extract the source files, execute the following commands:

$ tar xvf em3566_linux6.1-rkr*.tar.bz2

$ cd EM3566_Linux6.1-rkr5/

Step 2: Configure the Compiled Board

To configure the board, execute:

$ ./build.sh lunch

After running ./build.sh lunch, the system will list available defconfig files.

• To use HDMI as the display, select:

2. boardcon_rk3566_v3_v3.0_hdmi_defconfig

• To use LVDS (1280x800) as the display, select:

3.  boardcon_rk3566_v3_v3.0_lvds_defconfig

Example (HDMI display):

20

Customize the embedded system based on Your Idea

liuyuan@boardcon:~/opt/EM3566/em3566_linux6.1-rkr5$ ./build.sh lunch

############### Rockchip Linux SDK ###############

Manifest: rk3566_rk3568_linux6.1_release_v1.1.0_20241220.xml

Log colors: message notice warning error fatal

Log saved at /home/liuyuan/opt/EM3566/em3566_linux6.1-rkr5/output/sessions/2025-03-20_15-47-56

Pick a defconfig:

1. rockchip_defconfig

2. boardcon_rk3566_v3_v3.0_hdmi_defconfig

3. boardcon_rk3566_v3_v3.0_lvds_defconfig

4. rockchip_rk3566_evb2_lp4x_v10_32bit_defconfig

5. rockchip_rk3566_evb2_lp4x_v10_defconfig

6. rockchip_rk3568_evb1_ddr4_v10_32bit_defconfig

7. rockchip_rk3568_evb1_ddr4_v10_defconfig

8. rockchip_rk3568_evb8_lp4_v10_32bit_defconfig

9. rockchip_rk3568_evb8_lp4_v10_defconfig

10. rockchip_rk3568_pcie_ep_lp4x_v10_defconfig

Which would you like? [1]: 2

Switching to defconfig: /home/liuyuan/opt/EM3566/em3566_linux6.1-

rkr5/device/rockchip/.chip/boardcon_rk3566_v3_v3.0_hdmi_defconfig

#

# configuration written to /home/liuyuan/opt/EM3566/em3566_linux6.1-rkr5/output/.config

#

Using last kernel version(6.1)

Step 3: Compile U-Boot

To compile uboot, execute the following command:

$ ./build.sh uboot

Step 4: Compile the Kernel

To compile the kernel, execute the following command:

$ ./build.sh kernel

Step 5: Compile Recovery

To compile recovery, execute the following command:

$ ./build.sh recovery

Step 6: Compile rootfs

21

Customize the embedded system based on Your Idea

(1) Compile Debian12 (Permission: root)

To compile debian12, execute the following command:

$ sudo ./build.sh debian

After compilation, a linaro-rootfs.img is generated in the debian directory.

Note: Related dependencies must be installed beforehand.

$ cd debian

$ sudo apt-get install binfmt-support qemu-user-static live-build

$ sudo dpkg -i ubuntu-build-service/packages/*

$ sudo apt-get install -f

  (2) Compile Buildroot

To compile buildroot, execute the following command:

$ ./build.sh buildroot

Step 7: Generate and Check Firmwares

To generate firmware, execute the following command:

$ ./build.sh firmware

Images and update.img are generated in rockdev/ directory.

22

Customize the embedded system based on Your Idea

6.Debian12 Test

6.1 Serial Terminal

Connect the board and PC with USB Serial cable, then power on, the terminal will output

boot information. The default baudrate is 1500000.

6.2 Display

The EM3566 can only output to a single display (either HDMI or LVDS) at a time.

23

Customize the embedded system based on Your Idea

The display effect diagram is as follows:

6.3 Headset

Step 1: Plug the headset into the headset jack.

24

Customize the embedded system based on Your Idea

Step 2: View sound card.

# cat /proc/asound/cards

root@linaro-alip:/# cat /proc/asound/cards
 0 [rockchiphdmi   ]: rockchip-hdmi - rockchip-hdmi
                      rockchip-hdmi
 1 [rockchipes8388c]: simple-card - rockchip,es8388-codec
                      rockchip,es8388-codec

Step 3: Headset recording.

• To use HDMI as the display:

# arecord -Dhw:1,0 -f cd record.wav

root@linaro-alip:/# arecord -Dhw:1,0 -f cd record.wav
Recording WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

• To use LVDS (1280x800) as the display:

# arecord -Dhw:0,0 -f cd record.wav

root@linaro-alip:/# arecord -Dhw:0,0 -f cd record.wav
Recording WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

Step 4: Play audio through headset.

• When using HDMI as the display:

# aplay -Dhw:1,0 record.wav

root@linaro-alip:/# aplay -Dhw:1,0 record.wav
Playing WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

Note: Supplementary instructions on audio output.

# aplay -Dhw:0,0 record.wav   // HDMI TX audio output

# aplay -Dhw:1,0 record.wav   // Headset audio output

25

Customize the embedded system based on Your Idea

• When using LVDS (1280x800) as the display:

# aplay -Dhw:0,0 record.wav

root@linaro-alip:/# aplay -Dhw:0,0 record.wav
Playing WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

6.4 USB Host

The USB host can be used to connect devices such as USB mouse, USB keyboards, USB

flash drives, and other USB peripherals.

After connecting the USB flash drive, if the device is successfully recognized, an icon

will appear on the desktop. Users need to click the icon in order to access the files on the

device.

The user can identify whether the mounted flash drive is USB 2.0 or USB 3.0 from the
26

Customize the embedded system based on Your Idea

debug log.

• USB2.0 print information in high-speed mode.

root@linaro-alip:/# [  100.401796] usb 5-1.1: new high-speed USB device number 5 using ehci-platform
[  100.540580] usb 5-1.1: New USB device found, idVendor=0dd8, idProduct=3b00, bcdDevice= 0.02
[  100.540631] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  100.540654] usb 5-1.1: Product: OnlyDisk
[  100.540674] usb 5-1.1: Manufacturer: Netac
[  100.540715] usb 5-1.1: SerialNumber: 0A6544CD10427AB2
[  100.542566] usb-storage 5-1.1:1.0: USB Mass Storage device detected
[  100.543718] scsi host1: usb-storage 5-1.1:1.0
[  101.684785] scsi 1:0:0:0: Direct-Access     Netac    OnlyDisk         8.01 PQ: 0 ANSI: 6
[  101.690705] sd 1:0:0:0: [sdb] 121610240 512-byte logical blocks: (62.3 GB/58.0 GiB)
[  101.691923] sd 1:0:0:0: [sdb] Write Protect is off
[  101.692854] sd 1:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[  101.701334]  sdb: sdb1
[  101.701915] sd 1:0:0:0: [sdb] Attached SCSI removable disk

• USB3.0 print information in SuperSpeed mode.

root@linaro-alip:/# [  667.590292] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[  667.621251] usb 2-1: New USB device found, idVendor=0dd8, idProduct=3b00, bcdDevice= 0.02
[  667.621301] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  667.621324] usb 2-1: Product: OnlyDisk
[  667.621343] usb 2-1: Manufacturer: Netac
[  667.621363] usb 2-1: SerialNumber: 0A6544CD10427AB2
[  667.623814] usb-storage 2-1:1.0: USB Mass Storage device detected
[  667.625045] scsi host1: usb-storage 2-1:1.0
[  668.863371] scsi 1:0:0:0: Direct-Access     Netac    OnlyDisk         8.01 PQ: 0 ANSI: 6
[  668.867339] sd 1:0:0:0: [sdb] 121610240 512-byte logical blocks: (62.3 GB/58.0 GiB)
[  668.868328] sd 1:0:0:0: [sdb] Write Protect is off
[  668.869049] sd 1:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[  668.874950]  sdb: sdb1
[  668.875290] sd 1:0:0:0: [sdb] Attached SCSI removable disk

6.5 Ethernet

Step 1: Connect the network cable to the Ethernet port.

According to the log, it can be seen that the Gigabit Ethernet recognition is successful.

root@linaro-alip:/#
[   95.287411] rk_gmac-dwmac fe010000.ethernet end1: Link is Up - 1Gbps/Full - flow control rx/tx
[   95.287655] IPv6: ADDRCONF(NETDEV_CHANGE): end1: link becomes ready

Step 2: View network interface information.

# ifconfig

27

Customize the embedded system based on Your Idea

root@linaro-alip:/# ifconfig
end1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.226  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::d687:ef8d:e73a:7018  prefixlen 64  scopeid 0x20<link>
        ether 2a:59:46:ae:68:59  txqueuelen 1000  (Ethernet)
        RX packets 130  bytes 16541 (16.1 KiB)
        RX errors 0  dropped 8  overruns 0  frame 0
        TX packets 107  bytes 9461 (9.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 54

Step 3: Network connection test.

# ping -I end1 www.armdesigner.com

root@linaro-alip:/# ping -I end1 www.armdesigner.com
PING www.armdesigner.com (67.222.54.196) from 192.168.0.226 end1: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=1 ttl=48 time=187 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=2 ttl=48 time=186 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=3 ttl=48 time=189 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=4 ttl=48 time=185 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=48 time=185 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=6 ttl=48 time=188 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=7 ttl=48 time=185 ms
^C
--- www.armdesigner.com ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6004ms
rtt min/avg/max/mdev = 185.119/186.494/189.162/1.532 ms

6.6 ADB

Step 1: Connect the board and PC host with Micro usb cable.

Step 2: Install ADB driver on Windows system.

Step 3: Press Windows + R to open the Run program. Type “cmd” and press Enter.

Step 4: Execute the following command to enable ADB.

# adb shell

28

Customize the embedded system based on Your Idea

6.7 4G & GPS

Step 1: Insert 4G module to PCIe socket (4G model: EC20).

Step 2: Connect antenna and insert SIM card.

Step 3: Power on.

6.7.1 4G Test

Step 1: Initiate the PPP connection.

# pppd call quectel-ppp &

29

Customize the embedded system based on Your Idea

root@linaro-alip:/# pppd call quectel-ppp &
[1] 2491
root@linaro-alip:/# pppd options in effect:
debug           # (from /etc/ppp/peers/quectel-ppp)
nodetach                # (from /etc/ppp/peers/quectel-ppp)
dump            # (from /etc/ppp/peers/quectel-ppp)
noauth          # (from /etc/ppp/peers/quectel-ppp)
user test               # (from /etc/ppp/peers/quectel-ppp)
password ??????         # (from /etc/ppp/peers/quectel-ppp)
remotename 3gppp                # (from /etc/ppp/peers/quectel-ppp)
/dev/ttyUSB3            # (from /etc/ppp/peers/quectel-ppp)
115200          # (from /etc/ppp/peers/quectel-ppp)
lock            # (from /etc/ppp/peers/quectel-ppp)
connect chat -s -v -f /etc/ppp/peers/quectel-chat-connect               # (from /etc/ppp/peers/quectel-ppp)
disconnect chat -s -v -f /etc/ppp/peers/quectel-chat-disconnect         # (from /etc/ppp/peers/quectel-ppp)
nocrtscts               # (from /etc/ppp/peers/quectel-ppp)
modem           # (from /etc/ppp/peers/quectel-ppp)
asyncmap 0              # (from /etc/ppp/options)
lcp-echo-failure 4              # (from /etc/ppp/options)
lcp-echo-interval 30            # (from /etc/ppp/options)
hide-password           # (from /etc/ppp/peers/quectel-ppp)
novj            # (from /etc/ppp/peers/quectel-ppp)
novjccomp               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-local               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-remote              # (from /etc/ppp/peers/quectel-ppp)
ipparam 3gppp           # (from /etc/ppp/peers/quectel-ppp)
noipdefault             # (from /etc/ppp/peers/quectel-ppp)
ipcp-max-failure 30             # (from /etc/ppp/peers/quectel-ppp)
defaultroute            # (from /etc/ppp/peers/quectel-ppp)
usepeerdns              # (from /etc/ppp/peers/quectel-ppp)
noccp           # (from /etc/ppp/peers/quectel-ppp)
noipx           # (from /etc/ppp/options)
abort on (BUSY)
abort on (NO CARRIER)
abort on (NO DIALTONE)
abort on (ERROR)
abort on (NO ANSWER)
timeout set to 30 seconds
send (AT^M)
expect (OK)
AT^M^M
OK
 -- got it

send (ATE0^M)
expect (OK)
^M
ATE0^M^M
OK
 -- got it

Step 2: Check the status of the network interfaces.

send (ATI;+CSUB;+CSQ;+CPIN?;+COPS?;+CGREG?;&D2^M)
expect (OK)
# ifconfig
^M
^M
Quectel^M
EC25^M
Revision: EC25EUXGAR08A17M1G^M
^M
root@linaro-alip:/# ifconfig
SubEdition: V01^M
ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
^M
        inet 10.136.168.253  netmask 255.255.255.255  destination 10.64.64.64
+CSQ: 30,99^M
        ppp  txqueuelen 3  (Point-to-Point Protocol)
^M
        RX packets 4  bytes 52 (52.0 B)
+CPIN: READY^M
        RX errors 0  dropped 0  overruns 0  frame 0
^M
        TX packets 14  bytes 198 (198.0 B)
+COPS: 0,0,"Suning\00",7^M
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
^M
+CGREG: 0,1^M
^M
OK
 -- got it

Step 3: Test the PPP connection.

send (AT+CGDCONT=1,"IP","3gnet",,0,0^M)
# ping -I ppp0 www.armdesigner.com
expect (OK)
^M
^M
OK
 -- got it

send (ATD*99#^M)
expect (CONNECT)
^M
^M
CONNECT
 -- got it

30

Script chat -s -v -f /etc/ppp/peers/quectel-chat-connect finished (pid 2492), status = 0x0
Serial connection established.
using channel 1
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB3
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xfb04671f> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xd15255c2> <pcomp> <accomp>]
sent [LCP ConfAck id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xd15255c2> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xfb04671f> <pcomp> <accomp>]

Customize the embedded system based on Your Idea

root@linaro-alip:/# ping -I ppp0 www.armdesigner.com
PING www.armdesigner.com (67.222.54.196) from 10.136.168.253 ppp0: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=1 ttl=46 time=662 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=2 ttl=46 time=311 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=3 ttl=46 time=669 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=4 ttl=46 time=550 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=46 time=511 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=6 ttl=46 time=470 ms
^C64 bytes from 67.222.54.196: icmp_seq=7 ttl=46 time=422 ms

--- www.armdesigner.com ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6000ms
rtt min/avg/max/mdev = 311.082/513.597/668.628/118.606 ms

6.7.2 GPS Test

Step 1: Enable GPS functionality.

# echo -e "AT+QGPS=1\r\n" > /dev/ttyUSB2

Step 2: Read GPS data.

# cat /dev/ttyUSB1

root@linaro-alip:/# echo -e "AT+QGPS=1\r\n" > /dev/ttyUSB2
root@linaro-alip:/# cat /dev/ttyUSB1
$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

6.8 SD Card

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

Step 1: Insert the micro SD card into the card slot.

$GPVTG,,T,,M,,N,,K,N*2C

Step 2: After inserting the SD card, if it is recognized successfully, an icon will appear

31

Customize the embedded system based on Your Idea

on the desktop. Users need to click the icon in order to access the SD card.

6.9 M.2 NVME SSD

Step 1: Connect the SSD, then power on.

Step 2: If the SSD device is successfully recognized, an icon will appear on the desktop.

Users can click the icon to access the SSD device.

32

Customize the embedded system based on Your Idea

6.10 Camera

The EM3566 Debian 12 system only supports camera0 by default.

Step 2: Preview camera.

# /rockchip-test/camera/camera_rkisp_test.sh

root@linaro-alip:/# /rockchip-test/camera/camera_rkisp_test.sh
Start RKISP Camera Preview!
Setting pipeline to PAUSED ...
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  630.402506] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[  630.415403] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[  630.415545] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
0:00:18.8 / 99:99:99.

33

Customize the embedded system based on Your Idea

Step 3: Record the video.

# gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=100 ! \

video/x-raw,format=NV12,width=1920,height=1088,framerate=30/1 ! \

videoconvert ! mpph264enc ! h264parse ! mp4mux ! \

filesink location=/tmp/h264.mp4

root@linaro-alip:/# gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=100 ! video/x-
raw,format=NV12,width=1920,height=1088,framerate=30/1 ! videoconvert ! mpph264enc ! h264parse ! mp4mux !
filesink location=/tmp/h264.mp4
Setting pipeline to PAUSED ...
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  710.949230] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[  710.962501] rkisp rkisp-vir0: first params buf queue
[  710.962832] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[  710.962897] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
Redistribute latency...
0:00:01.9 / 99:99:99.

Step 4: Take photos.

# gst-launch-1.0 -v v4l2src device=/dev/video0 num-buffers=10 ! \

video/x-raw,format=NV12,width=1280,height=800 ! mppjpegenc ! \

multifilesink location=/tmp/test%05d.jpg

 root@linaro-alip:/# gst-launch-1.0 -v v4l2src device=/dev/video0 num-buffers=10 ! \
video/x-raw,format=NV12,width=1280,height=800 ! mppjpegenc ! \o0 num-buffers=10 ! \
multifilesink location=/tmp/test%05d.jpgt=800 ! mppjpegenc ! \
Setting pipeline to PAUSED ...st%05d.jpg
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0: crop-bounds = < (int)0, (int)0, (int)2112, (int)1568 >
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstMppJpegEnc:mppjpegenc0.GstPad:src: caps = image/jpeg, width=(int)1280,
height=(int)800, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)120/1, interlace-
mode=(string)progressive, colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstMultiFileSink:multifilesink0.GstPad:sink: caps = image/jpeg, width=(int)1280,
height=(int)800, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)120/1, interlace-
mode=(string)progressive, colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstMppJpegEnc:mppjpegenc0.GstPad:sink: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
[  735.988844] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[  736.003630] rkisp rkisp-vir0: first params buf queue
[  736.004069] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[  736.004148] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
Got EOS from element "pipeline0".
Execution ended after 0:00:00.576596087
Setting pipeline to NULL ...
[  736.568831] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream_stop stream stop, dphy1
[  736.568899] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:0, dphy1, ret 0
Freeing pipeline ...

34

Customize the embedded system based on Your Idea

6.11 ADC

Connect the ADC_VIN pin to high  and low levels respectively, then run the following

command to observe the data changes.

# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw

root@linaro-alip:/# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw
1023
583
883
15
447
525
541
537
root@linaro-alip:/# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw
1023
585
875
1023
562
547
543
539

6.12 RS485

Step 1: As shown in the diagram, connect the RS485 test tool to the development board.

35

Customize the embedded system based on Your Idea

Step 2: Open the corresponding serial terminal, set the baud rate of the board to 1500000,

and set the baud rate of the RS485 test tool to 115200.

Step 3: Execute the following command on the board to test the RS485 transmission and

reception functionality.

# com /dev/ttyS3 115200 8 0 1

6.14 UART

Step 1: Short circuit RX and TX pins of UART.

36

Customize the embedded system based on Your Idea

Step 2: UART1 test.

# com /dev/ttyS4 115200 8 0 1

root@linaro-alip:/# com /dev/ttyS4 115200 8 0 1
port = /dev/ttyS4
baudrate = 115200
cs = 8
parity = 0
stopb = 1
000000000
RECV: 000000000
lllllll
RECV: lllllll
ggggg
RECV: ggggg
uuu
RECV: uuu

Step 3: UART2 test.

# com /dev/ttyS5 115200 8 0 1

root@linaro-alip:/# com /dev/ttyS5 115200 8 0 1
port = /dev/ttyS5
baudrate = 115200
cs = 8
parity = 0
stopb = 1
8888888
RECV: 8888888
yyyyyy
RECV: yyyyyy
rrrr
RECV: rrrr
k
RECV: k

6.15 RTC

Step 1: Install the coin cell battery.

37

Customize the embedded system based on Your Idea

Step 2: Set the system time.

# date -s "2025-03-20 18:29:00"

Step 3: Write the system time to the hardware clock.

# hwclock -w

Step 4: Display the current hardware clock time.

# hwclock

root@linaro-alip:/# date -s "2025-03-20 18:29:00"
Thu Mar 20 18:29:00 UTC 2025
root@linaro-alip:/# hwclock -w
root@linaro-alip:/# hwclock
2025-03-20 18:29:15.640263+00:00
root@linaro-alip:/# hwclock
2025-03-20 18:29:29.292932+00:00
root@linaro-alip:/# hwclock
2025-03-20 18:29:58.857756+00:00
root@linaro-alip:/# hwclock
2025-03-20 18:30:02.172581+00:00

Step 5: Power off, after a period of time to turn on the power again, check whether the

time is saved.

root@linaro-alip:/# hwclock
2025-03-21 09:09:52.739874+00:00
root@linaro-alip:/# hwclock
2025-03-21 09:10:06.916376+00:00
root@linaro-alip:/# hwclock
2025-03-21 09:11:21.950144+00:00
root@linaro-alip:/# hwclock
2025-03-21 09:11:48.814721+00:00

6.16 IR

Step 1: Open IR debugging print.

# echo 1 > /sys/module/rockchip_pwm_remotectl/parameters/code_print

38

Customize the embedded system based on Your Idea

Step 2: When pressing a button on the remote control towards the IR receiver, the key

value will be printed to the log.

root@linaro-alip:/#                                                                                 echo 1 >
/sys/module/rockchip_pwm_remotectl/parameters/code_printip_pwm_remotectl/parameters/code_print
root@linaro-alip:/# [  464.078416] USERCODE=0x1818
[  464.105422] RMC_GETDATA=9b
[  464.842401] USERCODE=0x1818
[  464.869507] RMC_GETDATA=98
[  466.198537] USERCODE=0x1818
[  466.225687] RMC_GETDATA=99
[  466.862289] USERCODE=0x1818
[  466.889468] RMC_GETDATA=9a
[  467.578254] USERCODE=0x1818
[  467.605320] RMC_GETDATA=97
[  468.358371] USERCODE=0x1818
[  468.385553] RMC_GETDATA=e6
[  468.954431] USERCODE=0x1818
[  468.981577] RMC_GETDATA=e4

6.17 WiFi & Bluetooth

To use Wi-Fi and Bluetooth functions properly, the antenna needs to be connected.

6.17.1 WiFi

Step  1:  Click  the  network  icon  in  the  top  right  corner  of  the  interface,  then  select  the

"Available Networks" option to view the list of available hotspots.

39

Customize the embedded system based on Your Idea

Step 2: Select the SSID from the list of available networks and enter the password.

Step 3: After the WiFi successfully connects to the hotspot, the system will display the

corresponding connection status icon in the top right corner.

Step 4: Users can test network connectivity using the desktop's built-in browser or verify

it through the following command method.

(1) View network interface information.

# ifconfig

40

Customize the embedded system based on Your Idea

root@linaro-alip:/# ifconfig
wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.223  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::a511:3be7:929a:7aa5  prefixlen 64  scopeid 0x20<link>
        ether 60:fb:00:75:ac:d4  txqueuelen 1000  (Ethernet)
        RX packets 516  bytes 72339 (70.6 KiB)
        RX errors 0  dropped 70  overruns 0  frame 0
        TX packets 183  bytes 22938 (22.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

(2) Network connection test.

# ping -I wlan0 www.armdesigner.com

root@linaro-alip:/# ping -I wlan0 www.armdesigner.com
PING www.armdesigner.com (67.222.54.196) from 192.168.0.223 wlan0: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=1 ttl=48 time=323 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=2 ttl=48 time=348 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=3 ttl=48 time=274 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=4 ttl=48 time=325 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=48 time=214 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=6 ttl=48 time=237 ms
^C64 bytes from 67.222.54.196: icmp_seq=7 ttl=48 time=190 ms

--- www.armdesigner.com ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6002ms
rtt min/avg/max/mdev = 190.139/272.991/347.654/56.663 ms

6.17.2 Bluetooth

Step 1: Click the Bluetooth icon in the top right corner of the desktop.

Step 2: The Bluetooth device name is hidden by default. Set it to be visible by clicking

Adapter -> Preferences -> Always visible.

41

Customize the embedded system based on Your Idea

Step 3: Click Search to start searching and select the available device in the list to pair.

42

Customize the embedded system based on Your Idea

After successful configuration, Bluetooth devices can pair with each other directly.

6.18 Video Playback

(1) The directory for the built-in video testing scripts in the system: /rockchip-test/video

root@linaro-alip:/# ls /rockchip-test/video/
test_dec-gst.sh     test_enc-gst.sh         test_gst_video_maxfps.sh
test_dec-mpv.sh     test_gst_multivideo.sh  video_stresstest.sh
test_dec-parole.sh  test_gst_video.sh       video_test.sh
test_dec-qt.sh      test_gst_video_fps.sh

Simply execute the script.

root@linaro-alip:/# cd /rockchip-test/video/
root@linaro-alip:/rockchip-test/video# ./test_gst_video.sh
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Redistribute latency...
mpp[2097]: mpp_info: mpp version: 331ee68f author: nyanmisaka    2024-12-11 fix[mpp]: Fix input_task_count
for async enc
mpp[2097]: mpp_info: mpp version: 331ee68f author: nyanmisaka    2024-12-11 fix[mpp]: Fix input_task_count
for async enc
mpp[2097]: mpp_info: mpp version: 331ee68f author: nyanmisaka    2024-12-11 fix[mpp]: Fix input_task_count
for async enc
mpp[2097]: mpp: unable to create enc vp8 for soc rk3566 unsupported
mpp[2097]: mpp_info: mpp version: 331ee68f author: nyanmisaka    2024-12-11 fix[mpp]: Fix input_task_count
for async enc
mpp[2097]: mpp_info: mpp version: 331ee68f author: nyanmisaka    2024-12-11 fix[mpp]: Fix input_task_count
for async enc
Redistribute latency...
mpp[2097]: h264d_api: is_avcC=1
Pipeline is PREROLLED ...0 %)
Prerolled, waiting for async message to finish...
Setting pipeline to PLAYING ...
Redistribute latency...
New clock: GstSystemClock
0:00:09.6 / 0:00:29.5 (32.7 %)

43

Customize the embedded system based on Your Idea

(2) Play the video using Google Chrome.

•  Google  Chrome  supports  video  playback  up  to  4K,  with  support  for  the  following

decoding formats: VP8, H.264, H.265, VP9, and AV1.

• However, it is only compatible with certain H.265 video files.

Step 1: Select the video file, right-click, and choose “Open With Other Application…”.

Step 2: Find Chromium Browser in the list, select it, and click “Open” to play the video

file.

44

Customize the embedded system based on Your Idea

(1) Use the gst-play-1.0 command to play the video.

# export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1

# gst-play-1.0 --flags=3 --videosink="kmssink plane-id=96" /media/linaro/9692-

4836/video/4KP60/4KP60-exist.mp4  --audiosink="alsasink device=hw:0,0"

Command explanation:

• export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1: Open AFBC.

•  --videosink="kmssink  plane-id=96":  Specifies  the  plane.  Which  can  be  viewed  using  the  command:  cat

/sys/kernel/debug/dri/0/state | grep "plane\[".

• /media/linaro/9692-4836/video/4KP60/4KP60-exist.mp4: The media file path to be played.

• --audiosink="alsasink device=hw:0,0": Specifies the audio output device as hw:0,0.

45

Customize the embedded system based on Your Idea

root@linaro-alip:/# export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1
root@linaro-alip:/#                                                gst-play-1.0  --flags=3  --videosink="kmssink  plane-id=96"
/media/linaro/9692-4836/video/4KP60/4KP60-exist.mp4    --audiosink="alsasink  device=hw:0,0"nk="kmssink
plane-id=96"  /media/linaro/9692-4836/video/4KP60/4KP60-exist.mp4    --audioPress  'k'  to  see  a  list  of
keyboard shortcuts.
Now playing /media/linaro/9692-4836/video/4KP60/4KP60-exist.mp4
Redistribute latency...
Redistribute latency...
WARNING No volume control found
WARNING
debug
/GstPlayBin:playbin/GstPlaySink:playsink:
Volume/mute is not available
Redistribute latency...
Redistribute latency...
Redistribute latency...
0:00:17.0 / 0:04:01.9

../gst/playback/gstplaysink.c(2908):

gen_audio_chain

information:

():

7.Buildroot Test

7.1 Serial Terminal

Connect the board and PC with USB Serial cable, then power on, the terminal will output

boot information. The default baudrate is 1500000.

46

Customize the embedded system based on Your Idea

7.2 Display

The EM3566 can only output to a single display (either HDMI or LVDS) at a time.

The display effect diagram is as follows:

47

Customize the embedded system based on Your Idea

7.3 Headset

Step 1: Plug the headset into the headset jack.

Step 2: View sound card.

# cat /proc/asound/cards

root@rk3566-buildroot:/# cat /proc/asound/cards
 0 [rockchiphdmi   ]: rockchip-hdmi - rockchip-hdmi
                      rockchip-hdmi
 1 [rockchipes8388c]: simple-card - rockchip,es8388-codec
                      rockchip,es8388-codec

Step 3: Headset recording.

• To use HDMI as the display:

# arecord -Dhw:1,0 -f cd record.wav

root@rk3566-buildroot:/# arecord -Dhw:1,0 -f cd record.wav
Recording WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

• To use LVDS (1280x800) as the display:

# arecord -Dhw:0,0 -f cd record.wav

root@rk3566-buildroot:/# arecord -Dhw:0,0 -f cd record.wav
Recording WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

Step 4: Play audio through headset.

• When using HDMI as the display:

# aplay -Dhw:1,0 record.wav

root@rk3566-buildroot:/# aplay -Dhw:1,0 record.wav
Playing WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

Note: Supplementary instructions on audio output.

48

Customize the embedded system based on Your Idea

# aplay -Dhw:0,0 record.wav   // HDMI TX audio output

# aplay -Dhw:1,0 record.wav   // Headset audio output

• When using LVDS (1280x800) as the display:

# aplay -Dhw:0,0 record.wav

root@rk3566-buildroot:/# aplay -Dhw:0,0 record.wav
Playing WAVE 'record.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

7.4 USB Host

The USB host can be used to connect devices such as USB mouse, USB keyboards, USB

flash drives, and other USB peripherals.

The user can identify whether the mounted flash drive is USB 2.0 or USB 3.0 from the

debug log.

• USB2.0 print information in high-speed mode.

root@rk3566-buildroot:/# [   98.279786] RTW: nolinked power save leave
[   99.512575] usb 3-1.1: new high-speed USB device number 5 using ehci-platform
[   99.622832] usb 3-1.1: New USB device found, idVendor=21c4, idProduct=0cc7, bcdDevice= 1.00
[   99.622971] usb 3-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   99.623014] usb 3-1.1: Product: USB Flash Drive
[   99.623047] usb 3-1.1: Manufacturer: Lexar
[   99.623078] usb 3-1.1: SerialNumber: 04102800000031D7
[   99.625693] usb-storage 3-1.1:1.0: USB Mass Storage device detected
[   99.628291] scsi host1: usb-storage 3-1.1:1.0
[   99.837386] RTW: nolinked power save enter
[  100.643885] scsi 1:0:0:0: Direct-Access     Lexar    USB Flash Drive  1.00 PQ: 0 ANSI: 4
[  100.648207] sd 1:0:0:0: [sdb] 120861886 512-byte logical blocks: (61.9 GB/57.6 GiB)
[  100.649143] sd 1:0:0:0: [sdb] Write Protect is off
[  100.649905] sd 1:0:0:0: [sdb] No Caching mode page found
[  100.649929] sd 1:0:0:0: [sdb] Assuming drive cache: write through
[  100.658904]  sdb: sdb1
[  100.660235] sd 1:0:0:0: [sdb] Attached SCSI removable disk

• USB3.0 print information in SuperSpeed mode.

49

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/# [   25.165426] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[   25.196607] usb 2-1: New USB device found, idVendor=0dd8, idProduct=3b00, bcdDevice= 0.02
[   25.196702] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   25.196744] usb 2-1: Product: OnlyDisk
[   25.196777] usb 2-1: Manufacturer: Netac
[   25.196809] usb 2-1: SerialNumber: C0E8BFA3EC38F796
[   25.203056] usb-storage 2-1:1.0: USB Mass Storage device detected
[   25.206126] scsi host0: usb-storage 2-1:1.0
[   26.563955] scsi 0:0:0:0: Direct-Access     Netac    OnlyDisk         8.01 PQ: 0 ANSI: 6
[   26.569195] sd 0:0:0:0: [sda] 121610240 512-byte logical blocks: (62.3 GB/58.0 GiB)
[   26.569704] sd 0:0:0:0: [sda] Write Protect is off
[   26.569998] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   26.576508]  sda: sda1
[   26.577560] sd 0:0:0:0: [sda] Attached SCSI removable disk

After connecting the USB flash drive, it will be automatically mounted, execute the

following command to view the path where the device is mounted:

# df -h

root@rk3566-buildroot:/# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       5.9G  693M  5.0G  13% /
devtmpfs        967M  8.0K  967M   1% /dev
tmpfs           979M  140K  979M   1% /tmp
tmpfs           979M  432K  979M   1% /run
tmpfs           979M  176K  979M   1% /var/log
tmpfs           979M     0  979M   0% /dev/shm
/dev/mmcblk0p7  123M   12M  108M  10% /oem
/dev/mmcblk0p8  936M  412K  920M   1% /userdata
/dev/nvme0n1    229G  138M  217G   1% /mnt/storage
/dev/sda1        58G   30G   29G  51% /mnt/udisk
/dev/sdb1        32G  4.7G   28G  15% /media/udisk1

7.5 Ethernet

Step 1: Connect the network cable to the Ethernet port.

According to the log, it can be seen that the Gigabit Ethernet recognition is successful.

root@rk3566-buildroot:/# [  270.948764] rk_gmac-dwmac fe010000.ethernet eth0: Link is Up - 1Gbps/Full -
flow control rx/tx
[  270.948942] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

Step 2: View network interface information.

# ifconfig

50

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/# ifconfig
eth0      Link encap:Ethernet  HWaddr 2A:59:46:AE:68:59
          inet addr:192.168.0.226  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::4724:3f74:1777:3489/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:123 errors:0 dropped:8 overruns:0 frame:0
          TX packets:11 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:16809 (16.4 KiB)  TX bytes:1410 (1.3 KiB)
          Interrupt:54

Step 3: Network connection test.

# ping -I eth0 www.armdesigner.com

PING www.armdesigner.com (67.222.54.196) from 192.168.0.226 eth0: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=1 ttl=48 time=220 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=2 ttl=48 time=220 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=3 ttl=48 time=220 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=48 time=222 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=9 ttl=48 time=219 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=11 ttl=48 time=220 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=13 ttl=48 time=220 ms
^C
--- www.armdesigner.com ping statistics ---
14 packets transmitted, 7 received, 50% packet loss, time 13124ms
rtt min/avg/max/mdev = 219.453/220.111/221.670/0.720 ms

7.6 ADB

Step 1: Connect the board and PC host with Micro usb cable.

Step 2: Install ADB driver on Windows system.

Step 3: Press Windows + R to open the Run program. Type “cmd” and press Enter.

Step 4: Execute the following command to enable ADB.

# adb shell

51

Customize the embedded system based on Your Idea

7.7 4G & GPS

Step 1: Insert 4G module to PCIe socket (4G model: EC20).

Step 2: Connect antenna and insert SIM card.

Step 3: Power on.

7.7.1 4G Test

Step 1: Initiate the PPP connection.

# mkdir -p var/run/pppd/lock

# pppd call quectel-ppp &

52

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/# mkdir -p var/run/pppd/lock
root@rk3566-buildroot:/# pppd call quectel-ppp &
[1] 1475
root@rk3566-buildroot:/# pppd options in effect:
debug           # (from /etc/ppp/peers/quectel-ppp)
nodetach                # (from /etc/ppp/peers/quectel-ppp)
dump            # (from /etc/ppp/peers/quectel-ppp)
noauth          # (from /etc/ppp/peers/quectel-ppp)
user test               # (from /etc/ppp/peers/quectel-ppp)
password ??????         # (from /etc/ppp/peers/quectel-ppp)
remotename 3gppp                # (from /etc/ppp/peers/quectel-ppp)
/dev/ttyUSB3            # (from /etc/ppp/peers/quectel-ppp)
115200          # (from /etc/ppp/peers/quectel-ppp)
lock            # (from /etc/ppp/peers/quectel-ppp)
connect chat -s -v -f /etc/ppp/peers/quectel-chat-connect               # (from /etc/ppp/peers/quectel-ppp)
disconnect chat -s -v -f /etc/ppp/peers/quectel-chat-disconnect         # (from /etc/ppp/peers/quectel-ppp)
nocrtscts               # (from /etc/ppp/peers/quectel-ppp)
modem           # (from /etc/ppp/peers/quectel-ppp)
hide-password           # (from /etc/ppp/peers/quectel-ppp)
novj            # (from /etc/ppp/peers/quectel-ppp)
novjccomp               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-local               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-remote              # (from /etc/ppp/peers/quectel-ppp)
ipparam 3gppp           # (from /etc/ppp/peers/quectel-ppp)
noipdefault             # (from /etc/ppp/peers/quectel-ppp)
ipcp-max-failure 30             # (from /etc/ppp/peers/quectel-ppp)
defaultroute            # (from /etc/ppp/peers/quectel-ppp)
usepeerdns              # (from /etc/ppp/peers/quectel-ppp)
noccp           # (from /etc/ppp/peers/quectel-ppp)
abort on (BUSY)
abort on (NO CARRIER)
abort on (NO DIALTONE)
abort on (ERROR)
abort on (NO ANSWER)
timeout set to 30 seconds
send (AT^M)
expect (OK)
AT^M^M
OK
 -- got it

send (ATE0^M)
expect (OK)
^M
ATE0^M^M
OK
 -- got it

Step 2: Check the status of the network interfaces.

send (ATI;+CSUB;+CSQ;+CPIN?;+COPS?;+CGREG?;&D2^M)
expect (OK)
^M
^M
Quectel^M
EC25^M
Revision: EC25EUXGAR08A17M1G^M
^M
SubEdition: V01^M
# ifconfig
^M
+CSQ: 29,99^M
^M
+CPIN: READY^M
^M
root@rk3566-buildroot:/# ifconfig
+COPS: 0,0,"Suning\00",7^M
ppp0      Link encap:Point-to-Point Protocol
^M
          inet addr:10.137.30.185  P-t-P:10.64.64.64  Mask:255.255.255.255
+CGREG: 0,1^M
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
^M
          RX packets:22 errors:0 dropped:0 overruns:0 frame:0
OK
          TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
 -- got it
          collisions:0 txqueuelen:3
          RX bytes:1525 (1.4 KiB)  TX bytes:1552 (1.5 KiB)
send (AT+CGDCONT=1,"IP","3gnet",,0,0^M)
expect (OK)
^M
^M
OK
 -- got it
# ping -I ppp0 www.armdesigner.com
send (ATD*99#^M)
expect (CONNECT)
^M
^M
CONNECT
 -- got it

Step 3: Test the PPP connection.

Script chat -s -v -f /etc/ppp/peers/quectel-chat-connect finished (pid 1476), status = 0x0
Serial connection established.
using channel 1
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB3
[  843.763425] RTW: nolinked power save leave
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xa5b0cdbd> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xd20b1647> <pcomp> <accomp>]
sent [LCP ConfAck id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xd20b1647> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xa5b0cdbd> <pcomp> <accomp>]
rcvd [LCP DiscReq id=0x1 magic=0xd20b1647]
rcvd [CHAP Challenge id=0x1 <ec1efcf7cbb55fbe7f6ca7f9cf115f96>, name = "UMTS_CHAP_SRVR"]

53

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/# ping -I ppp0 www.armdesigner.com
PING www.armdesigner.com (67.222.54.196) from 10.137.30.185 ppp0: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=1 ttl=46 time=316 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=2 ttl=46 time=269 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=3 ttl=46 time=547 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=4 ttl=46 time=508 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=46 time=468 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=6 ttl=46 time=428 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=7 ttl=46 time=387 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=8 ttl=46 time=345 ms
^C
--- www.armdesigner.com ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7004ms
rtt min/avg/max/mdev = 269.016/408.291/546.505/90.381 ms

7.7.2 GPS Test

Step 1: Enable GPS functionality.

# echo -e "AT+QGPS=1\r\n" > /dev/ttyUSB2

Step 2: Read GPS data.

# cat /dev/ttyUSB1

root@rk3566-buildroot:/# echo -e "AT+QGPS=1\r\n" > /dev/ttyUSB2
root@rk3566-buildroot:/# cat /dev/ttyUSB1
$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

$GPGGA,,,,,,0,,,,,,,,*66

$GPRMC,,V,,,,,,,,,,N,V*29

$GPVTG,,T,,M,,N,,K,N*2C

$GPGSA,A,1,,,,,,,,,,,,,,,,*32

7.8 SD Card

Step 1: Insert the micro SD card into the card slot.

54

Customize the embedded system based on Your Idea

Step 2: The system will automatically mount it, view the device mount path.

# df -h

root@rk3566-buildroot:/# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       5.9G  693M  5.0G  13% /
devtmpfs        967M  8.0K  967M   1% /dev
tmpfs           979M  140K  979M   1% /tmp
tmpfs           979M  444K  979M   1% /run
tmpfs           979M  204K  979M   1% /var/log
tmpfs           979M     0  979M   0% /dev/shm
/dev/mmcblk0p7  123M   12M  108M  10% /oem
/dev/mmcblk0p8  936M  412K  920M   1% /userdata
/dev/nvme0n1    229G  138M  217G   1% /mnt/storage
/dev/sda1        58G   30G   29G  51% /mnt/udisk
/dev/sdb1        32G  4.7G   28G  15% /media/udisk1
/dev/mmcblk1p1   30G  572M   30G   2% /mnt/sdcard

7.9 M.2 NVME SSD

Step 1: Connect the SSD, then power on.

 .

Step 2: The system will automatically mount it, view the device mount path.

# df -h

root@rk3566-buildroot:/# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       5.9G  693M  5.0G  13% /
devtmpfs        967M  8.0K  967M   1% /dev
tmpfs           979M  140K  979M   1% /tmp
tmpfs           979M  444K  979M   1% /run
tmpfs           979M  204K  979M   1% /var/log
tmpfs           979M     0  979M   0% /dev/shm
/dev/mmcblk0p7  123M   12M  108M  10% /oem
/dev/mmcblk0p8  936M  412K  920M   1% /userdata
/dev/nvme0n1    229G  138M  217G   1% /mnt/storage
/dev/sda1        58G   30G   29G  51% /mnt/udisk
/dev/sdb1        32G  4.7G   28G  15% /media/udisk1
/dev/mmcblk1p1   30G  572M   30G   2% /mnt/sdcard

55

Customize the embedded system based on Your Idea

7.10 Camera

The EM3566 Buildroot system only supports camera0 by default.

Step 2: Preview camera.

# /rockchip-test/camera/camera_rkisp_test.sh

root@rk3566-buildroot:/# /rockchip-test/camera/camera_rkisp_test.sh
Setting pipeline to PAUSED ...
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  980.565034] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[  980.569761] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[  980.569835] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
[  984.906616] RTW: nolinked power save leave
[  986.427631] RTW: nolinked power save enter
0:00:09.2 / 99:99:99.

Step 3: Record the video.

# gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=100 ! \

video/x-raw,format=NV12,width=1920,height=1088,framerate=30/1 ! \

videoconvert ! mpph264enc ! h264parse ! mp4mux ! \

filesink location=/tmp/h264.mp4

56

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/#
00 ! \k3566-buildroot:/# gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=10
> video/x-raw,format=NV12,width=1920,height=1088,framerate=30/1 ! \
> videoconvert ! mpph264enc ! h264parse ! mp4mux ! \
> filesink location=/tmp/h264.mp4
Setting pipeline to PAUSED ...
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[ 1022.851135] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[ 1022.862572] rkisp rkisp-vir0: first params buf queue
[ 1022.862872] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[ 1022.862935] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
Redistribute latency...
0:00:02.5 / 99:99:99.

Step 4: Take photos.

# gst-launch-1.0 -v v4l2src device=/dev/video0 num-buffers=10 ! \

video/x-raw,format=NV12,width=1280,height=800 ! mppjpegenc ! \

multifilesink location=/tmp/test%05d.jpg

root@rk3566-buildroot:/#
s=10 ! \566-buildroot:/# gst-launch-1.0 -v v4l2src device=/dev/video0 num-buffers
> video/x-raw,format=NV12,width=1280,height=800 ! mppjpegenc ! \
> multifilesink location=/tmp/test%05d.jpg
Setting pipeline to PAUSED ...
Using mplane plugin for capture
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0: crop-bounds = < (int)0, (int)0, (int)2112, (int)1568 >
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
New clock: GstSystemClock
/GstPipeline:pipeline0/GstMppJpegEnc:mppjpegenc0.GstPad:src: caps = image/jpeg, width=(int)1280,
height=(int)800, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)120/1, interlace-
mode=(string)progressive, colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstMultiFileSink:multifilesink0.GstPad:sink: caps = image/jpeg, width=(int)1280,
height=(int)800, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)120/1, interlace-
mode=(string)progressive, colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstMppJpegEnc:mppjpegenc0.GstPad:sink: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)NV12,
width=(int)1280, height=(int)800, framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetry=(string)1:3:5:1
[ 1078.990845] rkisp_hw fdff0000.rkisp: set isp clk = 297000000Hz
[ 1079.008021] rkisp rkisp-vir0: first params buf queue
[ 1079.008389] rockchip-csi2-dphy1: dphy1, data_rate_mbps 600
[ 1079.008454] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:1, dphy1, ret 0
Redistribute latency...
Got EOS from element "pipeline0".
Execution ended after 0:00:00.573828820
Setting pipeline to NULL ...
[ 1079.570163] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream_stop stream stop, dphy1
[ 1079.570220] rockchip-csi2-dphy csi2-dphy1: csi2_dphy_s_stream stream on:0, dphy1, ret 0
Freeing pipeline ...

57

Customize the embedded system based on Your Idea

7.11 ADC

Connect the ADC_VIN pin to high and low levels respectively, then run the following

command to observe the data changes.

# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw

root@rk3566-buildroot:/# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw
1023
581
895
15
447
524
543
539
root@rk3566-buildroot:/# cat /sys/bus/iio/devices/iio\:device0/in_voltage*_raw
1023
585
830
1023
559
547
547
539

7.12 RS485

Step 1: As shown in the diagram, connect the RS485 test tool to the development board.

58

Customize the embedded system based on Your Idea

Step 2: Open the corresponding serial terminal, set the baud rate of the board to 1500000,

and set the baud rate of the RS485 test tool to 115200.

Step 3: Execute the following command on the board to test the RS485 transmission and

reception functionality.

# com /dev/ttyS3 115200 8 0 1

7.14 UART

Step 1: Short circuit RX and TX pins of UART.

59

Customize the embedded system based on Your Idea

Step 2: UART1 test.

# com /dev/ttyS4 115200 8 0 1

root@rk3566-buildroot:/# com /dev/ttyS4 115200 8 0 1
port = /dev/ttyS4
baudrate = 115200
cs = 8
parity = 0
stopb = 1
FFFFF
RECV: FFFFF
56565656
RECV: 56565656
KKKKK000
RECV: KKKKK000
KK
RECV: KK

Step 3: UART2 test.

# com /dev/ttyS5 115200 8 0 1

root@rk3566-buildroot:/# com /dev/ttyS5 115200 8 0 1
port = /dev/ttyS5
baudrate = 115200
cs = 8
parity = 0
stopb = 1
222200000
RECV: 222200000
PPPPP666
RECV: PPPPP666
YUYUYUYUYUUYUY
RECV: YUYUYUYUYUUYUY
KKKK0
RECV: KKKK0

7.15 RTC

Step 1: Install the coin cell battery.

60

Customize the embedded system based on Your Idea

Step 2: Set the system time.

# date -s "2025-03-21 10:33:00"

Step 3: Write the system time to the hardware clock.

# hwclock -w

Step 4: Display the current hardware clock time.

# hwclock

root@rk3566-buildroot:/# date -s "2025-03-21 10:33:00"
Fri Mar 21 10:33:00 UTC 2025
root@rk3566-buildroot:/# hwclock -w
root@rk3566-buildroot:/# hwclock
Fri Mar 21 10:33:09 2025  0.000000 seconds
root@rk3566-buildroot:/# hwclock
Fri Mar 21 10:33:19 2025  0.000000 seconds
root@rk3566-buildroot:/# hwclock
Fri Mar 21 10:33:39 2025  0.000000 seconds

Step 5: Power off, after a period of time to turn on the power again, check whether the

time is saved.

root@rk3566-buildroot:/# hwclock
Fri Mar 21 11:19:14 2025  0.000000 seconds
root@rk3566-buildroot:/# hwclock
Fri Mar 21 11:19:35 2025  0.000000 seconds
root@rk3566-buildroot:/# hwclock
Fri Mar 21 11:20:02 2025  0.000000 seconds
root@rk3566-buildroot:/# hwclock
Fri Mar 21 11:20:11 2025  0.000000 seconds

7.16 IR

Step 1: Open IR debugging print.

# echo 1 > /sys/module/rockchip_pwm_remotectl/parameters/code_print

Step 2: When pressing a button on the remote control towards the IR receiver, the key

61

Customize the embedded system based on Your Idea

value will be printed to the log.

code_print6-buildroot:/# echo 1 > /sys/module/rockchip_pwm_remotectl/parameters/c
root@rk3566-buildroot:/# [   25.228147] USERCODE=0x1818
[   25.314086] RMC_GETDATA=26
[   25.520397] USERCODE=0x1818
[   25.547530] RMC_GETDATA=98
[   25.817104] USERCODE=0x1818
[   25.844232] RMC_GETDATA=98
[   26.095907] USERCODE=0x1818
[   26.122997] RMC_GETDATA=98
[   26.372248] USERCODE=0x1818
[   26.399371] RMC_GETDATA=98
[   26.652092] USERCODE=0x1818
[   26.679112] RMC_GETDATA=98
[   26.928095] USERCODE=0x1818
[   26.955212] RMC_GETDATA=98
[   27.212297] USERCODE=0x1818
[   27.239426] RMC_GETDATA=98
[   27.503980] USERCODE=0x1818
[   27.531156] RMC_GETDATA=98

7.17 WiFi & Bluetooth

To use Wi-Fi and Bluetooth functions properly, the antenna needs to be connected.

7.17.1 WiFi

Step 1: View the device information.

# ifconfig

root@rk3566-buildroot:/# ifconfig
wlan0     Link encap:Ethernet  HWaddr 60:FB:00:75:AC:D4
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Step 2: Scan for available WiFi hotspots.

# iwlist wlan0 scan

62

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/# iwlist wlan0 scan
wlan0     Scan completed :
          Cell 01 - Address: B2:22:7A:5A:B6:4A
                    ESSID:"DIRECT-4A-HP Laser 136w"
                    Protocol:IEEE 802.11gn
                    Mode:Master
                    Frequency:2.412 GHz (Channel 1)
                    Encryption key:on
                    Bit Rates:72 Mb/s
                    Extra:rsn_ie=30140100000fac040100000fac040100000fac020c00
                    IE: IEEE 802.11i/WPA2 Version 1
                        Group Cipher : CCMP
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    Quality=89/100  Signal level=45/100
                    Extra:fm=0003
          Cell 02 - Address: 06:70:AB:A5:B6:F8
                    ESSID:"XYLX-Shoeroom"
                    Protocol:IEEE 802.11bgn
                    Mode:Master
                    Frequency:2.412 GHz (Channel 1)
                    Encryption key:on
                    Bit Rates:300 Mb/s
                    Extra:wpa_ie=dd160050f20101000050f20401000050f20401000050f202
                    IE: WPA Version 1
                        Group Cipher : CCMP
Step 3: Connect to the hotspot.
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    Extra:
                    IE: IEEE 802.11i/WPA2 Version 1
# wifi-connect.sh SSID PSK
                        Group Cipher : CCMP
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    Quality=96/100  Signal level=28/100
                    Extra:fm=0003
root@rk3566-buildroot:/# wifi-connect.sh Boardcon Boardcon43435656
          Cell 03 - Address: B4:F1:8C:6D:D1:24
connect to WiFi ssid: Boardcon, Passwd: Boardcon43435656
                    ESSID:"Boardcon"
Successfully initialized wpa_supplicant
                    Protocol:IEEE 802.11bgn
                    Mode:Master
                    Frequency:2.412 GHz (Channel 1)
Step 4: View the network interface status.
                    Encryption key:on
                    Bit Rates:300 Mb/s
                    Extra:wpa_ie=dd160050f20101000050f20401000050f20401000050f202
                    IE: WPA Version 1
                        Group Cipher : CCMP
# ifconfig
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    Extra:
                    IE: IEEE 802.11i/WPA2 Version 1
                        Group Cipher : CCMP
root@rk3566-buildroot:/# ifconfig
                        Pairwise Ciphers (1) : CCMP
wlan0     Link encap:Ethernet  HWaddr 60:FB:00:75:AC:D4
                        Authentication Suites (1) : PSK
          inet addr:192.168.0.223  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::a284:1a9:6654:7366/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:123 errors:0 dropped:14 overruns:0 frame:0
          TX packets:18 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:15578 (15.2 KiB)  TX bytes:2584 (2.5 KiB)

Step 5: Test the WiFi network.

# ping -I wlan0 www.armdesigner.com

root@rk3566-buildroot:/# ping -I wlan0 www.armdesigner.com
PING www.armdesigner.com (67.222.54.196) from 192.168.0.223 wlan0: 56(84) bytes of data.
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=5 ttl=48 time=210 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=6 ttl=48 time=204 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=7 ttl=48 time=207 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=8 ttl=48 time=264 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=9 ttl=48 time=208 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=11 ttl=48 time=217 ms
64 bytes from 67-222-54-196.unifiedlayer.com (67.222.54.196): icmp_seq=12 ttl=48 time=248 ms
^C
--- www.armdesigner.com ping statistics ---
12 packets transmitted, 7 received, 41.6667% packet loss, time 11990ms
rtt min/avg/max/mdev = 203.841/222.427/263.640/21.838 ms

63

Customize the embedded system based on Your Idea

7.17.2 Bluetooth

On Buildroot, Bluetooth is by default configured to be used as a Bluetooth speaker.

Step 1: Set the Bluetooth adapter to be discoverable.

# hciconfig hci0 piscan

Step 2: Control and configure the Bluetooth device.

# bluetoothctl

root@rk3566-buildroot:/# hciconfig hci0 piscan
root@rk3566-buildroot:/# bluetoothctl
hci0 new_settings: powered connectable discoverable bondable ssp br/edr le secure-conn
Agent registered
[CHG] Controller 60:FB:00:75:AC:D5 Pairable: yes
[bluetooth]#

Step 3: On the phone, locate the device name of the speaker: BlueZ 5.77, and click to

connect.

Step 4: Permissions must be confirmed on both the phone and the speaker.

Phone:

64

Customize the embedded system based on Your Idea

Bluetooth speaker:

root@rk3566-buildroot:/# hciconfig hci0 piscan
root@rk3566-buildroot:/# bluetoothctl
hci0 new_settings: powered connectable discoverable bondable ssp br/edr le secure-conn
Agent registered
[CHG] Controller 60:FB:00:75:AC:D5 Pairable: yes
hci0 A8:35:12:9A:EB:4D type BR/EDR connected eir_len 11
[CHG] Device A8:35:12:9A:EB:4D INFO: 0x000f (15)
[CHG] Device A8:35:12:9A:EB:4D Connected: yes
Request confirmation
[agent] Confirm passkey 979495 (yes/no): yes
hci0 new_link_key A8:35:12:9A:EB:4D type 0x05 pin_len 0 store_hint 1
Authorize service
[agent] Authorize service 00001108-0000-1000-8000-00805f9b34fb (yes/no): yes
Authorize service
[agent] Authorize service 0000110d-0000-1000-8000-00805f9b34fb (yes/no): yes
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000046a-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001105-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000110a-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000110c-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000110d-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001112-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001115-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001116-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000111f-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000112f-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001132-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001200-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001800-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 00001801-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 0000fe35-0000-1000-8000-00805f9b34fb
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 11c8b310-80e4-4276-afc0-f81590b2177f
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 8ce255c0-200a-11e0-ac64-0800200c9a66
[CHG] Device A8:35:12:9A:EB:4D UUIDs: 9664aa26-d76c-43ad-9775-d310f253a408
[NEW] Endpoint /org/bluez/hci0/dev_A8_35_12_9A_EB_4D/sep1
[NEW] Endpoint /org/bluez/hci0/dev_A8_35_12_9A_EB_4D/sep2
[NEW] Endpoint /org/bluez/hci0/dev_A8_35_12_9A_EB_4D/sep3
[NEW] Endpoint /org/bluez/hci0/dev_A8_35_12_9A_EB_4D/sep4
[NEW] Transport /org/bluez/hci0/dev_A8_35_12_9A_EB_4D/fd0
[liuy]#

Step 5: The connection is successful.

65

Customize the embedded system based on Your Idea

7.18 Video Playback

(1) The directory for the built-in video testing scripts in the system: /rockchip-test/video

root@rk3566-buildroot:/# ls /rockchip-test/video/
test_gst_multivideo.sh  test_gst_video_fps.sh     video_stresstest.sh
test_gst_video.sh       test_gst_video_maxfps.sh  video_test.sh

Simply execute the script.

root@rk3566-buildroot:/# /rockchip-test/video/test_gst_video.sh
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Redistribute latency...
mpp[1471]: mpp_info: mpp version: ab796560 author: Herman Chen   2024-12-30 docs: Update 1.0.8 CHANGELOG.md
mpp[1471]: mpp_info: mpp version: ab796560 author: Herman Chen   2024-12-30 docs: Update 1.0.8 CHANGELOG.md
mpp[1471]: mpp_info: mpp version: ab796560 author: Herman Chen   2024-12-30 docs: Update 1.0.8 CHANGELOG.md
mpp[1471]: mpp: unable to create enc vp8 for soc rk3566 unsupported
mpp[1471]: mpp_info: mpp version: ab796560 author: Herman Chen   2024-12-30 docs: Update 1.0.8 CHANGELOG.md
mpp[1471]: mpp_info: mpp version: ab796560 author: Herman Chen   2024-12-30 docs: Update 1.0.8 CHANGELOG.md
Redistribute latency...
mpp[1471]: h264d_api: is_avcC=1
Pipeline is PREROLLED ...
Prerolled, waiting for async message to finish...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
Redistribute latency...
[11:05:19.952] seeing the first app
0:00:01.8 / 0:00:29.5 (6.3 %)

(2) Play the video using Google Chrome.

•  Google  Chrome  supports  video  playback  up  to  4K,  with  support  for  the  following

decoding formats: VP8, H.264, H.265, VP9, and AV1.

• However, it is only compatible with certain H.265 video files.

Execute the following command to play the video using Google Chrome：

#  chromium /media/udisk1/video/4KP30/4K30P-BLACKPINK-DDU-DU_DDU-DU.mp4

Command explanation:

• chromium: Launches the Chromium browser.

• /mnt/udisk/video/4KP30/4K30P-BLACKPINK-DDU-DU_DDU-DU.mp4: The media file path to be played.

66

Customize the embedded system based on Your Idea

root@rk3566-buildroot:/#
DU_DDU-DU.mp4uildroot:/# chromium /media/udisk1/video/4KP30/4K30P-BLACKPINK-DDU-D
[1629:1648:0321/110716.777707:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110716.778172:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110716.778652:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110716.778773:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110716.898893:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110716.899222:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1695:0321/110716.971124:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1654:0321/110716.971311:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")

Command explanation:

• export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1: Open AFBC.

• --audiosink="alsasink device=hw:0,0": Specifies the audio output device as hw:0,0.

Failed
• /mnt/udisk/video/4KP60/4KP60-exist.mp4: The media file path to be played.

(3) Use the gst-play-1.0 command to play the video.

to

to

to

to

to

to

to

to

call

call

call

call

call

call

call

call

Failed

Failed

Failed

Failed

Failed

Failed

Failed

Failed

method:

method:

method:

method:

method:

object_path=

object_path=

object_path=

(process:1629): GLib-GIO-CRITICAL **: 11:07:16.978: g_settings_schema_source_lookup: assertion 'source !=
NULL' failed
[1629:1629:0321/110717.240370:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
[1629:1629:0321/110717.240501:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
[1629:1644:0321/110717.241210:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
method:
[1629:1718:0321/110717.305515:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.Properties.Get:
/org/freedesktop/UPower:
org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.UPower was not provided by any .service
files
method:
[1629:1718:0321/110717.306669:ERROR:object_proxy.cc(576)]
org.freedesktop.UPower.GetDisplayDevice:
/org/freedesktop/UPower:
org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.UPower was not provided by any .service
files
[1629:1718:0321/110717.307700:ERROR:object_proxy.cc(576)]
method:
/org/freedesktop/UPower:
org.freedesktop.UPower.EnumerateDevices:
org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.UPower was not provided by any .service
files
# export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1
[1629:1629:0321/110717.318326:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
# gst-play-1.0 --videosink="waylandsink fullscreen=true"
[1629:1644:0321/110717.320506:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
/media/udisk1/video/4KP60/4KP60-exist.mp4 --audiosink="alsasink device=hw:0,0"
Failed to query video capabilities: Inappropriate ioctl for device
[1629:1629:0321/110717.348711:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
[1629:1644:0321/110717.349446:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1629:0321/110717.378169:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
[1629:1644:0321/110717.378717:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1629:0321/110717.405805:ERROR:object_proxy.cc(576)]
org.freedesktop.DBus.NameHasOwner: object_path= /org/freedesktop/DBus: unknown error type:
Failed to query video capabilities: Inappropriate ioctl for device
Failed to query video capabilities: Inappropriate ioctl for device
Failed to query video capabilities: Inappropriate ioctl for device
Failed to query video capabilities: Inappropriate ioctl for device
root@rk3566-buildroot:/# export GST_MPP_VIDEODEC_DEFAULT_ARM_AFBC=1
Failed to query video capabilities: Inappropriate ioctl for device
root@rk3566-buildroot:/#
Failed to query video capabilities: Inappropriate ioctl for device
/media/udisk1/video/4KP60/4KP60-exist.mp4 --audiosink="alsasink device=hw:0,0"" /
Failed to query video capabilities: Inappropriate ioctl for device
Press 'k' to see a list of keyboard shortcuts.
[1629:1648:0321/110718.404837:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
Now playing /media/udisk1/video/4KP60/4KP60-exist.mp4
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
Redistribute latency...
[1629:1648:0321/110718.405025:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
Redistribute latency...
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
Redistribute latency...
[1629:1648:0321/110718.405088:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
Redistribute latency...
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
Redistribute latency...
[1629:1648:0321/110718.405138:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
0:00:13.8 / 0:04:01.9
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405261:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405315:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405383:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405439:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405486:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405536:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405583:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405633:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405679:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110718.405725:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110721.136894:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110721.137144:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110721.137234:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[1629:1648:0321/110721.137372:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
67
[1629:1648:0321/110721.137439:ERROR:bus.cc(407)]  Failed  to  connect  to  the  bus:  Could  not  parse  server
address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")

method:

call

to

