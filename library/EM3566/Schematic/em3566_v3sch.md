| 5   |     | 4   |     | 3   |     |     |     | 2   |     | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
EM3566 Block Diagram
D D
|     | Camera 1     | Camera 2     |          |          | USB Hub |     |     |            |     |     |
| --- | ------------ | ------------ | -------- | -------- | ------- | --- | --- | ---------- | --- | --- |
|     |              |              | LVDS OUT | MIPI LCD |         |     | OTG | USB3.0 HUB |     |     |
|     | OV13850 13MP | OV5640 500MP |          |          | USB2.0  |     |     |            |     |     |
|     | MIPI RX      |              | Option   |          |         |     |     |            |     |     |
|     |              | DVP          |          | MIPI TX  | USB 2.0 |     | OTG | USB3.0     |     |     |
|     | CM3566       |              |          | B2B      |         |     |     |            |     |     |
Fiber
C C
|     |     |     | POWER |     |     |     |     | RTL8211F |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | -------- | --- | --- |
RGMII
1000 Mb Ethenet
RK3566
3MXM
32 bits
DRAM
LPDDR4
iNAND
SDIO
8GB eMMC
B B
B2B
|     | UART/SDIO | PCIE X2 | SD1 | MDI |     | I2S |     |     | TMDS |     |
| --- | --------- | ------- | --- | --- | --- | --- | --- | --- | ---- | --- |
eDP
|     | WIFI/BT |     | SD SLOT |     |     | CODEC |     |     |     |     |
| --- | ------- | --- | ------- | --- | --- | ----- | --- | --- | --- | --- |
LCD Display
|     | 2.4/5G <300Mbps | PIC-E | Micra | RJ45 |     | ES8388 |     |               | HDMI OUT |     |
| --- | --------------- | ----- | ----- | ---- | --- | ------ | --- | ------------- | -------- | --- |
|     | AP6236 Module   |       |       |      |     |        |     | eDP interface |          |     |
MIC
HP
A A
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa +++888666---777555555---222777555777111555999111
TTTiiitttllleee
bbbllloooccckkk   dddiiiaaagggrrraaammm
DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr DDDrrraaawwwnnn RRReeevvv
SSSiiizzzeee EEEMMM333555666666 333
|     |     |     |     |     |     |     |     |     | CCC                                                                             | YYYhhhggg                         |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------- | --------------------------------- |
|     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 | SSShhheeeeeettt 111 ooofff 111444 |
| 5   |     | 4   |     | 3   |     |     |     | 2   |                                                                                 | 1                                 |

| 5   | 4   | 3   |     | 2   |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
RK3566I2C MAP
|     |     | Pull-up | Slave Addr |     | Slave Bus |     |     |
| --- | --- | ------- | ---------- | --- | --------- | --- | --- |
D Port Pin name Domain Bus name voltage Slave Device (MS 7Bits) Note Capability D
C C
I2C_SDA_HDMI HDMI
I2C_SCL_HDMI
B B
| I2C2 |     | VCC1V8_DVP |     | Camera |     |     |     |
| ---- | --- | ---------- | --- | ------ | --- | --- | --- |
| I2C1 |     | 3V3        |     | Touch  |     |     |     |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
A A
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
TTTiiitttllleee
III222CCC   MMMaaappp
|     |     |     | SSSiiizzzeee | DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr |     | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | ------------ | --------------------------------------------- | --- | --------------- | --------- |
|     |     |     |              | EEEMMM333555666666                            |     | YYYhhhggg       | 333       |
AAA444
|     |     |     | DDDaaattteee::: | TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 |     | SSShhheeeeeettt 222 | ooofff 111444 |
| --- | --- | --- | --------------- | --------------------------------------------------------------- | --- | ------------------- | ------------- |
| 5   | 4   | 3   |                 | 2                                                               |     | 1                   |               |

|     |     |     | 5   |     |     |     |     | 4   |             |     |     |     | 3   |     |     |     |     | 2   |     |     |              |     |     | 1     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- | ----- | --- | --- |
|     |     |     |     |     |     |     |     |     | VCC12V_DCIN |     |     |     |     |     |     |     |     |     |     |     | Default 5.2V |     |     | VDD5V |     |     |
U92
|     | Main Power |     |     |     |     |     |     |     |        |         |     | 4.5V<VIN<18V |     | 5         | 6   |         |         | L8301      |     |         |         |     |     |     |     |     |
| --- | ---------- | --- | --- | --- | --- | --- | --- | --- | ------ | ------- | --- | ------------ | --- | --------- | --- | ------- | ------- | ---------- | --- | ------- | ------- | --- | --- | --- | --- | --- |
|     |            |     |     |     |     |     |     |     |        |         |     |              |     | VIN       | LX  |         |         | 4.7uH/4A   |     |         |         |     |     |     |     |     |
|     |            |     |     |     |     |     |     |     | C2020  | C2021   |     |              |     | 2         | 1   | C2019 1 | 2 100nF | IND_606045 |     |         |         |     |     |     |     |     |
|     |            |     |     |     |     |     |     |     | 1 10uF | 1 100nF |     |              |     | GND       | BS  |         | X5R25V  |            |     | C2022 1 | R448    |     |     |     |     |     |
|     |            |     |     |     |     |     |     |     | X5R    | X5R     |     | 1 2          |     | 4         | 3   |         | C0402   |            | 1   | 22pF    | 232K_1% |     |     |     |     |     |
|     |            |     |     |     |     |     |     |     | 25V    | 50V     |     | R447         |     | EN FB/OUT |     |         |         |            |     | C0G     | 1%      |     |     |     |     |     |
2 C0805 2 C0603 NC/100K 5% SY8113B 50V R0402 C2023 C2024 C 2 0 2 5
|     |     |     | P1     |     |     |     |     |     |     |     |     | R0402 |      | SOT_23_6 |     |         |     |     | 2   | C0402 | CE10 | 1   | 22uF 1 22uF | 1 1 0 0 n F |     |     |
| --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | ----- | ---- | -------- | --- | ------- | --- | --- | --- | ----- | ---- | --- | ----------- | ----------- | --- | --- |
| D   |     |     | DC-12V |     |     |     |     |     |     |     |     | 1     | R449 | C2026    |     | FB=0.6V |     |     |     | 2     |      | +   | X5R X5R     | X 5 R       |     | D   |
DC-JACKJS-DC014KA > 8 V - - - >   O N NC/24K 1 100nF 10V 10V 10 V
3 F1 3A/125v VCC12V_DCIN V E N H   m i n = 1.5V 5% X5R 1 R450 220uF/16V 2 C0805 2 C0805 2 C 0 402
|     |     |     |     |     | FUSE/SMD |              |     |         |            |             |       |     | R0402 | 10V   |     |     |     |     |     |     | 30K_1% |     |     |     |     |     |
| --- | --- | --- | --- | --- | -------- | ------------ | --- | ------- | ---------- | ----------- | ----- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
|     |     |     | 1   |     |          |              |     |         |            |             |       |     | 2     | C0402 |     |     |     |     |     |     | 1%     |     |     |     |     |     |
|     |     |     |     |     |          |              |     |         |            |             |       | 2   |       |       |     |     |     |     |     |     | R0402  |     |     |     |     |     |
|     |     |     |     |     |          | TVS1         |     |         |            |             | 1     | 2   |       |       |     |     |     |     |     |     |        |     |     |     |     |     |
|     |     |     | 2   |     | SMAJ14A  |              |     | 1 C2027 | VCC3V3_SYS |             | R11   |     |       |       |     |     |     |     |     | 2   |        |     |     |     |     |     |
|     |     |     |     |     | DO214AC  | CE1          |     | + 100nF |            |             | 100K  | 5%  |       |       |     |     |     |     |     |     |        |     |     |     |     |     |
|     |     |     |     |     |          | 47uF/25V     |     | X5R     |            |             | R0402 |     |       |       |     |     |     |     |     |     |        |     |     |     |     |     |
|     |     |     |     |     |          | CV/100UF/16V |     | 2 50V   |            | V2 20210827 |       |     |       |       |     |     |     |     |     |     |        |     |     |     |     |     |
C0603
|     | DC=12V |     | 3A  |     |     |     |     |     |             |     |     |     |     |     |     |     |     |     |     |               |     |     |     |            |     |     |
| --- | ------ | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------- | --- | --- | --- | ---------- | --- | --- |
|     |        |     |     |     |     |     |     |     | VCC12V_DCIN |     |     |     |     |     |     |     |     |     |     | Default 3.33V |     |     |     | VCC3V3_SYS |     |     |
U91
|     |     |     |     |     |     |     |     |     |     |     |     | 4.5V<VIN<18V |     | 5 VIN | LX 6 |     |     | L12 |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | ----- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
4.7uH/4A
|     |     |     |     |     |     |     |            |       | C2013  | C2014   |               |     |       | 2 GND       | BS 1 C2012 | 1       | 2 100nF | IND_606045 |     |              |           |     |               |         |     |     |
| --- | --- | --- | --- | --- | --- | --- | ---------- | ----- | ------ | ------- | ------------- | --- | ----- | ----------- | ---------- | ------- | ------- | ---------- | --- | ------------ | --------- | --- | ------------- | ------- | --- | --- |
|     |     |     |     |     |     |     |            |       | 1 10uF | 1 100nF |               |     |       |             |            |         | X5R25V  |            |     | C2015 1 R444 |           |     |               |         |     |     |
|     |     |     |     |     |     |     | VCC3V3_SYS |       | X5R    | X5R     | 1             | 2   |       | 4 EN FB/OUT | 3          |         | C0402   |            | 1   | 22pF 232K_1% |           |     |               |         |     |     |
|     |     |     |     |     |     |     |            |       | 2 25V  | 2 50V   | R443          |     |       |             |            |         |         |            |     | C0G 1%       |           |     |               |         |     |     |
|     |     |     |     |     |     |     |            |       | C0805  | C0603   | 100K          | 5%  |       | SY8113B     |            |         |         |            |     | 50V R0402    | CE9       |     | C2016 C2017   | C2018   |     |     |
|     |     |     |     |     |     |     |            |       |        |         | R0402         |     |       | SOT_23_6    |            |         |         |            | 2   | C0402        |           | + 1 | 22uF 1 22uF   | 1 100nF |     |     |
|     |     |     |     |     |     |     |            | R213  |        |         |               | 1   | R445  | C2011       |            | FB=0.6V |         |            |     | 2            |           |     | X5R X5R       | X5R     |     |     |
|     |     |     |     |     |     |     |            | 4.7k  |        |         | >8V---> ON    |     | 24K 1 | 100nF       |            |         |         |            |     |              | 220uF/16V |     | 10V 10V       | 10V     |     |     |
|     |     |     |     |     |     |     |            | R0402 |        |         | VENH min=1.5V |     | 5%    | X5R         |            |         |         |            |     | 1 R446       |           | 2   | C0805 2 C0805 | 2 C0402 |     |     |
| C   |     |     |     |     |     |     |            |       |        |         |               |     | R0402 | 10V         |            |         |         |            |     | 51K_1%       |           |     |               |         |     | C   |
|     |     |     |     |     |     |     |            |       |        |         |               |     | 2     | C0402       |            |         |         |            |     | 1%           |           |     |               |         |     |     |
|     |     |     |     |     |     |     | 1          |       |        |         |               | 2   |       |             |            |         |         |            |     | R0402        |           |     |               |         |     |     |
|     |     |     |     |     |     |     |            | D4    |        |         |               |     |       |             |            |         |         |            |     | 2            |           |     |               |         |     |     |
LED_RED
LED190/SMD
|     |     |     |     |     |     |     | 2   |     |     |     |     |     |     |     |     |     |     |     |     | V2 20210827 |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- |
Vout=0.6*(1+R444/R446)
UART2DBG_TX
UART2DBG_RX
|     |         |           |            |     |     |     |     |     |     |     |     |             |     | VCC3V3_SYS |             |            |     |     |     |            |       | U5                         |       |       |          |       |
| --- | ------- | --------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | ---------- | ----------- | ---------- | --- | --- | --- | ---------- | ----- | -------------------------- | ----- | ----- | -------- | ----- |
|     |         |           | BT1        |     |     |     |     |     |     |     |     |             |     |            |             |            |     |     |     | VCC3V3_SYS |       | CL9191A18L5M/PT5108E23E-18 |       |       | VDDIO_18 |       |
|     |         |           | 1 + 2      |     |     |     |     |     |     |     |     |             |     |            |             |            |     |     |     |            |       | SOT_23_5                   |       |       |          |       |
|     | VCC_RTC |           |            |     |     |     |     |     |     |     |     |             |     |            |             |            |     |     |     |            |       | 1 IN                       | OUT 5 |       |          |       |
| B   |         |           |            |     |     |     |     |     |     |     |     |             |     | R237       |             |            |     |     |     |            |       |                            |       |       |          | B     |
|     |         |           | 3V_BATTERY |     |     |     |     |     |     |     |     |             |     | R236 10K   | V3 20220531 |            |     |     |     |            |       | 2 GND                      |       |       |          |       |
|     |         | RTC Power |            |     |     |     |     |     |     |     |     |             |     | 10K        |             |            |     |     |     |            | C111  |                            |       |       |          |       |
|     |         |           |            |     |     |     |     |     |     |     |     |             |     |            |             |            |     |     |     |            | 0.1uF | 3 EN                       | BP 4  |       |          |       |
|     |         |           |            |     |     |     |     |     |     |     |     |             |     |            |             |            |     | J10 |     |            | C0402 |                            |       |       |          |       |
|     |         |           |            |     |     |     |     |     |     |     |     | UART2DBG_RX |     |            | R365 10R    | UART2DBGRX | 1   |     |     |            |       |                            |       | C76   | C61      | C50   |
|     |         |           |            |     |     |     |     |     |     |     |     | UART2DBG_TX |     |            |             | UART2DBGTX | 2 1 |     |     |            |       |                            |       | 0.1uF | 10uF/10V | 0.1uF |
|     |         |           |            |     |     |     |     |     |     |     |     |             |     |            |             |            | 3 2 |     |     |            |       |                            |       | C0402 | C0805    | C0402 |
|     |         |           |            |     |     |     |     |     |     |     |     |             |     |            | R366 10R    |            | 3   |     |     |            |       |                            |       |       |          |       |
DEBUG
 KEY
K3
1R367100R2
|     |         |     | 1             | SARADC_VIN0_KEY/RECOVERY |     |     |     | VCC3V3_SYS  |            |     |     |     |     |          |     |          |     |          |     |     |          |     |     |     |     |     |
| --- | ------- | --- | ------------- | ------------------------ | --- | --- | --- | ----------- | ---------- | --- | --- | --- | --- | -------- | --- | -------- | --- | -------- | --- | --- | -------- | --- | --- | --- | --- | --- |
|     |         | KEY | R0402         |                          |     |     |     |             |            |     |     |     |     |          |     |          |     |          |     |     |          |     |     |     |     |     |
|     |         |     | DV16          |                          |     |     | IR  |             |            |     |     |     | H4  |          |     | H1       |     | H2       |     |     | H3       |     |     |     |     |     |
|     | RECOVER |     |               |                          |     |     |     |             |            |     |     |     |     | HOLE/GND |     | HOLE/GND |     | HOLE/GND |     |     | HOLE/GND |     |     |     |     |     |
|     |         |     | 240E2R5PP0402 |                          |     |     |     |             |            |     |     |     | 9 9 | 2 2      | 9 9 |          | 2 2 | 9 9      | 2 2 | 9 9 | 2        | 2   |     |     |     |     |
|     |         |     |               |                          |     |     |     |             |            |     |     |     | 8 8 | 3 3      | 8 8 |          | 3 3 | 8 8      | 3 3 | 8 8 | 3        | 3   |     |     |     |     |
|     |         |     | 2             |                          |     |     |     | 1 1         | C51        |     |     |     | 7 7 | 4 4      | 7 7 |          | 4 4 | 7 7      | 4 4 | 7 7 | 4        | 4   |     |     |     |     |
|     |         |     |               |                          |     |     |     | R42 R43     |            |     |     |     | 6 6 | 5 5      | 6 6 |          | 5 5 | 6 6      | 5 5 | 6 6 | 5        | 5   |     |     |     |     |
|     |         |     |               |                          |     |     |     | 10K 10R     | 1 2        |     |     |     |     |          |     |          |     |          |     |     |          |     |     |     |     |     |
|     |         |     |               |                          |     |     |     | R0402 R0402 | 10uF C0603 |     |     |     |     | 1        |     | 1        |     | 1        |     |     | 1        |     |     |     |     |     |
|     |         |     |               |                          |     |     |     | 2           | 1C522      |     |     |     |     | 1        |     | 1        |     | 1        |     |     | 1        |     |     |     |     |     |
| A   |         |     |               |                          |     |     |     | 2           |            |     |     |     |     |          |     |          |     |          |     |     |          |     |     |     |     | A   |
100nF C0402
J24
|     |     |     |     |     |     |     |     |     |     |     |     | Mark |     |     | Hole |     |     |     |     |     |     |     | BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------- | --- | --- | --- |
|     |     |     |     |     |     |     | R15 | 22R | 1   |     |     |      |     |     |      |     |     |     |     |     |     |     |                                                                 |     |     |     |
PWM3_IR 1 2 2 1 BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
3 2 M1 M2 M3 BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa +++888666---777555555---222777555777111555999111
|     |     |     |     |     |     | 2   | C3 R0402 |     | 3   |     |     |     |     |     |     |     |     |     |     |     | TTTiiitttllleee                                        |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------ | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     | 10nF     |     |     |     |     |     |     |     |     |     |     |     |     |     | PPPooowwweeerrr///MMMiiicccrrrooo   SSSDDD///KKKEEEYYY |     |     |     |     |     |
PH-3A
1 C0402 SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr DDDrrraaawwwnnn RRReeevvv
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                                                    |     |     |                 |            | 333    |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------------- | --- | --- | --------------- | ---------- | ------ |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | CCCuuussstttooommm                                                                    |     |     | YYYhhhggg       |            |        |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTThhhuuurrrsssdddaaayyy,,,   JJJuuunnneee   000222,,,   222000222222 |     |     | SSShhheeeeeettt | 333 ooofff | 111444 |
|     |     |     | 5   |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     |     | 2   |     |     |                                                                                       |     |     | 1               |            |        |

