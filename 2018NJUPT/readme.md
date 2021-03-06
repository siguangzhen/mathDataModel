2018年数模校赛的论文代码。题目是：

# 商业银行人民币贷款规模分配及盈利问题

商业银行贷款投放的简单模型是：从客户端吸收存款，缴存法定准备金（法定准备金率：大型金融机构15.5%，中小金融机构12%；法定准备金利率1.62%），预留一定比例备付水平（商业银行承担支付结算金融中介作用，满足流动性安全），剩余资金用于贷款投放或其他资产配置。
对商业银行而言，贷款规模增长受限于其存款规模增长，只有在存款有效增长的情况下银行才有充足资金用于贷款投放。具体来说，某家商业银行在全国存款总额中所占比例相对稳定，每年可增长的存款量受限于社会资金总量的增长情况。从经济指标上来看，社会存款增长与GDP、CPI、工业增加值等宏观经济指标密切相关（附件1为2010-2017宏观经济指标及2018年预测情况）。
在贷款分配模式上，商业银行过去多采用年初预分配、全年限额管理模式，即年初一次性预分配全年规模至各家分行，年度内不再调增。该模式存在较多弊端，如未考虑全年实际可支配贷款规模、环境变化、需求变化等，效率低、弹性差。目前，商业银行多采用以存定贷、存贷结合、表内外协同、资产负债动态平衡模式，既要努力获取全行最大收益，也要平衡各区域发展差异，调动各单位展业积极性，同时也要对国家重大项目、重点政策、民生工程等倾斜扶持，支持实体经济有效发展。
现有某中型商业银行A，其各家省级分行近三年存贷款业务发展情况见附件2。请查阅相关文献和资料，在对商业银行经营模式有所掌握，对未来经济、利率、汇率等政策及趋势有充分了解和预判的基础上回答以下问题。

1. 假设该银行除客户存款外无其他资金来源，且暂不考虑备付水平。请根据附件2商业银行A各项存贷款历史数据及附件1宏观经济指标历史数据，建立数学模型，预测该银行2018年存、贷款增量情况。
2. 假设该银行除客户存款外无其他资金来源，且暂不考虑备付水平。请根据问题1预测的结果并结合附件3相关数据，建立数学模型，给出2018年商业银行A 各分行贷款规模的分配方案，使得全行增量存贷款利息净收入最大，并将该分配方案填入表1。
3. 若商业银行A将于2018年5月1日发行500亿规模的15年期商业银行普通债（利率约为5.1%），请结合该条件对问题2进一步优化，暂不考虑备付水平情况下，重新设计商业银行A各分行贷款规模的分配方案，使得全行增量存贷款利息净收入最大，并将该分配方案填入表1。
4. 为保证每日交易正常进行，各家分行每日需预留一定的备付资金（备付资金不足易引起客户不满，严重的会引起社会恐慌，引发挤兑；预留资金过多，会降低银行盈利水平），以确保最低的备付水平（备付水平=备付资金÷存款余额）。假设每个客户存取款的行为是随机的，请根据附件4各分行2017年每日存取款交易数据，建立数学模型，计算在置信水平99%的情况下，2018年商业银行A各分行日常经营所需最低备付金额，并将结果填入表1。
5. 在贷款规模分配问题上，为了帮助商业银行A处理好收益与风险、企业经营与国际政策导向，区域化差异与分行公平考核等之间的关系，以期达到双赢或多赢，请对以上模型进行改进，并给出相关建议。

注：所有数据均为假设数据。

|单位：亿元|问题2|问题3|问题4|
|序号|分行|贷款规模分配方案|贷款规模分配方案|2018年备付资金|
|---|---|---|---|
|1|北京| | |
|2|江苏| | |
|3|广东| | |
|4|浙江| | |
|5|上海| | |
|6|山东| | |
|7|河南| | |
|8|湖北| | |
|9|安徽| | |
|10|四川| | |
|11|辽宁| | |
|12|河北| | |
|13|重庆| | |
|14|湖南| | |
|15|山西| | |
|16|陕西| | |
|17|天津| | |
|18|广西| | |
|19|吉林| | |
|20|云南| | |
|21|福建| | |
|22|江西| | |
|23|黑龙江| | |
|24|新疆| | |
|25|贵州| | |
|26|甘肃| | |
|27|海南| | |
|28|内蒙古| | |
|29|宁夏| | |
|30|青海| | |
|全行合计| | | |

1. 问题四中使用的蒙特卡洛算法，对于数据量较少的情况下可以生成大量的数据，克服数据量少带来的局限，这在仿真和统计上也有很大的应用。
2. 问题一中使用的主成分析法，在保留一定信息的前提下保留主要成分，抛弃次要成分，从而简化了问题。这种解决问题的思路在实际生活中非常普遍和奏效。
