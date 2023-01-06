---
title: SaaS 通识系列 6：SaaS 常用指标
date: 2022-11-29 11:43
updated: 2022-11-29 11:43
cover: //cdn.wallleap.cn/img/post/1.jpg
author: Luwang
comments: true
aliases:
  - SaaS 通识系列 6：SaaS 常用指标
rating: 10
tags:
  - SaaS
category: design
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: //myblog.wallleap.cn/post/
---

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211041558513.png)

[SaaS 通识系列 6：SaaS 常用指标 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/258358980)

## 一、为什么要关注指标?

### 1.1 SaaS 模式的特殊性

在软件许可（License）模式下，客户需要预先支付永久性的或规定期限内的全部费用。因此，大部分收入在客户购买时就完成了收取，而后期的维护费用仅占收入的一小部分。

但 SaaS 采用订阅模式，这决定了厂商的收入取决于未来的时间段，即每月或每年的经常性收入（MRR/ARR）。这些收入需要在较长的时间内弥补前期的获客成本（CAC）以及后期的维护成本（CRC），才能产生盈利。

如果客户不满意，他们就有可能会流失，致使无法收取回报，而遭受业务损失。

| 软件许可 License         | SaaS                  |
| -------------------- | --------------------- |
| 预先支付永久性的或规定期限内的全额许可费 | 订阅模式，按月或按年支付          |
| 类似于产品的销售             | 被视为一段时间内提供的服务的销售      |
| 业务的成功取决于销售多少软件       | 业务的成功取决于有多少客户愿意重复使用   |
| 保持业绩需要不断围绕新的订单       | 收入需要围绕客户为中心，留存和增加新的订阅 |

致使，订阅模式从根本上改变了 SaaS 厂商对客户关系的长期关注。例如，通过跟踪经常性收入、流失率、终生价值、获客成本等指标，来衡量业务发展的健康状况。

### 1.2 数据驱动，获取业务洞察力

同时，在 SaaS 中，通过数据指标，还可以帮助我们：

- 了解产品与市场的匹配（PMF：Product-market fit），即是否具有市场价值
- 了解商业模式的可持续性，即能否长期盈利
- 确定当前工作什么是有效的，什么需要改进
- 确定产品的发展战略、方向和节奏

从而杜绝，仅凭直觉做事。也更有利于我们做出更加明智的业务决策，并朝着正确的方向迈进。

### 1.3 衡量商业成功

获得商业成功，对于 SaaS 厂商而言，可以从 3 个方面入手：

1. 最低成本的获得大量客户
2. 确保客户忠于服务而持续付费使用
3. 以及针对每个客户进行利润最大化

为了衡量这 3 个方面以及对此的行动是否有效，自然也就需要对相关数据指标进行跟踪和评定。

## 二、SaaS 指标

由于公司的发展阶段（早期验证、初创、成长甚至上市）以及角色（营销、销售、客户成功、产品/设计、高管/老板以及投资人）利益的不同，自然关心和需要关注的指标也是不同的。

同时，对于一家公司而言，又可以根据自身的业务特性设定指标，甚至进行细分（例如客户、地区、行业等）。

所以，本文主要介绍一些非常核心的指标：

- MRR
- LTV
- CAC
- ARPA
- 流失

这些指标，不管公司是什么发展阶段、什么业务以及角色对象（营销、销售、客户成功、产品/设计、高管/老板、投资人），都是需要着重关注的。

### 1）MRR

#### 什么是 MRR/ARR

经常性收入（Recurring Revenue）是未来持续可获得的收入，就 SaaS 而言，经常性收入来自客户的订阅，具有稳定、可预测、高度确定的特点。

在 SaaS 业务中通常采用按月或按年合同：

- 主要按月合同及少量的年度合同，采用 MRR（Month Recurring Revenue 月度经常性收入）。MRR 用于衡量每月订阅收入，如果有一些年度订阅，除以 12，再分摊到每月来计算 MRR
- 按年合同及少量的多年合同 ，采用 ARR（Annual Recurring Revenue 年度经常性收入）。多年合同除以合同年限，再分摊到每年来计算 ARR