|     | 5          | 4   |     |     | 3       |     |     |     | 2               | 1                           |     |
| --- | ---------- | --- | --- | --- | ------- | --- | --- | --- | --------------- | --------------------------- | --- |
|     | eDP        |     |     |     |         |     |     |     | WIFI/BT IO 1.8V |                             |     |
|     | EDP_TX_D0P |     |     |     |         |     |     |     |                 | SDMMC1_D0                   |     |
|     | EDP_TX_D0N |     |     |     |         |     |     |     |                 | SDMMC1_D1 S D M M C 1 _ D 2 |     |
|     | EDP_TX_D1P |     |     |     | IO 1.8V |     |     |     |                 | S D M M C 1 _ D 3           |     |
EDP_TX_D1N
|     | EDP_TX_D2P |     |     |     |     |     |     |     |     | SDMMC1_CMD |     |
| --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- |
EDP_TX_D2N MD_3TSOH_2BSU PD_3TSOH_2BSU PD_2TSOH_2BSU MD_2TSOH_2BSU SDMMC1_CLK
| D   |     |     |     |     |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
EDP_TX_D3P EDP_TX_D3N 0M_OIDM_1CAMG 8V1_0M_LCS_4C2I 8V1_0M_ADS_4C2I 1M_KLC_656TB_POV 1M_0D_656TB_POV 1M_1D_656TB_POV 1M_2D_656TB_POV 1M_3D_656TB_POV 1M_4D_656TB_POV 1M_5D_656TB_POV 1M_6D_656TB_POV 1M_7D_656TB_POV WIFI_REG_ON_H WIFI_WAKE_HOST_H
|     |     |     |     | 0M_CDM_1CAMG 8V1_d_5B_4OIPG | TUOKLC_FIC NIKLC_TIB8_FIC FERH_TIB8_FIC CNYSV_TIB8_FIC | L_TSR_BAREMAC | L_TSR_FAREMAC |     |     |     |     |
| --- | --- | --- | --- | --------------------------- | ------------------------------------------------------ | ------------- | ------------- | --- | --- | --- | --- |
EDP_TX_AUXP EDP_TX_AUXN d_5A_0OIPG 0D_TIB8_FIC 1D_TIB8_FIC 2D_TIB8_FIC 3D_TIB8_FIC 4D_TIB8_FIC 5D_TIB8_FIC 6D_TIB8_FIC 7D_TIB8_FIC 2M_XT_FIDPS UART1_RX_M0 U A R T 1 _ T X _ M 0
Close to CPU board LCS_1C2I ADS_1C2I d_0A_0OIPG u_3A_0OIPG d_6A_0OIPG U A R T 1 _ R T S n _ M 0
VCC3V3_SYS U A R T 1 _ C T S n _ M 0
BT_REG_ON_H
| PCI-E/SATA |     |     |     |     |     |     |     |     |     | B T _ W A KE _ H O S T_ H |     |
| ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------- | --- |
H O S T_ W A K E _B T _ H
P C I E 2 0 _ S A T A 2 _ T X P C 3 5 1 C 3 4 9 C 3 5 0 T V S 2 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 U 7 I 2 S 2 _ S C L K _ T X _ M 0
P C I E 2 0 _ S A T A 2 _ T X N 1 C 0 0 u 8 F 0 / 5 10V 1 C 0 0 u 8 F 0 / 5 10V 0 C . 0 1 4 u 0 F 2 S S M O F D 3. 1 3 2 A 3 V2 20210827 8 1 8 1 8 1 8 1 8 1 8 1 8 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 6 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 4 1 4 1 4 1 4 1 4 1 C M3566 I 2 S 2 _ L R C K _ T X _ M 0
PCIE20_SATA2_RXP 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 1 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 I I2S2_SDI_M0 2 S 2 _ S D O _ M 0
|     | PCIE20_SATA2_RXN |     |     | 8 1 8 1 8 1 8 1 8 1 8 1 8 1 7 1 | 7 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 7 1 6 1 6 1 6 1 6 1 6 1 6 1 | 6 1 6 1 6 1 6 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 5 1 | 5 1 4 1 4 1 4 1 4 1 4 1 |     |     |     |     |
| --- | ---------------- | --- | --- | ------------------------------- | ----------------------------------------------------------- | --------------------------------------------------- | ----------------------- | --- | --- | --- | --- |
PCIE20_REFCLKP
P C I E 2 0 _ R E F C L K N 1 4 4 1 4 4 UART2DBG_TX UART2DBG_RX
|     |     |     | 1 2 1 |     |     |     |     | 1 4 3 1 1 4 4 2 3 UART5_TX_M1 |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | ----------------------------- | --- | --- | --- |
P P C C I I E E 2 2 0 0 _ _ C W L A K K R E E n Q _ n M _ 2 M 2 V C C 3 V 3_ S YS 3 2 3 1 1 4 4 1 2 1 4 1 UART5_RX_M1
P C I E 2 0 _ P E R S T n _ M 2 V C C _ R T C PMIC_32KOUT_SOC 4 5 4 1 4 0 1 1 3 4 9 0 PWM0_M0 LCD_PWREN_H C I F  I O  1 . 8 V
|     |     |     | 6 5 |     |     |     |     | 1 3 9 1 3 8 SPI3_CLK_M1 |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------------------- | --- | --- | --- |
HDMITX_CEC_M0 7 6 7 1 1 3 3 7 8 1 3 7 SPI3_MOSI_M1 C C I I F F _ _ 8 8 B B I I T T _ _ D D 0 1
V3 2022 053 1 HDMITX_SDA HDMITX_SCL 8 9 8 1 3 6 1 1 3 3 5 6 SPI3_MISO_M1 SPI3_CS0_M1 C I F _ 8 B I T _ D 2
M I P I_ R X GMAC1_RXER_M0 1 0 9 1 3 5 1 3 4 SPI0_CLK_M0 C C I I F F _ _ 8 8 B B I I T T _ _ D D 3 4
GMAC1_MCLKINOUT_M0 1 1 1 2 1 1 0 1 1 1 3 3 3 4 1 1 3 3 2 3 SPI0_MOSI_M0 SPI0_MISO_M0 C I F _ 8 B I T _ D 5
M I P I _ C S I _ R X _ D 0 P GMAC1_TXD0_M0 1 3 1 2 1 3 2 1 3 1 SPI0_CS0_M0 C I F _ 8 B I T _ D 6
M I P I _ C S I _ R X _ D 0 N GMAC1_TXD1_M0 1 4 1 1 3 4 1 1 3 3 0 1 1 3 0 C I F _ 8 B I T _ D 7
M I P I _ C S I _ R X _ D 1 P GMAC1_TXEN_M0 GMAC1_RXDV_CRS_M0 1 1 5 6 1 5 1 2 9 1 1 2 2 8 9 I2S1_MCLK_M0_PMIC I2S1_SDO0_M0_PMIC C I F _ 8 B I T _ C L K I N
M I P I _ C S I _ R X _ D 1 N GMAC1_RXD1_M0 1 7 1 6 1 2 8 1 2 7 I2S1_SCLK_TX_M0_PMIC C C I I F F _ _ 8 8 B B I I T T _ _ H V S R Y E N F C
M I P I _ C S I _ R X _ D 2 P GMAC1_RXD0_M0 GMAC1_RXD3_M0 1 8 1 1 7 8 1 1 2 2 6 7 1 2 6 I2S1_SDI0_M0/PDM_SDI0_M0_PMIC I2S1_LRCK_TX_M0_PMIC
M I P I _ C S I _ R X _ D 2 N GMAC1_RXD2_M0 1 2 9 0 1 9 1 2 5 1 1 2 2 4 5 UART4_TX_M0
M I P I _ C S I _ R X _ D 3 P GMAC1_RXCLK_M0 2 1 2 2 0 1 1 1 2 2 3 4 1 2 3 UART4_RX_M0 C I F _ C L K O U T
C M I P I _ C S I _ R X _ D 3 N GMAC1_TXD2_M0 GMAC1_TXD3_M0 2 2 2 3 2 2 1 2 2 1 1 2 2 1 2 UART3_TX_M0 UART3_RX_M0 C A M E R A F _ R S T _ L C
GMAC1_TXCLK_M0 2 4 2 3 1 2 1 1 2 0 PCIE20_CLKREQn_M2 C A M E R A B _ R S T _ L
M M I I P P I I _ _ C C S S I I _ _ R R X X _ _ C C L L K K 0 0 P N MIPI_DSI_TX0_D3N/LVDS_TX0_D3N MIPI_DSI_TX0_D3P/LVDS_TX0_D3P 2 5 2 2 4 5 1 1 1 2 9 0 1 1 9 PCIE20_PERSTn_M2 PCIE20_WAKEn_M2 I 2 C 4 _ S D A _ M 0 _ 1 V 8
MIPI_DSI_TX0_D2N/LVDS_TX0_D2N 2 2 6 7 2 6 1 1 8 1 1 1 1 7 8 I 2 C 4 _ S C L _ M 0 _ 1 V 8
M M I I P P I I _ _ C C S S I I _ _ R R X X _ _ C C L L K K 1 1 P N MIPI_DSI_TX0_D2P/LVDS_TX0_D2P 2 8 2 2 7 8 1 1 1 1 6 7 1 1 6 SARADC_VIN0_KEY/RECOVERY
MIPI_DSI_TX0_D1N/LVDS_TX0_D1N MIPI_DSI_TX0_D1P/LVDS_TX0_D1P 2 3 9 0 2 9 1 1 5 1 1 1 1 4 5 SARADC_VIN2_HP_HOOK SARADC_VIN3 G P I O 4 _ B 5 _ d _ 1 V 8
|     |     | MIPI_DSI_TX0_D0N/LVDS_TX0_D0N | 3 1 3 0     |     |     |     |     | 1 1 4 1 1 3       |            |     |     |
| --- | --- | ----------------------------- | ----------- | --- | --- | --- | --- | ----------------- | ---------- | --- | --- |
|     |     | MIPI_DSI_TX0_D0P/LVDS_TX0_D0P | 3 2 3 3 1 2 |     |     |     |     | 1 1 1 1 2 3 1 1 2 | SDMMC1_CLK |     |     |
M IP I /L V D S _ T X MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP 3 3 3 4 3 3 1 1 1 1 1 1 1 0 1 SDMMC1_CMD SDMMC1_D0 B T 6 5 6  IO 1 . 8 V
|     |     | HDMI_TX_HPDIN | 3 5 3 4 |     |     |     |     | 1 1 0 1 0 9 | SDMMC1_D1 |     |     |
| --- | --- | ------------- | ------- | --- | --- | --- | --- | ----------- | --------- | --- | --- |
M I P I _ D S I _ T X 0 _ D 0 P / L V D S _ T X 0 _ D 0 P HDMI_TXCLKN HDMI_TXCLKP 3 3 6 7 3 3 5 6 1 1 0 0 8 9 1 1 0 0 7 8 SDMMC1_D2 SDMMC1_D3 V O P _ B T 6 5 6 _ D 0 _ M 1
M I P I _ D S I _ T X 0 _ D 0 N / L V D S _ T X 0 _ D 0 N HDMI_TX0N 3 8 3 7 1 0 7 1 0 6 I2S2_SDI_M0 V O P _ B T 6 5 6 _ D 1 _ M 1
M I P I _ D S I _ T X 0 _ D 1 P / L V D S _ T X 0 _ D 1 P HDMI_TX0P 3 9 3 3 8 9 1 1 0 0 5 6 1 0 5 I2S2_SDO_M0 IO 1.8V V V O O P P _ _ B B T T 6 6 5 5 6 6 _ _ D D 2 3 _ _ M M 1 1
M I P I _ D S I _ T X 0 _ D 1 N / L V D S _ T X 0 _ D 1 N HDMI_TX1N HDMI_TX1P 4 4 0 1 4 0 1 0 4 1 1 0 0 3 4 I2S2_LRCK_TX_M0 I2S2_SCLK_TX_M0 V O P _ B T 6 5 6 _ D 4 _ M 1
HDMI_TX2N 4 2 4 1 1 0 3 1 0 2 WIFI_REG_ON_H V V O O P P _ _ B B T T 6 6 5 5 6 6 _ _ D D 5 6 _ _ M M 1 1
M M I I P P I I _ _ D D S S I I _ _ T T X X 0 0 _ _ D D 2 2 P N / / L L V V D D S S _ _ T T X X 0 0 _ _ D D 2 2 P N MIPI_CSI_RX_CLK1N HDMI_TX2P 4 3 4 4 2 3 1 1 0 0 1 2 1 0 1 HOST_WAKE_BT_H WIFI_WAKE_HOST_H V O P _ B T 6 5 6 _ D 7 _ M 1
|     |     | MIPI_CSI_RX_CLK1P | 4 4 4 5 4 4 |     |     |     |     | 1 0 0 9 1 9 0 0 | BT_WAKE_HOST_H |     |     |
| --- | --- | ----------------- | ----------- | --- | --- | --- | --- | --------------- | -------------- | --- | --- |
M M I I P P I I _ _ D D S S I I _ _ T T X X 0 0 _ _ D D 3 3 P N / / L L V V D D S S _ _ T T X X 0 0 _ _ D D 3 3 P N MIPI_CSI_RX_D3N 4 6 4 4 5 6 9 9 8 9 9 8 BT_REG_ON_H V O P _ B T 6 5 6 _ C L K _ M 1
|     |     | MIPI_CSI_RX_D3P MIPI_CSI_RX_D2N | 4 4 7 8 4 7 |     |     |     |     | 9 7 9 9 6 7 UART1_CTSn_M0 UART1_RTSn_M0 |     |     |     |
| --- | --- | ------------------------------- | ----------- | --- | --- | --- | --- | --------------------------------------- | --- | --- | --- |
M I P I _ D S I _ T X 0 _ C L K P / L V D S _ T X 0 _ C L K P MIPI_CSI_RX_D2P 4 9 4 8 9 6 9 5 UART1_TX_M0
M I P I _ D S I _ T X 0 _ C L K N / L V D S _ T X 0 _ C L K N MIPI_CSI_RX_D1P MIPI_CSI_RX_D1N 5 0 4 5 9 0 9 9 4 5 9 4 UART1_RX_M0 R G M II
5 1 5 1
GMAC1_TXD2_M0 GMAC1_TXD3_M0
G M A C 1 _ R X D 2 _ M 0
HDMI_TX 2 5 3 5 4 5 5 5 6 5 7 5 8 5 9 5 0 6 1 6 2 6 3 6 4 6 5 6 6 6 7 6 8 6 9 6 0 7 1 7 2 7 3 7 4 7 5 7 6 7 7 7 8 7 9 7 0 8 1 8 2 8 3 8 4 8 5 8 6 8 7 8 8 8 9 8 0 9 1 9 2 9 3 9 G M A C 1 _ R X D 3 _ M 0
HDMI_TX2P HDMI_TX2N 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 GMAC1_TXCLK_M0 GMAC1_RXCLK_M0
|     |                     |     | DIP186_47X40MM | 5 5 5 5 5 5 5 5 6 | 6 6 6 6 6 6 6 6 6 7 7 7 7 7 7 | 7 7 7 7 8 8 8 8 8 8 8 8 8 | 8 9 9 9 9        |     |     |               |     |
| --- | ------------------- | --- | -------------- | ----------------- | ----------------------------- | ------------------------- | ---------------- | --- | --- | ------------- | --- |
|     | HDMI_TX1P HDMI_TX1N |     |                |                   | P N P N                       |                           |                  |     |     | GMAC1_RXD0_M0 |     |
|     |                     |     |                | P                 | N N P X T X T X R X R M       | L_TED_0CMMDS              | TEDSUBV_0GTO_BSU |     |     | GMAC1_RXD1_M0 |     |
B H D M I _ T X 0 P N0KLC_XR_ISC_IPIM P0KLC_XR_ISC_IPIM X R X R X T X T P N S S _ S S _ S S _ S S _ P D _ D _ N PXUA_XT_PDE KLC_0CMMDS DMC_0CMMDS 3D_0CMMDS 2D_0CMMDS 1D_0CMMDS 0D_0CMMDS GMAC1_RXDV_CRS_M0 B
H D M I _ T X 0 N N0D_XR_ISC_IPIM P0D_XR_ISC_IPIM _ 2 A _ 2 A _ 2 A _ 2 A K L C K L C 1 T 1 T 1 T 1 T M D P D 1 T 1 T N2D_XT_PDE P 2 N 1 P 1 N 0 P 0 N 3 P 3 X U DI_0GTO_BSU GMAC1_TXD0_M0
HDMI_TXCLKP T A T A T A T A F E F E S O S O S O S O _ 0 _ 0 S O S O D _ D _ D _ D _ D _ D _ D _ A _ GMAC1_TXD1_M0
HDMI_TXCLKN MWP_LB_DCL S _ S _ S _ S _ R _ R _ H _ 3 H _ 3 H _ 3 H _ 3 G T G T H _ 3 H _ 3 X T _ X T _ X T _ X T _ X T _ X T _ X T _ X T _ GMAC1_TXEN_M0
HDMI_TX_HPDIN RI_3MWP 0 2 E 0 2 E 0 2 E 0 2 E 0 2 E 0 2 E B S B S B S B S O _ B O _ B B S B S P D P D P D P D P D P D P D P D GMAC1_MCLKINOUT_M0
|     | HDMITX_CEC_M0         |     |     | 5MWP I C P | I C P I C P I C P I C P I C P U U U U S U S U U U E | E E E E E E E |     |     |     |                            |     |
| --- | --------------------- | --- | --- | ---------- | --------------------------------------------------- | ------------- | --- | --- | --- | -------------------------- | --- |
|     | HDMITX_SCL HDMITX_SDA |     |     |            |                                                     |               |     |     |     | GMAC1_MDC_M0 GMAC1_MDIO_M0 |     |
USB
SPI/UART
USB_OTG0_DP
|     | USB_OTG0_DM                  |     |     |     |     |     |     |     |     | SPI0_CLK_M0               |     |
| --- | ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------- | --- |
|     | USB_OTG0_VBUSDET USB_OTG0_ID |     |     |     |     |     |     |     |     | SPI0_MOSI_M0 SPI0_MISO_M0 |     |
SPI0_CS0_M0
U U S S B B 2 2 _ _ H H O O S S T T 2 2 _ _ D D P M I2C_GPIO_PWM_ADIN Audio I2S SPDIF SPI3_CLK_M1
SPI3_MOSI_M1
|     | USB2_HOST3_DP |     |     | GPIO0_A0_d |     | I2S1_MCLK_M0_PMIC |     |     |     | SPI3_MISO_M1 |     |
| --- | ------------- | --- | --- | ---------- | --- | ----------------- | --- | --- | --- | ------------ | --- |
USB2_HOST3_DM GPIO0_A3_u GPIO0_A5_d I2S1_SDO0_M0_PMIC I2S1_SCLK_TX_M0_PMIC SPI3_CS0_M1
USB3_HOST1_DP GPIO0_A6_d I2S1_SDI0_M0/PDM_SDI0_M0_PMIC UART2DBG_RX
USB3_HOST1_DM I2C1_SCL I2S1_LRCK_TX_M0_PMIC UART2DBG_TX UART3_RX_M0
|     | USB3_HOST1_SSTXP |     |     | I2C1_SDA            |     | SPDIF_TX_M2 |           |     |     | UART3_TX_M0             |     |
| --- | ---------------- | --- | --- | ------------------- | --- | ----------- | --------- | --- | --- | ----------------------- | --- |
|     | USB3_HOST1_SSTXN |     |     |                     |     |             |           |     |     | UART4_RX_M0             |     |
|     | USB3_HOST1_SSRXP |     |     | PWM0_M0 PWM3_IR     |     |             |           |     |     | UART4_TX_M0 UART5_RX_M1 |     |
|     | USB3_HOST1_SSRXN |     |     | L C D _ BL_PWM      |     | SD Card     |           |     |     | UART5_TX_M1             |     |
|     |                  |     |     | P LCD_PWREN_H W M 5 |     |             | SDMMC0_D0 |     |     |                         |     |
SDMMC0_D1
|     |     |     |     | PMIC_32KOUT_SOC |                              |     | SDMMC0_D2               |       |     |     |     |
| --- | --- | --- | --- | --------------- | ---------------------------- | --- | ----------------------- | ----- | --- | --- | --- |
|     |     |     |     | S A R A D C _   | V I N 0 _ K E Y /R E C OVERY |     | SDMMC0_D3 S D M M C 0 _ | C M D |     |     |     |
| A   |     |     |     | S A R A D C _   | V I N 2 _ H P_ H O O K       |     | S D M M C 0 _           | C LK  |     |     | A   |
|     |     |     |     | SARADC_VIN3     |                              |     | SDMMC0_DET_L            |       |     |     |     |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,    BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
TTTiiitttllleee
BBB222BBB   CCCooonnnnnneeeccctttooorrr
|     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr                                      | DDDrrraaawwwnnn            | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------------------------------------------------------------------------------------------- | -------------------------- | --------- |
|     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                                                              | YYYhhhggg                  | 333       |
|     |     |     |     |     |     |     |     |     | AAA222 DDDaaattteee::: WWWeeedddnnneeesssdddaaayyy,,,   JJJuuunnneee   000111,,,   222000222222 | SSShhheeeeeettt 444 ooofff | 111444    |
|     | 5   | 4   |     |     | 3   |     |     |     | 2                                                                                               | 1                          |           |

