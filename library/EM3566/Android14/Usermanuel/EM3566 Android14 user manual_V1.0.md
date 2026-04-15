| EM3566 | Android14 | User | Manual |
| ------ | --------- | ---- | ------ |
V1.0
|     | Boardcon | Embedded | Designer |
| --- | -------- | -------- | -------- |

Customizetheembeddedsystembasedon YourIdea
Overview
The content of this document is only described for the development board Idea3588s,
aiming to help users quickly understand, apply and develop the Idea3588s development
board.
| System           | Support |           |     |     |
| ---------------- | ------- | --------- | --- | --- |
| DevelopmentBoard |         | Android14 |     | N   |
EM3566_V3
|     |     | Y   |     | N   |
| --- | --- | --- | --- | --- |
CM3566_V3
| Revision | History    |        |                 |     |
| -------- | ---------- | ------ | --------------- | --- |
| Version  | Date       | Author | RevisionHistory |     |
| V1.0     | 2025-01-21 | Wugk   | Initial version |     |
Disclaimer
The information provided in this document is not warranted for accuracy and is
subject to change without notice. Boardcon explicitly reserves the right to amend or
alterthecontent of thisdocument at any timewithoutprior notification.
| Boardconembedded | design | limited |     |     |
| ---------------- | ------ | ------- | --- | --- |
2508HaofangTianjiPlaza, 11008BeihuanAvenue, Nanshan District,
| Shenzhen,Guangdong,     | China. | 518051            |     |     |
| ----------------------- | ------ | ----------------- | --- | --- |
| URL:www.armdesigner.com |        | |www.boardcon.com |     |     |
Email:market@armdesigner.com
| Technical            | SupportInquiries:support@armdesigner.com |     |     |     |
| -------------------- | ---------------------------------------- | --- | --- | --- |
| Tel:+86-755-26481393 | |+86-755-27571591                        |     |     |     |
1

Customizetheembeddedsystembasedon YourIdea
Content
1.Introduction.....................................................................................................................4
1.1Overview..............................................................................................................4
1.2ProductParameters..............................................................................................5
1.3Hardware Interface Introduction..........................................................................6
2.InstallDrivers andTool..................................................................................................8
2.1InstallRKDriverAssitant...................................................................................8
2.2InstallCH9102XDriver....................................................................................10
2.2.1Howto Connect theSerial PortTool......................................................10
2.2.2InstallDriver...........................................................................................10
2.3InstallSerialTerminalTool................................................................................11
3.Upgrade Introduction....................................................................................................14
3.1Upgrade Mode...................................................................................................14
3.1.1Howto EnterLoader Mode....................................................................14
3.1.2Howto EnterMaskRom Mode...............................................................16
3.2Burn firmware....................................................................................................17
3.2.1Burn Update.img Firmware....................................................................17
3.2.2Burn SplitFirmware...............................................................................19
4.Development Environment...........................................................................................20
4.1Preparing theDevelopment Environment.........................................................20
4.2InstallingLibraries andToolkits........................................................................20
4.3InstallJDK.........................................................................................................21
5.CompileSource............................................................................................................21
6.Android14Test.............................................................................................................23
6.1SerialTerminal...................................................................................................23
6.2Display...............................................................................................................24
6.3MICROUSB.....................................................................................................25
6.3.1ADB........................................................................................................25
2

Customizetheembeddedsystembasedon YourIdea
6.4Ethernet..............................................................................................................26
6.5WiFi & Bluetooth..............................................................................................31
6.5.1WiFi........................................................................................................31
6.5.2Bluetooth.................................................................................................36
6.64G& GPS..........................................................................................................39
6.6.14GTest....................................................................................................39
6.6.2GPSTest.................................................................................................41
6.7SDCard.............................................................................................................42
6.8M.2SSD............................................................................................................43
6.9Headset..............................................................................................................45
6.10UART...............................................................................................................47
6.11RS485...............................................................................................................49
6.12IR.....................................................................................................................50
6.13RTC..................................................................................................................51
6.14Camera.............................................................................................................52
6.15ADC.................................................................................................................55
3

