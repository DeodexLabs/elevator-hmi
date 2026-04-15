| CM3566 | Welding | User     | Manual   |        |
| ------ | ------- | -------- | -------- | ------ |
|        |         | Boardcon | Embedded | Design |
www.boardcon.com

content
1.Preparation beforemanualsolder.......................................................................................................................................2
2.PCB boardpositioning andsoldering..................................................................................................................................2
3.Washthe board and Clean...................................................................................................................................................6
4.5-stepsofsoldering ironsoldering.....................................................................................................................................7
5.CM3566 reflowsoldering.......................................................................................................................................................8
5.1 CM3566 ReflowPreparation.....................................................................................................................................8
5.2 BaseboardPCB requirements..................................................................................................................................8
5.3 PrepareSMTstepped stenciland solder paste printing......................................................................................8
5.4 Solder paste...............................................................................................................................................................10
5.5 MakeCM3566ESD anti-static tray........................................................................................................................11
5.6 STMConsiderations.................................................................................................................................................12
5.7 Reflow.........................................................................................................................................................................12
6.CM3566 Disassembly..........................................................................................................................................................12
1

Customizetheembeddedsystembasedon
YourIdea
Beforecoreboardleftfactory,allfunctionsandinterfaceshave beentestedwith E-testfixture,ensure everyboard
100% pass-test. According to experience and statistics from previous years, the abnormal function after welded
the core board, most of which is caused by poor welding. To avoid unnecessary problem, it is important that
| weldingoperations                 |     | are | performedby | experiencedwelders. |                        |        |
| --------------------------------- | --- | --- | ----------- | ------------------- | ---------------------- | ------ |
| 1.Preparation                     |     |     | before      |                     | manual                 | solder |
| Adaptationscenario:samples,10~100 |     |     |             |                     | piecesin smallbatches. |        |
Tools: constant temperature electric soldering iron, knife edge soldering iron tip, moist cleaning sponge, 0.8mm
solder wire( the inner core with flux), solder paste, soldering iron thermometer, 100% polyester double cleaning
| fabric,water | forcleaningpanel,deionized |     |     |     | fan,anti-static | brush. |
| ------------ | -------------------------- | --- | --- | --- | --------------- | ------ |
Step 1: Please ensure that all equipment, tools are connected to the ground, the welder needs to wear anti-static
gloves, ESD wrist strap (The ESD wrist strap needs to be connected to the anti-static ground wire and well
grounded).
| Note:ESD | and | EOS protectionat |     | alltimes. |     |     |
| -------- | --- | ---------------- | --- | --------- | --- | --- |
Step2:Makesure the solderingironhandleand solderingironmouth are lockedandno loose.
Step3:Turnon the thermostatic solderingiron switch and adjustthe temperature to 380℃±10℃.After the heating
ironiskeptwithin380℃±10℃.
indicator changesfromsolidto flashing,the temperatureofthe soldering
Explain: because the dense pad of the core board and the fast heat dissipation, the knife edge soldering iron
temperature(380℃±10℃),itcanbe
| needsto | bekeptatahigher |     |     |     |     | solderingsmoothly. |
| ------- | --------------- | --- | --- | --- | --- | ------------------ |
Step4: Wipe the tip of the soldering iron on the sponge to remove oxidation and dirt, and add a little solder wire
protection.
| 2.PCB | board |     | positioning |     | and | soldering |
| ----- | ----- | --- | ----------- | --- | --- | --------- |
Step 1: Prepared the baseboard that needs to be soldered, check the baseboard whether clean and smooth, and
| findthe | pin1 mark | positionof | the | baseboard. |     |     |
| ------- | --------- | ---------- | --- | ---------- | --- | --- |
2

Customizetheembeddedsystembasedon YourIdea
Note: the direction of pin 1 of the CM3566 module should be consistent with the direction of pin 1 of the
baseboard.
Pin1 sign
Step2:Thecoreboardandthebaseboardfour sidepadsarepin-topinalignedandfixedwithgummedpaper(see
figurebelow).
After fixing the core board, it is necessary to confirm that the core board stamp hole pads and baseboard pads
are fully fitted, without bias and warpage, to ensure that there are no foreign objects between the core board and
the baseboard or elsecan lead tocoreboardfloat.
3

