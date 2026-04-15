Application Note: SY6280/SY6280A

 5.5V, 2A Low Loss Power Distribution Switch

General Description

Features

SY6280/  SY6280A  is  ultra-low  RDS(ON)  switch  with
programmable current limit to protect the power source
from  over  current  and  short  circuit  conditions.  They
incorporate  over  temperature  protection  and  reverse
blocking  functions.  SY6280  automatically  discharges
the output capacitors during shutdown.

Ordering Information
SY6280□□□□(□□□□□□□□)□□□□
SY6280□□□□(□□□□□□□□)□□□□

•  Input voltage: 2.4V to 5.5V
•  2A load current capability
•  Programmable current limit
•  Enable polarity: active high
•  Over temperature protection
•  Reverse blocking (no body diode)
•  OUT can be forced higher than IN at shutdown
•  Output discharge function

(cid:1)  SY6280: Auto output discharge function
(cid:1)  SY6280A: No output discharge function

Temperature  Code
Temperature  Code
Package Code
Package Code
Optional Spec Code
Optional Spec Code

space

•  Compact SOT23-5 package minimizes the board

Ordering Number
SY6280AAC
SY6280AAAC

Package type
SOT23-5
SOT23-5

Note
----
----

Applications

•  USB 3G Datacard
•  USB Dongle
•  MiniPCI Accessories

Typical Applications

                                                          Figure 1. Schematic Diagram(1A current limit)

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              1

Silergy Corp. Confidential-Prepared for RK

Pinout (top view)

  SY6280/SY6280A

OUT

GND

ISET

1

2

3

5

IN

4

EN

 (SOT23-5)

                          Top mark: COxyz for SY6280 (Device code: CO,  x=year code, y=week code, z= lot number code)

QWxyz for SY6280A (Device code: QW,  x=year code, y=week code, z= lot number code)

Pin Name
IN
GND
OUT
EN
ISET

Pin number
5
2
1
4
3

Pin Description

Input pin, decoupled with a 10µF capacitor to GND
Ground pin
Output pin, decoupled with a 10µF capacitor to GND
ON/OFF control. Pull high to enable IC. Do not leave it floating
Current limit programming pin. Connect a resistor RSET from this pin
to ground to program the current limit: ILIM (A)=6800/RSET (Ω)

Absolute Maximum Ratings (Note 1)
All pins-------------------------------------------------------------------------------------------------------------------  -0.3V to 6V
Power Dissipation, PD @ TA = 25°C SOT23-5, ---------------------------------------------------------------------------- 0.6W
Package Thermal Resistance (Note 2)

θ JA ---------------------------------------------------------------------------------------------------------------- 200°C/W
θ JC ---------------------------------------------------------------------------------------------------------------- 130°C/W
Junction Temperature--------------------------------------------------------------------------------------------------------- 150°C
Lead Temperature (Soldering, 10 sec.) ------------------------------------------------------------------------------------ 260°C
Storage Temperature Range ------------------------------------------------------------------------------------- -65°C to 150°C
ESD Susceptibility (Note 2)
HBM (Human Body Mode) ---------------------------------------------------------------------------------------------------- 2kV
MM (Machine Mode) ---------------------------------------------------------------------------------------------------------- 200V

Recommended Operating Conditions (Note 3)
 IN------------------------------------------------------------------------------------------------------------------------ 2.4V to 5.5V
All other pins ------------------------------------------------------------------------------------------------------------- 0V to 5.5V
Junction Temperature Range ------------------------------------------------------------------------------------- -40°C to 125°C
Ambient Temperature Range -------------------------------------------------------------------------------------- -40°C to 85°C

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              2

Silergy Corp. Confidential-Prepared for RK

Block Diagram

  SY6280/SY6280A

(SY6280)

(SY6280A)

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              3

Silergy Corp. Confidential-Prepared for RK

  SY6280/SY6280A

Electrical Characteristics
(VIN = 5V, COUT=10µF, TA = 25°C unless otherwise specified)

Parameter
Input Voltage Range
Shutdown Input Current
Quiescent Supply Current
FET RON
EN Rising Threshold
EN Falling Threshold
EN Leakage Current
IN UVLO Threshold
IN UVLO Hysteresis
Over Current Limit

Turn-on Time
Turn-off Time
OUT Shutdown Discharge Resistance
Thermal Shutdown Temperature
Thermal Shutdown Hysteresis

Symbol
VIN
ISHDN
IQ
RDS(ON)
VEN(H)
VEN(L)
IEN
VIN_UVLO
VIN_HYS
ILIM
ILIM(min)
TON
TOFF
RDIS
TSD

Test Conditions

Open load, IC Disabled.
Open load, IC Enabled.

Min
2.4

2

VEN=5.0V

RSET=6.8kΩ

0.75

RL=10Ω, COUT=1µF
RL=10Ω, COUT=1µF
SY6280 Only

Typ  Max  Unit
5.5
1

0.2
38
63

0.8
1
2.3

1.25

0.1
1
0.4
130
20
120
130
20

V
µA
µA
mΩ
V
V
µA
V
V
A
A
µs
µs
Ω
℃
℃

