5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

is  a  high-frequency,  high-current

DESCRIPTION
The TCS4525
synchronous  step-down  dc-dc  converter  optimized  to
supply  the  different  sub  systems  of  smart-phones,
Tablets,  and portable  applications  powered  by  one cell
Li−Ion or three cell Alkaline/NiCd/NiMH batteries. The
device  is  able  to  deliver  up  to  5A,  with  programmable
output voltage from 0.6 V to 1.4V.
The TCS4525  operates  at  3-MHz  fixed  switching
frequency  which  allows  the  use  of  small  low  cost
inductors  and  capacitors.  During  light  load  conditions,
to  enhance
includes  a  PFM  mode
the  regulator
light-load efficiency. The regulator transitions smoothly
between  PWM  and  PFM  modes.  Synchronous
rectification  and  automatic  PWM/PFM
transitions
improve overall efficiency.
The  serial  interface  is  compatible  with  Fast/Standard
and  High-Speed  mode  I2C  specification  allowing
transfers  at  up  to  3.4  Mbps.  This  communication
interface  is  used  for  dynamic  voltage  scaling  with
voltage steps down to 6.25 mV, for reprogramming the
mode  of  operation  (PFM  or  Forced  PWM)  or
disable/enabling the output voltage.

Typical Application Circuit

  FEATURES
(cid:1)
(cid:1)
(cid:1)
(cid:1)

(cid:1)

(cid:1)
(cid:1)
(cid:1)

2.7V to 5.5V Input Voltage Range
3MHz Constant Switching Frequency
5A Available Load Current
I2C Control Interface with Dynamic Voltage
Scaling Support
Programmable Output Voltage: 0.6V to 1.4V in
6.25mV Steps
Small size, 0.33µH or 0.47µH Inductor Solution
52µA Typical Quiescent Current
PFM/PWM Operation for Optimum Increased
Efficiency
Excellent Load and Line Transient Response
Short Circuit and Thermal Protection

(cid:1)
(cid:1)
(cid:1)  Available in 2.0mm×1.6mm WCSP-20 Package
(cid:1)  RoHS Compliant and 100% Lead(Pb)-Free

Halogen-Free

APPLICATIONS
(cid:1)
(cid:1)
(cid:1)
          Supplies

Smart Phones
Tablets
 Low-Voltage DSPs and Processors Core Power

Figure 1.

Ver.1.0  May.26,2015    Page       1

Typical Application Circuit (Continued)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Block Diagram

Figure 2.

Figure 3.

Ver.1.0  May.26,2015    Page       2

Pin Configurations

Package Type

Pin Configurations

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

WCSP-20

Pin Description

Name

WCSP-20

PVIN

D2,E1,E2

AVIN

SW

PGND

AGND

SDA

SCL

VSEL

EN

FB

PGND/PG

D1

D3,D4,E3,E4
B2,C1,C2,
C3,C4
B4

B1

A3

A1

A2

A4

B3

Ordering Information

DESCRIPTION

Power Input Voltage. Connect to input power source. The connection from this pin
to CIN should be as short as possible.
Analog  Input  Voltage.  Connect  to  input  power  source  as  close  as  possible  to  the
input bypass capacitor.
Switching Node. Connect to the inductor.
Power GND. Connect to the (-) terminal of output capacitor and (-) terminal of input
capacitor.
Analog GND. This is the signal ground reference for the IC.
SDA.  I2C  interface  serial  data.  There  is  an  internal  pull  down  resistor  on  this  pin;
could be left open if not used.
SCL. I2C interface serial clock. There is an internal pull down resistor on this pin;
could be left open if not used.
Output  voltage  and  mode  selection.
This  pin  determines  which  of  the  two
programmable  configurations  to  utilize.  This  behavior  can  be  overridden  through
I2C register settings. There is an internal pull down resistor on this pin; could be left
open if not used.
Enable. When HIGH, the circuit is enabled. There is an internal pull down resistor
on this pin.
Feedback Voltage Input. Tie this pin to the output voltage.

Power Good open drain output. If not used has to be connected to ground.

Order Number

Package Type

Marking

Quantity per Reel Operating Temperature Range

TCS4525_WT

WCSP-20

xxx
Y00

3000

-40°C to +85°C

Ver.1.0  May.26,2015    Page       3

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Absolute Maximum Ratings (1)