Customizetheembeddedsystembasedon YourIdea
1.Introduction
1.1 Overview
EM3566 isadevelopment board designed based onBoardcon core boardCM3566.The
coreboard of CM3566uses RK3566 as thecore chip ofthesystem. It is aquad-core
ARMCortex-A55 processorwith lowpower consumption and high performance,
designed forpersonal mobileInternet devices andAIoTdevices. CM3566 core board
supportsRAM upto 8G,eMMC flash upto128G,H.264 decoder support 4K@60fps,
H.265 decoder support 4K@60fps, H.264/H.265 encoder support 1080p@60fps,And
high quality JPEGcodec.
EM3566 provides rich peripheral functions, support video display outputupto
4K@60fps, supportWIFI and Bluetooth, support Ethernet, support 4Gmodule, support
USB3.0, support external storage, etc.
4

|             |            |           | Customizetheembeddedsystembasedon |                                |            | YourIdea |
| ----------- | ---------- | --------- | --------------------------------- | ------------------------------ | ---------- | -------- |
| 1.2 Product | Parameters |           |                                   |                                |            |          |
|             |            |           | Basic Parameters                  |                                |            |          |
| SOC         |            | RK3566    |                                   |                                |            |          |
| CPU         |            | Quad-core | 64-bitARM                         | Cortex-A55@                    | upto1.8GHz |          |
|             |            | Support   | OpenGLES                          | 1.1/2.0/3.2,OpenCL2.0andVulkan |            |          |
GPU
1.1
| NPU |     | Support | INT8/INT16/FP16/BFP16   |     | MAC hybrid     | operation |
| --- | --- | ------- | ----------------------- | --- | -------------- | --------- |
|     |     | Support | 4K60fps H.265/H.264/VP9 |     | video decoding |           |
Video
|          |         | Support    | 1080P@60fpsH.265/H.264 |      | video encoding |     |
| -------- | ------- | ---------- | ---------------------- | ---- | -------------- | --- |
| RAM      |         | Support    | 2GB/4GB/8GB            |      |                |     |
| Storage  |         | Support    | 32GB/64GB/128GB        | eMMC |                |     |
|          |         | Support    | M.2PCIe 2.0NVMESSD     |      |                |     |
| Extended | Storage |            |                        |      |                |     |
|          |         | SupportTF  | Card Slot              |      |                |     |
| Support  | system  | Android14  |                        |      |                |     |
|          |         | Electrical | Parameters             |      |                |     |
Power supplyinput
12V/3A
voltage
| RTCinput  | voltage     | 3V         |            |     |     |     |
| --------- | ----------- | ---------- | ---------- | --- | --- | --- |
| Operating | temperature | 0~70º      |            |     |     |     |
| Storage   | temperature | -40~85º    |            |     |     |     |
|           |             | Structural | Parameters |     |     |     |
Motherboard
135mmx95mm
dimensions
| Platelayer |     | 4floors |     |     |     |     |
| ---------- | --- | ------- | --- | --- | --- | --- |
5

Customizetheembeddedsystembasedon YourIdea
| 1.3 Hardware | Interface | Introduction |
| ------------ | --------- | ------------ |
Interface parameters
| Powerin | 12VDC power | input |
| ------- | ----------- | ----- |
6

