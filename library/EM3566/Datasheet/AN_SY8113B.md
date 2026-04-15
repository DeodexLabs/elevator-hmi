Application Note: SY8113B

High Efficiency, 500kHz, 3A, 18V Input
Synchronous Step Down Regulator

General Description

Features

The  SY8113B
is  a  high  efficiency  500  kHz
synchronous  step-down  DC-DC  converter  capable  of
delivering  3A  current.  The  SY8113B  operates  over  a
wide  input  voltage  range  from  4.5V  to  18V  and
integrates  main  switch  and  synchronous  switch  with
very low RDS(ON) to minimize the conduction loss.

Low  output  voltage  ripple  and  small  external inductor
and  capacitor  sizes  are  achieved  with  500  kHz
switching  frequency.  It  adopts  the  instant  PWM
architecture to achieve fast transient responses for high
step down applications

•

•
•
•
•

low RDS(ON) for internal switches (top/bottom):
80mΩ/40mΩ
4.5-18V input voltage range
3A output current capability
500 kHz switching frequency
Instant PWM architecture to achieve fast transient
responses.

Internal softstart limits the inrush current

•  Cycle-by-cycle peak current limitation
•
•  ±1.5% 0.6V reference
•  TSOT23-6 package

Ordering Information
SY8113

□□□□(□□□□□□□□)□□□□

Temperature  Code
Package Code
Optional Spec Code

Temperature Range: -40°C to 85°C

Ordering Number
SY8113BADC

Package type
TSOT23-6

Note
--

Applications

•  Set Top Box
•  Portable TV
•  Access Point Router
•  DSL Modem
•  LCD TV

Typical Applications

Figure 1. Schematic Diagram                                                                                 Figure 2. Efficiency Figure

AN_SY8113B Rev.0.1             Silergy Corp. Confidential-prepared for Internal Use Only         1

Silergy Corp. Confidential-Prepared for powerstar

Pinout (top view)

AN_SY8113B

BS

GND

FB

LX

IN

EN

TSOT23-6(FC)

Top Mark: WCxyz, (Device code: WC,  x=year code, y=week code, z= lot number code)

Pin Name
BS

Pin Number
1

GND

FB

EN

IN
LX

2

3

4

5
6

Pin Description

Boot-Strap Pin. Supply high side gate driver. Decouple this pin to LX pin with
0.1uF ceramic cap.
Ground pin

Output Feedback Pin. Connect this pin to the center point of the output resistor
divider (as shown in Figure 1) to program the output voltage:
Vout=0.6*(1+R1/R2)
Enable control. Pull high to turn on. Do not float.

Input pin. Decouple this pin to GND pin with at least 1uF ceramic cap
Inductor pin. Connect this pin to the switching node of inductor

Absolute Maximum Ratings (Note 1)
Supply Input Voltage ------------------------------------------------------------------------------------------------ 19V
Enable Voltage---------------------------------------------------------------------------------------------- VIN + 0.3V
FB Voltage -----------------------------------------------------------------------------------------------------------  4V
Power Dissipation, PD @ TA = 25°C, TSOT23-6（FC）----------------------------------------------------- 1W
Package Thermal Resistance (Note 2)

θ JA ------------------------------------------------------------------------------------------------------ 100°C /W
θ JC ----------------------------------------------------------------------------------------------------- 11.2°C /W
Junction Temperature Range ----------------------------------------------------------------------------------- 150°C
Lead Temperature (Soldering, 10 sec.) ----------------------------------------------------------------------- 260°C
Storage Temperature Range ------------------------------------------------------------------------- -65°C to 150°C

Recommended Operating Conditions (Note 3)
 Supply Input Voltage ---------------------------------------------------------------------------------------------- 4.5V to 18V
Junction Temperature Range -----------------------------------------------------------------------------------  -40°C to 125°C
Ambient Temperature Range -----------------------------------------------------------------------------------  -40°C to 85°C

AN_SY8113B Rev.0.1             Silergy Corp. Confidential-prepared for Internal Use Only         2

Silergy Corp. Confidential-Prepared for powerstar

Electrical Characteristics
(VIN = 12V, VOUT = 1.2V, L = 2.2uH, COUT = 47uF, TA = 25°C, IOUT = 1A unless otherwise specified)

AN_SY8113B

Test Conditions

IOUT=0, VFB=VREF*105%
EN=0

VFB=3.3V

Parameter
Input Voltage Range
Quiescent Current
Shutdown Current
Feedback Reference
Voltage
FB Input Current
Top FET RON
Bottom FET RON
Top FET PeakCurrent
Limit
Bottom FET Valley
Current Limit
EN Rising Threshold
EN Falling Threshold
Input UVLO Threshold
UVLO Hysteresis
Min ON Time
Min OFF Time
Switching Frequency
Soft-start Time
Thermal Shutdown
Temperature
Thermal Shutdown
Hysteresis

