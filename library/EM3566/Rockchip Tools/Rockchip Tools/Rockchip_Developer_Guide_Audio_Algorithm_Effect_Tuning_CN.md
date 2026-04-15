Rockchip⾳频算法效果调试指南

⽂件标识：RK-KF-SF-XXX

发布版本：V1.0.0

⽇期：2024-08-12

⽂件密级：□绝密   □秘密   □内部资料   ■公开

免责声明

本⽂档按“现状”提供，瑞芯微电⼦股份有限公司（“本公司”，下同）不对本⽂档的任何陈述、信息和内
容的准确性、可靠性、完整性、适销性、特定⽬的性和⾮侵权性提供任何明⽰或暗⽰的声明或保证。本

⽂档仅作为使⽤指导的参考。

由于产品版本升级或其他原因，本⽂档将可能在未经任何通知的情况下，不定期进⾏更新或修改。

商标声明

“Rockchip”、“瑞芯微”、“瑞芯”均为本公司的注册商标，归本公司所有。

本⽂档可能提及的其他所有注册商标或商标，由其各⾃拥有者所有。

版权所有 © 2024 瑞芯微电⼦股份有限公司

超越合理使⽤范畴，⾮经本公司书⾯许可，任何单位和个⼈不得擅⾃摘抄、复制本⽂档内容的部分或全

部，并不得以任何形式传播。

瑞芯微电⼦股份有限公司

Rockchip Electronics Co., Ltd.

地址：     福建省福州市铜盘路软件园A区18号

⽹址：     www.rock-chips.com

客⼾服务电话： +86-4007-700-590

客⼾服务传真： +86-591-83951833

客⼾服务邮箱： fae@rock-chips.com

前⾔

概述

本⽂提供⼀个⾳频效果调参指导⽂档，以帮助开发⼈员在Rockchip平台上更好地完成⾳频效果调试。

内核版本

通⽤

产品版本

芯⽚名称

全系列

读者对象

本⽂档（本指南）主要适⽤于以下⼯程师：

技术⽀持⼯程师

软件开发⼯程师

修订记录

版本号

V1.0.0

作者

修改⽇期

Xing Zheng

2024-08-12

修改说明

初始版本

⽬录

Rockchip⾳频算法效果调试指南

1.   概述

1.1   功能描述

2.   准备⼯作

2.1   明确当前的产品类型和规格指标
2.2   ⾳频算法测试相关知识点介绍
2.3   ⾳频算法测试场景
2.4   ⾳频通路测试

2.4.1   ⾳频播放最⼤不失真信号测试
2.4.2   ⾳频扫频录放测试
2.4.3   安防类产品⾳频算法调试

1. 概述

1.1 功能描述

⽬前，随着电⼦产品技术不断地更新迭代，⽤⼾希望产品的⾳频特性能适⽤于更多的应⽤场景：在录⾳

场景下，能获以及更为清晰、真实的录⾳效果；播放场景下，能获得饱满、舒适的听感。这就需要算法

的介⼊与加持，辅助前端硬件的可靠数据通路，适当地调节算法参数，以达到⽤⼾不同的听感需求。

2. 准备⼯作

在⾯临⾳频调参需求时，绝⼤部分开发⼈员都习惯对着⾳频算法接⼝和参数盲调⼀通。其实，算法调试

仅仅是在整个⾳频效果通路的末端起到辅助作⽤，真正需要关注的，往往是算法前端的声学结构、以及

硬件器件指标等环节。只有算法前端获取的信号不失真，算法才能真正有效地发挥它的作⽤。

因此，当前的产品类型和规格指标，可以在调参之前先明确好，以取得事半功倍的效果。

2.1 明确当前的产品类型和规格指标

⾸先，开发⼈员要了解当前的产品类型以及对⾳频效果的需求。⽐如：使⽤⼏个⻨克⻛，⼏个喇叭播
放？产品类型是IPC，还是会议拾⾳系统等？是否有双向通话需求？通常IPC类产品不会需要超过2个⻨克
⻛拾⾳，⽽会议系统要求的⻨克⻛数量较多，若是多⻨克⻛场景下的⻨克阵列类型（如4MIC的拓扑，是
环⻨还是线⻨）。

其次，确定好产品设计要求的拾⾳距离范围（如3⽶到10⽶），以及播放响度，以下信息，可通过器件⼿
册查询：