|     |     | 5   |     |     |     |     | 4   |     |     | 3   |     |     |     | 2   |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
HDMI
J4
HDMI/TYPE-A
|     |     |            |        |          |     |             | HDMI/SMD/CON/A 32 22 |     |             | U3     | WS05-4R2P/ESD5304D |               |     |     |     |     |     |
| --- | --- | ---------- | ------ | -------- | --- | ----------- | -------------------- | --- | ----------- | ------ | ------------------ | ------------- | --- | --- | --- | --- | --- |
|     |     |            |        |          |     |             |                      |     | HDMI_TX2P   | 1 IN1  | OUT1               | 10 HDMI_TX2P  |     |     |     |     |     |
|     |     |            |        |          |     |             | 1                    |     | HDMI_TX2N   | 2 IN2  | OUT2               | 9 HDMI_TX2N   |     |     |     |     |     |
|     |     |            |        |          | 2   | HDMI_TX2P   | 2                    |     |             | 3 GND1 | GND2               | 8             |     |     |     |     |     |
|     |     |            |        |          | 2   |             | 3                    |     | HDMI_TX1P   | 4 IN3  | OUT3               | 7 HDMI_TX1P   |     |     |     |     |     |
|     |     |            |        | HDMI_VCC |     | HDMI_TX2N   | 4                    |     | HDMI_TX1N   | 5 IN4  | OUT4               | 6 HDMI_TX1N   |     |     |     |     |     |
|     |     | VCC3V3_SYS |        |          | 2   | HDMI_TX1P   | 5                    |     |             |        |                    |               |     |     |     |     |     |
| D   |     |            |        |          |     |             | 6                    |     |             |        |                    |               |     |     |     |     | D   |
|     |     |            |        | K01/CN   | 2   | HDMI_TX1N   | 7                    |     |             |        |                    |               |     |     |     |     |     |
|     |     |            |        |          | 2   | HDMI_TX0P   | 8                    |     |             | U4     | WS05-4R2P/ESD5304D |               |     |     |     |     |     |
|     |     |            | K72    |          |     |             | 9                    |     | HDMI_TX0P   | 1 IN1  | OUT1               | 10 HDMI_TX0P  |     |     |     |     |     |
|     |     |            | 1 QT1  |          | 2   | HDMI_TX0N   | 10                   |     | HDMI_TX0N   | 2 IN2  | OUT2               | 9 HDMI_TX0N   |     |     |     |     |     |
|     |     |            | BSS138 | 55R      | 2   | HDMI_TXCLKP | 11                   |     |             | 3 GND1 | GND2               | 8             |     |     |     |     |     |
|     |     |            | 45R    |          |     |             | 12                   |     | HDMI_TXCLKP | 4 IN3  | OUT3               | 7 HDMI_TXCLKP |     |     |     |     |     |
1 2 3 CEC 2 HDMI_TXCLKN 13 HDMI_TXCLKN 5 IN4 OUT4 6 HDMI_TXCLKN
|     | HDMITX_CEC_M0 |     |        |     |     |          | 14  |     |     |     |     |     |     |     |     |     |     |
| --- | ------------- | --- | ------ | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |               |     |        |     |     | HDMI_SCL | 15  |     |     |     |     |     |     |     |     |     |     |
|     |               |     | SOT_23 |     |     | HDMI_SDA | 16  |     |     |     |     |     |     |     |     |     |     |
17
|     |                 |     |       |     |     |     | 18  |     | HDMI_SCL |     | 1DV11         | 2   |     |     |     |     |     |
| --- | --------------- | --- | ----- | --- | --- | --- | --- | --- | -------- | --- | ------------- | --- | --- | --- | --- | --- | --- |
|     |                 |     | R601K |     |     | HPD | 19  |     |          |     | 240E2R5PP0402 |     |     |     |     |     |     |
|     | 1 HDMI_TX_HPDIN |     |       |     |     |     |     |     | HDMI_SDA |     | 1DV12         | 2   |     |     |     |     |     |
240E2R5PP0402
|     |     |     |     | R61 |     |     | 02 12 |     | CEC |     | 1DV13 | 2   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- |
240E2R5PP0402
|     |     |     |     | 100K |     |     |     |     | HPD |     | 1DV14 | 2   |     |     |     |     |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- |
240E2R5PP0402
D10
|     |     |     |     |     |     | HDMI_VCC | GND |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
VDD5V
C20
B5819WS
|     |     |     |     |     | SOD_323 | 10uF/10V |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| C   |     |     |     |     |         |          |     |     |     |     |     |     |     |     |     |     | C   |
HDMI OUTPUT
|     |     |        |        | VCC3V3_SYS | HDMI_VCC |          |     |          |     |     |     |     |     |     |     |     |     |
| --- | --- | ------ | ------ | ---------- | -------- | -------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |        | R57    |            |          | R59      |     |          |     |     |     |     |     |     |     |     |     |
|     |     | R56    |        | 1 QT2      | R58      | 1.8K     |     |          |     |     |     |     |     |     |     |     |     |
|     |     | NC/10K | NC/10K | BSS138     | 1.8K     |          |     |          |     |     |     |     |     |     |     |     |     |
|     |     |        | 2      | 3          |          | HDMI_SCL |     | Micro SD |     |     |     |     |     |     |     |     |     |
HDMITX_SCL
SOT_23
|     |     |     |     | 1   | QT3 |     |     |     | VCC3V3_SYS |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
BSS138
R6 0R
|     |            |     |                 | 2      | 3   | HDMI_SDA |     |     |     |     | VCC3V3_SD |        |       |       |     |     |     |
| --- | ---------- | --- | --------------- | ------ | --- | -------- | --- | --- | --- | --- | --------- | ------ | ----- | ----- | --- | --- | --- |
| B   | HDMITX_SDA |     |                 |        |     |          |     |     |     |     |           |        | 1 C2  |       |     |     | B   |
|     |            |     |                 |        |     |          |     |     |     |     |           |        | 10uF  | C1    |     |     |     |
|     |            |     |                 | SOT_23 |     |          |     |     |     |     |           |        | C0603 |       |     |     |     |
|     |            |     |                 |        |     |          |     |     |     |     |           | R4     | 2 X5R | 0.1uF |     |     |     |
|     |            |     | I2C Level Shift |        |     |          |     |     |     |     |           | NC/10K | 10V   |       |     |     |     |
J3
|     |     |     |     |     |     |     |     | SDMMC0_D2  |     | R7 22R  |     |     | 1 DAT2 |           |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | ------- | --- | --- | ------ | --------- | --- | --- | --- |
|     |     |     |     |     |     |     |     | SDMMC0_D3  |     | R8 22R  |     |     | 2 DAT3 |           |     |     |     |
|     |     |     |     |     |     |     |     | SDMMC0_CMD |     | R9 22R  |     |     | 3 CMD  | 10 10     |     |     |     |
|     |     |     |     |     |     |     |     |            |     |         |     |     | 4 VDD  | 11 11     |     |     |     |
|     |     |     |     |     |     |     |     | SDMMC0_CLK |     |         |     |     | 5 CLK  | 12 12     |     |     |     |
|     |     |     |     |     |     |     |     | SDMMC0_D0  |     | R13 22R |     |     | 7 D A  | T 0 13 13 |     |     |     |
|     |     |     |     |     |     |     |     | SDMMC0_D1  |     | R14 22R |     |     | 8 D A  | T 1       |     |     |     |
6 VSS
|     |     |     |     |     |     |     |     | SDMMC0_DET_L |     | R138 22R |     |       | 9 DET     | GND |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | -------- | --- | ----- | --------- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     |              |     | 1        | 1 1 | 1 1 1 | 1 T-Flash |     |     |     |     |
MINISD1
|     |     |     |     |     |     |     |     |     |     | DV1 | DV2 DV3 | DV4 DV5 DV6 | DV7 |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | ----------- | --- | --- | --- | --- | --- |
240E2R5PP0402
|     |     |     |     |     |     |     |     |     |     | 2   | 2 2 | 2 2 2 | 2   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
| A   |     |     |     |     |     |     |     |     |     |     |     |       |     |     |     |     | A   |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
+++888666---777555555---222777555777111555999111
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | TTTiiitttllleee BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------------------------------- | --- | --- |
HHHDDDMMMIII///EEEttthhheeerrrnnneeettt
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | --------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                         | YYYhhhggg       | 333       |
AAA333
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTThhhuuurrrsssdddaaayyy,,,   JJJuuunnneee   000222,,,   222000222222 | SSShhheeeeeettt 555 | ooofff 111444 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------------- | ------------------- | ------------- |
|     |     | 5   |     |     |     |     | 4   |     |     | 3   |     |     |     | 2   |                                                                                       | 1                   |               |

