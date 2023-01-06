---
title: KANO模型
date: 2023-01-06 17:05
updated: 2023-01-06 17:05
cover: //cdn.wallleap.cn/img/post/1.jpg
image-auto-upload: true
author: Luwang
comments: true
aliases:
  - KANO模型
rating: 1
tags:
  - 策略
category: design
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: #
url: //myblog.wallleap.cn/post/1
---

KANO 模型，翻译叫卡诺模型。网上摘抄到对它的解释大概如下：对用户需求分类和优先排序的有用工具，以分析用户需求对用户满意的影响为基础，体现了产品性能和用户满意之间的非线性关系。

> 不说那么抽象的，讲人话，就是一个帮助我们定义 “需求影响力” 的工具，通过定义评价的标准，来衡量每条需求可能对用户造成的实质影响。  

通常，KANO 中定义了5个需求的属性，即魅力、期望、必备、无差异、反向型，通过一定的分析步骤对每个属性进行打分，最终搞明白它属于哪一类型。

[一流设计网](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/)提示这么做的目的，是为了辅助我们更好的理解需求的有效性，为后续需求的优先级、工期、精细度安排做参考。

## KANO 的需求类型

有了基本的概念，我们就要来详细了解一下 KANO 的具体原理了。

在 KANO 模型的理念中，产品功能、服务的完成度，与用户满意度的相关性并不完全一致，可能功能非常出色完善但用户并不买账，也可能做的非常简陋但是备受用户吹捧。

所以，KANO 定义了一个由功能完成度和用户满意度组成的2维坐标轴。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707618.jpeg)

并在这个坐标轴中，通过一定的[曲线](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E6%259B%25B2%25E7%25BA%25BF%26post_type%3Dpost)、圆形区域，来表达下面说到的五种需求类型：

-   魅力型：提供了会让用户惊喜，但是不提供用户满意度也不会受到影响
-   期望型：用户非常渴望的功能，提供了用户满意度会上升，反之则下降
-   必备型：提供了用户满意度不受影响，但是没提供则满意度大幅下降
-   无差异：无论提供还是不提供，都不会有什么影响
-   反向型：提供了会导致用户满意度下降

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707619.jpeg)

我们可以在很多分享看到这个图例，但是要注意这只是一个对概念进行直观呈现的示意图，我们并不需要直接应用。

我们要先来理解一下，基础的五种需求类型都有什么特点。

### 1. 魅力型（Attractive Quality）

魅力型的需求，是能让用户产生 “意外[惊喜](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E6%2583%258A%25E5%2596%259C%26post_type%3Dpost)” 的东西。虽然没有这个功能不受影响，但是提供之后会让用户非常的兴奋和满意。

比如在设计中常说的 “情感化” 设计，就是增加魅力型需求到产品中，通过一些有趣的交互、提示，来提升用户的满意度。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707620.jpeg)

或者，像[微信](https://link.zhihu.com/?target=https%3A//www.uisdc.com/topic/%25e5%25be%25ae%25e4%25bf%25a1)提供的拍一拍功能，没有的时候完全不受影响，但是诞生以后可以大大增加社交中的趣味性，提升用户的满意度。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707621.jpeg)

### 2. 期望型(One-dimensional Quality)

期望型则是用户非常想要有的功能，通常是用户的主要诉求或痛点，如果没有得到满足，那么用户始终会觉得不够满意，或者认为被厂商忽视。

例如使用支付宝进行公共[交通](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E4%25BA%25A4%25E9%2580%259A%26post_type%3Dpost)的支付就是期望型功能，在它们还没上线的时候，用户有非常大的呼声希望扫码支付能得到统一的应用。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707622.jpeg)

### 3. 必备型(Must-be Quality)

必备型，通常是一个应用最底层的功能之一，是用户默认你应该具备的。例如聊天工具可以发表情，电商有购物车。如果这些底层的功能实现不符合预期，那么就会对用户的满意度造成极其负面的影响。