(cid:2)

(cid:2)

(cid:2)

(cid:2)

(cid:2)

(cid:2)

(cid:2)

(cid:2)

Input Supply Voltage(AVIN,PVIN)    -------------------------------------------    -0.3V to 6V
SW Voltage -------------------------------------------------------------------------    -0.3V to VIN+0.3V
SDA, SCL, VSEL, EN, FB Voltages --------------------------------------------    -0.3V to 6V
Package Thermal Resistance
WCSP-20,θJA -----------------------------------------------------------------------    65°C/W
Junction Temperature --------------------------------------------------------------    150°C
Lead Temperature (Soldering, 10sec.) -------------------------------------------    260°C
Storage Temperature Range -------------------------------------------------------    -65°C to 150°C
ESD Susceptibility (HBM) --------------------------------------------------------    2kV

Recommended Operating Conditions (2)

(cid:2)

(cid:2)

Supply Voltage -------------------------------------------------------------------      2.7V to 5.5V
Operating Temperature --------------------------------------------------------    -40°C to +85°C

Note (1): Stress beyond those listed under “Absolute Maximum Ratings” may damage the device.
Note (2): The device is not guaranteed to function outside the recommended operating conditions.
Electrical Characteristics
(The ● denote the Spec. apply over the full operating temperature range, otherwise Spec. are TA =+25°C.
VIN =3.6V unless otherwise specified. )

Symbol

Parameter

Conditions

VIN

Input Voltage Range

-40°C≤TA≤+85°C

UVLO

Input Undervoltage Lockout

∆VOUT

Output Voltage Load Regulation

Output Voltage Line Regulation

Rising
IO= 0 to 5A, VOUT=1.15V,
PWM Mode
IO= 0A, VIN=2.7V to 5.5V,
VOUT=1.15V, PWM Mode

VIH

VIL

High-Level Input Voltage

Low-Level Input Voltage

IQ

Quiescent Current

ISHDN

OFF Mode Current

ISLEEP

SLEEP Mode Current

IPEAK

fOSC

Peak Inductor Current

Oscillator Frequency

ILSW

SW Leakage Current

EN,VSEL,SCL,SDA

IO=0mA, PFM mode,
no switching
IO=0mA, PWM mode,
switching
EN,VSEL,SLEEP_mode
bit low
EN high, DC-DC off
(or EN low, VSEL low,
SLEEP_mode bit high)

EN=0V, SW=0V

EN=0V, SW=3.6V

RPFET

RDS(ON) of P-Channel FET

ISW=500mA, VIN=5V

RNFET

RDS(ON) of N-Channel FET

ISW=500mA, VIN=5V

TSD

Thermal Shutdown

TSD-Hys  Thermal Shutdown Hysteresis

Min.
2.7

●

TCS4525
Typ.

Max.
5.5

1.2

2.2

0.1

0.1

52

14

0.4

Unit

V

V

%/A

%/V

V

V

µA

mA

●

0.3

5

µA

2.65

17

8

3

31

17

150

20

µA

A

3.35  MHz

5

5

µA

µA

mΩ

mΩ

°C

°C

Ver.1.0  May.26,2015    Page       4

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

I2C Timing Specifications

Symbol

Parameter

Conditions

TCS4525
Typ.

Min.

fSCL

SCL Clock Frequency

tBUF

Bus-Free Time between STOP
and START Conditions

tHD;STA

START or Repeated-START Hold
Time

tLOW

SCL LOW Period

tHIGH

SCL HIGH Period

tSU;STA

Repeat-START Setup Time

tSU;DAT

Data Setup Time

tHD;DAT

Data Hold Time

tRCL

SCL Rise Time

tFCL

SCL Fall Time

tRCL1

Rise Time of SCL After a
Repeated START Condition and
After ACK Bit

tRDA

SDA Rise Time

Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
Standard Mode
Fast Mode
High-Speed Mode
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode
Standard Mode
Fast Mode
High-Speed Mode
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF

Ver.1.0  May.26,2015    Page      5

4.7
1.3
4
100
160
4.7
1.3
160
320
4
600
60
120
4.7
600
160
250
100
10

0
0
0
0
20+0.1CB
20+0.1CB
10
20
20+0.1CB
20+0.1CB
10
20
20+0.1CB
20+0.1CB
10
20
20+0.1CB
20+0.1CB
10
20