|           |      |              |                 |                   | Customizetheembeddedsystembasedon |     |     |     | YourIdea |
| --------- | ---- | ------------ | --------------- | ----------------- | --------------------------------- | --- | --- | --- | -------- |
| Headphone |      | Earphone     | output,earphone |                   | recording                         |     |     |     |          |
| USB3.0    | Host | USB3.0       | Host            | interface         |                                   |     |     |     |          |
| USBOTG    |      | OTG download |                 | interface         |                                   |     |     |     |          |
| HDMI      |      | HDMI2.0      | output          | interface         |                                   |     |     |     |          |
|           |      | Gigabit      | Ethernet        | RJ45interface,via |                                   |     |     |     |          |
Ethernet
Realtek RTL8211F-CGcontroller
| 2xUSB2.0  | Host    | Dual-layer  | USB2.0HOSTinterface |            |         |               |                |     |     |
| --------- | ------- | ----------- | ------------------- | ---------- | ------- | ------------- | -------------- | --- | --- |
| USB2.0    | Host(1) | USB2.0      | HOSTinterface,      |            | USB     | expansionport |                |     |     |
| USB2.0    | Host(2) | USB2.0      | HOSTinterface,      |            | USB     | expansionport |                |     |     |
| RTC       |         | RTCcoin     | cell                | connector  |         |               |                |     |     |
| Camera(1) |         | MIPI camera |                     | interface, | connect | the           | camera OV13850 |     |     |
| Camera(2) |         | MIPI camera |                     | interface, | reuse   | I2C4          | withcamera1    |     |     |
IR PWM3control interface, connected to theinfrared receiving head
| RS485 |     | RS485data   | transmissioninterface |           |      |     |     |     |     |
| ----- | --- | ----------- | --------------------- | --------- | ---- | --- | --- | --- | --- |
| Debug |     | UART2,debug |                       | theserial | port |     |     |     |     |
LVDS/MIPI/ED
|     |     | Display | interface, | capacitivetouch |     |     | screen LVDS | isused | bydefault |
| --- | --- | ------- | ---------- | --------------- | --- | --- | ----------- | ------ | --------- |
P
| GPIO  |     | GPIO extensioninterface |              |           |         |      |                     |     |     |
| ----- | --- | ----------------------- | ------------ | --------- | ------- | ---- | ------------------- | --- | --- |
| UART2 |     | UART5,TTLlevel          |              | interface |         |      |                     |     |     |
| UART1 |     | UART4,TTLlevel          |              | interface |         |      |                     |     |     |
|       |     | Recovery                | button,which |           | is used | when | upgrading,orvolume+ |     |     |
Recovery
button
|     |     | RTL8723DS, |     | 802.11b/g/n | 150Mbps1T1R |     | SDIOWiFiand |     | BT  |
| --- | --- | ---------- | --- | ----------- | ----------- | --- | ----------- | --- | --- |
WIFI&BT
combo Module
SIM Card
NanoSIMcardport
| SDCard |     | MicroSDcardslot |           |     |     |     |     |     |     |
| ------ | --- | --------------- | --------- | --- | --- | --- | --- | --- | --- |
| ADC    |     | ADC output      | interface |     |     |     |     |     |     |
7

|           |        |     |           |           |              | Customizetheembeddedsystembasedon |           |     |     | YourIdea |
| --------- | ------ | --- | --------- | --------- | ------------ | --------------------------------- | --------- | --- | --- | -------- |
| SATAPower |        |     | 5Vvoltage |           | output       |                                   |           |     |     |          |
| M.2SSD    |        |     | M.2PCIe   | 2.0socket |              |                                   |           |     |     |          |
| mPCIE     | 4G&GPS |     | The       | EC204G    | moduleisused |                                   | bydefault |     |     |          |
| 2.Install |        |     | Drivers   |           |              | and                               | Tool      |     |     |          |
To download firmware and debug in the terminal, the following drivers and software
| need | tobeinstalled |                  | (forWindows |     | computers):       |     |     |         |        |              |
| ---- | ------------- | ---------------- | ----------- | --- | ----------------- | --- | --- | ------- | ------ | ------------ |
|      | Number        | Drivername       |             |     | Driver            |     |     | Use     |        |              |
|      |               |                  |             |     |                   |     |     | OTG USB | driver | installation |
|      | 1             | RKDriverAssitant |             |     | DriverInstall.exe |     |     |         |        |              |
assitant
|        | 2       | CH9102x                                  |     |        | SETUP.EXE     |          |     | Serial port | debugging | driver |
| ------ | ------- | ---------------------------------------- | --- | ------ | ------------- | -------- | --- | ----------- | --------- | ------ |
|        | 3       | SerialTerminalTool                       |     |        | SecureCRT.exe |          |     | Debugging   | tool      |        |
| 2.1    | Install |                                          | RK  | Driver |               | Assitant |     |             |           |        |
| Step1: | Open    | DriverAssitant_v5.1.3/DriverInstall.exe. |     |        |               |          |     |             |           |        |
Step2:Toavoid driverconflicts, click “Uninstall Driver”to uninstallthedriver.
| Step3: | Click | button“Install |     | Driver”toinst |     |     |     |     |     |     |
| ------ | ----- | -------------- | --- | ------------- | --- | --- | --- | --- | --- | --- |
all.
8