|     |     | 5   |     |     | 4   |     |     |     | 3   |     |     | 2   |     |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
WIFI/BT MODULE
| D   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
VCCIO_WL
|     | R2  | NC/10K R0402 | S D M M C 1 _ D 0 |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ------------ | ----------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | R28 | NC/10K R0402 | S D M M C 1 _ D 1 |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     | R29 | NC/10K R0402 | SDMMC1_D2         |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     | R38 | NC/10K R0402 | SDMMC1_D3         |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     | R40 | NC/10K R0402 | SDMMC1_CMD        |     |     |     |     |     |     |     |     |     |     |     |     |     |
SDMMC1_CLK
50 ohm
|     |     |     | U A R T 1 _ T X _ M 0     |     |     |                 |          |     |         |                               |     | C90  |        | 2          |     |     |
| --- | --- | --- | ------------------------- | --- | --- | --------------- | -------- | --- | ------- | ----------------------------- | --- | ---- | ------ | ---------- | --- | --- |
|     |     |     | U A R T 1 _ R X _ M 0     |     |     | C91 NC/15pF R71 | 1 0 0 R  |     |         |                               |     | R70  | 0 R    | 1 3        |     |     |
|     |     |     | U A R T 1 _ C T S n _ M 0 |     |     | C0402           | R 0 4 02 |     | VBAT_WL |                               |     |      | R 0402 | 4          |     |     |
|     |     |     | U A R T 1 _ R T S n _ M 0 |     |     | Y1              |          |     |         |                               |     |      |        |            |     |     |
|     |     |     |                           |     |     | 1               | 4        |     |         | H_TSOH_EKAW_TB H_TB_EKAW_TSOH |     | 33pF |        |            |     |     |
|     |     |     |                           |     |     | XIN             | GND      |     |         |                               |     | C92  |        | C93 P5     |     |     |
|     |     |     | WIFI_REG_ON_H             |     |     | 2               | 3        |     |         |                               |     |      |        | IPEX       |     |     |
|     |     |     | WIFI_WAKE_HOST_H          |     |     | GNDXOUT         |          |     |         |                               |     | NC   |        | NC GSC/SMD |     |     |
NC/26MHz_20ppm_12pF
| C   |     |     |                |     |     | C102 NC/15pF CRY-D3225 |     |     |     |     |     |     |     |     |     | C   |
| --- | --- | --- | -------------- | --- | --- | ---------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | HOST_WAKE_BT_H |     |     | C0402                  |     |     |     |     |     |     |     |     |     |     |
BT_WAKE_HOST_H
U 2 0
|     |     |     | BT_REG_ON_H |     | Frequency Offset less than 20PPM! |     |     |     | BL-M8 72 3 DS1 | 11 01 9 8 7 6 5 4 3 | 2 1 |     |     |     |     |     |
| --- | --- | --- | ----------- | --- | --------------------------------- | --- | --- | --- | -------------- | ------------------- | --- | --- | --- | --- | --- | --- |
TUO_LATX NI_LATX TABV EKAW_TSOH_N/OIV_TB EKAW_TSOH_TB EKAW_TB EKAW_N XR_MF DNG TNA_TB_LW DNG
I2S2_SCLK_TX_M0
I2S2_LRCK_TX_M0
I2S2_SDO_M0
I2S2_SDI_M0
N_VDDSWP_IN 47
|     |     |     |     |     |     |     |     | R90 | NC/10K |     | N_VDDSWP_OUT | 46  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | ------------ | --- | --- | --- | --- | --- |
N_VDDSWPIO 45
|     |     |     |     |     |     |     |     | WIFI_REG_ON_H    |                 |     |            | UART1_RTSn_M0    |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------------- | --------------- | --- | ---------- | ---------------- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | WIFI_WAKE_HOST_H | 12 WL_REG_ON    |     | UART_CTS_N | 44 UART1_TX_M0   |     |     |     |     |
|     |     |     |     |     |     |     |     | WIFI_D2          | 13 WL_HOST_WAKE |     | UART_RXD   | 43 UART1_RX_M0   |     |     |     |     |
|     |     |     |     |     |     |     |     | W I F I _ D 3    | 14 SDIO_DATA_2  |     | UART_TXD   | 42 UART1_CTSn_M0 |     |     |     |     |
SDMMC1_D0 R94 22RR0402 WIFI_D0 C103 NC/33pFC0402 W I F I _ C M D 15 SDIO_DATA_3 UART_RTS_N 41
|     |     |     |     |     |     |     |     |     | 16 SDIO_DATA_CMD |     |     | TX1 40 |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------------- | --- | --- | ------ | --- | --- | --- | --- |
SDMMC1_D1 R95 22RR0402 WIFI_D1 C105 NC/33pFC0402 W I F I _ C L K 17 SDIO_DATA_CLK TX2 39
|     |     |     |     |     |     |     |     | W I F I _ D 0 | 18 SDIO_DATA_0 |     | N_REG_PU | 38  | R129 |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------- | -------------- | --- | -------- | --- | ---- | --- | --- | --- |
SDMMC1_D2 R96 22RR0402 WIFI_D2 C117 NC/33pFC0402 VCCIO_WL WIFI_D1 19 SDIO_DATA_1 N_I2C_SCL 37 NC/10K
|     |     |     |     |     |     |     |     |     | 20 GND |     |     | GND 36 |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | ------ | --- | --- | --- | --- |
SDMMC1_D3 R97 22RR0402 WIFI_D3 C118 NC/33pFC0402 21 VIN_LDO_OUT N_I2C_SDA 35
|     |     |     |     |     |     |     |     |     | 22 VDDIO | CNYS_MCP OXCT_DDV | BT_RST_N | 34  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | -------- | ----------------- | -------- | --- | --- | --- | --- | --- |
SDMMC1_CMD R99 22RR0402 WIFI_CMD C138 NC/33pFC0402 ODL_NIV TUO_MCP KLC_MCP NI_OXCT FR_SPG
|     |     |     |     |     |     |     |     |     | A1/TN3R3S5103APWS/CN | NI_MCP |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------------- | ------ | --- | --- | --- | --- | --- | --- |
B SDMMC1_CLK R100 22RR0402 WIFI_CLK C141 NC/33pFC0402 C 1 4 3 C 1 4 4 3X3-DNI OPL DNG DNG B
|     |     |     |     |     |     |     |     | 4. 7 u F 0. 1 u F | 11L |     |     | BT_REG_ON_H |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | --- | ----------- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | C0603 C0402       |     |     |     |             |     |     |     |     |
32 42 52 62 72 82 92 03 13 23 33
VCCIO_WL
|     |     |     |     |     |     |     |     |     | C158 |     | R137 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | ---- | --- | --- | --- | --- | --- |
NC/4.7uF
|     | VDDIO_18   | R23 1 0R      | 2 R0402 |         |     |     |     |                 | C0603   |     | NC/0R |     |     |     |     |     |
| --- | ---------- | ------------- | ------- | ------- | --- | --- | --- | --------------- | ------- | --- | ----- | --- | --- | --- | --- | --- |
|     |            |               |         | VBAT_WL |     |     |     |                 | R12 22R |     |       |     |     |     |     |     |
|     |            | R41 1         | 2 L0603 |         |     |     |     | PMIC_32KOUT_SOC |         |     |       |     |     |     |     |     |
|     | VCC3V3_SYS | BLM18PG181SN1 | VBAT_WL |         |     |     |     |                 |         |     |       |     |     |     |     |     |
C62 C69
|     |     | 供电电流至少400mA |     | 1 10uF | 1 100nF |     |     |     | I2S2_SDI_M0 |     |     |     |     |     |     |     |
| --- | --- | ----------- | --- | ------ | ------- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- |
C0805 C0402
|     |     |     |     | 2 X5R | 2 X5R |     |     |     | I2S2_LRCK_TX_M0 |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ----- | ----- | --- | --- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- |
10V 16V
I2S2_SDO_M0
I2S2_SCLK_TX_M0
| A   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa | +++888666---777555555---222777555777111555999111 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------------- | ------------------------------------------------ | --- |
TTTiiitttllleee
WWWIIIFFFIII///BBBTTT
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr                      | DDDrrraaawwwnnn     | RRReeevvv     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------- | ------------------- | ------------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                                              |                     | 333           |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | AAA333                                                                          | YYYhhhggg           |               |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: FFFrrriiidddaaayyy,,,   JJJuuulllyyy   222222,,,   222000222222 | SSShhheeeeeettt 666 | ooofff 111444 |
|     |     | 5   |     |     | 4   |     |     |     | 3   |     |     | 2   |     |                                                                                 | 1                   |               |

|     |     |     | 5   |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     |     |     | 2   |     |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Audio Codec
EARPHONE
|     |     |                   |     |     |     |     |     |     |     | C9 1UFC0402  | MIC1P |     |     |     |            |       |             |       |     |     |     |     |     |
| --- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- | ------------ | ----- | --- | --- | --- | ---------- | ----- | ----------- | ----- | --- | --- | --- | --- | --- |
|     |     |                   |     |     |     |     |     |     |     | C10 1UFC0402 | MIC1N |     |     |     |            | 100R  | R82 2K2 R81 | MIC2P |     |     |     |     |     |
|     |     | I2S1_MCLK_M0_PMIC |     |     |     |     |     |     |     |              |       |     |     |     | VCC3V3_SYS | R0402 | R0402       |       |     |     |     |     |     |
I2S1_SDO0_M0_PMIC I 2 C 1 _ S D A C53 C 1 0 4 C 1 1 4 C 1 1 5
I2S1_SCLK_TX_M0_PMIC I2S1_SDI0_M0/PDM_SDI0_M0_PMIC I 2 C 1 _ S C L NC/102 N C /1 0 2 1 0 u F 22 0 p F V3 20220531
D I2S1_LRCK_TX_M0_PMIC C0402 C 0 4 0 2 C 0 6 03 C0402 MIN2N D
|     |     |              |     |     |     |     |     | 8 7 6 5 4 3             | 2   | C106 C0402 | 1UF MIC2P       |     |     |     |     |     |     |     |            |     |     |     |     |
| --- | --- | ------------ | --- | --- | --- | --- | --- | ----------------------- | --- | ---------- | --------------- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- |
|     |     | SPI3_MISO_M1 |     |     |     |     |     | U15 2 2 2 2 2 2         | 2   |            |                 |     |     |     |     |     |     |     | VCC3V3_SYS |     |     |     |     |
|     |     | I2C1_SDA     |     |     |     |     | 29  | K L N E C E D 1 N 1 N   | 2 N | C107       | C0402 1UF MIN2N |     |     |     |     |     |     |     |            |     |     |     |     |
|     |     | I2C1_SCL     |     |     |     |     | GND | 29 C S ID S O M I L I R | I L | C108       |                 |     |     |     |     |     |     |     |            |     |     |     |     |
I2S1_MCLK_M0_PMIC R0402R31 33R 1 M C L K R I N 2 2 1 4.7uF V3 20220531 R77
|     |     |     |     |     |     | VCC3V3_CODEC | 2 3 | D C V D D | V M I D 1 2 9 0 | C0603 C0603 C 4. 1 7 0 u 9 F |     |     |     |     |     |     |     |     |     | 10K |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------ | --- | --------- | --------------- | ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
GND 4 D D B G V N D D D ES8388 AD C A V G R N E D F 1 8 R0402 J7
I2S1_SCLK_TX_M0_PMIC R0402R39 33R 5 6 B C L K A V D D 1 1 6 7 SPI3_MISO_M1 MIC2P 5 PJ327E
I2S1_SDO0_M0_PMIC R0402R47 R0402R48 33R 33R 7 D A C D AT H P V D D 1 5 MIN2N 1
I2S1_LRCK_TX_M0_PMIC LR C K T L O U T 2 AVDD HP_LO R80 33R R83 33R PHE_DET 4
VCC3V3_SYS VCC3V3_CODEC A D M O M 1 T 1 T D N 2 T R0402 R0402 3
|     |     |       |     |     |     |     |     | C D C P O C U O U O G P | U O |     | HPVDD |     |     |     |     | HP_RO | R84   | 33R   |     |     | 2           |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | ----------------------- | --- | --- | ----- | --- | --- | --- | --- | ----- | ----- | ----- | --- | --- | ----------- | --- | --- |
|     | R78 | 0R    |     |     |     |     |     | A H L R L H             | R   |     |       |     |     |     |     |       |       | R0402 |     |     |             |     |     |
|     |     | R0402 |     |     |     |     |     | 8 9 0 1 1 1 2 1 3 1     | 4 1 |     |       |     |     |     |     |       | C7 C8 |       |     |     | PJ3mm5_327E |     |     |
C110 10uF C 1 1 0 4 4 2 I2S1_SDI0_M0/PDM_SDI0_M0_PMIC R50 33R 10nF/25V 10nF/25V R85 R86 C116 18VD 2040PP5R2E042 19VD 2040PP5R2E042 101VD 2040PP5R2E042 151VD 2040PP5R2E042 R24 V3 20220531
|     |     | C0603 | C0402 |     |     |       |     |      |     |            |       |     |     |     |     |     | C0402 C0402 |     | 1K R0402 1K R0402 | 0.1uF/10V C0402 | 0R    |     |     |
| --- | --- | ----- | ----- | --- | --- | ----- | --- | ---- | --- | ---------- | ----- | --- | --- | --- | --- | --- | ----------- | --- | ----------------- | --------------- | ----- | --- | --- |
|     |     |       |       |     |     | R0402 |     | C113 |     | C0603 C112 | HP_LO |     |     |     |     |     |             |     |                   |                 | R0402 |     |     |
4.7uF
|     |            |             |                    |     |     |     |     | 4.7uF C0603 |     | C0603 C137         | HP_RO |          |     |     |     |     | R87 470R R88 470R |     |     | 2 2 2 | 2   |     |     |
| --- | ---------- | ----------- | ------------------ | --- | --- | --- | --- | ----------- | --- | ------------------ | ----- | -------- | --- | --- | --- | --- | ----------------- | --- | --- | ----- | --- | --- | --- |
|     | VCC3V3_SYS | L1          | AVDD               |     |     |     |     |             |     | 4.7uF              |       |          |     |     |     |     | R0402 R0402       |     |     |       |     |     |     |
|     |            | 600R/100MHZ | C 1 45 C 1 4 9     |     |     |     |     | GND         |     | C0603 C 1 39 R51   | 33R   | 4G_OUT_P |     |     |     |     |                   |     |     |       |     |     |     |
|     |            | 4.7         | u F 1 C 0 0 4 4 02 |     |     |     |     |             |     | 1u F               | R0402 | 4G_OUT_N |     |     |     |     |                   |     |     |       |     |     |     |
|     |            | C0603       |                    |     |     |     |     |             |     | C0603 C140 1uF R52 | 33R   |          |     |     |     |     |                   |     |     |       |     |     |     |
R0402
|     |     | L8  | HPVDD |     |     |     |     |     |     |     |     | R76 |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
10K
|     |     | 600R/100MHZ C152 | C153 |     |     |     |     |     |     |     |     | R0402 |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ---------------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
104
| C   |     | 4.7uF C0603 | C0402 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | C   |
| --- | --- | ----------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Mobile Module
MINI PCI-E CON
|     | GPIO0_A0_d                  |     |                |           | CON2              |                                     | 3GVCC |                  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | --------------------------- | --- | -------------- | --------- | ----------------- | ----------------------------------- | ----- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |                             |     | 4G_OUT_P       | 1 M       | I C +             | 3 . 3 V a u x A 2                   |       |                  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     | USB2_HOST2_DM USB2_HOST2_DP |     | 4G_OUT_N MIC1P | 3 5 M     | I C -             | G N D 1 4 6                         |       |                  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     |                             |     | MIC1N          | 7 E       | A R +             | 1 . 5 V A 8                         |       | SIM_VCC          |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     |                             |     |                | 9 E G     | A N R D - 2       | U U I I M M _ _ D P A W T R A 1 0   |       | SIM_DATA SIM_CLK |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     |                             |     |                | 1 1 1 3 R | E F C L K -       | U I M _ C L K 1 1 2 4               |       | SIM_RST          |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     |                             |     |                | 1 5 R G   | E N F D C 3 L K + | U I M U _ I R M E _ S V E p T p 1 6 |       |                  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
3GVCC
|     |     |     |       | 1 1 7 9 N   | C 9                                     | G N D 4 1 2 8 0                       |                       | R124 10K         |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | ----------- | --------------------------------------- | ------------------------------------- | --------------------- | ---------------- | ---------- | --------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |       | 2 1 N       | C 1 0 W                                 | _ D I S A B L E _ N 2 2               |                       |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 2 2 3 5 G P | E N R D n 5 0                           | 3 . 3 P V E a R u S x B T 2 2 4 6     |                       |                  | 3          |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
| B   |     |     |       | 2 7 P       | E R p 0                                 | G N D 6 2 8                           |                       |                  |            | R125 4.7K | GPIO0_A0_d |     |     |     |     |     |     |     |     |     |     |     | B   |
|     |     |     |       | 2 9 G G     | N N D D 7 8                             | S M B 1 _ . C 5 V L B K 3 0           |                       |                  | 1          |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 3 3 1 3 P   | E T n 0                                 | S M B _ D A T A 3 3 2 4               |                       |                  | 2S8050 Q10 | C12 R1    |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 3 5 P       | E T p 0                                 | G N D 9 3 6                           | R126 22R              | USB2_HOST2_DM    |            | 0.1uF 10K |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     | 3GVCC | 3 7 G G     | N N D D 1 1 0 1                         | U U S S B B _ _ D D + - 3 8           | R127 22RUSB2_HOST2_DP |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 3 4 9 1 3   | . 3 V a u x 1                           | G N D 1 2 4 4 0 2                     |                       | 2                | 1          |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 4 3 3 G     | . N 3 V D a 1 u 3 x 2                   | L L E E D D _ _ W W L W A A N N # 4 4 |                       | R128 1K          |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 4 4 5 7 A   | U X _ P C M _ C L K                     | L E D _ W P A N # 4 4 6 8             |                       | 3GVCC D5 LED_RED |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 4 9 A       | U X _ P C M _ D O U T                   | 1 . 5 V 5 0                           |                       |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 5 1 A A     | U U X X _ _ P P C C M M _ _ D SY IN N C | 3 G . 3 N V D a 1 u 4 x 5 2           |                       |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 5 3         |                                         | 5 4                                   |                       |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
|     |     |     |       | 5 5 G G     | N N D D                                 | G G N N D D 5 6                       |                       |                  |            |           |            |     |     |     |     |     |     |     |     |     |     |     |     |
PCI-E/H_3MM
PCI-E/52PIN
3.4V
|     |     |       |                  |       | 3GVCC     |          |             |             |          |     |     | R131        |                      |                                         |                 |               |                 |     |     |     |     |     |     |
| --- | --- | ----- | ---------------- | ----- | --------- | -------- | ----------- | ----------- | -------- | --- | --- | ----------- | -------------------- | --------------------------------------- | --------------- | ------------- | --------------- | --- | --- | --- | --- | --- | --- |
|     |     | VDD5V | U93              |       |           |          |             |             |          |     |     | 10k         |                      |                                         |                 |               |                 |     |     |     |     |     |     |
|     |     | 3     | IN DNG/JDA O U T | 2     |           |          |             |             |          |     |     |             |                      |                                         | P4 SIM          |               |                 |     |     |     |     |     |     |
|     |     |       | O U T            | 4     |           |          |             |             |          |     |     |             |                      | SIM_CLK                                 | 1               | 2             | SIM_DATA        |     |     |     |     |     |     |
|     |     |       |                  | R451  | CE8       |          |             |             |          |     |     |             |                      | SIM_RST                                 | 3 CLK           | IO 4          |                 |     |     |     |     |     |     |
|     |     |       | 1 LM1117-ADJ     | 75R   | +         | C83      | C85 C86     | C87 C88     | C99      |     |     | R 10 1 k 30 |                      |                                         | RST             | VPP           |                 |     |     |     |     |     |     |
|     |     |       | SOT-223          | R0603 | 220uF/10V | 10uF/10V | 0.1uF 0.1uF | 0.1uF 0.1uF | 10uF/10V |     |     |             |                      | SIM_VCC                                 | 5 VCC D C G 1 G | 2 G 3 G GND 6 | 1 2040PP5R2E042 |     |     |     |     |     |     |
|     |     | C122  |                  |       |           |          |             |             |          |     |     |             | 71VD 1 2040PP5R2E042 | 181VD 2040PP5R2E042 191VD 2040PP5R2E042 | SIM             |               |                 |     |     |     |     |     |     |
| A   |     | 0.1uF |                  |       |           |          |             |             |          |     |     | C78 C79 C80 |                      |                                         | 7 8 9           | 0 1 1 1       | 02VD C81        |     |     |     |     |     | A   |
|     |     | C0603 |                  | R452  |           |          |             |             |          |     |     | 0.1uF 30p   | 30p                  |                                         |                 |               | 30p             |     |     |     |     |     |     |
130R
|     |     |     |     | R0603 V2 20210827 |     |     |     |     |     |     |     |     | 2   | 2 2 |     | Nano_SIM/INSERT_TYPE | 2   |     |     |     |     |     |     |
| --- | --- | --- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------------- | --- | --- | --- | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
TTTiiitttllleee 444GGG///AAAuuudddiiiooo   CCCooodddeeeccc
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr                            | DDDrrraaawwwnnn            | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------------- | -------------------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | AAA222 EEEMMM333555666666                                                             | YYYhhhggg                  | 333       |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTThhhuuurrrsssdddaaayyy,,,   JJJuuunnneee   000222,,,   222000222222 | SSShhheeeeeettt 777 ooofff | 111444    |
|     |     |     | 5   |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     |     |     | 2   |     |                                                                                       | 1                          |           |