Unit

Max.
kHz
100
400
kHz
3.4  MHz
1.7  MHz
µs
µs
µs
ns
ns
µs
ns
ns
ns
µs
ns
ns
ns
µs
ns
ns
ns
ns
ns
µs
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns
ns

3.45
900
70
150
1000
300
80
160
300
300
40
80
1000
300
80
160
1000
300
80
160

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

I2C Timing Specifications (continued)

Symbol

Parameter

Conditions

Standard Mode
Fast Mode
High-Speed Mode, CB≦100pF
High-Speed Mode, CB≦400pF
Standard Mode
Fast Mode
High-Speed Mode

tFDA

SDA Fall Time

tSU;STO

STOP Condition Setup Time

CB

Capacitive Load for SDA and
SCL

I2C Timing Diagrams

Max.
300
300
80
160

TCS4525
Typ.

Min.

20+0.1CB
20+0.1CB
10
20
4
600
160

Unit

ns
ns
ns
ns
µs
ns
ns

400

pF

Figure 4. I2C Interface Timing for Fast and Standard (F/S) Modes

        Note A: First rising edge of SCLH after Repeated Start and after each ACK bit.

Figure 5. I2C Interface Timing for High Speed (HS) Mode

Ver.1.0  May.26,2015    Page       6

Typical Operating Characteristics
(AVIN=PVIN=3.6V, L=0.47µH, COUT=2×22µF)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       7

Typical Operating Characteristics (continued)
(AVIN=PVIN=3.6V, L=0.47µH, COUT=2×22µF)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       8

Typical Operating Characteristics (continued)
(AVIN=PVIN=3.6V, L=0.47µH, COUT=2×22µF)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       9

Typical Operating Characteristics (continued)
(AVIN=PVIN=3.6V, L=0.47µH, COUT=2×22µF)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       10

Typical Operating Characteristics (continued)
(AVIN=PVIN=3.6V, L=0.47µH, COUT=2×22µF)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       11

OPERATION
Functional Description

The TCS4525  is  a  synchronous  step-down  converter
typically  operating  with  a  3-MHz  fixed  frequency
pulse-width modulation (PWM) at moderate to heavy
load  currents.  At  light  load  currents,  the  converter
could be programmed to operate with pulse frequency
modulation  (PFM)  to  improve  efficiency.  Both  the
main  (P-Channel  MOSFET)  and  the  synchronous
(N-Channel  MOSFET)  switches  are  internal.  The
TCS4525  uses  voltage  mode  architecture  with  input
voltage  feed-forward.  This  achieves  good  load  and
line response and allows the use of tiny inductors and
small ceramic input and output capacitors.
2C  compatible  interface
The TCS4525  integrates  an  I
allowing
to  3.4  Mbps.  This
communication  interface  can  be  used  for  dynamic
voltage  scaling  with  voltage  steps  down  to  6.25  mV,
for  reprogramming  the  mode  of  operation  (PFM  or
forced  PWM)  or  disable/enabling  the  output  voltage
for  instance.  For  more  details,  see  the  I2C  interface
and register description section.
Forced PWM Operation

transfers  up

Selecting forced PWM mode operation, the TCS4525
regulates  output  voltage  by  switching  at  a  constant
frequency and then modulating the power transferred
to the load each cycle using PWM comparator. At the
beginning  of  each  switching  cycle,  the  P-channel
MOSFET switch is turned on and the inductor current
ramps  up  until  the  PWM  comparator  trips  and  the
control  logic  turns  off  the  switch.  The  duty  cycle  is
controlled  by  two  weighed  differential  signals:  the
output  of  error  amplifier  and  the  sawtooth  ramp.
Forced  PWM  operation  provides  low  ripple  noise.
The TCS4525 can be programmed to only use PWM
and  disable
if  desired
(PWMVSEL0/  PWMVSEL1  bits  of  COMMAND
register).

transition

to  PFM

the

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

level  of