Customizetheembeddedsystembasedon YourIdea
| Step4:Afterthe | installation | is  | complete, | co  |     |
| -------------- | ------------ | --- | --------- | --- | --- |
nnect theboard and PC withType-C USBcable and press theRecovery key and hold
then powerthe board,thefollowing information isdisplayed intheComputerDevice
| Manager,indicating     |     | that theUSB       | driverwas | successfully | installed. |
| ---------------------- | --- | ----------------- | --------- | ------------ | ---------- |
| Step5: If thefollowing |     | deviceinformation |           | a            |            |
ppears in theDevice Manager after the operation in Step 4,user needto proceed to the
nextstep.
Step6:TheWINDOWwillpopupfound NewHardwareWizard dialog box,choose to
installfrom thespecified location, and then select:DriverAssitant_v5.1.3/ADBDriver.
Step7:Afterthe installation is completed, the followingdevice information can be seen
| intheComputerDevice |     | Manager. |     |     |     |
| ------------------- | --- | -------- | --- | --- | --- |
9

Customizetheembeddedsystembasedon YourIdea
| 2.2 Install              | CH9102X               |                  | Driver      |                    |                 |
| ------------------------ | --------------------- | ---------------- | ----------- | ------------------ | --------------- |
| 2.2.1 How                | to Connect            | the              | Serial      | Port               | Tool            |
| Pin                      |                       | Connection       | Description |                    |                 |
| RXD                      |                       | Receive,         | connect     | toTXpinoftheboard. |                 |
| TXD                      |                       | Transmit,connect |             | to RXpin           | oftheboard.     |
| GND                      |                       | Ground,          | connect     | to GND             | pinof theboard. |
| 3V3                      |                       | Noneed           | to connect. |                    |                 |
| 2.2.2 Install            | Driver                |                  |             |                    |                 |
| Step1: Plug              | theCH9102XModuletothe |                  |             | PC                 |                 |
| Step2: UnzipCH343SER.ZIP |                       | onWindows.       |             |                    |                 |
Step3: Select and installthecorresponding SETUP.EXE according to thecomputer
properties.
10

Customizetheembeddedsystembasedon YourIdea
Step 4: After the installation is completed, the device will be listed under Device
| Managerports | with uniqueserial | port     | assigned. |
| ------------ | ----------------- | -------- | --------- |
| 2.3 Install  | Serial            | Terminal | Tool      |
Theserial terminal SecureCRTis usedfor debugging inWindows. It can be used
| directly after                     | decompression.          |     |                    |
| ---------------------------------- | ----------------------- | --- | ------------------ |
| Step1: UnzipPlatform/SecureCRT.rar |                         |     | onPC.              |
| Step2: Click                       | SecureCRT/SecureCRT.exe |     | open theSecureCRT. |
11

Customizetheembeddedsystembasedon YourIdea
Step3: Confirm that theCH9102Xdriver has been installed andtheCH9102X module
| isconnecting to thePC. |     |     |
| ---------------------- | --- | --- |
Step4: Click the“QuickConnect”button to go to theQuick Connect configuration
screen.
| Step5: Configureas | shown in thefollowing | figure. |
| ------------------ | --------------------- | ------- |
12

Customizetheembeddedsystembasedon YourIdea
Step6:Afterclicking “Connect”button, theterminal serial interface will be
successfully accessed.
13