Customizetheembeddedsystembasedon YourIdea
Step3: Pre-tin guidelines: first solder the corner of the core board and the baseboard with a soldering iron, and
then solder the second point diagonally of the core board. After soldered these two points, carefully check that
four sides of the pads whether are aligned, if the pad is deviation, need fine-tuned the position of the core board
accordingto the actual untilitis fully aligned,andfinally fixthe other two diagonalofcorners.
Whensolderingthefour cornersofthecoreboardthatneedgently pressthe coreboardwithyourfingers tomake
itfitperfectly with the baseboard,avoidfloating.
Step 4: Soldering remaining pads: 35-55° angle drag welding between the knife edge soldering iron nozzle and
4

Customizetheembeddedsystembasedon YourIdea
the baseboard (preheat pad---->add tin wire---->tin wire leaves the pad---->remove the soldering iron). The
soldering time of each pad should be 2~3s, the longest time is not more than 4s, otherwise it may cause the pad
tofalloff.
.
Step 5: When dragging soldering, need to control the move speed of the soldering iron, too fast or too slow can
easily leadto falsesolder and tin connection.
Toofast:Ifthe solder paste solderingtimeisnotenough, itiseasyto lead tofalsesolderingandtin connection.
Too slow: the soldering time is too long, the flux evaporated too much, lead to thermal fatigue, easy to tin
connection, for the solder pads of the connecting tin, some solder paste can be applied appropriately to increase
the solderactivity.
Step6:After solderingwas completed,itis necessary tocheckthe soldering jointto seewhether thesoldering
pointsare round, brightandfirm,andwhether thereis continuoussoldering withthe surroundingcomponent. For
the phenomenonoftin connection,cold solder and false solder,itisnecessary torelevantbadsolder spotsto
re-weld toensure good soldering.
5

Customizetheembeddedsystembasedon
YourIdea
| 3.Wash | the | board | and Clean |
| ------ | --- | ----- | --------- |
Coverthe core boardwith acleaningfabricand cleanthe four sides ofthe core board with abrushstainedwith
washingwater.Thewashing Watershouldbejustwetby thecleaningfabric.Itshouldnotbetoo muchtoprevent
the washingwater enter intothe plastic components,resultingin theplastic parts becorroded.
| After clean, | drythe core | boardwith | adry fabric. |
| ------------ | ----------- | --------- | ------------ |
6

Customizetheembeddedsystembasedon
YourIdea
| 4. 5-steps |     | of  | soldering |     | iron | soldering |
| ---------- | --- | --- | --------- | --- | ---- | --------- |
Standardbasis:IPC-7711/7721
| Step1:Prepare |     | forsoldering: |     |     |     |     |
| ------------- | --- | ------------- | --- | --- | --- | --- |
Preparethe tin wire andsolderingiron, atthis timepay special attention tothe solderingirontip need tobe kept
clean,then canbe stained withtin wire,adjustthe temperatureofthe solderingiron appropriately,andkeepit for
| ten minutes,thenused |     |            | (commonly | known | aseating | tin). |
| -------------------- | --- | ---------- | --------- | ----- | -------- | ----- |
| Step2:Heating        |     | weldments: |           |       |          |       |
Contactthesolderingirontothesolderpoint,payattentiontoneedtokeepthesolderingironheatingeachpartof
theweldment,suchasneedtokeeptheinsertedcomponentpinsontheprintedcircuitboardandPCBboardpad
heatedatthesametime.Secondly,needtheflatpartofthesolderingironhead(thelargepartofthecontactarea)
contactthe soldering partwith faster heatdissipation.Thefaceor theedgesofthe solderingtip contactwith
weldmentswith lessheat capacity,inorder toachieve weldmentsheatingevenly.
| Step3:Meltthe |     | solder: |     |     |     |     |
| ------------- | --- | ------- | --- | --- | --- | --- |
Whenthe solder is heated toatemperature thatmelt the solder,the solderwire is placedon thesolder joint,the
| solderbegins | tomelt | and        | wetthe | solder | spots. |     |
| ------------ | ------ | ---------- | ------ | ------ | ------ | --- |
| Step4:Remove |        | thesolder: |        |        |        |     |
Whena certainamount ofsolder ismelted,the solder wire isremoved.
| Step5:Remove |     | thesoldering | iron: |     |     |     |
| ------------ | --- | ------------ | ----- | --- | --- | --- |
Removethe solderingironwhen the soldertin has completelywettedthe solder spots(note: thedirectionofthe
roughly45°direction).
removesolderingironshouldbe
7