在 MRR/ARR 统计中，并不会计算一次性和可变的收入。例如，定制功能费用。

#### 如何计算 MRR

将每个客户每月支付的费用相加得出 MRR。

> MRR = SUM（每位客户每月支付费用）

例如，当月共拥有 2 个客户，每个客户支付 100元/月，那么当月的 MRR=100+100=200 元。下个月又增加了 1 个客户，那么 MRR=100+100+100=300 元。

同时，我们也要注意不同套餐月费不同的情况。

例如，当月拥有 1 个客户，订阅了 100 元/月，那么当月 MRR=100 元。在下个月，增加了 1 个客户，订阅 1,000 元/年（ARR），那么相当于 83 元/月 MRR，虽然 2 个客户的总收款为 1,100 元，但 MRR=100+83=183 元。

#### MoM MRR 增长率

MoM MRR 增长率（MRR Growth Rate）按月计算 MRR 增长率。用于衡量 SaaS 业务增长速度、市场吸引力和业务扩展的指标。

> MRR 增长率 =（MRRt-MRRt-1）/MRRt-1*100%

例如，上个月产生了 1,000 元的 MRR，本月产生了 2,000 元的 MRR，我们的 MRR 增长率=（2,000-1,000）÷1000×100%=100%

#### 净 MRR

通过拆解 MRR 的各个组成部分，帮助我们了解到具体业务收入进和出的状况，以及导致 MRR 波动的原因。

其构成主要包括：

- **新增 MRR**：新客户产生的的 MRR
- **扩展 MRR**：对现有客户向上销售[1]或交叉销售[2]所增加的 MRR
- **重新激活 MRR**：以前客户重新使用订阅后的 MRR
- **客户流失 MRR**：客户取消订阅后的 MRR
- **客户收缩 MRR**：客户降低订阅后的 MRR

利用以上信息，我们可以计算净 MRR（Net New MRR）。

> 净 MRR =（新增 MRR+扩展 MRR+重新激活 MRR）-（客户流失 MRR+客户收缩 MRR）

例如，当月产生了 1,000 元的新 MRR，又产生了 1,000 元的向上销售收入，但由于客户流失而损失了 500 元 MRR，那么我们的净 MRR=1,000+1,000-500=1,500 元。