Customizetheembeddedsystembasedon YourIdea
| 3.Upgrade   |      | Introduction |     |     |
| ----------- | ---- | ------------ | --- | --- |
| 3.1 Upgrade | Mode |              |     |     |
(1) Before upgrading the firmware via USB cable, ensure the necessary drivers are
installed. Please refer to the section Install RK Driver Assistant for installation
instructions.
| (2)There | are two modesfor | upgrading | thefirmware | viaUSB cable: |
| -------- | ---------------- | --------- | ----------- | ------------- |
• LoaderMode:This isthestandard modeused for firmware upgrades.
• MaskRomMode:This is thelastresort when thedevice is bricked. Forcing entry into
MaskRom requires hardware manipulation, which carries certain risks, and should only
| beattempted | when Loader | modeis | unavailable. |     |
| ----------- | ----------- | ------ | ------------ | --- |
| 3.1.1 How   | to Enter    | Loader | Mode         |     |
3.1.1.1Hardware
| Step1: Disconnect | thepower | adapter. |     |     |
| ----------------- | -------- | -------- | --- | --- |
Step2: Connect one end oftheType-C cable to thehost andtheother end tothe
| development    | board.               |         |                    |     |
| -------------- | -------------------- | ------- | ------------------ | --- |
| Step3: Press   | and hold theRecovery |         | button ontheboard. |     |
| Step4: Connect | thepower             | supply. |                    |     |
14

Customizetheembeddedsystembasedon YourIdea
| Step5:Afterabout | two seconds, | release theRecovery | button. |
| ---------------- | ------------ | ------------------- | ------- |
15

Customizetheembeddedsystembasedon YourIdea
In the flashing tool, "Found one LOADER Device" indicates that the device is in
Loader mode.
3.1.1.2Software
After connecting the Type-C cable, execute the following command in the serial debug
| terminal oradb    | shell.   |          |      |     |
| ----------------- | -------- | -------- | ---- | --- |
| 3.1.2 How         | to Enter | MaskRom  | Mode |     |
| Step1: Disconnect | thepower | adapter. |      |     |
Step 2: Connect one end of the Type-C cable to the host and the other end to the
| development        | board. |              |                  |         |
| ------------------ | ------ | ------------ | ---------------- | ------- |
| Step3: Usetweezers | to     | short thetwo | test pointsonthe | CM3566. |
Step4:Afterconnecting thepower cable, thedevice will enter MaskRom mode.
16

Customizetheembeddedsystembasedon YourIdea
| 3.2 Burn              | firmware   |            |          |
| --------------------- | ---------- | ---------- | -------- |
| Environment:WindowsOS |            | (Operating | System). |
| 3.2.1 Burn            | Update.img | Firmware   |          |
Step1: UnzipRKDevTool_v3.30_for_window.zip onWindows.
Step2: Open
RKDevTool_v3.30_for_window\RKDevTool_v3.30_for_window\RKDevTool_v3.30_for_
window\RKDevTool.exe.
| Step3: Switch | toloadermode. |     |     |
| ------------- | ------------- | --- | --- |
17

Customizetheembeddedsystembasedon YourIdea
Step 4: Click Upgrade Firmware -> Firmware, select update.img, then click
| Upgradeto flash.  |             |                            |         |
| ----------------- | ----------- | -------------------------- | ------- |
| Afterthe flashing | iscomplete, | theboard willautomatically | reboot. |
18

Customizetheembeddedsystembasedon YourIdea
| 3.2.2 Burn    | Split Firmware |     |     |
| ------------- | -------------- | --- | --- |
| Step1: Switch | toLoadermode.  |     |     |
Step2: Check the partitionsto be flashed, multiple partitionscan beselected.
Step 3: Ensure the image file path is correct. If necessary, click the blank cell next to the
| path toreselect | it.                  |                            |         |
| --------------- | -------------------- | -------------------------- | ------- |
| Step4: Click    | theRunbutton         | toflash theimage.          |         |
| Afterthe        | flashing iscomplete, | theboard willautomatically | reboot. |
19