Customizetheembeddedsystembasedon
YourIdea
| 5.CM3566                    | reflow |          | soldering   |     |                 |            |            |     |     |     |     |
| --------------------------- | ------ | -------- | ----------- | --- | --------------- | ---------- | ---------- | --- | --- | --- | --- |
| Adaptationscenario:morethan |        |          | 100piecesin |     | massproduction. |            |            |     |     |     |     |
| SMT flow                    | chart: |          |             |     |                 |            |            |     |     |     |     |
|                             |        | Incoming |             | PCB | and             | Components | inspection |     |     |     |     |
Screen print (Prints the solder paste on the PAD of the PCB board through stencils)
|     |     |     | SPI | (SPI | Solder | thickness | inspection) |     |     |     |     |
| --- | --- | --- | --- | ---- | ------ | --------- | ----------- | --- | --- | --- | --- |
Pl（Main
|     | Multi-Function |     | Mounter |     |     |     | High | Speed |     | mounting | chip, |
| --- | -------------- | --- | ------- | --- | --- | --- | ---- | ----- | --- | -------- | ----- |
(CM3566, Main IC, Module, etc) resistors, capacitors, inductors, diodes,
|            |        |        |             |            |             |            |        | transistors, |        | etc) |     |
| ---------- | ------ | ------ | ----------- | ---------- | ----------- | ---------- | ------ | ------------ | ------ | ---- | --- |
|            |        | Reflow |             | (Soldering |             | components | onto   | the PCB      | board) |      |     |
|            |        | AOI    | (Appearance |            | inspection, |            | BGAand | IC need      | X-RAY) |      |     |
| 5.1 CM3566 | Reflow |        | Preparation |            |             |            |        |              |        |      |     |
1. CM3566 core board within three months of the production date and have vacuum packaging, can be directly
reflowsoldering.
2.CM3566core board is notvacuum packedor placedunder amoisture-proofcabinet. Before reflow needs to be
| bakedat 115°C-120°C |     | for 24H. |     |     |     |     |     |     |     |     |     |
| ------------------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
3.CM3566coreboardisnotvacuumpackedorstoredwithoutmoisture-proofcabinetformorethanthreemonths,
itislikely tobe damp,it isnotrecommended toreflow soldering, switchtomanualsoldering.
| 5.2 Baseboard | PCB           |     | requirements |     |     |     |     |     |     |     |     |
| ------------- | ------------- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
| BaseboardPCB  | requirements: |     |              |     |     |     |     |     |     |     |     |
add 5mm edges on both sides of the single board, add mark points to the board, or add 5mm edge to two plates
| spliced inoneline,addmark |     |         | points | tothe   | board. |        |       |          |     |     |     |
| ------------------------- | --- | ------- | ------ | ------- | ------ | ------ | ----- | -------- | --- | --- | --- |
| 5.3 Prepare               | SMT | stepped |        | stencil | and    | solder | paste | printing |     |     |     |
Stencil is a kind of SMT special mold. Its main function is to help the deposition of solder paste;The
8

Customizetheembeddedsystembasedon
YourIdea
goal is to transfer the exact amount of solder paste to the exact location on the empty PCB.
The stencil：
| The overall   | thickness | of the stencil: | 0.1mm            |        |
| ------------- | --------- | --------------- | ---------------- | ------ |
| The thickness | of CM3566 | core board      | stepped stencil: | 0.18mm |
The length of the stencil pad of the core board that is increased to the outside: 0.6mm
Thecore boardPADatthe bottom ofthe stencil ispastedwith 0.05mmthick tinfoilat the corners,
inorder topartially raise the coreboardof the stencilandincreasethe amount ofsolder paste
deposited atthe corners ofthe core board.Preventsfalse solderingofthe coreboard dueto slightly
| warpage | duringbonding. |     |     |     |
| ------- | -------------- | --- | --- | --- |
9

Customizetheembeddedsystembasedon YourIdea
5.4 Solder paste
Solder paste brand and model: Senju M705-GRN360-K2-V, Alpha, indium Tai and other high-quality solder
pastetoprevent thecollapse ofthe paste after printingandcausethe phenomenon oftinconnection.
Afterscreenprintiscompleted,UsetheSPIinstrumenttodetecttheeffectofscreenprinting.Preventundesirable
phenomenasuchas soldering leakage,less solderingandsoldering bridgeafter printing.
10