⻨克⻛是模拟⻨（驻极体居多）还是数字⻨？通常模拟⻨对远场拾⾳会有更好的效果
⻨克⻛的SNR（通常不低于65dB），灵敏度，以模拟⻨为例，5⽶以上远场拾⾳，不低于-32dBV
喇叭播放输出的功率和负载，如2W@8ohm，
产品结构设计相关图⽚信息，如MIC孔径，还有和SPK的位置、距离、分布等
使⽤硬件回采还是软件回采。⽬前以软件回采应⽤居多

接着，还需要确定产品使⽤的录放的采样率，⽐如通常为16kHz或者8kHz。若需要使⽤AI降噪，或者哭
声检测的场景，需要使⽤16kHz及以上的采样率。

2.2 ⾳频算法测试相关知识点介绍

⽤⼾⼤多数需要开启⾳频算法，除了消除环境噪声以外，还有就是在通话场景下的回声消除AEC
（Acoustic Echo Cancellation），这个框图描述了经典回声消除算法在⼯作时的数据流向和处理效果：

其中，有⼏个名词术语需要确定：

图 1 回声消除⼯作流

近端（Near End）：以待测机器的⻆度看，⽐如主讲⼈对着机器的MIC说话，我们称之为“近端输⼊
的⼈声”，接着，这说话声，通过⽹络传输到远端设备播放出来。
远端（Far End）：指与待测机器通讯的远端设备，⽐如测试⼈员对着远端设备的MIC说话，通过⽹
络传输到待测机器播放出来。同时，这部分数据也通过回采（不论是软件回采还是硬件回采）的⽅

式，存储在待测机器的另⼀个录⾳通道⾥，作为回声消除的参考信号。

2.3 ⾳频算法测试场景

⽤⼾通话对讲时通常会遇到以下使⽤场景：

近端不说话，远端说话

在这种情况下，系统处于远端单讲状态，远端声⾳通过近端扬声器播放，再被⻨克⻛采集回去（⻨

克⻛输⼊包含回声和噪声）。这个通常是⾳频通路测试完以后，⾳频效果调参最先测试及关注的。

测试⼈员可以在独⽴的空间内，尽可能使⽤⾃然⼈声向远端设备（如⼿机或另⼀台对讲设备）说

话，然后⽤远端设备听是否有⾃⼰的说话声。如果没有，说明远端单讲下回声抑制的效果较为理

想；反之，会有残留回声从设备再回传回来，需要进⼀步调参优化。

近端说话，远端不说话

在这种情况下，系统处于近端单讲状态，远端没有说话（本机扬声器没有声⾳），那么也就不存在

回声，此时实际相当于⻨克⻛采集到的只有近端主讲⼈声和环境声。

近端和远端同时说话

在这种情况下，系统处于双讲状态，该状态下⾃适应滤波器容易发散，导致回声消除⼒度减⼩。因

此，这时候更需要关注回采参考信号和

因此，在测试回声消除效果的时候，需要以上三个情况同时测试。

2.4 ⾳频通路测试

在算法调试之前，我们需要对⾳频通路做测试，调整合适的录放增益，将最佳的电信号数据提供给算

法，才可能获得更理想的处理效果。

2.4.1 ⾳频播放最⼤不失真信号测试

如果⼀款产品有通话对讲的需求，我们应该先明确喇叭的播放功率和负载，并做好播放最⼤不失真信号

的增益标定。否则，喇叭的失真会引起严重的漏回声异常。

所以，我们可以播放⼀个0dBFS 1kHz正弦波，然后通过⽰波器测量功率放⼤器（PA）输出或者喇叭两端
的电压幅值，以确定实际输出的最⼤不失真电压是否满⾜产品定位要求。但是，由于PA通常是⽤ClassD
驱动放⼤，直接测量PA输出或者喇叭两端，会包含⼏百kHz的⾼频载波信号。因此，如下图所⽰，我们
可以在喇叭两端分别串上RC电阻形成⼀阶滤波电路，阻容配⽐可以为500ohm/10nF，截⾄频率约为
32kHz，既可以滤除⾼频载波信号，也较为接近⼈耳可听频率范围上限20kHz。

图 2 测量喇叭输出幅度和添加RC滤波电路的⽅法

播放0dBFS 1kHz正弦波可以使⽤如下命令，注意播放的是原始数据，不能开启AO VQE算法：

rk_mpi_ao_test -i /data/sine1000_16khz_2ch.wav --sound_card_name=hw:0,0 --

device_ch=2 --device_rate=16000 --input_rate=16000 --input_ch=2

如果有tinyalsa或者alsa-utils，也可以使⽤如下命令播放测试：

tinyplay /data/sine1000_16khz_2ch.wav -r 16000 -c 2 -b 2 -D 0