Customizetheembeddedsystembasedon YourIdea
| 4.Development |           |     |     |             | Environment |             |     |
| ------------- | --------- | --- | --- | ----------- | ----------- | ----------- | --- |
| 4.1           | Preparing |     | the | Development |             | Environment |     |
It is recommended to use Ubuntu 22.04 or higher version for compilation. If you
encounter an error during compilation, user can check the error message and install the
corresponding software packages accordingly. Other Linux versions may need to adjust
the software package accordingly.In addition to the system requirements, there are other
| hardwareand |            | software     | requirements.     |          |              |                      |       |
| ----------- | ---------- | ------------ | ----------------- | -------- | ------------ | -------------------- | ----- |
| Hardware    |            | requirements |                   |          |              | Softwarerequirements |       |
| 64-bit      | system,    | hard         | disk space        | shouldbe | greater      |                      |       |
| than200G.   |            | If you       | domultiplebuilds, |          | you will     | Ubuntu               | 22.04 |
| need        | morehard   | drive        | space.            |          |              |                      |       |
| 4.2         | Installing |              | Libraries         |          | and Toolkits |                      |       |
Thecontents ofthis directory only providethesoftware package installationcommands
thatare needed to buildthecompiled SDKenvironment. Please install othertools such
| as        | sambaand | sshyourself. |        |                     |         |     |            |
| --------- | -------- | ------------ | ------ | ------------------- | ------- | --- | ---------- |
|           |          | PC OS        |        |                     | Network |     | Permission |
|           | Ubuntu   | 22.04        |        |                     | online  |     | root       |
| Toinstall |          | therequired  | tools, | executethefollowing |         |     |            |
commands:
20

Customizetheembeddedsystembasedon YourIdea
| 4.3 Install |     | JDK    |     |     |
| ----------- | --- | ------ | --- | --- |
| 5.Compile   |     | Source |     |     |
Step1: UnziptheSource
| Toextract    | the source       | files, executethefollowing |       | commands: |
| ------------ | ---------------- | -------------------------- | ----- | --------- |
| Step2:Select | thecorresponding |                            | board | level     |
Step3: CompileU-Boot
| TocompileU-Boot, |     | execute | thefollowing | command: |
| ---------------- | --- | ------- | ------------ | -------- |
Step4: CompiletheKernel
| Tocompilethe | kernel, | execute | thefollowing | command: |
| ------------ | ------- | ------- | ------------ | -------- |
21

Customizetheembeddedsystembasedon YourIdea
Othercompilinginstruction
| Onlycompile  |                   | kernel | to generate |     | boot.img |     |     |
| ------------ | ----------------- | ------ | ----------- | --- | -------- | --- | --- |
| Export clang | totheenvironment: |        |             |     |          |     |     |
user can flash boot.img under the catalogue of kernel-6.1 directly to boot position of
machine after compiling, and please load the partition table (parameter.txt) when
| flashing, | forfearof | flashing |     | to thewrong |     | place. |     |
| --------- | --------- | -------- | --- | ----------- | --- | ------ | --- |
Step5: CompileAndroid
| Tocompileandroid,executethe |            |          |                     | following |     | command: |            |
| --------------------------- | ---------- | -------- | ------------------- | --------- | --- | -------- | ---------- |
| Step6:                      | Generate   | andCheck |                     | Firmwares |     |          |            |
| Togenerate                  | firmware,  |          | executethefollowing |           |     | command: |            |
| Images and                  | update.img |          | are                 | generated | in  | rockdev/ | directory. |
One-clickcompilation
22

Customizetheembeddedsystembasedon YourIdea
| 6.Android14 |          | Test |     |
| ----------- | -------- | ---- | --- |
| 6.1 Serial  | Terminal |      |     |
Connect the board and PC with USB Serial cable, then power on, the terminal will
| outputboot | information.Thedefault | baudrateis       | 1500000. |
| ---------- | ---------------------- | ---------------- | -------- |
| Executethe | following command      | to switch toroot | mode:    |
23

Customizetheembeddedsystembasedon YourIdea
6.2 Display
| Connect    | theboard and monitorwith | a HDMI cable,  | then start up. |
| ---------- | ------------------------ | -------------- | -------------- |
| Thedisplay | effect diagram           | is as follows: |                |
24

Customizetheembeddedsystembasedon YourIdea
| 6.3 MICRO | USB |     |     |
| --------- | --- | --- | --- |
6.3.1 ADB
| Step1: Connect          | theboard | and PChostwith | micro USB. |
| ----------------------- | -------- | -------------- | ---------- |
| Step2: InstallADBdriver |          | onWindows      | system.    |
Step3: Press Windows +R toopen theRun program.Type “cmd”and press Enter.
| Step4: Executethefollowing |     | command | toenableADB. |
| -------------------------- | --- | ------- | ------------ |
25