switching frequency and quiescent current to maintain
high efficiency. During PFM operation, there are two
thresholds  to  control  the  loop  and  limit  the  output
ripple as shown in Figure 6. With the increase of load
current,  the  converter  changes  from  PFM  to  PWM
mode with smooth transition.
Output Voltage
Output  voltage
programmed in the 0.6 V to 1.4 V range by 6.25 mV
steps.  Writing  in  the  VoutVSEL0[6..0]  bits  of  the
PROGVSEL0 register or VoutVSEL1[6..0] bits of the
PROGVSEL1  register  will  change  settings.  The
VSEL  pin  and  VSELGT  bit  will  determine  which
register  between  PROGVSEL0  and  PROGVSEL1
will set the output voltage.
(cid:1)

the TCS4525  can  be

If VSELGT=1 AND VSEL=0, Output voltage is
set  by  VoutVSEL0[6..0]  bits  (PROGVSEL0
register)
Else,  Output  voltage  is  set  by  VoutVSEL1[6..0]
bits (PROGVSEL1 register)

(cid:1)

turning  on

When  the  VSEL  pin  is  set  high,  the TCS4525  has  a
default output voltage of 1.15V. When the VSEL pin
is  set  low,  the  default  output  voltage  changes  to
1.025V.
Undervoltage Lockout
The  undervoltage  lockout  circuit  prevents  device
from  misoperation  at  low  input  voltages.  It  prevents
the  converter  from
the  main  and
synchronous switches under undervoltage state.
Thermal Shutdown
As soon as the junction temperature of the IC exceeds
150°C typical, the device goes into thermal shutdown.
Both
and
synchronous  (N-channel  MOSFET)  switches  are
turned off.
When TCS4525  returns  from  thermal  shutdown,  it
can  restart  in  two  different  configurations  depending
on  REARM  bit  in  the  LIMCONF  register  (see
register description section):
(cid:1)

(P-channel  MOSFET)

the  main

If  REARM  =  0, TCS4525  does  not  restart  after
TSD. To restart, an EN pin toggle is required.
If  REARM  =  1, TCS4525  restarts  with  register
values set prior to thermal shutdown. The device
recovers
junction
its  operation  when
temperature falls below 130°C typical again.

the

(cid:1)

Figure 6. Operation in PFM mode and transfer to

PWM mode

PFM/PWM Operation

The TCS4525  could  operate  at  PFM  mode  to  save
power  and  improve  efficiency  when  the  load  current
is  very
the  converter  will
this  case,
automatically  switch  between  PFM  state  and  PWM
state based on load demand. At light loads, the device
enters  PFM  mode  and  operates  with  reduced

low.  In

Active Output Discharge
To make sure that no residual voltage remains in the
power  supply  rail,  an  active  discharge  path  can
ground  the TCS4525  output  voltage.  For  maximum
flexibility,  this  feature  can  be  easily  disabled  or
enabled  with  DISCHG  bit  in  PGOOD  register.  By
default the discharge path is disabled.

Ver.1.0  May.26,2015    Page       12

Enabling
The EN pin controls TCS4525 start up. EN pin Low
to  High  transition  starts  the  power  up  sequencer.  If
EN  is  made  low,  the  DC-DC  converter  is  turned  off
and device enters:
(cid:1)

In Sleep Mode if Sleep_Mode I2C bit is high or
VSEL is high.
In Off Mode if Sleep_Mode I2C bit and VSEL
are low.

(cid:1)

is

allowing

the  output  voltage

When  EN  pin  is  set  to  high  level,  the  DC-DC
converter  can  be  enabled/disabled  by  writing  the
ENVSEL0 or ENVSEL1 bit of the PROGVSEL0 and
PROGVSEL1  registers:  If  ENVSELx  bit  is  high,
DC-DC is activated. If ENVSELx bit is low, DC-DC
converter  is  turned  off  and  device  enters  in  Sleep
Mode.
A built in pull down resistor disables the device when
this pin is left unconnected or not driven.
Dynamic Voltage Scaling (DVS)
This  converter  supports  dynamic  voltage  scaling
(DVS)
to  be
reprogrammed  via  I2C  commands  and  provides  the
different  voltages  required  by  the  processor.  The
change  between  set  points  is  managed  in  a  smooth
fashion  without  disturbing  the  operation  of  the
processor.  When  programming  a  higher  voltage,
in  equidistant  steps,  which  are
output
6.25mV/0.166us,  such  that  the  dV/dt  is  controlled.
When  programming  a  lower  voltage,  output  will
decrease  in  equidistant  steps  per  defined  time  period
(default
such
6.25mV/2.666us) by writing DVS[1..0] bits in TIME
register.  DVS  sequence  is  automatically  initiated  by
changing output voltage settings. There are two ways
to change these settings:
(cid:1)