比如在线支付这个操作，我们默认所有主流支付渠道都包含了，但是京东、美团的支付选项中移除了支付宝，这对于相当数量的用户而言是不可理喻的。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707623.jpeg)

### 4. 无差异（Indifferent Quality）

无差异，则是一些你做和不做，用户都一点也不在意的东西。可以说，它们就是 “无效需求” 的代名词。

这类需求常常来源于老板、产品经理拍脑门做的决定，或者用户反馈中没有虚无的建议和要求。

再有可能，就是紧跟潮流趋势做的功能，比如饿了么最近上线的 “真香” 频道，在一个外卖应用中上直播和短视频……

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707624.jpeg)

### 5. 反向型（Reversal Quality）

反向型需求，则是做了会起反相效果的需求，也就是让用户反感。

除了某些刚愎自用的决策者根据自己喜好添加需求以外，多数情况下是为了促进转化或者流量强加给用户的一些功能。

比如 UC 这类浏览器不会老老实实的在首页放基础搜索框和收藏，而是一定要加入新闻流媒体来强制用户进行关注。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707625.jpeg)

了解了这5类需求是什么，下一步，我们就要来熟悉应用它们的方法

## KANO 的评价系统

首先我们看看下面的[表格](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E8%25A1%25A8%25E6%25A0%25BC%26post_type%3Dpost)，包含功能有或没有的复合表格，两个维度都包含了从喜欢到不喜欢的5个分数等级。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707626.jpeg)

我们通过获取用户对有或没有的打分，来判断这个功能处于哪一个类型。当然，当调查访谈的用户数量较多时，是需要进行均值或加权计算的。

除了用这个表格记录外，KANO 还经常使用一个四分位 Better-Worse 系数坐标轴（奇怪的知识又增加了），通过对相关系数进行计算将需求置入对应坐标象限。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707627.jpeg)

这个坐标相对于前面的表格来说，看上去更直观。但是去系统获得坐标系对应数值的办法，就没那么讨喜了。

Better、Worse 系数分别代表了在增加和缺少该功能后，用户的评分。但这个评分的数值不再是 1-5 这么简单，而要通过一定的计算来完成，公式如下：

-   Better/SI=（A+O）/(A+O+M+I)
-   Worse/DSI=-1（O+M）/(A+O+M+I)
-   这个公式了解下就好，只要知道在四象限应用中的原理就足够了，而不需要我们真的去进行这种计算。

既然两种方法各有优缺点，我们在实际应用中自然应该要做出一些有效的改良，即结合它们各自的优点，创建出一个新的坐标体系。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707628.jpeg)

我们只要根据第一种方法的数值，将功能对应分配到这个列表中，就可以获得一个直观的需求影响力图表了。

同时，根据可视化的原理，对需求的其它权重或分类进行表现，例如使用色彩或大小进行区分，让图表可以更直观。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301061707629.jpeg)

## 结语

KANO [模型](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E6%25A8%25A1%25E5%259E%258B%26post_type%3Dpost)只是需求分析中的其中一个环节，用来帮助团队更好的理解需求的属性，但并不是代表需求的理解仅此而已。

同时，KANO 模型的可信度是建立在准确的用户打分之上，这是一个非常严苛的要求，不仅需要非常有效的实验、调研计划制定，同时受限于样本数会导致置信区间过大（评分误差），置信度极低。

在以效率为导向的团队协作中，除非是非常重要的功能，否则使用用户[画像](https://link.zhihu.com/?target=https%3A//www.yiliusheji.com/%3Fs%3D%25E7%2594%25BB%25E5%2583%258F%26post_type%3Dpost)、卡片等工具进行大致的推导即可。

KANO 的应用场景多种多样，需要大家根据实际应用场景进行调整。尤其对于设计师来说，KANO 不是一个我们教育 PM 怎么做需求的工具（某种情况下可以），而是辅助团队对需求的影响力有清晰认识的方法，帮助团队做出更有效的决策。