Customizetheembeddedsystembasedon YourIdea
6.4 Ethernet
Step1: Connect thenetwork cable to theEthernet port.
According to thelog, it can be seen that the Gigabit Ethernet recognition issuccessful.
Step 2:After connecting the Ethernet cable, the following icon will appear in the upper
right corner ofthedesktop, indicating that theEthernet connection issuccessful.
26

Customizetheembeddedsystembasedon YourIdea
Step3:Testtheethernet connection.
27

Customizetheembeddedsystembasedon YourIdea
Users can also choose to use the ping command to test the connectivity of the Ethernet,
as shown below:
• Viewnetwork interfaceinformation.
28

Customizetheembeddedsystembasedon YourIdea
•
| Network | connection | test. |     |
| ------- | ---------- | ----- | --- |
| 6.5 USB | Host       |       |     |
The USB host can be used to connect devices such as USB mouse, USB keyboards,
| USBflash | drives, and | other USBperipherals. |     |
| -------- | ----------- | --------------------- | --- |
Afterconnecting theUSB flash drive, users can open the appto check theauto-mount
| status,and | then access | thedevice | contents. |
| ---------- | ----------- | --------- | --------- |
29

Customizetheembeddedsystembasedon YourIdea
The user can identify whether the mounted flash drive is USB 2.0 or USB 3.0 from the
debug log.
| •USB2.0 print | information | in high-speed | mode. |
| ------------- | ----------- | ------------- | ----- |
30

Customizetheembeddedsystembasedon YourIdea
| •USB3.0  | print information | in SuperSpeed | mode. |
| -------- | ----------------- | ------------- | ----- |
| 6.6 WiFi | & Bluetooth       |               |       |
TouseWi-Fi and Bluetooth functions properly,theantenna needs to beconnected.
6.6.1 WiFi
| Step1: Open | theSettings | app. |     |
| ----------- | ----------- | ---- | --- |
31

Customizetheembeddedsystembasedon YourIdea
| Step2: Open | the"Network&  | Internet" | option. |
| ----------- | ------------- | --------- | ------- |
| Step3: Open | the"Internet" | option.   |         |
32

Customizetheembeddedsystembasedon YourIdea
| Step4: Select | and connect | to thehotspotfrom | theWi-Fi list. |
| ------------- | ----------- | ----------------- | -------------- |
33

Customizetheembeddedsystembasedon YourIdea
| Step5:Wi-Fi | connection | test. |
| ----------- | ---------- | ----- |
34

Customizetheembeddedsystembasedon YourIdea
Users can also choose to use the ping command to test the connectivity of the wifi, as
shownbelow:
(1) Viewnetwork interface information.
35

Customizetheembeddedsystembasedon YourIdea
(2)
| Network | connection | test. |
| ------- | ---------- | ----- |
6.6.2 Bluetooth
| Step1: Open | theSettings | app. |
| ----------- | ----------- | ---- |
36

Customizetheembeddedsystembasedon YourIdea
| Step2: Open | the"Connected | devices" option. |
| ----------- | ------------- | ---------------- |
Step3: Open the"Pairnewdevice" option,and start scanning fordevices.
37

Customizetheembeddedsystembasedon YourIdea
| Step3: User | can pairthemselves | intheBluetooth | device list. |
| ----------- | ------------------ | -------------- | ------------ |
After successful configuration, Bluetooth devices can communicate with each other
directly.
38

Customizetheembeddedsystembasedon YourIdea
| 6.7 4G         | & GPS      |                |                  |
| -------------- | ---------- | -------------- | ---------------- |
| Step1: Insert  | 4Gmoduleto | PCIe socket    | (4G model:EC20). |
| Step2: Connect | antenna    | and insert SIM | card.            |
Step3: Poweron.
| 6.7.1 4G | Test |     |     |
| -------- | ---- | --- | --- |
The following icon appears in the upper right corner of the desktop, indicating that the
| 4Gconnection | is successful. |     |     |
| ------------ | -------------- | --- | --- |
39

Customizetheembeddedsystembasedon YourIdea
Testthe4Gconnection:
Users can also choose to use the ping command to test the connectivity of the 4G, as
shownbelow:
•Viewnetwork interfaceinformation.
40

