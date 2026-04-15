RKAN18058
Rockchip Application Notice
RK3588S&RK3588S2

OVERVIEW
ISSUE DATE:  Nov.-7-2023
AN NO:  RKAN18058
| PRODUCT AFFECTED:  |                    |     | RK3588S & RK3588S2  |     |     |     |
| ------------------ | ------------------ | --- | ------------------- | --- | --- | --- |
| SUBJECT：           | RK3588S & RK3588S2 |     | 功能差异与切换建议           |     |     |     |
针对新项目，强烈建议使用3588S2；针对老项目，建议客户使用3588S2
SUMMARY:
逐步替代3588S。
REMARK:
若有疑问请联系对应的瑞芯微业务人员。

DESICRIPTION
差异说明如下：
| 为了增加摄像头的接入数量，RK3588S2 |     | 型号在原有封装上做了功能调整，软硬件上可实现与旧封装 |     |     |     |     |
| --------------------- | --- | -------------------------- | --- | --- | --- | --- |
RK3588S的兼容设计，引脚功能差异说明如下：
| Package PIN  | RK3588S Function  |     | RK3588S2 Function  |     |     | 修改说明  |
| ------------ | ----------------- | --- | ------------------ | --- | --- | ----- |
BB41/BA41/
将DCPHY接口更换为
BA38/BB38/
MIPI D/C-PHY
| BA40/AY40/  |     | 1*4lane  |             |           | DPHY接口;  |     |
| ----------- | --- | -------- | ----------- | --------- | -------- | --- |
|             |     |          | MIPI DPHY   | 1*4lane   |          |     |
CSI_RX PORT0
AY42/BA42/
|     |     |     | CSI_RX PORT0  | or 2*2lane  | 将RK3588S封装的两个 |     |
| --- | --- | --- | ------------- | ----------- | ------------- | --- |
AW41/AW42
GND球位改为CLK，支
| AN37/AN38  | GND  |     |     |     |     |     |
| ---------- | ---- | --- | --- | --- | --- | --- |
持2*2lane
BA26/BB26/
BA23/BB23/
|             | MIPI D/C-PHY   |          | MIPI D/C-PHY   |          |         |     |
| ----------- | -------------- | -------- | -------------- | -------- | ------- | --- |
| BB25/BA25/  |                | 1*4lane  |                | 1*4lane  | 功能保持不变  |     |
|             | CSI_RX PORT1   |          | CSI_RX PORT1   |          |         |     |
BA28/BA29/
BB29
AN42/AN41/
| AL42/AL41/  |               | 1*4lane   |               |             |                   |     |
| ----------- | ------------- | --------- | ------------- | ----------- | ----------------- | --- |
|             | MIPI DPHY     |           | MIPI DPHY     | 1*4lane     |                   |     |
| AK41/AK42/  |               | or        |               |             | 接口由Port0更换为Port1  |     |
|             | CSI_RX PORT0  |           | CSI_RX PORT1  | or 2*2lane  |                   |     |
| AU41/AU42/  |               | 2*2lane   |               |             |                   |     |
AT41/AT42/
Rev1.0                                            1/2                                        Nov-7-2023

RKAN18058
AP42/AP41
如表所示，RK3588S2 较 RK3588S 少了一组 MIPI D/C-PHY CSI_RX PORT0，新增一组 MIPI DPHY
CSI_RX PORT1，同时接口位置除MIPI D/C-PHY CSI_RX PORT1不变外，其余接口位置有整体移动，并且
RK3588S2 的 MIPI DPHY CSI_RX PORT0 接口在 PIN AN37/AN38 新增一组时钟 MIPI_CSI0_CLK1P/
MIPI_CSI0_CLK1N，RK3588S的 PIN AN37/AN38为VSS接地引脚，所以在兼容上需要注意：
（1）若在原RK3588S 的 PCB 上直接贴RK3588S2，请打上 RK提供的兼容补丁，调整接口映射，以免
引起功能异常。
（2）针对新设计的RK3588S2 PCB，请参考RK新发布的RK3588S2 参考设计，最多可支持5路摄像头
接入。
IMPORTANT NOTICE
Rockchip Electronic Co., Ltd. and its subsidiaries (RK) reserve the right to make corrections, modifications, enhancements, improvements, and
other changes to its products and services at any time and to discontinue any product or service without notice. Customers should obtain the latest
relevant information before placing orders and should verify that such information is current and complete. All products are sold subject to RK’s terms
and conditions of sale supplied at the time of order acknowledgment.
Rev1.0 2/2 Nov-7-2023