|     | 5   |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     | 2   |     |     |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
PCI.Express
PCIE_3V3
R3
NC/4.7k
R0402
| D   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
V3 20220531
1
|     |     |     |     |     |     |                      |     |           |     | 1                  |     |                    | 2       |             | D8         |                                           |          |     |     |     |
| --- | --- | --- | --- | --- | --- | -------------------- | --- | --------- | --- | ------------------ | --- | ------------------ | ------- | ----------- | ---------- | ----------------------------------------- | -------- | --- | --- | --- |
|     |     |     |     |     |     |                      |     |           |     | 3 GND              |     |                    | 3.3V 4  | PCIE_3V3    | NC/LED_RED |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 5 GND              |     |                    | 3.3V 6  |             | LED190/SMD |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 7 PERn3            |     |                    | NC 8    |             | 2          |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 9 PERp3            |     |                    | NC 10   | DAS         |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 11 GND             |     | DAS/DSS# (O)(OD)   | 12      |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 13 PETn3           |     |                    | 3.3V 14 |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 15 PETp3           |     |                    | 3.3V 16 |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 17 GND             |     |                    | 3.3V 18 |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 19 PERn2           |     |                    | 3.3V 20 | PCIE_3V3    |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 21 PERp2           |     |                    | NC 22   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 23 GND             |     |                    | NC 24   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 25 PETn2           |     |                    | NC 26   |             | R5         | 1 10K 2                                   | R0402    |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 27 PETp2           |     |                    | NC 28   |             |            |                                           | PCIE_3V3 |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 29 GND             |     |                    | NC 30   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 31 PERn1           |     |                    | NC 32   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 33 PERp1           |     |                    | NC 34   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 35 GND             |     |                    | NC 36   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 37 PETn1           |     |                    | NC 38   | PCIE_DEVSLP |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 39 PETp1           |     | DEVSLP (I)(0/3.3V) | 40      |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     |                      |     |           |     | 41 GND             |     |                    | NC 42   |             |            | On power up, the deassertion of PERST# is |          |     |     |     |
|     |     |     |     |     |     | PCIE20_SATA2_RXN     |     |           |     | 43 PERn0 / SATA-B+ |     |                    | NC 44   |             |            |                                           |          |     |     |     |
|     |     |     |     |     |     | PCIE20_SATA2_RXP     |     |           |     | 45 PERp0 / SATA-B- |     |                    | NC 46   |             |            | delayed 100 ms.                           |          |     |     |     |
| C   |     |     |     |     | C15 | 1 2 100nFC0402X5R10V |     | SATA2_TXN |     | 4 7 G N D          |     |                    | N C 4 8 |             |            |                                           |          |     |     | C   |
PCIE20_SATA2_TXN C16 1 2 100nFC0402X5R10V SATA2_TXP 4 9 PE T n0 / SATA-A- N C 5 0 R10 1 1K 5%2 R0402
PCIE20_SATA2_TXP 51 PETp0 / SATA-A+ PERST#(I)(0/3.3V) 52 PCIE20_PERSTn_M2
|     |     |     |     |     |     |     |     |     |     | 53 GND |     | CLKREQ#(I/O)(0/3.3V) | 54  |     | PCIE20_CLKREQn_M2 |     | C19 |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | -------------------- | --- | --- | ----------------- | --- | --- | --- | --- | --- |
PCIE20_REFCLKN 55 REFCLKN PEWAKE#(I/O)(0/3.3V) 56 PCIE20_WAKEn_M2 1 100nF
|     |     |     | PCIE20_REFCLKP |     |     |     |     |     |     | 57 REFCLKP                                      |     | MFG Data(NC)  | 58      |          |                 |     |       |     |     |     |
| --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- | ----------------------------------------------- | --- | ------------- | ------- | -------- | --------------- | --- | ----- | --- | --- | --- |
|     |     |     |                |     |     |     |     |     |     | GND                                             |     | MFG Clock(NC) |         |          |                 |     | C0402 |     |     |     |
|     |     |     |                |     |     |     |     |     |     | 67                                              |     |               |         | R136     | NC/22R          |     | 2 X5R |     |     |     |
|     |     |     |                |     |     |     |     |     |     | 69 NC                                           |     |               | 68      | 1        | 2               |     | 16V   |     |     |     |
|     |     |     |                |     |     |     |     |     |     | 71 PEDET(PCIE-H/SATA-L)SUSCLK(32kHz)(I)(0/3.3V) |     |               | 70      |          | PMIC_32KOUT_SOC |     |       |     |     |     |
|     |     |     |                |     |     |     |     |     |     | GND                                             |     |               | 3.3V    | R04025%  |                 |     |       |     |     |     |
|     |     |     |                |     |     |     |     |     |     | 73 GND                                          |     |               | 3.3V 72 |          |                 |     |       |     |     |     |
|     |     |     |                |     |     |     |     |     |     | 75 GND                                          |     |               | 3.3V 74 | PCIE_3V3 |                 |     |       |     |     |     |
80 GND
81 NC
82 NC
GPIO0_A5_d
|     |     |     |     |     |     |     |     |     |     | CON3 M2_NVME_H3.2MM |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
M2_M_KEY-2242-2280
|     |     | VCC3V3_SYS |     |     |     | PCIE_3V3 |     |     |          |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ---------- | --- | --- | --- | -------- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| B   |     |            |     |     |     |          |     |     | PCIE_3V3 |     |     |     |     |     |     |     |     |     |     | B   |
2 3
|     |     |             | 1       | Q1       |     |             |           | C66    |     | C72   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ----------- | ------- | -------- | --- | ----------- | --------- | ------ | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | 1 C13 1 C14 |         | SI2305   | 1   | C96 1 C97   | 1 CE2     | 1 10uF | 1   | 100nF |     |     |     |     |     |     |     |     |     |     |
|     |     | 1uF 100nF   | R132    | 1 SOT_23 |     | 10uF 100nF  | +         | C0805  |     | C0402 |     |     |     |     |     |     |     |     |     |     |
|     |     | X5R X5R     | 100K    |          |     | X5R X5R     |           | X5R    |     | X5R   |     |     |     |     |     |     |     |     |     |     |
|     |     | 2 10V 2 16V | 5%      |          | 2   | 6.3V 2 16V  | 220uF/10V | 2 16V  | 2   | 16V   |     |     |     |     |     |     |     |     |     |     |
|     |     | C0402 C0402 | 2 R0402 |          |     | C0603 C0402 | 2         |        |     |       |     |     |     |     |     |     |     |     |     |     |
1
R133
10K
R0402
2 5%
3
|     | GPIO0_A5_d | R134 1 | 2 1 | Q2       |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | ---------- | ------ | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |            | 10K5%  |     | S8050    |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     |            | R0402  | 1   | 2 SOT_23 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
R135
51K
R0402
2 5%
| A   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa | +++888666---777555555---222777555777111555999111 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------------- | ------------------------------------------------ | --- |
TTTiiitttllleee
PPPCCCIII---EEE   NNNVVVMMMEEE
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | --------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                         | YYYhhhggg       | 333       |
AAA333
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 | SSShhheeeeeettt 888 | ooofff 111444 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------- | ------------------- | ------------- |
|     | 5   |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     | 2   |     |     |                                                                                 | 1                   |               |

5 4 3 2 1
VDD5V VCC3V3_SYS VCC5V0_HOST2 C74 +220uF/10V CV/100UF/16V R0402 D AV33_HUB GND 0R R32 D VCC3V3_SYS R285 VCC3V3_SYS 0R
AV33_HUB
GND GND VDD5V VCC5V0_HOST2 VCC5V0_HOST2 GND GND USB2.0 HOST GND SPI3_CS0_M1
GND
VCC5V0_HOST1 USB3.0
option C C C35 100nF U U S S B B 3 3 _ _ H H O O S S T T 1 1 _ _ S S S S T T X X N P SATA VCC5V0_HOST1
V3 20220531
USB_OTG0_DP
USB_OTG0_DM
USB_OTG0_VBUSDET
USB_OTG0_ID R27 2.2R ON USB3.0
100ohms diferential impedance OFF SATA
USB2_HOST3_DP USB2_HOST3_DM USB3_HOST1_DP USB3_HOST1_DM U U S S B B 3 3 _ _ H H O O S S T T 1 1 _ _ S S S S T T X X P N VDD5V VCC5V0_HOST1
USB3_HOST1_SSRXP USB3_HOST1_SSRXN V3 20220531 V3 20220531 V3 20220531 GPIO0_A6_d
B B
USB2.0 OTG VCC_OTG
R19 110K 2R04025% VCC_OTG
R20 15K
5% R0402 If common mode inductors are needed, it is recommended to keep 2.2ohm in series to improve the antistatic ability
A VDD5V R368 2NC/0R 1R0603 VCC_OTG A
GPIO0_A3_u BBBoooaaarrrdddcccooonnn CCCooonnnfffiiidddeeennntttiiiaaalll V2 20201018 BBBoooaaarrrdddcccooonnn IIInnnccc...RRRoooooommm777000222---777111000,,, XXXiiinnnAAAnnn BBBuuusssiiinnneeessssss BBBuuuiiillldddiiinnnggg,,, 444555ZZZooonnneee,,,
BBBaaaoooAAAnnn DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
TTTiiitttllleee
UUUSSSBBB HHHOOOSSSTTT///UUUSSSBBB333...000
SSSiiizzzeee DDDooocccuuummmeeennnttt NNNuuummmbbbeeerrr DDDrrraaawwwnnn RRReeevvv
AAA222 EEEMMM333555666666 YYYhhhggg 333
DDDaaattteee::: TTThhhuuurrrsssdddaaayyy,,, JJJuuunnneee 000222,,, 222000222222 SSShhheeeeeettt 999 ooofff 111444
5 4 3 2 1
1
2
D9
ESD05V72T-ULC SOT-723
R22 22.2R 1R04025%
1
3
2
C120 22uF C0805
J29
1 2 3 4 5 V D D N G C M P C N C D USB 701MICRO
9
DNG DNG 6
8
DNG DNG 7
0R R119 0R R33 R0402 C55
0.1uF
C0402
10 10 11 11 D7 240E2R5PP0402 E0402N 1
2
0R R118 C48 20pF
C0402
C0G 50V
C29 C30 100nF 22uF C0805
R72 2.2R
1 2 4 3NC/Coil_90OHM L7 R30 1100R 2R04025%
C343
1uF C0402
1
2
R288 10K
D11
C45 ESD05V72T-ULC 1uF SOT-723 C0402
R21 10R 2R04025%
1
3
2
0R R122
ED1 240E2R5PP0402 1 2
C49 20pF
C0402
C0G 50V
J6 C 0. 5 1 8 uF C131 1 2 3 4 1 2 3 4 C0402 2 C 2 0 u 8 F 05 HOST2
J33
1 2
SATA-POWER
DIP2/W/H/P2.54
SW1 C33 0R 4 1 3 2
NC/DHN-02
R26 1 2 0R R0402 5%
U41
5 IN OUT 1
4 EN I G S N E D T 2 3 SY6280AAC
SOT_23_5
1
2
C75 0.1uF C0402
U13 SY6280AAC SOT_23_5
5 IN VOUT 1 GND 2 4 EN OCB 3
R25 22.2R 1R04025% D2109
ESD05V72T-ULC
SOT-723
1
3
2
F4 1A/125v FUSE/SMD 0R R121
D12
ESD05V72T-ULC SOT-723 C59 0.1uF C0402
J25
USB_A_30 USB30A
S S H H V E E G G B R T R L L T N N U D X X L L D X X D D S + + + 2 1 - - - 1 2 3 4 5 6 7 8 9 1 1 0 1
C17 22uF C0805
1
3
2
R75
6.8K R0402
5%
1
2
Y 12 7 MHz_20ppm_20pF J17 1 2 C X G R I N Y N D 4_ 1 3 G X R O N 2 U D 0 T 2 X2R 3 4 50X0R80 1 2 3 4 1 2 3 4 HOST1
R281
10K R0402
0R R73 C63 0.1uF C119 R0402 C0402 0.1uF C0402 R35
10K
R0402
5%
C28 100nF
4 3
L4 1 2 NC/Coil_90OHM
1
2
R289 10K
R34
10K R0402
5%
1
2
1 5 9 2 10 6 3 7 11 4 12 8 P3 USB-DUAL-FEMALE-TYPE/A USB-AB8P-213
U17 SY6280AAC R0402 SOT_23_5 0R R53 C60 5 IN VOUT 1 1 C u 0 F 402 GND 2 4 EN OCB 3
1 2 4 5 3 I I I I G N N N N N 1 2 3 4 D1 G O O O O N U U U U D T T T T 2 1 2 3 4 1 9 8 7 6 0 C 2 C 2 3 0 u 4 8 F 05 U1
WS05-4R2P/ESD5304D
C18 22uF C0805
J34 C43 0R 1 2 3 4 5 6 7 1 2 3 4 5 6 7
8 9 8 9 NC/SATA SATA/DIP/180/A
C4 10uF
X5R 10V C0603
C337 0.1uF R364 C0402 10K
R0402
1
2
U40
GL850G
SSOP28/SMD
1 1 1 1 1 2 3 4 5 6 7 8 9 1 0 1 2 3 4 D D R A X X D D A D D R T A E 1 2 V V V M P R M P M P E S D D D 2 3 4 S E 2 3 4 T D D D E F / 2 3 1 T S # CL P P O O W W V V P C C R R P G D U U E E S G A D D V D D R R N N E V N M M D N P P V L 2 1 3 1 2 G D D F 1 0 1 0 5 # # 3 # # 1 2 2 2 2 2 1 1 1 2 2 2 2 1 6 8 7 6 1 0 9 8 5 4 3 2 5 7
R16
6.8K
R0402 5%
1
2
R286 680R R0402
R370
10K
R0402
5%
1
2
AVDD1 USB2_HOST3_DP RREF USB2_HOST3_DM AVDD2 X1 X2 OVCUR1# AVDD3 RESET#
RESET# 1DDVA 2DDVA 2DDVA 3DDVA
USB_DP1 USB_DM2 USB_DM1 USB_DP2 VCC_USB USB_DM1 USB_DM3 USB_DP1 USB_DP3 USB_DM3 USB_DM4 USB_DM2 USB_DP3 USB_DP4 USB_DP2
USB_DM4 USB_DP4
USB3_DM USB3_DP USB3_SSRXN USB3_SSRXP USB3_SSTXN USB3_SSTXP
USB3_HOST1_DM USB3_DM
USB3_HOST1_DP USB3_DP USB3_SSTXP USB3_SSTXN USB3_HOST1_SSRXN USB3_SSRXN USB3_HOST1_SSRXP USB3_SSRXP USB3_HOST1_SSRXN USB3_SSRXN USB3_HOST1_SSRXP USB3_SSRXP
USB_OTG0_VBUSDET
USB_OTG0_DM USB_OTG0DM USB_OTG0DP USB_OTG0_DP USB_OTG0ID USB_OTG0_ID USB_OTG0ID