Symbol
VIN
IQ
ISHDN
VREF

IFB
RDS(ON)1
RDS(ON)2
ILIM,TOP

ILIM

VENH
VENL
VUVLO
VHYS

tSS
TSD

THYS

Min
4.5

Typ  Max

18

Unit
V
µA
µA

10
0.609  V

50
90
50
6

nA
mΩ
mΩ
A

4.25

A

0.4
4.5

120
220

V
V
V
V
ns
ns
kHz
uS
°C

°C

0.591

-50

3

1.5

50
140

100
5
0.6

80
40

0.3
80
170
500
800
150

15

Note 1: Stresses beyond the “Absolute Maximum Ratings” may cause permanent damage to the device. These are
stress ratings only. Functional operation of the device at these or any other conditions beyond those indicated in the
operational sections of the specification is not implied. Exposure to absolute maximum rating conditions for
extended periods may affect device reliability.

Note 2:  θ JA is measured in the natural convection at TA = 25°C on a low effective 4-layer thermal conductivity test
board  of  JEDEC  51-3  thermal  measurement  standard.  Pin2  of  TSOT23-6  packages  is  the  case  position  for  θ JC
measurement.

Note 3: The device is not guaranteed to function outside its operating conditions

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        3

Silergy Corp. Confidential-Prepared for powerstar

Block Diagram

AN_SY8113B

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        4

Silergy Corp. Confidential-Prepared for powerstar

 Typical Performance Characteristics

Efficiency vs. Load Current

AN_SY8113B

100

95

90

85

80

75

70

95

90

85

80

75

70

65

60

VIN=6V,VOUT=5V
VIN=12V,VOUT=5V
VIN=16V,VOUT=5V

0.01

0.10

1.00

10.00

Load Current (A)

Efficiency vs. Load Current

VIN=5V,VOUT=1.2V
VIN=12V,VOUT=1.2V
VIN=16V,VOUT=1.2V

0.01

0.10

1.00

10.00

Load Current (A)

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        5

Silergy Corp. Confidential-Prepared for powerstar

AN_SY8113B

Short Circuit Protection
(VIN=12V, VOUT=3.3V, Open to Short)

Short Circuit Protection
(VIN=12V, VOUT=3.3V, 3A to Short)

VOUT                     2V/div

VOUT                     2V/div

IL                         1A/div

IL                           1A/div

Time (2ms/div)

Time (2ms/div)

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        6

Silergy Corp. Confidential-Prepared for powerstar

Operation

SY8113B  is  a  synchronous  buck  regulator  IC  that
integrates  the  PWM  control,  top  and  bottom  switches
on  the  same  die  to  minimize  the  switching  transition
loss and conduction loss. With ultra low Rds(on) power
switches  and  proprietary  PWM  control,  this  regulator
IC  can  achieve  the  highest  efficiency  and  the  highest
switch  frequency  simultaneously  to  minimize  the
external inductor and capacitor size, and thus achieving
the minimum solution footprint.

SY8113B  provides  protection  functions  such  as  cycle
by  cycle  current  limiting  and
thermal  shutdown
protection.  SY8113B  will  sense  the  output  voltage
conditions for the fault protection.

Applications Information

Because of the high integration in the SY8113B IC, the
application circuit based on this regulator IC is rather
simple. Only input capacitor CIN, output capacitor COUT,
output inductor L and feedback resistors (R1 and R2)
need to be selected for the targeted applications
specifications.

Feedback resistor dividers R1 and R2:

Choose R1 and R2 to program the proper output voltage.
To minimize the power consumption under light loads,
it is desirable to choose large resistance values for both
R1 and R2. A value of between 10kΩ and 1MΩ is
highly recommended for both resistors. If Vout is 3.3V,
R1=100k is chosen, then using following equation, R2
can be calculated to be 22.1k:

AN_SY8113B

To minimize the potential noise problem, place a
typical X5R or better grade ceramic capacitor really
close to the IN and GND pins. Care should be taken to
minimize the loop area formed by CIN, and IN/GND
pins. In this case, a 10uF low ESR ceramic capacitor is
recommended.

Output capacitor COUT:
The output capacitor is selected to handle the output
ripple noise requirements. Both steady state ripple and
transient requirements must be taken into consideration
when selecting this capacitor. For the best performance,
it is recommended to use X5R or better grade ceramic
capacitor greater than 22uF capacitance.

Output inductor L:
There are several considerations in choosing this
inductor.
1)  Choose the inductance to provide the desired