the  dV/dt

controlled

Directly  change  the  active  setting  register  value
(VoutVSEL0[6..0]  of  PROGVSEL0  register  or
VoutVSEL1[6..0]  of  the  PROGVSEL1  register)
via I2C command.
Change  the  VSEL  internal  signal  level  by
toggling VSEL pin.

raises

that

The  second  method  eliminates  the  I2C  latency  and
therefore faster.
VSEL Pin
By changing VSEL pin levels, the user has a latency
free way to change TCS4525 configuration: operating
mode  (Auto  or  PWM  forced),  the  output  voltage  as
well  as  enable.
VSEL  pin  action  can  be  masked  by
writing  0  to  the  VSELGT  bit  in  the  COMMAND
register.  In  that  case  I2C  bit  corresponding  to  VSEL
high will be taken into account.
Power Good Pin (Optional)
To  indicate  the  output  voltage  level  is  established,  a
power good signal is available. The power good pin is
pulled down when the DC-DC converter is off. Once
the output voltage reaches 93% of the expected output

(cid:1)

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

level, the power good logic signal becomes high and
the  open  drain  output  becomes  high  impedance.
During  operation  when  the  output  drops  below  90%
of the programmed level, the power good logic signal
goes  low  and  the  open  drain  signal  transitions  to  a
low impedance state, which indicates a power failure.
When the voltage rises again to above 93% the power
good signal goes high again.
During a positive DVS sequence, when target voltage
is  higher  than  initial  voltage,  the  Power  Good  logic
signal will be set low during output voltage ramping
and transition to high once the output voltage reaches
93% of the target voltage. When the target voltage is
lower  than  the  initial  voltage,  Power  Good  pin  will
remain at high level during transition.
Power  Good  signal  during  normal  operation  can  be
disabled  by  clearing  the  PGDCDC  bit  in  PGOOD
register.
Power Good operation during DVS can be controlled
by  setting  /  clearing  the  bit  PGDVS  in  PGOOD
register.
In  order  to  generate  a  Reset  signal,  a  delay  can  be
programmed between the output voltage gets 93% of
its final value and Power Good pin is released to high
level.  The  delay  is  set  through  the  TOR[1..0]  bits  in
the TIME register. The default delay is 0 ms.
I2C interface
Description
I2C  is  a  2-wire  serial  interface  developed  by  Philips
Semiconductor  (see  I2C-Bus  Specification,  Version
2.1,  January  2000).  The  bus  consists  of  a  data  line
(SDA) and a clock line (SCL) with pull-up structures.
When  the  bus  is  idle,  both  SDA  and  SCL  lines  are
pulled high. All the I2C compatible devices connect to
the  I2C  bus  through  open  drain  I/O  pins,  SDA  and
SCL. A master device, usually a microcontroller or a
digital signal processor, controls the bus. The master
is  responsible  for  generating  the  SCL  signal  and
device  addresses.  The  master  also  generates  specific
conditions that indicate the START and STOP of data
transfer. A slave device receives and/or transmits data
on the bus under control of the master device.
The TCS4525  device  works  as  a  slave  and  supports
the  following  data  transfer  modes,  as  defined  in  the
I2C-Bus Specification: standard mode (100 kbps), fast
mode  (400  kbps),  and  high-speed  mode  (up  to  3.4
Mbps in write mode). The interface adds flexibility to
the power supply solution, enabling most functions to
be  programmed  to  new  values  depending  on  the
instantaneous  application  requirements.  The  data
transfer  protocol  for  standard  and  fast  modes  is
exactly  the  same.  Therefore,  they  are  referred  to  as
F/S-mode
this  document.  The  protocol  for
high-speed  mode  is  identical  with  the  F/S-mode
except  the  bus  speed,  and  it  is  referred  to  as
HS-mode.
The TCS4525 device supports 7-bit addressing. The 7
MSBs are 0011100.

in

Ver.1.0  May.26,2015    Page       13

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