aplay -Dhw:0,0 /data/sine1000_16khz_2ch.wav -r 16000 -c 2 -f S16_LE

经过⼀番播放增益调整，我们预期能在喇叭端测量到如下信号：

图 3 实测RC滤波后0dBFS 1kHz正弦波最⼤不失真电压

其中⻩⾊和绿⾊的波形分别为喇叭的P端和N端，粉⾊的是⽰波器经过math sub运算获得的差分电压幅
度。如果⼀个产品设计喇叭的额定功率最⾼为1.5W@8ohm，那么从粉⾊的峰-峰值电压9.8V可以得到：

实测功率数值上刚好满⾜设计要求的1.5W。

2.4.2 ⾳频扫频录放测试

以RV1106/RV1103产品为例，在算法调参之前，我们还需要对⾳频通路进⾏测试。通常我们可以播放⼀
个0dBFS的扫频⾳源，然后适当调节当前的Codec硬件ADC/DAC增益，使其录⾳到的扫频信号尽可能为
最⼤不失真幅度，即可标定好当前的Codec硬件增益。

⾸先第⼀步，先配置好回采通路。以RV1106/RV1103平台举例，可以执⾏以下命令：

rk_mpi_amix_test --control "I2STDM Digital Loopback Mode" --value "Mode2"

或者tinyalsa的tinymix：

tinymix set "I2STDM Digital Loopback Mode" "Mode2"

使能SoC内部数字回采功能。具体ACodec和回采通路细节，请参考
《Rockchip_Developer_Guide_Linux_RV1106_ACodec_CN.pdf》。

安防类产品，基本上使⽤Rockit框架。因为rk_mpi_ai_test默认输出的/tmp/cap_out.pcm有1MB⼤⼩的限
制，如果需要⻓时间录⾳，可以执⾏以下命令，将原始⾳频数据导出为/tmp/dbg_capin.pcm：

export rt_debug_cap_file=/tmp/dbg_capin.pcm

然后执⾏不开VQE算法的播放命令：

rk_mpi_ai_test --sound_card_name=hw:0,0 --device_rate 16000 --device_ch 2 --

out_rate 16000 --out_ch 2 --output /tmp

同时，还需要本机播放⼀个0dBFS的扫频⽂件：

rk_mpi_ao_test -i /data/sweep_16k_20_8000_16b_2ch.wav --sound_card_name=hw:0,0 --

device_ch=2 --device_rate=16000 --input_rate=16000 --input_ch=2

这样，可以获算法处理前的原始录⾳数据：

图 4 ⾃录⾃播扫频测试

如上图可以看到，录到的⾳频数据是2ch的，并分别显⽰了2ch的时域和频域的状态。左声道为⻨克⻛实
时采集的数据，右声道为回采到刚才播放时的⾳频数据，且数字回采的PCM和播放出去的PCM内容是⼀
致的。

如果喇叭增益太⼤，播放0dBFS扫频时可能会测到MIC录到的数据会有截福异常：

图 5 ⾃录⾃播扫频测试截福异常

可以将时间轴放⼤，看到上图红框的部分有明显的截福失真。失真的信号对于后端算法的输⼊来说是不

可逆的异常，会影响算法处理的结果。

图 6 ⾃录⾃播扫频测试截福异常⽰意图

因此，如果有在此情况下遇到录⾳截福失真，建议先调⼩前端的codec模拟增益。可以先获取RV1106
ACodec当前的ADC ALC增益：

# rk_mpi_amix_test --control "ADC ALC Left Volume"

cmd parse result:

sound control id      : 0

control name          : ADC ALC Left Volume

control value         : (null)

list controls         : 0

list contents         : 0

Get current control value: 22

List the control values:

22 (range 0->31)#

可以看到，当前"ADC ALC Left Volume"的数值是22,对应ADC ALC Gain是+24dB。我们可以逐步减⼩其
数值，每个单位数值对应1.5dB的步进。⽐如我们逐步减少数值到14，对应+12dB，相较于之前衰减了
12dB，播放0dBFS扫频时录⾳到的幅度才不失真，我们便可以将硬件的ACodec的ADC ALC Gain标定为
+12dB：

# rk_mpi_amix_test --control "ADC ALC Left Volume" --value "14"

cmd parse result:

sound control id      : 0

control name          : ADC ALC Left Volume

control value         : 14

list controls         : 0

list contents         : 0

2.4.3 安防类产品⾳频算法调试

基于上⾯的⾳频通路测试，我们理应获得了较理想的输⼊信号数据，在应⽤集成算法之前，我们可以先
确认⼀下测试板中是否包含了算法库和AI VQE的JSON配置参数，释放的SDK中它们默认路径下的位置
分别是：