Customizetheembeddedsystembasedon YourIdea
| •Network | connection | test. |
| -------- | ---------- | ----- |
| 6.7.2    | GPS Test   |       |
Opentheapp tocheck the numberof satellitesand theirpositioning.
41

Customizetheembeddedsystembasedon YourIdea
| 6.8 SD        | Card            |              |       |
| ------------- | --------------- | ------------ | ----- |
| Step1: Insert | themicro SDcard | intothe card | slot. |
Step2: Users canopen theapp tocheck theauto-mount status,and thenaccess the
devicecontents.
42

Customizetheembeddedsystembasedon YourIdea
6.9 M.2 SSD
Forthefirst time,format them.2ssd ontheAndroid operating system.
Step 1,connect M.2SSDdevice.
43

Customizetheembeddedsystembasedon YourIdea
Step 2,opentheExplorerAPPto viewtheM.2 SSDdevice auto-mount directory.
44

Customizetheembeddedsystembasedon YourIdea
6.10 Headset
| Step 1,plugthe              | headphones | intotheheadphone | jack.           |
| --------------------------- | ---------- | ---------------- | --------------- |
| Step 2,opentheSoundRecorder |            | app fora         | recording test. |
45

Customizetheembeddedsystembasedon YourIdea
| Step 3,click | thebutton | as shown below | tostart recording.  |
| ------------ | --------- | -------------- | ------------------- |
| Step 4,click | thebutton | as shown below | toend therecording. |
46

Customizetheembeddedsystembasedon YourIdea
| Step 5,click | thebutton | as shown below | toplay therecording. |
| ------------ | --------- | -------------- | -------------------- |
6.11 UART
| Step1: Short | circuit | RXandTXpins | ofUART. |
| ------------ | ------- | ----------- | ------- |
47

Customizetheembeddedsystembasedon YourIdea
Step2: UART1test.
Step3,UART2test.
48

Customizetheembeddedsystembasedon YourIdea
6.12 RS485
Step1:Asshown in thediagram, connect the RS485 test toolto thedevelopment board.
Step 2:Open thecorresponding serial terminal, set thebaud rate of theboard to 1500000,
and set thebaudrate of theRS485test toolto115200.
49

Customizetheembeddedsystembasedon YourIdea
Step 3: Execute the following command on the board to test the RS485transmission and
receptionfunctionality.
6.13 IR
50

Customizetheembeddedsystembasedon YourIdea
| Step1: | Open IR debugging |     | print. |
| ------ | ----------------- | --- | ------ |
Step 2: When pressing a button on the remote control towards the IR receiver, the key
| valuewill | beprinted | to thelog. |     |
| --------- | --------- | ---------- | --- |
6.14 RTC
| Step1: | Install thecoin | cell  | battery. |
| ------ | --------------- | ----- | -------- |
| Step2: | Set thesystem   | time. |          |
51

Customizetheembeddedsystembasedon YourIdea
| Step3:Writethesystem |            | timetothe hardwareclock. |       |
| -------------------- | ---------- | ------------------------ | ----- |
| Step4: Display       | thecurrent | hardware clock           | time. |
Step 5: Power off, after a period of time to turn on the power again, check whether the
timeis saved.
6.15 Camera
EM3566 Android14 system is configured with the camera0 by default, as shown in the
figurebelow.
52

Customizetheembeddedsystembasedon YourIdea
| Step1: Open | theCamera | app. |
| ----------- | --------- | ---- |
Step2:Takeapicture.
53

Customizetheembeddedsystembasedon YourIdea
Step 3:Switch to video recording modebyswiping from the left side ofthe screen to the
right.
Step4:Video recording.
54

Customizetheembeddedsystembasedon YourIdea
6.16 ADC
ExecutethefollowingcommandtotestADC:
| Connect SARADC_VIN2 | toVDDIO_18 | execute command | again: |
| ------------------- | ---------- | --------------- | ------ |
55

Customizetheembeddedsystembasedon YourIdea
| Connect SARADC_VIN2 | to GNDexecute | command | again: |
| ------------------- | ------------- | ------- | ------ |
Thetesting methodfor SARADC_VIN3 will bethe sameas thatused for
SARADC_VIN2.
56