When  the  bus  is  idle,  both  SDA  and  SCL  lines  are
pulled high by the pull-up devices.
This  transmission  is  made  in  F/S-mode  at  no  more
than 400 Kbps. No device is allowed to acknowledge
the HS master code, but all devices must recognize it
and  switch  their  internal  setting  to  support  3.4-Mbps
operation.
The master then generates a repeated start condition (a
repeated  start  condition  has  the  same  timing  as  the
start condition). After this repeated start condition, the
protocol  is  the  same  as  F/S-mode,  except  that
transmission  speeds  up  to  3.4  Mbps  are  allowed.  A
stop condition ends the HS-mode.

Figure7.Start and Stop conditions

Figure8.Bit Transfer on the Serial Interface

Fast/Standard (F/S) Mode Protocol

knows

the  7-bit  address  and

the  master
link  with  a

The  master  initiates  data  transfer  by  generating  a
start  condition.  The  start  condition  is  when  a
high-to-low transition occurs on the SDA line while
SCL  is  high,  see  Figure  7.  All  I2C-compatible
devices should recognize a start condition.
The  master  then  generates  the  SCL  pulses,  and
transmits
the  read/write
direction  bit  R/W  on  the  SDA  line.  During  all
transmissions, the master ensures that data is valid. A
valid  data  condition  requires  the  SDA  line  to  be
stable during the entire high period of the clock pulse,
see  Figure  8. All  devices  recognize the  address  sent
by  the  master  and  compare  it  to  their  internal  fixed
addresses.  Only  the  slave  device  with  a  matching
address  generates  an acknowledge  bit,  see  Figure  9,
by  pulling  the  SDA  line  low  during  the  entire  high
period  of  the  ninth  SCL  cycle.  Upon  detecting  this
acknowledge,
the
that
slave  has  been
communication
established.
The  master  generates  further  SCL  cycles  to  either
transmit data to the slave (R/W bit 1) or receive data
from  the  slave  (R/W  bit  0).  In  either  case,  the
receiver  needs  to  acknowledge  the  data  sent  by  the
transmitter.  An  acknowledge  signal  can  either  be
generated  by  the  master  or  by  the  slave,  depending
on  which  one  is  the  receiver.  9-bit  valid  data
sequences  consisting  of  8-bit  data  and  1-bit
acknowledge can continue as long as necessary.
To  signal  the  end  of  the  data  transfer,  the  master
generates  a  stop  condition  by  pulling  the  SDA  line
from  low  to  high  while  the  SCL  line  is  high,  see
Figure  7.  This  releases  the  bus  and  stops  the
communication link with the addressed slave. All I2C
compatible devices must recognize the stop condition.
Upon  the  receipt  of  a  stop  condition,  all  devices
know  that  the  bus  is  released,  and  they  wait  for  a
start condition followed by a matching address.
High Speed (HS) Mode

Figure9.Acknowledge on the I2C Bus

Ver.1.0  May.26,2015    Page       14

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Read and Write transactions

Figure10.Bus Protocol

The TCS4525  requires  a  start  condition,  a  valid  I
update. After the receipt of each byte, the TCS4525
period of a single clock pulse. A valid I2
edge of the LSB byte.
When EN pin is tied to ground, the registers can be updated via the I2C interface.

2C  address,  a  register  address  byte,  and  a  data  byte  for  a  single
 device acknowledges by pulling the SDA line low during the high
update on the falling

C address selects the TCS4525. TCS4525 performs an

TCS4525
TCS4525

TCS4525
TCS4525

Figure11. "Write" Data Transfer Format in F/S-Mode

TCS4525
TCS4525

TCS4525
TCS4525

Figure12. "Read" Data Transfer Format in F/S-Mode

Configurations
Default values of TCS4525 are shown below:
(cid:1)
(cid:1)
(cid:1)
(cid:1)
(cid:1)
(cid:1)

I2C Address: 0011100
VOUT_VSEL1: 1.15V
VOUT_VSEL0: 1.025V
MODE_VSEL1: Forced PWM
MODE_VSEL0: PWM/PFM Auto Mode
IPEAK: 8A

Ver.1.0  May.26,2015    Page       15

Register Description

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       16

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       17

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       18

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Ver.1.0  May.26,2015    Page       19

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

∆V

OUT

L∆I





ESR

+

1

8fC

OUT





When choosing the input and output ceramic capacitors,
choose the X5R or X7R dielectric formulations. These
dielectrics  have  the  best  temperature  and  voltage
characteristics of all the ceramics for a given value and
size.
Thermal Considerations

