RKDevTool Manual

Version 1.2

2018-04-02

Revision

Ver

Data

Author

Brief

Publish

Memo

1.0

1.1

2014-07-28

LY

2018-01-10

LY

1.2

2018-04-02

LY

TOC

1.  Main Function ........................................................................................................................... 4
Import Partition config .................................................................................................. 4
1.1.
1.2.
Export partition config .................................................................................................. 5
1.3.  Download image ........................................................................................................... 6
Switch ........................................................................................................................... 6
1.4.
1.5.  Dev Partition ................................................................................................................. 6
1.6.  Download update.img ................................................................................................... 7
Erase Flash .................................................................................................................... 7
1.7.
1.8.
unpack update.img ........................................................................................................ 8
1.9.  Download Boot ............................................................................................................. 8
Download gpt ............................................................................................................ 9
1.10.
1.11.  Read Capability ........................................................................................................... 10
Go Maskrom ........................................................................................................... 10
1.12.
Clear sn ................................................................................................................... 11
1.13.
2.  Problems ................................................................................................................................. 11
2.1.  Download item not exist ............................................................................................. 11
2.2.
Loading firmware failed .............................................................................................. 12
2.3.  Check chip failed ........................................................................................................ 12
2.4.  Download Boot failed ................................................................................................. 12
2.5.  Download image failed ............................................................................................... 13
2.6.  Check image failed ...................................................................................................... 13
2.7.  GPT not support .......................................................................................................... 13
3.  Notice ...................................................................................................................................... 13

1. Main Function

1.1. Import Partition config

You can import partition by load Config。You can set default config in the config.ini at
DEFAULT_IMAGE_CONFIG

1.2. Export partition config

You can save partition config by export config

1.3. Download image

Step by step：
⚫  Device enter into loader or maskrom and connect with  pc.you should

check loader at the state of maskrom

⚫  Check download item ，if address of item is zero ，you can  select

parameter to load partition

⚫  Click”Run”

1.4. Switch

Wnen tool found one msc|adb|mtp|uvc,you can click switch to enter loader

or maskrom state。

1.5. Dev Partition

You want to user partition in the device, you can click”Dev Partition”
at the loader or maskrom state.

1.6. Download update.img

Notice：
⚫  You

can

only

download

update.img

at

the

loader

or

maskrom.otherwise,switch firstly

⚫  click“Firmware” can select update.img or loader file.

1.7. Erase Flash

EraseFlash will erase all of data in the flash.
1.  click “Firmware” to select update.img or loader.bin firstly
2.  device enter into maskrom or loader and connect with pc
3.  click “EraseFlash”

1.8. unpack update.img

Unpack all of download item from update.img saving into output dir.

1.9. Download Boot

It will do two things.
1.  download ddr init code into sram and run
2.  download rockusb code into ddr and run

Or    double click”Loader”and choose ”LoaderToDDR”

1.10.  Download gpt

Gpt file have two format: parameter or partition_table.img,
Parameter pay attention to two point
1.

It must    have ”TYPE:GPT” line in the parameter.

2.if last partition will want to have all of remain room,it must have  “grow”property follow with
name.

1.11.  Read Capability

It must enable DirectLBA to download gpt,otherwise popup error”Writing gpt did not support”

1.12.  Go Maskrom

If you want device enter into maskrom at the state of loader,you can click “Go maskrom”

1.13.  Clear sn

If you want to clear sn mac … in the idblock sector3,you can click “clear sn”

2. Problems

2.1. Download item not exist

It show you uboot item is not exist。

2.2. Loading firmware failed

⚫  Check whether firmware was open by other process
⚫  Checking format of firmware failed
⚫  Firmware was modified

2.3. Check chip failed

⚫  Chip info in the firmware was different with device
⚫  Click”ReadChipInfo” to get chip info from device,chip info show at

the red circle

⚫  Creating update.img need use chip parameter at the green circle

2.4. Download Boot failed

⚫  Detect ddr hardware

⚫  Check loader if match with device

2.5. Download image failed

⚫  Update tool and loader
⚫  Connect device with pc into back usb port
⚫  Detect flash hardware

2.6. Check image failed

⚫  Confirm that partition size is enough in the parameter
⚫  Flash driver has some bug,erase flash and retry
⚫  Test ddr with tool

2.7. GPT not support

click“Read Capability” to confirm if function of DirectLBA is enabled

3. Notice

⚫  Copy tool into dir including only ascii char under the non-chinese os
⚫  Tool must run under the administrator account
⚫  After updating Config.ini，it will be effect to restart tool .