ripple current. It is suggested to choose the ripple
current to be about 40% of the maximum output
current. The inductance is calculated as:

=

L

V
OUT
F
SW

V(1
I

OUT,

/V

OUT

MAX

)

IN,
MAX
40%

where Fsw is the switching frequency and IOUT,MAX is
the maximum load current.
The SY8113B regulator IC is quite tolerant of different
ripple current amplitude. Consequently, the final choice
of inductance can be slightly off the calculation value
without significantly impacting the performance.
2)  The saturation current rating of the inductor must
be selected to be greater than the peak inductor
current under full load conditions.

=

R
2

6.0

V
6.0

V

V

OUT

R
1

.

0.6VFB

VOUT

R1

,
I
SAT MIN

>

,
I
OUT MAX

+

OUT

V (1-V /V ,
2 F

OUT

L

SW

)
IN MAX

GND

R2

Input capacitor CIN:

The ripple current through input capacitor is calculated
as：

I

_CIN

RMS

=

I

OUT

)D1(D

.

3)  The DCR of the inductor and the core loss at the
switching frequency must be low enough to
achieve the desired efficiency requirement. It is
desirable to choose an inductor with DCR<50mΩ
to achieve a good overall efficiency.

External Boostrap Cap
This capacitor provides the gate driver voltage for
internal high side MOSEFET. A 100nF low ESR
ceramic capacitor connected between BS pin and LX
pin is recommended.

BS

CB
100nF

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        7

LX

Silergy Corp. Confidential-Prepared for powerstar

-

-
(cid:215)

·
·
-

(cid:215)
(cid:215)

Load Transient Considerations:
The SY8113B regulator IC integrates the compensation
components to achieve good stability and fast transient
responses. In some applications, adding a 22pF ceramic
cap  in  parallel  with  R1  may  further  speed  up the  load
transient  responses  and  is  thus  recommended  for
applications with large load transient step requirements.

Layout Design:

The  layout  design  of  SY8113B  regulator  is  relatively
simple.  For  the  best  efficiency  and  minimum  noise
promblem,  we should place the  following components
close to the IC: CIN, L, R1 and R2.

AN_SY8113B

1) It is desirable to maximize the PCB copper area
connecting to GND pin to achieve the best thermal and
noise performance.  If the board space allowed, a
ground plane is highly desirable.

2) CIN must be close to Pins IN and GND. The loop
area formed by CIN and GND must be minimized.

3) The PCB copper area associated with LX pin must
be minimized to avoid the potential noise problem.

4) The components R1 and R2, and the trace connecting
to the FB pin must NOT be adjacent to the LX net on
the PCB layout to avoid the noise problem.

5) If the system chip interfacing with the EN pin has a
high impedance state at shutdown mode and the IN pin
is connected directly to a power source such as a Li-Ion
battery, it is desirable to add a pull down 1Mohm
resistor between the EN and GND pins to prevent the
noise from falsely turning on the regulator at shutdown
mode.

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        8

Silergy Corp. Confidential-Prepared for powerstar

TSOT23-6L (FC)Package outline & PCB layout

AN_SY8113B

1.90
1.90

2.80 - 3.10
2.80 - 3.10

0
0
4
4
.
.
2
2

0.95
0.95

Recommended Pad Layout

0
0
0
0
3
3

.
.

-
-
0
0
7
7
2
2

.
.

0
0
0
0
.
.

1
1

0.60
0.60

.

0
2
0
-
1
0

.

1.00 (max)

F
E
R
5
2
0

.

0.3 - 0.6

0.95 TYP

1.90 TYP

0
0
7
7
1
1

.
.

-
-
0
0
5
5
1
1

.
.

0.30 - 0.50
0.30 - 0.50

1
.
0
-

1
0
.
0

Notes:

All dimension in MM
All dimension don’t not include mold flash & metal burr

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        9

Silergy Corp. Confidential-Prepared for powerstar

AN_SY8113B

Taping & Reel Specification

1.  Taping orientation

TSOT23-6

3.9/4.1
3.9/4.1

1.45/1.55
1.45/1.55

3
3
.
.
8
8
/
/
7
7
.
.
7
7

                                                     Feeding direction
2.  Carrier Tape & Reel specification for packages

Reel
Width

Reel
Size

Package
types

Tape
width
(mm)

Pocket
pitch(mm)

Reel size
(Inch)

Reel
width(mm)

Trailer
length(mm)

Leader length
(mm)

Qty per
reel

SOT23-6

8

4

7"

8.4

280

160

3000

3.  Others:  NA

AN_SY8113B Rev.0.1           Silergy Corp. Confidential-prepared for Internal Use Only        10

Silergy Corp. Confidential-Prepared for powerstar