|     |     | 5   |     |     |     | 4   |     | 3   |     |     |     | 2   | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
MIPI Camera
| D   |     |     |     |     |     |     | 翻盖下接 |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
J31
FFPPCC2-244PP_IPNitch05_Down
1
2 3 A A G F G N N D D
4 S T R O B E
|     |     |     |     |     | I2C4_SDA_M0_1V8                     | AF_2V8 R372122R 2R0402       | 5 A S F I O - 2 - D V 8   |     |     |                   |                      |     |     |     |
| --- | --- | --- | --- | --- | ----------------------------------- | ---------------------------- | ------------------------- | --- | --- | ----------------- | -------------------- | --- | --- | --- |
|     |     |     |     |     | I2C4_SCL_M0_1V8                     | R373122R 2R0402              | 6 7 S I O - C             |     |     |                   |                      |     |     |     |
|     |     |     |     |     | AVDD2V8_DVP                         |                              | 8 N C                     |     |     |                   |                      |     |     |     |
|     |     |     |     |     |                                     | CAMERAF_RST_L GPIO4_B5_d_1V8 | 9 A R V E D S D E 2 T V 8 |     |     |                   |                      |     |     |     |
|     |     |     |     |     |                                     |                              | 1 1 0 1 P W D N           |     |     |                   | AF_2V8               |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_D1P                     |                              | 1 2 G M N D D P 1         |     |     | AVDD2V8_DVP       |                      |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_D1N                     |                              | 1 1 3 4 M D N 1           |     |     | L5                |                      |     |     |     |
|     |     |     |     |     | M I P I _ C S I _ R                 | X _ D 0 P                    | 1 5 G N D                 |     |     | B L M 1 8PG181SN1 |                      |     |     |     |
|     |     |     |     |     | M I P I _ C S I _ R                 | X _ D 0 N                    | 1 6 M M D D P N 0 0       |     |     | L0 6 0 3          | C 8 9 C100           |     |     |     |
|     |     |     |     |     |                                     |                              | 1 1 7 8 G N D             |     |     |                   | 1u C0402 F 1uF C0402 |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_CLK0P MIPI_CSI_RX_CLK0N |                              | 1 9 M M C C P N           |     |     |                   |                      |     |     |     |
2 2 0 1 G N D
|     |     |     |            |     | DVDD1V2    |            | 2 2 D V D D 1 V 2        |     |     |     |     |     |     |     |
| --- | --- | --- | ---------- | --- | ---------- | ---------- | ------------------------ | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |            |     | VCC1V8_DVP |            | 2 3 D G O N D V D D 1 V8 |     |     |     |     |     |     |     |
|     |     |     | VCC1V8_DVP |     |            | MIPI_MCLK0 | 2 4 X C L K D N D N      |     |     |     |     |     |     |     |
G G
|     |     |               | 1          |     |     |     | 5 6 |                |               |     |                                        |     |     |     |
| --- | --- | ------------- | ---------- | --- | --- | --- | --- | -------------- | ------------- | --- | -------------------------------------- | --- | --- | --- |
|     |     |               | R 3 69     |     |     |     | 2 2 | VCC3V3_SYS     |               |     | AVDD2V8_DVP                            |     |     |     |
|     |     |               | 10 R0402 K |     |     |     |     |                | U19           |     |                                        |     |     |     |
|     |     |               | 2 5%       |     |     |     |     |                | 1 rt9013-28gb | 5   |                                        |     |     |     |
|     |     | CAMERAF_RST_L | DNP        |     |     |     |     |                | IN            | OUT |                                        |     |     |     |
|     |     |               | C346       |     |     |     |     | C 1 5 1        | 2 GND         |     | C154 C155 C 2 0 2                      |     |     |     |
|     |     |               | 1 100nF    |     |     |     |     | 4. C0603 7 u F | 3             | 4   | 4.7uF C0603 0.1uF C0402 0. C0402 1 u F |     |     |     |
|     |     |               | X5R 16V    |     |     |     |     |                | EN            | NC  |                                        |     |     |     |
| C   |     |               | 2 C0402    |     |     |     |     |                | SOT23-5       |     |                                        |     |     | C   |
DNP
I2C4_SDA_M0_1V8
I2C4_SCL_M0_1V8
|     | CAMERAF_RST_L  | CIF_CLKOUT |     | R36 122R | 2R0402 MIPI_MCLK0 | C70 1 2NC/8pF |     |            |             |       |                   |     |     |     |
| --- | -------------- | ---------- | --- | -------- | ----------------- | ------------- | --- | ---------- | ----------- | ----- | ----------------- | --- | --- | --- |
|     | CAMERAB_RST_L  |            |     |          | 5%                | C0402 C0G50V  |     | VCC3V3_SYS | U16         |       | DVDD1V2           |     |     |     |
|     | GPIO4_B5_d_1V8 |            |     | R371122R | 2R0402 MIPI_MCLK1 | C3471 2NC/8pF |     |            | rt9013-12gb |       |                   |     |     |     |
|     | CIF_8BIT_VSYNC |            |     |          | 5%                | C0402 C0G50V  |     |            | 1 IN        | OUT 5 |                   |     |     |     |
|     |                |            |     |          |                   |               |     | C 1 2 4    | 2           |       | C129 C150 C166    |     |     |     |
|     |                |            |     |          |                   |               |     | 4. 7 u F   | GND         |       | 4.7uF 0.1uF 0.1uF |     |     |     |
|     |                |            |     |          |                   |               |     | C0603      | 3 EN        | NC 4  | C0603 C0402 C0402 |     |     |     |
SOT23-5
R66
AVDD2V8_DVP 110K 2
R0402
翻盖下接
J30
FFPPCC2-244PP_IPNitch05_Down
1
2 A G N D
|     |     |     |     |                 |        |                 | 3 A S F T G R O N D B E | VCC3V3_SYS | U8                       |       | VCC1V8_DVP    |     |     |     |
| --- | --- | --- | --- | --------------- | ------ | --------------- | ----------------------- | ---------- | ------------------------ | ----- | ------------- | --- | --- | --- |
|     |     |     |     | I2C4_SDA_M0_1V8 | AF_2V8 | R120122R 2R0402 | 4 5 A F - 2 V 8         |            | CL9191A18L5M/rt9013-18gb |       |               |     |     |     |
|     |     |     |     | I2C4_SCL_M0_1V8 |        | R123122R 2R0402 | 6 S I O - D             |            | 1 IN                     | OUT 5 |               |     |     |     |
|     |     |     |     |                 |        |                 | 7 8 S N I C O - C       | C77        | 2                        |       | C 8 2 C94 C95 |     |     |     |
B AVDD2V8_DVP CAMERAB_RST_L 9 A V D D 2 V 8 4.7uF GND 4 . 7 u F 0 . 1 u F 0 . 1 u F B
|     |     |     |     |     |                                 | CIF_8BIT_VSYNC | 1 0 R P W E S D E N T | C0603 | 3 EN    | NC 4 | C 0 6 0 3 C 0 4 0 2 C 0 4 0 2 |     |     |     |
| --- | --- | --- | --- | --- | ------------------------------- | -------------- | --------------------- | ----- | ------- | ---- | ----------------------------- | --- | --- | --- |
|     |     |     |     |     |                                 |                | 1 1 1 2 G N D         |       | SOT23-5 |      |                               |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_D3P MIPI_CSI_RX_D3N |                | 1 3 M D P 1           |       |         |      |                               |     |     |     |
1 4 M G N D D N 1
|     |     |     |     |     | MIPI_CSI_RX_D2P   |            | 1 1 5 6 M D P 0         |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ----------------- | ---------- | ----------------------- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | MIPI_CSI_RX_D2N   |            | 1 7 M G N D D N 0       |     |     |     |     |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_CLK1P |            | 1 1 8 9 M C P           |     |     |     |     |     |     |     |
|     |     |     |     |     | MIPI_CSI_RX_CLK1N |            | 2 0 M C N               |     |     |     |     |     |     |     |
|     |     |     |     |     | DVDD1V2           |            | 2 1 G D V N D D D 1 V 2 |     |     |     |     |     |     |     |
|     |     |     |     |     | VCC1V8_DVP        |            | 2 2 2 3 D O V D D 1 V8  |     |     |     |     |     |     |     |
|     |     |     |     |     |                   | MIPI_MCLK1 | 2 4 G X C N L D K D D   |     |     |     |     |     |     |     |
N G N G
|     |     |     | VCC1V8_DVP |     |     |     | 5 2 6 2 |     |     |     |     |     |     |     |
| --- | --- | --- | ---------- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
1
R374
10K R0402
2 5%
|     |     |     | CAMERAB_RST_L | DNP |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C348
1 100nF
X5R 16V
2 C0402
DNP
| A   |     |     |     |     |     |     |     |     |     |     |     |     |     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,    BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
TTTiiitttllleee
MMMIIIPPPIII///DDDVVVPPP   CCCaaammmeeerrraaa
|     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr                                   | DDDrrraaawwwnnn               | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------------------------------------------------------------------------------------- | ----------------------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                                                           | YYYhhhggg                     | 333       |
|     |     |     |     |     |     |     |     |     |     |     |     | AAA222 DDDaaattteee::: TTThhhuuurrrsssdddaaayyy,,,   JJJuuunnneee   000222,,,   222000222222 | SSShhheeeeeettt 111000 ooofff | 111444    |
|     |     | 5   |     |     |     | 4   |     | 3   |     |     |     | 2                                                                                            | 1                             |           |

| 5   |     |     |     | 4   |     |     |     |     |     | 3   |     | 2   |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
MIPI_DSI_TX0_D0P/LVDS_TX0_D0P
MIPI_DSI_TX0_D0N/LVDS_TX0_D0N
MIPI_DSI_TX0_D1P/LVDS_TX0_D1P
| MIPI_DSI_TX0_D1N/LVDS_TX0_D1N |     |     |     |     | VDD5V |     |     |     |     |     |     |     |     |     |     |
| ----------------------------- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
D D
MIPI_DSI_TX0_D2P/LVDS_TX0_D2P
| MIPI_DSI_TX0_D2N/LVDS_TX0_D2N |     |     |     |     |     | 1 C32 |       |     |     |     |     |     |     |     |     |
| ----------------------------- | --- | --- | --- | --- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
|                               |     |     |     |     |     | 10uF  | C67   |     |     |     |     |     |     |     |     |
| MIPI_DSI_TX0_D3P/LVDS_TX0_D3P |     |     |     |     |     | C0805 | 0.1uF |     |     |     |     |     |     |     |     |
| MIPI_DSI_TX0_D3N/LVDS_TX0_D3N |     |     |     |     |     | 2 X5R | C0402 |     |     |     |     |     |     |     |     |
10V
MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP
| MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN |     |     |     |     |     |     |     | VDD5V |     | VDD5V |     |     |     |     |     |
| ------------------------------- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | ----- | --- | --- | --- | --- | --- |
CON1
| EDP_TX_D0P  |     |     |             |      |                                 |               |     | 1   | 1 2   | 2                                  |                      |     |     |     |     |
| ----------- | --- | --- | ----------- | ---- | ------------------------------- | ------------- | --- | --- | ----- | ---------------------------------- | -------------------- | --- | --- | --- | --- |
| EDP_TX_D0N  |     |     |             |      |                                 |               |     | 3   | 3 4   | 4                                  |                      |     |     |     |     |
|             |     |     |             |      |                                 | VCC3V3_LCD    |     | 5   | 5 6   | 6 VCC3V3_LCD                       | R148                 |     |     |     |     |
| EDP_TX_D1P  |     |     |             |      | R0402                           |               |     | 7   | 7 8   | 8                                  |                      |     |     |     |     |
| EDP_TX_D1N  |     |     | SPI0_CLK_M0 | R147 | 1 22R                           | 2 I2C2_SCL_TP |     | 9   | 9 10  | 10 I2C2_SDA_TP                     | 1 22R 2 SPI0_MOSI_M0 |     |     |     |     |
|             |     |     |             |      |                                 | TOUCH_RST     |     | 11  | 11 12 | 12 TOUCH_INT                       | R0402                |     |     |     |     |
| EDP_TX_D2P  |     |     |             |      |                                 | LCD_PWREN_H   |     | 13  | 13 14 | 14 LCD_BL_PWM                      |                      |     |     |     |     |
| EDP_TX_D2N  |     |     |             |      |                                 |               |     | 15  | 15 16 | 16                                 |                      |     |     |     |     |
|             |     |     |             |      |                                 | EDP_TX_AUXP   |     | 17  | 17 18 | 18 EDP_TX_AUXN                     |                      |     |     |     |     |
| EDP_TX_D3P  |     |     |             |      |                                 |               |     | 19  | 19 20 | 20                                 |                      |     |     |     |     |
| EDP_TX_D3N  |     |     |             |      | EDP_TX_D3P                      |               |     | 21  | 21 22 | 22 EDP_TX_D3N                      |                      |     |     |     |     |
|             |     |     |             |      | EDP_TX_D2P                      |               |     | 23  |       | 24 EDP_TX_D2N                      |                      |     |     |     |     |
| EDP_TX_AUXP |     |     |             |      | EDP_TX_D1P                      |               |     | 25  | 23 24 | 26 EDP_TX_D1N                      |                      |     |     |     |     |
| EDP_TX_AUXN |     |     |             |      | EDP_TX_D0P                      |               |     | 27  | 25 26 | 28 EDP_TX_D0N                      |                      |     |     |     |     |
|             |     |     |             |      | MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP |               |     | 29  | 27 28 | 30 MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN |                      |     |     |     |     |
|             |     |     |             |      |                                 |               |     | 31  | 29 30 | 32                                 |                      |     |     |     |     |
C MIPI_DSI_TX0_D3P/LVDS_TX0_D3P 33 31 32 34 MIPI_DSI_TX0_D3N/LVDS_TX0_D3N C
| LCD_BL_PWM             |          |     |     |     | MIPI_DSI_TX0_D2P/LVDS_TX0_D2P |     |     | 35  | 33 34 | 36 MIPI_DSI_TX0_D2N/LVDS_TX0_D2N |     |     |     |     |     |
| ---------------------- | -------- | --- | --- | --- | ----------------------------- | --- | --- | --- | ----- | -------------------------------- | --- | --- | --- | --- | --- |
| LCD_PWREN_H            |          |     |     |     | MIPI_DSI_TX0_D1P/LVDS_TX0_D1P |     |     | 37  | 35 36 | 38 MIPI_DSI_TX0_D1N/LVDS_TX0_D1N |     |     |     |     |     |
|                        |          |     |     |     | MIPI_DSI_TX0_D0P/LVDS_TX0_D0P |     |     | 39  | 37 38 | 40 MIPI_DSI_TX0_D0N/LVDS_TX0_D0N |     |     |     |     |     |
| TOUCH_INT              |          |     |     |     |                               |     |     |     | 39 40 |                                  |     |     |     |     |     |
| TOUCH_RST SPI0_MISO_M0 | GPIO0_C5 |     |     |     |                               |     |     |     |       |                                  |     |     |     |     |     |
| SPI0_CS0_M0            | GPIO0_C6 |     |     |     |                               |     |     |     | LVDS  |                                  |     |     |     |     |     |
PWM0_M0
VCC3V3_SYS
|     |     |     |     |     | VCC3V3_SYS |     |     |     |     | VCC3V3_LCD |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- |
R441 R442
2K2 2K2
2 3
| R0402 R0402 |                           |                       |     |     |     |               | 1       | Q17      |     |               |     |     |     |     |     |
| ----------- | ------------------------- | --------------------- | --- | --- | --- | ------------- | ------- | -------- | --- | ------------- | --- | --- | --- | --- | --- |
|             |                           |                       |     |     | 1   | C2035 1 C2036 |         | SI2305   | 1   | C2037 1 C2038 |     |     |     |     |     |
| G P I O 0 _ | B 5                       |                       |     |     |     | 1uF 100nF     | R455    | 1 SOT_23 |     | 10uF 100nF    |     |     |     |     |     |
| G P I O 0 _ | B 6 S P I 0 _ C L K _ M 0 | I 2 C 2 _ S C L _ M 0 |     |     |     | X5R X5R       | 100K    |          |     | X5R X5R       |     |     |     |     |     |
|             | S P I 0 _ M O S I_ M 0    | I 2 C 2 _ S D A _ M 0 |     |     | 2   | 10V 2 16V     | 5%      |          | 2   | 6.3V 2 16V    |     |     |     |     |     |
|             |                           |                       |     |     |     | C0402 C0402   | 2 R0402 |          |     | C0603 C0402   |     |     |     |     |     |
1
B B
R456
10K
R0402
2 5%
3
|     |     |     |     | PWM0_M0 | R457  | 1 2 | 1   | Q18      |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ------- | ----- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |         | 10K5% |     | 1   | S8050    |     |     |     |     |     |     |     |
|     |     |     |     |         | R0402 |     |     | 2 SOT_23 |     |     |     |     |     |     |     |
R458
51K
R0402
2 5%
A A
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
|     |     |     |     |     |     |     |     |     |     |     |     |     | BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa | +++888666---777555555---222777555777111555999111 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------------- | ------------------------------------------------ | --- |
TTTiiitttllleee
MMMIIIPPPIII&&&LLLVVVDDDSSS///EEEDDDPPP
|     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | --------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     | EEEMMM333555666666                                         | YYYhhhggg       | 333       |
AAA333
|     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 | SSShhheeeeeettt 111111 | ooofff 111444 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------- | ---------------------- | ------------- |
| 5   |     |     |     | 4   |     |     |     |     |     | 3   |     | 2   |                                                                                 | 1                      |               |