Customizetheembeddedsystembasedon
YourIdea
| 5.5 Make | CM3566 | ESD anti-static | tray |
| -------- | ------ | --------------- | ---- |
Itis necessary tomake a special anti-static surfacemounting trayfor the CM3566 core board tofacilitate the core
boardsurfacemounting.
Tray Size：47cm*40cm*0.8cm
size：47mm*40mm*3.6mm
| Internal | frame        |          |                       |
| -------- | ------------ | -------- | --------------------- |
| Note:The | CM3566should | beplaced | inthesameorientation. |
11

Customizetheembeddedsystembasedon
YourIdea
| 5.6 | STM | Considerations |     |     |     |     |     |     |     |     |     |     |
| --- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
The core board needs to be placed in the right position. Prevent offset, misalignment, etc. The PCB board needs
tobetransmittedsmoothlythroughthe track.Protectionagainstimpact,vibrationcausesthecoreplatetoshiftout
ofposition.
5.7 Reflow
When the core board is mounted on the baseboard reflow, the temperature in the upper temperature zone should
be lowered as far as possible, and it is better to adjust the component solder on the core board not to melt
completely.The temperature in the lower temperature zone should be properly raised to melt the solder paste on
| the | baseboard | andsolder | thecore | board. |     |     |     |     |     |     |     |     |
| --- | --------- | --------- | ------- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
Reflow Temperature：The maximum temperature is 245-250℃; The time required above 220 ℃ is about
60-70 seconds.
(Due to the different thickness and different material of the baseboard, as well as the difference in the melting
pointofsolder pasteandreflow temperature,the reflow soldering temperature zone issetfor reference)
300
250
200
150
100
50
|          | 0   | Z1  | Z2          | Z3  Z4  | Z5    | Z6   | Z7     | Z8  | Z9    | Z10  |        |      |
| -------- | --- | --- | ----------- | ------- | ----- | ---- | ------ | --- | ----- | ---- | ------ | ---- |
|          | 0   |     | 50          |         |  100  |  150 |        | 200 |       | 250  |  300   |      |
|          |     |     | 2.00        | 0%      | -2.74 | -16% | 110.36 | 68% | 72.43 | 41%  | 245.51 | 10%  |
|          |     |     | 2.05        | 5%      | -2.83 | -22% | 112.78 | 76% | 63.08 | 10%  | 244.67 | 33%  |
|          |     |     |             | -28%    | -2.45 |      | 111.44 |     |       |      |        | -15% |
|          |     |     | 1.72        |         |       | 3%   |        | 71% | 60.78 | 3%   | 244.23 |      |
|          |     |     | 1.99        | -1%     | -2.64 | -9%  | 112.90 | 76% | 64.45 | 15%  | 245.60 | 12%  |
|          |     |     | 1.66        | -34%    | -2.64 | -9%  | 108.88 | 63% | 66.57 | 22%  | 243.33 | 21%  |
|          |     |     | 0.39        |         | 0.38  |      | 4.02   |     | 11.65 |      | 2.44   |      |
| 6.CM3566 |     |     | Disassembly |         |       |      |        |     |       |      |        |      |
If the direction of the core board is reversed, or be damaged need to be disassembled, don’t try to remove core
board only relying on an electric soldering iron, the most customers cannot disassemble the core board that only
relying on an electric soldering iron, and some customers even tried four people and four electric soldering iron,
but ended in failure. Electric soldering iron disassembly easy lead to some phenomenon, such as stamp hole
12

Customizetheembeddedsystembasedon YourIdea
pad fall off and fracture, wiring copper foil is falling and teared; core board warping deformation, line breakage,
baseboardpad falloff,breakage,etc.
Therecommendedmethod ofdisassemblecore board:Hot air solderingstation+heat gun.
Place the baseboard ofthe core board to be removed on the hotair soldering station, and the core board is in the
middle position of the hot air soldering station, set the constant working temperature of the hot air soldering
stationtable to around 160℃(because ofthe temperature of differentmodels of hot air soldering stationmay exist
differences, and the different placement height of the core board also have an impact, the temperature needs to
be adjusted according to the actual condition), after the board is fully warmed up, use a heat gun ( the
temperature is set to 360℃, which can be adjusted according to the actual condition) to blow back and forth
against the stamp hole pads of the core board until all the stamp hole pads have melted, gently move the core
platewith tweezers,and thenslowly clampit horizontallyand placeit inadedicated position.
13