/oem/usr/lib/librkaudio_vqe.so

/oem/usr/lib/librkaudio_common.so

/oem/usr/share/vqefiles/config_aivqe.json

如果产品还有需要AI降噪，也需要确认RKNN模型的位置是否和config_aivqe.json⾥model_path字段描述
的地址相匹配。如：

    "ainr": {

      "status": "enable",

      "mode" : 1,

      "datrs_optm": 2,

      "pregain" : "float:8.00",

      "mini_gain" : "float:0.006",

      "alpha1" : "float:0.6",

      "alpha2" : "float:0.8",

      "preserve1" : "float:1.05",

      "preserve2" : "float:5.0",

      "preserve3" : "float:0.6",

      "preserve4" : "float:0.95",

      "sfs_enable" : 1,

      "Sup_Freq1": 6000,

      "Sup_Freq2": -3588,

      "Sup_Energy1" : "float:100000.0",

      "Sup_Energy2" : "float:100000.0",

      "eq_enable" : 1,

      "speech_eq" : 1,

      "eq_frqs_hz" : "0  800  1500  4000  4100  4200  8000  -1  -1  -1  -1",

      "eq_gains" : "1.0  1.0  1.0   1.0   0.36  0.1786   0.1786   0   0   0   0

",

      "model_path" : "/oem/usr/share/vqefiles/rkaudio_model_ainr.rknn"

    }

实际rkaudio_model_ainr.rknn的存放路径也应为：

/oem/usr/share/vqefiles/rkaudio_model_ainr.rknn

然后，在应⽤执⾏之前，我们先配置⼀些调试相关的环境变量，以⽣成我们需要的信息：

export rt_debug_cap_file=/tmp/dbg_capin.pcm // 兼容旧版本rockit，导出算法处理前的录⾳数
据
export rt_debug_skv_out_file=/tmp/dbg_skvout.pcm // 兼容旧版本rockit，导出AI VQE算法
处理后的录⾳数据
export rt_debug_skv_ao_out_file=/tmp/dbg_ao_skvout.pcm // 兼容旧版本rockit，导出AO
VQE算法处理后的录⾳数据
export rt_debug_playback_file=/tmp/dbg_playback_out.pcm // 兼容旧版本rockit，导出所
有AO算法处理后的录⾳数据，应和数字回采信号相同
export rt_dump_skv_param=true // rockit版本通⽤，打印AI VQE算法运⾏时的参数配置
export RKAUDIO_SKV_DUMP_CONF=true // 新版本算法库使⽤，打印AI VQE算法运⾏时的参数配置
export rt_dump_skv_inout=true // 新版本rockit使⽤，导出AI VQE算法处理前后的录⾳数据，默
认⽣成⾄/tmp⽬录下。如：/tmp/dbg-skv-in-2ch-16000.pcm和/tmp/dbg-skv-out-1ch-16000.pcm
export rt_dump_skv_ao_inout=true // 新版本rockit使⽤，导出AO VQE算法处理前后的录⾳数据，
默认⽣成⾄/tmp⽬录下。如：/tmp/dbg-skv-ao-in-2ch-16000.pcm和/tmp/dbg-skv-ao-out-1ch-
16000.pcm

可以使⽤如下命令开启AI VQE算法，且输出为1ch，所以这⾥'--out_ch 1'：

rk_mpi_ai_test --sound_card_name=hw:0,0 --device_rate 16000 --device_ch 2 --

out_rate 16000 --out_ch 1 --output /tmp --vqe_enable 1 --vqe_cfg

/oem/usr/share/vqefiles/config_aivqe.json

同时，可以播放本地存好的远端⼈声⾳频：

rk_mpi_ao_test -i /userdata/remote_voice.wav  --sound_card_name=h

w:0,0 --device_ch=2 --device_rate=16000 --input_rate=16000 --input_ch=2

如果播放也需要⾛VQE算法的话，也可以加上使能AO VQE的配置参数：

rk_mpi_ao_test -i /userdata/remote_voice.wav  --sound_card_name=h

w:0,0 --device_ch=2 --device_rate=16000 --input_rate=16000 --input_ch=2 --vqe_cf

g /oem/usr/share/vqefiles/config_aovqe.json --vqe_enable=1

这样，调试的时候，可以将上述的算法参数打印信息，以及AI/AO算法前后⽣成的数据倒出来，放到电
脑上⽤audacity⼯具参看，标出时间轴，定位需要优化的地⽅。