|     |     | 5   |     |     |     | 4   |     |     | 3   |     |     |     |     | 2   |     |     | 1   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
GPS
V3 20220531
P8
4
|     |     |     |     |     |     |     |     |     |     |     | 3 1 |     | Keep 50 OHM |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- |
2
| D   |     |     |     |     |     |     |     |     |     |     | NC/IPEX |     |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
GSC/SMD
MU4
|     |     |          |     |     | 1V8 GPIO       |                       |     |     |         |             |                   |          |             | L51      |     |     |     |     |     |
| --- | --- | -------- | --- | --- | -------------- | --------------------- | --- | --- | ------- | ----------- | ----------------- | -------- | ----------- | -------- | --- | --- | --- | --- | --- |
|     |     |          |     |     |                |                       |     |     |         |             | 1                 |          | 1 8         | NC/47nH  |     |     |     |     |     |
|     |     |          |     |     |                |                       |     |     |         | UART3_RX_M0 | 2 GND             | RESERVED | 1 7         |          |     |     |     |     |     |
|     |     |          |     |     |                |                       |     |     |         | UART3_TX_M0 | 3 TX_OUT          | SCL2     | 16          |          |     |     |     |     |     |
|     |     |          |     |     |                |                       |     |     |         |             | 4 RX_IN           | SDA2     | 15          |          |     |     |     |     |     |
|     |     |          |     |     |                |                       |     |     |         |             | 5 TUMEPULV_ANT/NC |          | 14          | RFVCC    |     |     |     |     |     |
|     | ADC |          |     |     |                | CON4                  |     |     |         |             | 6 EXTINT          | VCC_RF   | 13          | C2028    |     |     |     |     |     |
|     |     |          |     |     |                | CIF                   |     |     | VCC_RTC | GPSVDDIO    | 7 V_BCKP          | ANTON    | 12          |          |     |     |     |     |     |
|     |     | VDDIO_18 |     |     |                | DIP/7X2P/P 2.0        |     |     |         |             | 8 VCC_IO          | GND      | 11 GPS_RFIN | NC/0.1uF |     |     |     |     |     |
|     |     |          | J18 |     |                | 1 2                   |     |     | VDD_GPS | GPSRST      | 9 VCC             | RF_IN    | 10          |          |     |     |     |     |     |
|     |     |          | 1   |     | CIF_8BIT_CLKIN | 3 1 2 4 CIF_8BIT_HREF |     |     |         |             | VRESET            | GND      |             |          |     |     |     |     |     |
|     |     |          | 2 1 |     | CIF_8BIT_D7    | 5 3 4 6 CIF_8BIT_D6   |     |     |         | C2029 C2030 |                   |          |             |          |     |     |     |     |     |
SARADC_VIN2_HP_HOOK 3 2 CIF_8BIT_D5 7 5 6 8 CIF_8BIT_D4 NC/ST-91-U7 VDD5V
SARADC_VIN3 4 3 CIF_8BIT_D3 9 7 8 10 CIF_8BIT_D2 NC/33NF NC/33NF MAX-7
|     |     |     | 4   |     | CIF_8BIT_D1 | 1 1 9 1 0 1 2 CIF_8BIT_D0 |     |     |     |     |     |     |     |     |     | U 2 0 |     |     |     |
| --- | --- | --- | --- | --- | ----------- | ------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- |
VDDIO_18 1 3 1 1 1 2 1 4 VDDIO_18 C2031 C2032 N C / R 1 1 31N331D
|     |     |     | SIP_ 4PIN_2.0MM |     |     | 1 3 1 4 |     |     |     |     |     |     |     | 10uF/10V |     | SO T 2 3 -5 |     | VDD_GPS |     |
| --- | --- | --- | --------------- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | ----------- | --- | ------- | --- |
0.1uF
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | 1   | 5   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
IN OUT
|     |     |     |     |     |     |     |     |     |     |     |     |     |     | VDD_GPS |     |     |             | C2034    |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- | ----------- | -------- | --- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |         |     | 2   | C2033       |          |     |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |         |     | GND | NC/10uF/10V | NC/0.1uF |     |
R453
| C   |     |     |     |     |     |     |     |     |     |      |                |     |        | NC/10K | PWM5 | 3   | 4   |     | C   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | -------------- | --- | ------ | ------ | ---- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     |     |     |      |                |     |        |        |      | EN  | NC  |     |     |
|     |     |     |     |     |     |     |     |     |     | R454 | NC/0R GPSVDDIO |     | GPSRST |        |      |     |     |     |     |
VDD_GPS
C54
NC/0.1uF
VCC3V3_SYS
UART
RS485
|     |     |     |     |     | 1 C130 1 C135 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
10uF 100nF
C0603 C0402
|     |             |     |     |     | 2 X5R 2 X5R |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | ----------- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | UART4_RX_M0 |     |     |     | 6.3V 16V    |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
UART4_TX_M0
UART5_RX_M1
UART5_TX_M1
| B   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | B   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
VDD5V
|     |     |     |     |     |     |     |     |     |     |     |     |      | R376 | 10R     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | ---- | ------- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     |     |     |     |     | R375 |      | RS485_B |     |     |     |     |     |
R377
|     |     |       |     |             |            |     |             | R438   |     | 10K      |       | 10K |      |      |             |     |     |     |     |
| --- | --- | ----- | --- | ----------- | ---------- | --- | ----------- | ------ | --- | -------- | ----- | --- | ---- | ---- | ----------- | --- | --- | --- | --- |
|     |     |       |     |             | VCC3V3_SYS |     | UART3_RX_M0 | NC/10K |     |          |       |     |      | R378 |             |     |     |     |     |
|     |     |       |     |             | J11        |     |             |        |     |          |       |     |      | 120R | JP2         |     |     |     |     |
|     |     | UART1 |     |             |            |     |             |        |     | U90      | VDD5V |     |      |      |             |     |     |     |     |
|     |     |       |     |             | 1 1        |     |             |        |     | SN75176B |       |     |      |      | 2 2         |     |     |     |     |
|     |     |       |     | UART4_TX_M0 | 2 2        |     |             | R437   | 1K  | 1 R      | VCC 8 |     |      |      |             |     |     |     |     |
|     |     |       |     | UART4_RX_M0 | 3 3        |     |             |        |     | 2 /RE    | B 7   |     | R439 | 10R  | 1 1         |     |     |     |     |
|     |     |       |     |             | 4 4        |     |             |        |     | 3 DE     | A 6   |     |      |      |             |     |     |     |     |
|     |     |       |     |             |            |     | UART3_TX_M0 |        |     | 4 D      | GND 5 |     |      |      | 2Pin_Jumper |     |     |     |     |
SIP_4PIN_2.0MM
|     |     |       |     |             |                |     |      |             | R424 | SOP8   | C293  |     | R440  | RS485_A | DIP2_2.0 |             |     |     |     |
| --- | --- | ----- | --- | ----------- | -------------- | --- | ---- | ----------- | ---- | ------ | ----- | --- | ----- | ------- | -------- | ----------- | --- | --- | --- |
|     |     |       |     |             |                |     |      |             | 10K  | 3      |       |     | 10K   |         |          |             |     |     |     |
|     |     |       |     |             | VCC3V3_SYS     |     |      |             |      | Q16    | 0.1uF |     |       |         |          |             |     |     |     |
|     |     |       |     |             | J12            |     |      |             |      | BSS138 |       |     |       |         |          |             |     |     |     |
|     |     |       |     |             |                |     | PWM5 | R423 NC/10K | 1    | SOT23  |       |     |       |         |          |             |     |     |     |
|     |     | UART2 |     |             | 1 1            |     |      |             |      |        |       |     |       |         |          |             |     |     |     |
|     |     |       |     | UART5_TX_M1 | 2 2            |     |      |             |      | 2      |       |     | VDD5V |         | J32      |             |     |     |     |
|     |     |       |     | UART5_RX_M1 | 3 3            |     |      |             |      |        |       |     |       |         |          |             |     |     |     |
|     |     |       |     |             | 4 4            |     |      |             |      |        |       |     |       |         | 1 1      |             |     |     |     |
|     |     |       |     |             |                |     |      |             |      |        |       |     |       | RS485_B | 2 2      |             |     |     |     |
|     |     |       |     |             | SIP_4PIN_2.0MM |     |      |             |      |        |       |     |       | RS485_A | 3 3      | V3 20220531 |     |     |     |
RS485
| A   |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DIP3P_XH2.54 |     |     |     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa | +++888666---777555555---222777555777111555999111 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------------- | ------------------------------------------------ | --- |
TTTiiitttllleee
GGGPPPIIIOOO///UUUAAARRRTTT
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr |                    |     | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | ------------------ | --- | --------------- | --------- |
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |                                                            | EEEMMM333555666666 |     | YYYhhhggg       | 333       |
AAA333
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | DDDaaattteee::: | TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 |     | SSShhheeeeeettt 111222 | ooofff 111444 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------------- | --------------------------------------------------------------- | --- | ---------------------- | ------------- |
|     |     | 5   |     |     |     | 4   |     |     | 3   |     |     |     |     | 2   |                 |                                                                 | 1   |                        |               |