To  avoid  the TCS4525  from  exceeding  the  maximum
junction temperature, the user will need to do a thermal
analysis.  The  goal  of  the  thermal  analysis  is  to
determine whether the operating conditions exceed the
maximum  junction  temperature  of  the  part.  The
temperature rise is given by:

TR=(PD)(θJA)

2×  RDS(ON)  is  the  power  dissipated  by
Where  PD=ILOAD
the  regulator  ;  θJA  is  the  thermal  resistance  from  the
junction  of  the  die  to  the  ambient  temperature.  The
junction temperature, TJ, is given by:

TJ=TA+TR

Where TA is the ambient temperature.
TJ should be below the maximum junction temperature
of 150°C.
PC Board Layout Checklist

laying  out

the  printed  circuit  board,

For  all  switching  power  supplies,  the  layout  is  an
important  step  in  the  design  especially  at  high  peak
currents and switching frequencies. If the layout is not
carefully  done,  the  regulator  might  show  stability
problems as well as EMI problems.
the
When
following  guidelines  should  be  used  to  ensure  proper
operation of the TCS4525.
The  input  capacitor  CIN  should  connect  to  VIN  as
closely  as  possible.  This  capacitor  provides  the  AC
current to the internal power MOSFETs.
The power traces, consisting of the GND trace, the SW
trace and the VIN trace should be kept short, direct and
wide.
For good thermal coupling, PCB vias are required from
the Pad for the thermal paddle to the ground plane.

Applications Information

Inductor Selection

The TCS4525  typically  uses  a  0.33µH  or  0.47µH
inductor.  The  output  inductor  is  selected  to  limit  the
ripple  current  to  some  predetermined  value,  typically
20%~40%  of  the  full  load  current  at  the  maximum
input  voltage.  Large  value  inductors  lower  ripple
currents.  Higher  VIN  or  VOUT  also  increases  the  ripple
current as shown in equation.





The DC current rating of the inductor should be at least
equal to the maximum load current plus half the ripple
current to prevent core saturation. The DC resistance of
the  inductor  directly  influences  the  efficiency  of  the
converter. Therefore for better efficiency, choose a low
DC-resistance inductor.
CIN and COUT Selection

OUTV
INV

OUTV

(f)(L)

L∆I






=

1

1

the  source  current  of

In  continuous  mode,
the
P-Channel  MOSFET  is  a  square  wave  of  duty  cycle
VOUT/VIN. The primary function of the input capacitor
is  to  provide  a  low  impedance  loop  for  the  edges  of
pulsed  current  drawn  by  the TCS4525.  A  low  ESR
input  capacitor  sized  for  the  maximum  RMS  current
must be used. The size required will vary depending on
the  load,  output  voltage  and  input  voltage  source
impedance  characteristics.  A  typically  CIN  value  is
around  10µF.  If  the  wire  of  supply  is  too  long,  larger
input capacitor should be used, 22µF is preferred.
The input capacitor RMS current varies with the input
voltage  and  the  output  voltage.  The  equation  for  the
maximum RMS current in the input capacitor is:

L∆I

=

1

(f)(L)

OUTV






1

OUTV
INV






The  output  capacitor  COUT has  a  strong  effect  on  loop
stability.  The  selection  of  COUT  is  driven  by  the
required  effective  series  resistance  (ESR).  ESR  is  a
direct  function  of  the  volume  of  the  capacitor;  that  is,
physically larger capacitors have lower ESR. Once the
ESR  requirement  for  COUT  has  been  met,  the  RMS
current  rating  generally  far  exceeds  the  IRIPPLE(P-P)
requirement. The output ripple ∆VOUT in PWM mode is
determined by:

Ver.1.0  May.26,2015    Page       20

-
-
@

5A, 3MHz Synchronous Step-Down

TCS4525

DC-DC with I

2

C Compatible Interface

Packaging Information

WCSP-20

SYMBOLS

MILLIMETERS

INCHES

A

A1

D

D1

E

E1

MIN.

MAX.

-

0.15

1.60

0.60

0.23

1.66

MIN.

-

0.006

0.063

MAX.

0.024

0.009

0.065

0.40 REF

0.016 REF

2.00

2.06

0.079

0.081

0.40 REF

0.016 REF

Ver.1.0  May.26,2015    Page       21