![](https://pic3.zhimg.com/v2-9eb24bebebf390c95941d5218a942026_b.jpg)

▲ 净 MRR。图片创意来源：baremetrics

#### 确认收入

确认收入（revenue recognition）是非常重要的财务知识，在 SaaS 业务中，确认收入与合同金额（Bookings）、收款金额（Billings）有很大的区别。

例如，按年收费的 SaaS 产品，年费 1200 元，那么：

- 合同金额是 1200 元
- 客户一次性支付年费，收款金额是 1200 元
- 在合同期间的每个月的确认收入则为 1200/12=100 元。剩下的 [1200-（月数*100）] 则为递延收益[3]
- 从企业资产负债表[4]而言，剩下 11 个月的 1100 元均为负债。因为服务还未完成，还需要投入 11 个月资源履行服务义务，甚至合同可能发生中止等情况，所以还不是确定的收入，需要通过后期的确认收入（损益表[5]中的利润）来减少资产负债表上的负债

### 2）LTV

#### 什么是 LTV

LTV（Customer Lifetime Value）又称为 CLTV 或 CLV，代表客户生命周期的财务价值，即单个客户在整个使用期内产生的总收入。

![](https://pic4.zhimg.com/v2-94e269b5673ba586a8eb94e16d44f727_b.jpg)

▲ 客户生命周期价值。图片创意来源：chartmogul

#### 如何计算 LTV

要计算客户生命周期价值，我们需要三个变量：

- **每个账户平均收入 ARPA**（Average Revenue Per Account）
- **流失率**（Cusmoter churn rate）
- **毛利率**[6]（Gross Margin %）

> LTV = ARPA*毛利率*客户月留存时长\
> LTV = ARPA*毛利率/客户流失率

例如，每个帐户的平均收入为 1,000 元，毛利率为 80%，客户流失率为 10％，那么客户终身价值 LTV=1,000*80%/10%=8,000 元。

#### 如何使用 LTV

1. **指导获客成本**。客户终身价值可以指导我们应该花多少钱来获客，一般而言，LTV：CAC（获客成本） ≥3 被认为是健康的标准。
2. **确定高价值客户**。将 LTV 按照不同的客户进行细分（规模、行业或其他维度），可以帮助我们确定最有价值的客户类型和特征。从而集中营销、销售、产品和支持等资源来吸引、赢得和留住这些客户。

#### 如何提高 LTV

增加 LTV，可以采用 4 种策略：

1. **增加 ARPA**。有[研究](https://link.zhihu.com/?target=https%3A//www.forbes.com/sites/patrickhull/2013/12/06/tools-for-entrepreneurs-to-retain-clients/%23203209272443)表明，向现有客户销售的可能性为 60-70％，而向新客户销售的可能性则为 5-20％。基于现有客户的信任，可对其进行向上销售和交叉销售，来增加 ARPA。
2. **减少流失**。客户留存时间越长支付的钱也就越多。与客户保持互动并建立良好的关系，以及不断完善、优化产品和服务，从而提高客户忠诚度。

![](https://pic1.zhimg.com/v2-3cd27e6ec84d7cd93f75d6a96f66a058_b.png)

▲ 留存提高 LTV。图片创意来源：vendasta

1. **提供年费计划套餐。**假如，客户平均留存时间为 8 个月，通过年费优惠套餐，优惠 10% 吸引客户购买，从而延长客户生命周期时长。
2. **提高毛利率。**提高自动化投入，从而降低人力资源，获得规模化效益。

### 3）CAC

#### 什么是 CAC

CAC（Customer Acquisition Cost）指获取新获客而产生的成本。

对于大多数 B2B SaaS 业务而言，CAC 包括：

- 产生销售线索的成本：通常由营销费用确定
- 转化为客户的成本：通常为销售和相关支持成本

#### 如何计算 CAC

将给定时间段中的销售和营销支出总额相加除以新客户总数。

> CACt = 总成本t/获得的客户总数t

例如，一个月中在销售和营销上花费了 50,000 元，并获得了 50 个新客户，则该月的客户获取成本 CAC=50,000/50=1,000 元。

CAC 存在两种不同的计算方式：

- 混合 CAC（Blended CAC）：市场营销支出/（付费客户+有机客户） 。把付费渠道和天然渠道（包括口口相传、社交媒体、自然搜索）混在一起计算的 CAC
- 付费 CAC（Paid CAC）：通过付费渠道获取的总成本/客户 。

混合 CAC 可以为我们提供业务的整体概况，但是查看付费 CAC 可以帮助我们确定和对比哪些渠道有效，哪些渠道无效。

![](https://pic3.zhimg.com/v2-8201bb1957800df88badae6a1f5429fe_b.jpg)

▲ CAC 可视化折线图。图片创意来源：chartio

#### LTV：CAC

用于估算客户获取的投资回报率（ROI）。通常情况下 LTV：CAC≥3 被认为是一个良好的指标。

例如，客户的生命周期价值为 3,000 元，而获客成本为 1,000 元，则 LTV：CAC 比率为 3：1。

![](https://pic2.zhimg.com/v2-5158fbc58d3713d046399fd3df2e1881_b.jpg)

▲ LTV：CAC 比率。图片创意来源：simplestrat

#### CAC 投资回收期

CAC 投资回收期（CAC Payback Period）通过计算得知获利（未考虑后期维护成本的情况）需要等待的时长，即从客户身上获取到收入需要多长时间才能抵消获客成本。

> CAC 投资回收期 = CAC/（ARPA*毛利率%）

例如，客户获取成本为 1,000 元，每位客户的平均每月收入为 100 元，毛利率为 *80%，那么 CAC 投资回收期1,000/（100*80%）=12.5 个月，才能获利。

通常 ≤12 个月被认为是一个不错的指标。投资回收期越短，公司的利润就越大。减少 CAC 投资回收期的时间还有助于减少因客户流失而沉没的获客成本（CAC）。

![](https://pic2.zhimg.com/v2-91c49024b4a8e4a4450aa210138a7fb5_b.jpg)

▲ CAC 投资回收期≤12 个月

#### 缩短 CAC 投资回收期

我们想要尽快的到达盈利，就需要客户订阅收入尽可能快的超过获取成本（CAC），通常可以采取以下方式：

1. **增加收入**。最大化定价和套餐策略；与潜在客户建立良好关系，进而最快速度的转化；专注客户入职，让意向客户尽早了解到产品的价值而付费订阅，让老客户不断深入使用，致使订阅更多和升级套餐。

![](https://pic3.zhimg.com/v2-0ceb50101ea22405a35b986d77c19c2a_b.jpg)

▲ 增加收入。图片创意来源：simplestrat

1. **降低获客成本**。优化营销渠道，将钱投放到最佳回报率的渠道上；增加自然线索，例如优化 SEO、口碑传播。

![](https://pic3.zhimg.com/v2-224ff2d6818d34414727931ecba3ea62_b.jpg)

▲ 降低 CAC。图片创意来源：simplestrat

1. **增加向上销售和交叉销售的机会。**

![](https://pic1.zhimg.com/v2-13ec344f0e7a78369218de94ab5ebe80_b.jpg)

▲ 向上销售和交叉销售。图片创意来源：simplestrat

### 4）ARPA

#### 什么是 ARPA

ARPA（Average Revenue Per Account）是每个帐户每年或每月产生的平均收入。它被用作创收能力和实现目标能力的指标。

![](https://pic2.zhimg.com/v2-f6e2de955be15195dd2a73d7d8883a0d_b.jpg)

▲ 建立 1 亿美元业务的八种方法。图片创意来源：The Angel VC

#### 如何计算 ARPA

所有客户（付费用户）在此期间产生的总收入应除以客户总数。

> ARPA = MRR/客户总数

例如，一家公司有 1,000 个帐户，每月产生 100,000 元的收入。每个帐户的平均收入 ARPA=100,000/1,000=100 元。

#### 如何使用 ARPA

ARPA 可以帮助我们预测和优化收入。例如通过跟踪对比新帐户和现有帐户的 ARPA，可以帮助我们对营销策略、定价策略和产品策略调整效果的评估。并且随着时间的推移，ARPA 的变化趋势也反映了产品/服务的价值变现能力。

#### 如何提高 ARPA

可以采用以下方法，增加 ARPU：

- **优化定价结构**

- **提高价格**。调整产品价格是增加每位用户平均收入的最明显、最直接的方法

- **可扩展的定价**。随着客户业务的增长，需要客户不断升级套餐计划。例如套餐 A 允许储存 1,000 个客户信息，套餐 B 允许储存 10,000 个客户信息

- **更多销售**

- **向上销售**。通过提供不同功能或服务组合套餐，引导客户升级，增加向上销售机会

- **交叉销售**。提供套餐外的额外功能或者服务，提高交叉销售收入

- **捆绑销售**。通过组合多个产品或功能组件进行销售，增加订阅金额

- **扩展产品线**。关注现有客户的需求，开发新功能或额外的服务来发展和进化产品来进一步扩展市场，增加产品价值提高 ARPU。例如一家在线客服系统的应用，不断扩展智能客服、电话客服

- **关注高 ARPA 客户**。并非所有的客户都是平等的，我们可以将更多的精力投入获取和维护高价值客户身上

### 5）流失

#### 什么是流失

流失（Churn）是指在特定时间段内停止订阅服务。

常见的流失原因有：

- 客户无法看到/获取产品的价值
- 产品质量或功能不满足
- 服务不好
- 转用竞争对手
- 账户余额不足
- 客户业务关闭

等等。不管怎样，流失都意味着收入的损失。

![](https://pic4.zhimg.com/v2-369844fdfc2a7a01de33bebd5a8dd78b_b.jpg)

▲ 流失

不过，我们可以通过调查和跟踪流失，特别是因为产品或服务的问题而造成的流失。然后，采取有针对性的完善和优化，进而达到提高留存获，取持续收入的目标。

在 SaaS 中有两种计算流失的角度：

- **客户流失**（Customer Churn）：取消订阅的客户数量
- **收入流失**（MRR/ARR Churn，Revenue Churn）：取消订阅的收入损失

#### 客户流失

要计算客户流失率，先将给定时间段内停止订阅的客户数量相加，然后除以期初的客户总数。

> 客户流失率 = 期间内流失的客户数/期初客户总数*100%

例如，在 1 月份有 20 个付费客户，但在当月结束时只有 19 个付费客户，那么仅 1 月份的客户流失率为（20-19）/20=5％。

#### 年度客户流失率

听起来合理的月度流失率，但确是非常严重的年均流失率。

> 年客户流失率 = 1-（1-月流失率）^12

例如，月客户流失率 5％，听上去并不高，将转化为全年客户流失率，却高达 46％。

1-(1-0.05) ^ 12≈46%

但，当我们将年客户流失率定为为 5-7％ 时，这意味着月流失率仅约为 0.5％，即每 200 个客户流失 1 个客户。

6%≈[1-(1-0.005)]12

通过以上的公式，我们可以从单个月度流失率提前计算出年度可能流失率。

但是，当我们拥有 12 个月的数据时，则可以用以下公式确切计算出全年客户流失率。

> 年客户流失率 = 1-(1-m1)*(1-m2)×...×(1-m11)×(1-m12)

<table data-draft-node="block" data-draft-type="table" data-size="normal" data-row-style="normal"><tbody><tr><td>细分</td><td>月度客户流失率%</td><td>年度客户流失率%</td></tr><tr><td>微型和小企业（<br>Small And Midsize Business）</td><td>3-7%</td><td>31%-58%</td></tr><tr><td>中型企业（Mid-Market）</td><td>1-2%</td><td>11%-22%</td></tr><tr><td>大型企业（Enterprise）</td><td>0.5-1%</td><td>6%-10%</td></tr></tbody></table>

<table data-draft-node="block" data-draft-type="table" data-size="normal" data-row-style="normal"><tbody><tr><td>细分</td><td>月度客户流失率%</td><td>年度客户流失率%</td></tr><tr><td>微型和小企业（<br>Small And Midsize Business）</td><td>3-7%</td><td>31%-58%</td></tr><tr><td>中型企业（Mid-Market）</td><td>1-2%</td><td>11%-22%</td></tr><tr><td>大型企业（Enterprise）</td><td>0.5-1%</td><td>6%-10%</td></tr></tbody></table>

▲ 数据来源：Tomasz Tunguz

#### 收入流失

假如，在当月有 3 个客户停止订阅服务。第一个客户支付 10 元/月，第二个客户支付 50 元/月，第三个客户支付 100 元/月。

收入流失就是这些订阅费用的总和，即 10+50+100=160 元。

> MRR 流失 = SUM（流失客户的 MRR）

其收入流失率，指流失收入占收入的百分比。

> MRR 流失率 = 期间流失 MRR/期初 MRR*100%

#### 客户流失 VS 收入流失

那为什么会有两种计算方式？

例如，我们的 SaaS 业务是按照坐席收费，50 元/月。拥有 200 个客户，100 个大客户（每个大客户拥有 100 个坐席），100 个小客户（每个小客户拥有 10 个坐席）。

当月，我们流失了 10 个客户，那么月客户流失率为 5％。

如果，流失的客户中，有 8 个是大客户，2 个是小客户，那么 MRR 流失 45000 元，MRR 流失率为 7.45%。

如果，流失的客户中，有 2 个是大客户，8 个是小客户，那么 MRR 流失 14000 元，MRR 流失率为 2.55%。

所以，通过不同的计算方式，使得我们更加全面、准确的了解到业务中所发生的事情。

#### 总 MRR 流失

总 MRR 流失（Gross MRR Churn Rate）由于取消和降级而导致的经常性收入损失的百分比。显示了客户对产品的满意度以及企业是否吸引了合适的客户。

> 总 MRR 流失率 = [（降级 MRR + 取消 MRR）/（期初总 MRR）]*100%

例如，如果本月流失（降级和取消）的总 MRR 为 200 元，而总 MRR（在月初计量）为10,000 元，则 MRR 总流失率将为 200/10,000=2％。

#### MRR 净流失率

MRR 净流失率（Net MRR Churn Rate）是 MRR 因扩张、取消和降级而发生的百分比变化。表明了一个时期内现有客户所带来收入增加（增加订阅数或升级套餐）或减少（取消、降级）情况。

> 净 MRR 流失率 =（损失 MRR - 扩张 MRR） /期初总 MRR*100%

例 A：一家公司的 MRR 为 50,000 元，扩展为7,000 元，降级和取消为 10,000 元。MRR 净流失率为（10,000-7,000）/50,000=6.0％

例 B：一家公司的 MRR 为 100,000 元，其中扩展了 12,000 元，降级和取消了 7,000 元。MRR 净流失率为（12,000-7,000）/100,000=-5.0％

当出现负 MRR 净流失率时，意味着现有客户每月产生的额外收入大于取消和降级而损失的收入。

要达到净 MRR 流失率为负值，可以采用以下措施：

- **扩展**：随使用量增长而增加的定价模型
- **追加销售**：客户升级更高的套餐版本
- **交叉销售**：客户购买额外的产品或服务
- **降低流失**：减少取消订阅量对收入的影响

#### 队列分析

队列本身不是一个指标，但非常重要。

队列分析（Cohort Analysis）是一个可视化图表，用于绘制和比较每个队列的特定指标随时间的进展情况。

在 SaaS 中，我们会查看留存率随时间变化趋势，并尝试找出导致高客户流失率的因素，从而改善留存。

通常，我们基于时间进行队列分组，例如：

- 2020 年 1 月注册
- 2020 年 2 月注册
- 2020 年 3 月注册

常见的队列分析形式以表格呈现，具有以下几个特征：

- 每行，代表一组用户。队列的名称在第一列（例如 2020 年 1 月）
- 每列，代表队列创建后的第几个月（第 0 个月是注册月份）
- 每个单元格，其中值为相对于前一个月的流失率或留存率

![](https://pic4.zhimg.com/v2-43b8353bfc7cdf4763a9cc7d937f15bf_b.jpg)

▲ 队列分析。图片来源：chartmogul

队列分析可以帮助我们找到以下问题的答案:

- 在客户生命周期的哪个阶段，用户流失率最高？
- 一段时间后，流失是否稳定？

然后，我们可以采取适当的行动，将重点放在客户流失率最高的地方（例如，如果第 1 个月和第 2 个月的流失率很高）。然后查看跟踪后面队列流失的情况，看看我们的行动是否产生了积极的影响。

## 最后

彼得 · 德鲁克（Peter Drucker）曾经说过，“一个事物，你如果无法度量它，就无法管理它”。

那么，把这句话放在 SaaS 的世界里，你如果不去度量它，那么你就在一定层度上丢失了衡量、优化和增长它的机会和视角。

## 更多说明

[1] 向上销售（Upsell）：提供更高价值的产品或服务，从竖向角度开发客户。

向上销售可以分为 3 类：

- 扩充坐席。例如，新增使用账户
- 升级版本。例如，从基础版升级为高级版
- 更大容量。例如，从 10G 扩展到 100G

[2] 交叉销售（Cross-sell）：发现客户的多种需求，并通过满足其需求而销售相关产品/服务，从横向角度开发客户。

![](https://pic4.zhimg.com/v2-77b328fb2e18a2da86c1d312ce46bb6b_b.jpg)

▲ 向上销售和交叉销售

[3] 递延收益：指尚待确认的收入或收益。凡在期间内完成的服务所产生的收入，则为确认收入；反之，即使款项提前预收，但未在期间内完成服务，则不作为确认收入。

[4] 资产负债表：反映企业经营在一定时期内（月份、年度）财务状况（两个方面，一方资产、另一方负债和权益）的报表。

[5] 损益表：反映企业经营在一定时期内（月份、年度）利润（收入）或亏损（支出）的报表。

[6] 毛利是收入和销货成本之间的差额。在 SaaS 中主要的销货成本主要包括支持、服务、客户成功（CSM）和开发运营。这在 SaaS 中通常非常高，例如 >80％。

## 本文参考

[Important SaaS Success Metrics](https://link.zhihu.com/?target=https%3A//www.youtube.com/watch%3Fv%3DMpCJtMLKjgs)

[Building a Growth Framework Towards a $100 Million Product](https://link.zhihu.com/?target=https%3A//brianbalfour.com/essays/hubspot-growth-framework-100m)

[The ultimate SaaS metrics guide to smarter, faster growth](https://link.zhihu.com/?target=https%3A//www.cobloom.com/blog/saas-metrics%23)

[SaaS Metrics 2.0 – Detailed Definitions](https://link.zhihu.com/?target=https%3A//www.forentrepreneurs.com/saas-metrics-2-definitions-2/)

[Geckoboard-Sales KPIs](https://link.zhihu.com/?target=https%3A//www.geckoboard.com/best-practice/kpi-examples/gross-mrr-churn-rate/%3Ffilter%3Dsaas)

[Klipfolio-SaaS Metrics and KPIs](https://link.zhihu.com/?target=https%3A//www.klipfolio.com/resources/kpi-examples/saas-metrics)

[Klipfolio metric HQ-SaaS metrics and KPIs](https://link.zhihu.com/?target=https%3A//www.klipfolio.com/metrics/category/saas%3Fpage%3D1)

[Chargebee Glossaries-saas metrics](https://link.zhihu.com/?target=https%3A//www.chargebee.com/resources/glossaries/%23saas-metrics)

[How to achieve net negative churn for SaaS](https://link.zhihu.com/?target=https%3A//www.profitwell.com/blog/how-to-achieve-negative-churn-and-why-it-matters)

[ARPU in SaaS: calculating and optimizing average revenue per user](https://link.zhihu.com/?target=https%3A//www.profitwell.com/blog/the-complete-saas-guide-to-calculating-and-optimizing-arpu)

[SaaS Metrics Refresher #6: Cohort Analysis](https://link.zhihu.com/?target=https%3A//blog.chartmogul.com/saas-metrics-refresher-cohort-analysis/)

[Supercharging Your SaaS Business Model for Hypergrowth](https://link.zhihu.com/?target=https%3A//blog.simplestrat.com/supercharging-your-saas-business-model-for-hypergrowth)

[Customer Acquisition Cost: Why it’s so important for your business](https://link.zhihu.com/?target=https%3A//grow.ukuinbound.com/blog/customer-acquisition-cost-why-its-so-important-for-your-business)

[Five ways to build a $100 million business](https://link.zhihu.com/?target=http%3A//christophjanz.blogspot.com/2014/10/five-ways-to-build-100-million-business.html)

[The Full Guide to ARPU for SaaS Companies](https://link.zhihu.com/?target=https%3A//blog.chartmogul.com/arpu-average-revenue-per-user/)

[What is Customer Acquisition Cost (CAC) and When to Use It](https://link.zhihu.com/?target=https%3A//chartio.com/learn/product-analytics/what-is-customer-acquisition-cost-cac/%23visualizing-customer-acquisition-cost)

[What is Customer Lifetime Value (LTV) and How to Calculate It](https://link.zhihu.com/?target=https%3A//www.vendasta.com/blog/what-is-customer-ltv/)

[How to Increase the Average Revenue per User (ARPU) of Your SaaS Product](https://link.zhihu.com/?target=https%3A//www.lightercapital.com/blog/how-to-increase-average-revenue-per-user-arpu-saas/)

欢迎关注公众号：产品D