|     |     | 5   |     |     |     |     |     | 4   |     |     |     |     | 3   |     |     |     | 2   |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
T1
|     |     |               |     |     |     |     |     |     |     |       |     |     | 1   |                                 | 2 4         | R17 75R%1 |     |     |     |     |
| --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ------------------------------- | ----------- | --------- | --- | --- | --- | --- |
|     |     |               |     |     |     |     |     |     |     | MDI0+ |     |     | 2   | T T D C 1 T - 1 M M C X T 1 1 - | 2 3 DA+     |           |     |     |     |     |
|     |     |               |     |     |     |     |     |     |     | MDI0- |     |     | 4 3 | T D 1 + M X 1 +                 | 2 2 2 1 DA- | R18 75R%1 |     |     |     |     |
|     |     | GMAC1_TXD2_M0 |     |     |     |     |     |     |     | MDI1+ |     |     | 5   | T C T 2 M C T 2                 | 2 0 DB+     |           |     |     |     |     |
D G M A C 1 _ T X D 3 _ M 0 MDI1- 6 T T D D 2 2 + - M M X X 2 2 + - 1 9 DB- D
G M A C 1 _ R X D 2 _ M 0 Y 2 MDI2+ 8 7 T C T 3 M C T 3 1 1 8 7 DC+ R44 75R%1
|     |     | GMAC1_RXD3_M0 GMAC1_TXCLK_M0 |     |     |     | PHY_XTALOUT | 3 X O U TG | N D 2 |     | MDI2- |     |     | 9   | T T D D 3 3 + - M M X X 3 3 + - | 1 6 DC- |     |     |     |     |     |
| --- | --- | ---------------------------- | --- | --- | --- | ----------- | ---------- | ----- | --- | ----- | --- | --- | --- | ------------------------------- | ------- | --- | --- | --- | --- | --- |
GMAC1_RXCLK_M0 4 1 PHY_XTALIN MDI3+ 1 1 1 0 T C T 4 M C T 4 1 1 5 4 DD+ R45 75R%1
|     |     |               |     |     |     |     | G N D            | X IN |     | MDI3- |     |     | 1 2 | T D 4 - M X 4 - | 1 3 DD- |     |     |     |     |     |
| --- | --- | ------------- | --- | --- | --- | --- | ---------------- | ---- | --- | ----- | --- | --- | --- | --------------- | ------- | --- | --- | --- | --- | --- |
|     |     | GMAC1_RXD0_M0 |     |     |     |     | 25MHz-10ppm-20pF |      |     |       |     |     |     | T D 4 + M X 4 + |         |     |     |     |     |     |
GMAC1_RXD1_M0 C22 15pF CRY-D3225 C23 C24 ZXGE-2401-R C21 2.2nF/1KV
|     |     | GMAC1_RXDV_CRS_M0  |     |     |     | C0402                  |     | 15pF  |     |     |     |     | 10nF  |     |                       |                        |     |     |     |     |
| --- | --- | ------------------ | --- | --- | --- | ---------------------- | --- | ----- | --- | --- | --- | --- | ----- | --- | --------------------- | ---------------------- | --- | --- | --- | --- |
|     |     | GMAC1_TXD0_M0      |     |     |     |                        |     | C0402 |     |     |     |     | C0402 |     |                       |                        |     |     |     |     |
|     |     | GMAC1_TXD1_M0      |     |     |     |                        |     |       |     |     |     |     |       |     | DA+ 1 JP1             |                        |     |     |     |     |
|     |     | GMAC1_TXEN_M0      |     |     |     | If use external clock  |     |       |     |     |     |     |       |     | DA- 2 T T X X + -     |                        |     |     |     |     |
|     |     | GMAC1_MCLKINOUT_M0 |     |     |     | then the XTAL2 need    |     |       |     |     |     |     |       |     | DB+ 3                 |                        |     |     |     |     |
|     |     | GMAC1_MDC_M0       |     |     |     | connect to GND         |     |       |     |     |     |     |       |     | DB- 6 R X +           |                        |     |     |     |     |
|     |     | GMAC1_MDIO_M0      |     |     |     |                        |     |       |     |     |     |     |       |     | R X - 1 4             |                        |     |     |     |     |
|     |     |                    |     |     |     |                        |     |       |     |     |     |     |       |     | DC+ 4 G K 1 3         | R46 510R LED1/CFG_LDO0 |     |     |     |     |
|     |     | SPI3_CLK_M1        |     |     |     |                        |     |       |     |     |     |     |       |     | DC- 5 T T N N 1 2 G A |                        |     |     |     |     |
PHY_INT SPI3_MOSI_M1 GMAC1_MCLKINOUT_M0 R49 22R PHY_CLKOUT125 DD+ 7 1 2 1 2 R63 510R
|     |     |     |     |            |     |     |          | R0402 |                                                         |                   |                           |                 |                         |     | DD- 8 R N 1 D N D N Y K 1 1          | LED2/CFG_LDO1 |              |     |     |     |
| --- | --- | --- | --- | ---------- | --- | --- | -------- | ----- | ------------------------------------------------------- | ----------------- | ------------------------- | --------------- | ----------------------- | --- | ------------------------------------ | ------------- | ------------ | --- | --- | --- |
|     |     |     |     |            |     |     | C25      |       |                                                         |                   |                           |                 |                         |     | R N 2 G G Y A                        |               |              |     |     |     |
|     |     |     |     |            |     |     | NC C0402 |       |                                                         |                   |                           |                 |                         |     | RJ45S 01 9                           |               |              |     |     |     |
|     |     |     |     |            |     |     |          |       | CFG_EXT=1:Use the external power source for the IO pad. |                   |                           |                 |                         |     | RGMII Power Source                   | CFG_EXT       | CFG_LDO[1:0] |     |     |     |
|     |     |     |     | VDD10_EPHY |     |     |          |       | C F G                                                   | _ L D O 1 = 1 ,   | C F G _ L D O 0 = 0 :   I | O   p a d   1 . | 8 V                     |     | E x t e r n a l   3 . 3 V ( default) | 1 ' b 1       | 2 ' b 0 0    |     |     |     |
|     |     |     |     |            |     |     |          |       | C F G                                                   | _ L D O 1 = 0 , C | F G _ L D O 0 = 0 :   I O |   p a d   3 . 3 | V Default: IO pad=3.3V  |     |                                      |               |              |     |     |     |
|     |     |     |     |            |     |     |          |       |                                                         |                   |                           |                 |                         |     | E x t e r n a l   1 . 8 V            | 1 ' b 1       | 2 ' b 1 0    |     |     |     |
C R64 2.49K_1% 2 1 1% PHY_INT R68 2 4.7K 5%R0402 1 VCC33_LAN LED0/CFG_EXT R69 2 14.7K R0402 5% VCC33_LAN Internal 1.8V 1'b0 2'b10 C
|     |     |     | R0402     |      | TUOLATX_YHP 521TUOKLC_YHP 1ODL_GFC/2DEL 0ODL_GFC/1DEL TXE_GFC/0DEL |     |     |     | R74 | 2   | 14.7K 5% LED1/CFG_LDO0   |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --------- | ---- | ------------------------------------------------------------------ | --- | --- | --- | --- | --- | ------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |           |      | NILATX_YHP                                                         |     |     |     |     |     | R0402 LED2/CFG_LDO1      |     |     |     |     |     |     |     |     |     |
|     |     |     | VCC33_LAN |      |                                                                    |     |     |     | R89 | 2   | 14.7K R0402 5%           |     |     |     |     |     |     |     |     |     |
|     |     |     |           | TESR |                                                                    |     |     |     |     |     | VCCIO_PHY Voltage Config |     |     |     |     |     |     |     |     |     |
U6
|     |            |             |           |                       |                                     | RTL8211F-CG QFN40-5X5                       |                                  |                     |      |                                                           | PHY_RXD3/PHYAD0                 | R91  | 2 14.7K                | 5%           |     |     |     |     |     |     |
| --- | ---------- | ----------- | --------- | --------------------- | ----------------------------------- | ------------------------------------------- | -------------------------------- | ------------------- | ---- | --------------------------------------------------------- | ------------------------------- | ---- | ---------------------- | ------------ | --- | --- | --- | --- | --- | --- |
|     |            |             |           | 14 0 4 9 3 8 3        | 7 3 6 3 5 3 4 3 3 3 2 3 1 3         | RTL8211F-CG(SW Mode)                        |                                  |                     |      |                                                           |                                 |      | R0402                  | VCC33_LAN    |     |     |     |     |     |     |
|     |            |             |           |                       |                                     | RTL8211FI-CG(SW Mode)Industrial             |                                  |                     | R92  | 2                                                         | 14.7K R0402 5% PHY_RXCLK/PHYAD1 |      |                        |              |     |     |     |     |     |     |
|     |            |             |           | daP_E 1 _ 3 T E S     | 1 _ 0 K L C N I_ T U 1 O 0 O T X E  | B E                                         |                                  |                     | R93  | 2                                                         | 14.7K 5% PHY_RXDV/PHYAD2        |      |                        |              |     |     |     |     |     |     |
|     |            |             |           | 3 D R                 | 1 D _ T L A T O K L D L _ D L _ _ G | M P /                                       |                                  |                     |      |                                                           | R0402                           |      | PHY Address PHYAD[2:0] |              |     |     |     |     |     |     |
|     |            |             |           | D V A                 | D V A X E X C G F G F F C           | B T                                         |                                  |                     |      |                                                           | PHY Address Config              |      | 1 (default) 3'b001     |              |     |     |     |     |     |     |
|     |            |             |           |                       | / T U C / 2 C / 1 / 0 D             | N I                                         |                                  |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     |            | MDI0+ MDI0- | 1 2 M D   | I [ 0 ] +             | O _L D E D E EL                     | R E G _ O U T 2 3 9 0                       | REG_OUT                          |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     | VDD10_EPHY |             | 3 M D     | I [ 0 ] -             | ATX L L                             | D V D D 3 3 2 8                             |                                  | VCC33_LAN VCC33_LAN | R101 | 2                                                         | 14.7K 5% PHY_RXD0/RXDLY         | R102 | 2 DNP1NC/4.7K5%        | VCC33_LAN    |     |     |     |     |     |     |
|     |            | MDI1+       | 4 A M V D | D I [ D 1 1 ] + 0 _ 3 |                                     | R X C D / V P D H D Y _ A R D G 1 2 7       | PHY_RXDV/PHYAD2 PHY_RXCLK/PHYAD1 |                     |      |                                                           | R0402                           |      | R0402                  |              |     |     |     |     |     |     |
|     |            | MDI1- MDI2+ | 5 6 M D   | I [ 1 ] -             | R X                                 | C T L / P H Y A D 2 2 2 5 6                 | PHY_RXD0/RXDLY                   |                     |      | Pull-up for additional 2ns delay to RXC for data latching |                                 |      |                        |              |     |     |     |     |     |     |
|     |            | MDI2-       | 7 M M D D | I I [ [ 2 2 ] ] + -   |                                     | R R X X D D 0 1 / / R T X X D D L L Y Y 2 4 | PHY_RXD1/TXDLY                   |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     | VDD10_EPHY | MDI3+       | 8 9 A V   | D D 1 0 _ 2           | R                                   | X D 2 / P L L O F F 2 2 2 3                 | PHY_RXD2/PLLOFF PHY_RXD3/PHYAD0  |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     |            | MDI3-       | 1 0 M D   | I [ 3 ] +             | R                                   | X D 3 / P H Y A D 0 2 1                     |                                  | VDD10_EPHY          | R103 | 2                                                         | 14.7K 5% PHY_RXD1/TXDLY         | R104 | 2 DNP1NC/4.7K5%        | VCC33_LAN    |     |     |     |     |     |     |
|     |            |             | M D       | I [ 3 ] -             |                                     | D V D D 1 0                                 |                                  |                     |      |                                                           | R0402                           |      | R0402                  |              |     |     |     |     |     |     |
|     |            |             |           | 2 B                   |                                     |                                             |                                  |                     |      | Pull-up for additional 2ns delay to TXC for data latching |                                 |      |                        |              |     |     |     |     |     |     |
|     |            |             |           | _ 3 3 T S             | L                                   |                                             |                                  |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     |            |             |           | D D R Y C D           | O I D 3 D 2 D 1 D 0 D T C C         |                                             |                                  |                     |      |                                                           | PHY_RXD2/PLLOFF                 |      | 2 14.7K                |              |     |     |     |     |     |     |
|     |            |             |           | V A H P M             | M X T X T X T X T X T X T           |                                             |                                  |                     |      |                                                           |                                 | R105 | R0402                  | 5% VCC33_LAN |     |     |     |     |     |     |
|     |            |             |           | 1 2 3 4               | 5 6 7 8 9 0                         |                                             |                                  |                     |      |                                                           |                                 |      |                        |              |     |     |     |     |     |     |
|     |            |             |           | 1 1 1 1               | 1 1 1 1 1 2                         |                                             |                                  |                     |      | Pull-up to disable PLL @ ALDPS mode                       |                                 |      |                        |              |     |     |     |     |     |     |
VCC33_LAN
|     |     |                    |     | te0sMe_RC-YDHMP_1CAMG 0M_OIDM_1CAMG | 0M_3DXT_1CAMG 0M_2DXT_1CAMG 0M_1DXT_1CAMG 0M_0DXT_1CAMG 0M_NEXT_1CAMG 0M_KLCXT_1CAMG | 1       |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ------------------ | --- | ----------------------------------- | ------------------------------------------------------------------------------------ | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| B   |     |                    |     |                                     |                                                                                      | C26 DNP |     |     |     |     |     |     |     |     |     |     |     |     |     | B   |
|     |     | PHYRSTB is 3.3V IO |     |                                     |                                                                                      | 2 C0402 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
VCC33_LAN
close to PIN3,8,21,38
|     |     |     | R106 |     |     |     |     |     |     |     |     |     |     |     |     |     |     | close to PIN11,40 |     |     |
| --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------------- | --- | --- |
NC/10K
|     |     |      | R0402 |     |     |     |     |     |         |     | VDD10_EPHY |     |     |     |            |           | 1   | C47 1 C56   |     |     |
| --- | --- | ---- | ----- | --- | --- | --- | --- | --- | ------- | --- | ---------- | --- | --- | --- | ---------- | --------- | --- | ----------- | --- | --- |
|     |     | R107 |       |     |     |     |     |     | REG_OUT | L6  |            |     |     |     | VCC3V3_SYS | VCC33_LAN |     | 100nF 100nF |     |     |
SPI3_CLK_M1 PHY-Reset 2.2uH/1A R10810R 5%2 2 X5R 10V 2 X5R 10V
|     |     |     | 1 C 2 7 |     |     |     |     |     |     |     | C31 C36 |     | C 3 7 C38 | C39 C | 4 0 1 |     |     | C0402 C0402 |     |     |
| --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | --------- | ----- | ----- | --- | --- | ----------- | --- | --- |
0R 10 n F IND_3X3 10uF 0.1uF 0. 1 uF 0.1uF 0.1uF 0. 1 uF C41 4.7uF R0402
|     |     | R0402 | 2 X5R     |     |     |     |     |     |     |  close to PIN30 | C0603 C0402 |     | C0402 C0402 | C0402 C0402 | X5R   |     |     |                     |     |     |
| --- | --- | ----- | --------- | --- | --- | --- | --- | --- | --- | --------------- | ----------- | --- | ----------- | ----------- | ----- | --- | --- | ------------------- | --- | --- |
|     |     |       | 10V C0402 |     |     |     |     |     |     |                 |             |     |             |             | 2 10V |     | 1   | C57 1 C64           |     |     |
|     |     |       |           |     |     |     |     |     |     |                 |             |     |             |             | C0603 |     |     | 4.7uF X5R 100nF X5R |     |     |
2 10V 2 10V
C0603 C0402
|     |     |     | GMAC1_MDIO_M0 | R109 | 1K5 | R0402 VCC33_LAN |     |     |     |     |     |     |     |     |     |     |     | close to PIN28 |     |     |
| --- | --- | --- | ------------- | ---- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------- | --- | --- |
VCC33_LAN
close to PIN29
|     |     |     | PHY_RXD0/RXDLY                  |     | R110      | 22RR0402 GMAC1_RXD0_M0                        |     |     |     |     |     | 1   | C42 4.7uF 1 C44 100nF |     |     |     |     |     |     |     |
| --- | --- | --- | ------------------------------- | --- | --------- | --------------------------------------------- | --- | --- | --- | --- | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | PHY_RXD1/TXDLY                  |     | R111      | 22RR0402 GMAC1_RXD1_M0                        |     |     |     |     |     |     | 10V X5R               |     |     |     |     |     |     |     |
|     |     |     | PHY_RXD2/PLLOFF PHY_RXD3/PHYAD0 |     | R112 R113 | 22RR0402 22RR0402 GMAC1_RXD2_M0 GMAC1_RXD3_M0 |     |     |     |     |     | 2   | X5R C0603 2 10V C0402 |     |     |     |     |     |     |     |
|     |     |     | PHY_RXCLK/PHYAD1                |     | R114      | 22RR0402 GMAC1_RXCLK_M0                       |     |     |     |     |     |     |                       |     |     |     |     |     |     |     |
|     |     |     | PHY_RXDV/PHYAD2                 |     | R115      | 22RR0402 GMAC1_RXDV_CRS_M0                    |     |     |     |     |     |     |                       |     |     |     |     |     |     |     |
| A   |     |     |                                 |     |           |                                               | C46 |     |     |     |     |     |                       |     |     |     |     |     |     | A   |
NC C0402
Close to PHY
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
TTTiiitttllleee BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa+++888666---777555555---222777555777111555999111
EEEttthhheeerrrnnneeettt
|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr EEEMMM333555666666 | DDDrrraaawwwnnn | RRReeevvv 333 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------------------------------------------------------------------------- | --------------- | ------------- |
AAA222 YYYhhhggg
5 4 3 2 DDDaaattteee::: TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 1 SSShhheeeeeettt 111333 ooofff 111444

|     | 5   | 4   |     | 3   | 2   |     | 1   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
SPDIF-OUT
| D   |     |     |     |     |     |     |     | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
SPDIF_TX_M2
|     |     | SPDIF_TX_M2 R139 1 | 22R 2 R04025% |     |     |     |     |     |
| --- | --- | ------------------ | ------------- | --- | --- | --- | --- | --- |
C5 1
1 22pF DV21
C0G
50V 240E2R5PP0402
2 C0402
2
VCC3V3_SYS DJ2
1
2 LED
3 Drive IC
DQT-003
|     |     |     | C6      | C11 DQT-003 |     |     |     |     |
| --- | --- | --- | ------- | ----------- | --- | --- | --- | --- |
|     |     |     | 1 4.7uF | 1 100nF     |     |     |     |     |
|     |     |     | X5R     | X5R OPT     |     |     |     |     |
| C   |     |     | 10V     | 10V         |     |     |     | C   |
|     |     |     | 2 C0603 | 2 C0402     |     |     |     |     |
| B   |     |     |         |             |     |     |     | B   |
VCC3V3_SYS
C344 C345
1 4.7uF 1 100nF
X5R X5R
|     |     | 10V 10V VCC3V3_SYS |     |     |     |     |     |     |
| --- | --- | ------------------ | --- | --- | --- | --- | --- | --- |
2 C0603 2 C0402
VOP_BT656_D0_M1
VOP_BT656_D1_M1
|     | VOP_BT656_D2_M1  |                  | J26           |                 |     |     |     |     |
| --- | ---------------- | ---------------- | ------------- | --------------- | --- | --- | --- | --- |
|     | VOP_BT656_D3_M1  |                  | BT656-VO      |                 |     |     |     |     |
|     | VOP_BT656_D4_M1  |                  | DIP/7X2P/P2.0 |                 |     |     |     |     |
|     | VOP_BT656_D5_M1  |                  | 1 2           |                 |     |     |     |     |
|     | VOP_BT656_D6_M1  |                  | 3 1 2 4       |                 |     |     |     |     |
|     | VOP_BT656_D7_M1  | VOP_BT656_D0_M1  | 5 3 4 6       | VOP_BT656_D1_M1 |     |     |     |     |
|     |                  | VOP_BT656_D2_M1  | 7 5 6 8       | VOP_BT656_D3_M1 |     |     |     |     |
|     | VOP_BT656_CLK_M1 | VOP_BT656_D4_M1  | 9 7 8 10      | VOP_BT656_D5_M1 |     |     |     |     |
|     |                  | VOP_BT656_D6_M1  | 11 9 10 12    | VOP_BT656_D7_M1 |     |     |     |     |
|     |                  | VOP_BT656_CLK_M1 | 13 11 12 14   |                 |     |     |     |     |
13 14
| A   |     |     |     |     |     |     |     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
BBBoooaaarrrdddcccooonnn   CCCooonnnfffiiidddeeennntttiiiaaalll
BBBoooaaarrrdddcccooonnn   IIInnnccc...RRRoooooommm777000222---777111000,,,   XXXiiinnnAAAnnn   BBBuuusssiiinnneeessssss   BBBuuuiiillldddiiinnnggg,,,   444555ZZZooonnneee,,,
|     |     |     |     |     |     | BBBaaaoooAAAnnn   DDDiiissstttrrriiicccttt,,,SSShhheeennnzzzhhheeennn   CCChhhiiinnnaaa | +++888666---777555555---222777555777111555999111 |     |
| --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------------- | ------------------------------------------------ | --- |
TTTiiitttllleee
SSSPPPDDDIIIFFF
|     |     |     |     |     |     | SSSiiizzzeee DDDooocccuuummmeeennnttt   NNNuuummmbbbeeerrr | DDDrrraaawwwnnn | RRReeevvv |
| --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | --------------- | --------- |
|     |     |     |     |     |     | EEEMMM333555666666                                         | YYYhhhggg       | 333       |
AAA333
|     |     |     |     |     |     | DDDaaattteee::: TTTuuueeesssdddaaayyy,,,   MMMaaayyy   333111,,,   222000222222 | SSShhheeeeeettt 111444 | ooofff 111444 |
| --- | --- | --- | --- | --- | --- | ------------------------------------------------------------------------------- | ---------------------- | ------------- |
|     | 5   | 4   |     | 3   | 2   |                                                                                 | 1                      |               |