Note 1: Stresses beyond the “Absolute Maximum Ratings” may cause permanent damage to the device. These are
stress ratings only. Functional operation of the device at these or any other conditions beyond those indicated in the
operational sections of the specification is not implied. Exposure to absolute maximum rating conditions for
extended periods may affect device reliability.

Note 2:  θ JA is measured in the natural convection at TA = 25°C on a low effective single layer thermal conductivity
test board of JEDEC 51-3 thermal measurement standard. Pin 2 of  SOT23-5 packages is the case position for  θ JC
measurement.

Note 3: The device is not guaranteed to function outside its operating conditions.

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              4

Silergy Corp. Confidential-Prepared for RK

Typical Operating Characteristics

  SY6280/SY6280A

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              5

Silergy Corp. Confidential-Prepared for RK

  SY6280/SY6280A

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              6

Silergy Corp. Confidential-Prepared for RK

Operation

SY6280/A  is  a  current  limited  P-channel  MOSFET
power  switch  with  over  current  and  over  temperature
protections.  There  is  no  body  diode  across  the  drain
and  the source of the MOSFET. It prevents the current
flow  from  the  output    to  the  input  after  the  chip  is
disabled.

Over-current protection

When the over-current condition is detected, the switch
is  regulated  to  achieve  constant  output  current.  If  the
over current condition lasts for a long time, and results
in  a  junction  temperature  over  130°C,  the  switch  will
be  shutdown.  Once  the  junction  temperature  drops  to
110°C, the part will restart.

Supply Filter Capacitor

In  order  to  prevent  the  input  voltage  from  dropping
during  hot-plug  condition,  a  10µF  ceramic  capacitor
from VIN to GND is strongly recommended. However,
higher capacitance could help reduce the voltage drop.
Furthermore, an output short will cause ringing on the
input  without  the  input  capacitor.  It  could  destroy  the
internal  circuitry  when  the  input  transient  voltage
exceeds the absolute maximum supply voltage even for
a short duration.

Current Limiting Setting

  SY6280/SY6280A

Current  limit  is  programmable  to  protect  the  power
source  from  over  current  and  short  circuit  conditions.
Connect  a  resistor  RSET  from  ISET  pin  to  GND  to
program the current limit:

ILIM (A)=6800 /  Rset (Ω).

The  minimum  current  limit  is  0.4A.  Current  limit
beyond 2A is not recommended.

Maximum input voltage consideration:

For  any  application,  input  voltage  for  SY6280/A
should  not  be  allowed  to  exceed  the  maximum
recommended value (5.5V).

Below  is  a  typical  application  circuit  for  SY6280/A.
The  front  stage  is  a  non-synchronous  boost  stage  and
the input power supply can be a battery or an adapter.

Some adapters may have poor output voltage tolerance,
or  may  have  large  output  voltage  overshoot  if  the
adapter  is  hot  plug  in  directly.  The  voltage  overshoot
higher  than  VIN(  5.5V)  will  significantly  reduce  the
reliability of SY6280/A and may even lead to IC EOS
failure.

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              7

Silergy Corp. Confidential-Prepared for RK

  SY6280/SY6280A

PCB Layout Guide

To achieve a better performance, the following guidelines must be strictly followed:
(cid:2)  Keep all power traces as short and wide as possible and use at least 2 ounce copper for all power traces.
(cid:2)  Place a ground plane under all circuitry to lower both resistance and inductance and improve DC and transient

performance.

(cid:2)  Locate the output capacitors as close to the connectors as possible to lower the  impedance (mainly inductance)

between the port and the capacitor and improve transient performance.

(cid:2)

Input and output capacitors should be placed close to the IC and connected to the ground plane to reduce noise
coupling.

(cid:2)  Locate  the  ceramic  bypass  capacitors  as  close  as  possible  to  the  IN  pin  and  OUT  pin  of  SY6280/A.

Top View: PCB Layout Guide(SOT23-5)

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              8

Silergy Corp. Confidential-Prepared for RK

SOT23-5 Package outline & PCB layout design

  SY6280/SY6280A

0.55
0.55

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

5
5
1
1
.
.
0
0
-
-
1
1
.
.
0
0

.
.

0
0
0
0
3
3
-
-

0
0
7
7

.
.

2
2

0
0
8
8
.
.
0
0

0.95 TYP
0.95 TYP

 Recommended Pad Layout

1.0 - 1.3
1.0 - 1.3

F
F
E
E
R
R
5
5
2
2
.
.
0
0

0.3 - 0.6
0.3 - 0.6

0.95 TYP
0.95 TYP

1.90 TYP
1.90 TYP

0
0
7
7

.
.

1
1
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
1

.
.

0
0
-
-
1
1
0
0

.
.

0
0

Notes:  All dimensions are in millimeters.

All dimensions don’t include mold flash & metal burr.

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              9

Silergy Corp. Confidential-Prepared for RK

  SY6280/SY6280A

Taping & Reel Specification

1.  Taping orientation

SOT23-5

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

Feeding direction

2.  Carrier Tape & Reel specification for packages

Package
types

Tape width
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

SOT23-5

8

4

7"

8.4

280

160

3000

3.  Others:  NA

SY6280/A Rev1.0C        Silergy Corp. Confidential- Prepared for Customer Use Only              10

Silergy Corp. Confidential-Prepared for RK

