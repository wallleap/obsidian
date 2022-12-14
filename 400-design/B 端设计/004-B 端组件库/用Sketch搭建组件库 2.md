---
title: 用Sketch搭建组件库
date: 2022-12-02 16:44
updated: 2022-12-02 17:04
cover: //cdn.wallleap.cn/img/post/1.jpg
image-auto-upload: true
author: Luwang
comments: true
aliases:
  - 用Sketch搭建组件库
rating: 10
tags:
  - 组件
category: design
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: //myblog.wallleap.cn/post/
---

今天，让我们从理论走向实践，来看看如何使用Sketch搭建组件库。整个讲解过程我秉承着知行合一的精神亲自实践，但愿这种深入浅出的表达能为你带来即时收获~任何疑问建议欢迎留言呀。

大量gif预警，弱网环境下谨慎阅读~

## 为啥用Sketch创建？

还记得被我diss的“一次性设计”吗？对，就是我今天产出的这个东西只用一次，下一次碰到新的类似的场景用不上它。就好像一次性碗筷，用完即仍，不仅仅没有办法复用，而且无体系、非模块的处理方式也十分摧残我们的精力。

原子设计解决的就是这个问题，基于原子产出的设计可以大大提升设计本身的复用率，只需要花费很少的时间，就可以用组件迅速的搭建出一个页面。

而Sketch的核心大招——symbol功能，恰恰对应了原子设计的理念，基于symbol创建的组件可以多个页面复用，并且复用后的样式可以基于定义的样式库自由改动，而不影响symbol本身。（后续所有翻译都统称symbol为组件）

## 定义样式

在创建组件之前，我们需要先定义styling（样式）。

新版本的Sketch中除了以往我们熟知的字符样式和图层样式外，还新增了颜色变量这个新的功能。这个我们放后面着重说。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021645281.png)

### 1. 创建与复用一个样式

**字符样式：**

调整好一个字符后，通过新建即可将其定义到字符样式库，之后我们想对某些文本信息复用样式，直接在外观面板中调用（可以直接搜索对应的字号，方便快捷）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021646720.gif)

**图层样式：**

而我们所能定义的图层样式通常可以包含“样式”面板中所有的选项。填充、边框、阴影、内模糊及模糊这些样式都可以定义到库中。具体创建与调用方法和字符样式一致，这里不细讲。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021647287.png)

### 2. 神奇的颜色变量

69版本新增了一个颜色变量的功能。这个颜色变量的神奇之处就在于，形状和文字图层都可以共用一个颜色，修改了颜色变量即可实现全局更新。

举个栗子

我想把这俩货换个颜色来更契合我高冷的气质。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021647221.png)

在以往，我们需要在fill（填充）、border（边框）和text（字符）三个地方进行修改，才可以全部更换。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021647351.png)

但是如果我们使用颜色变量，那就可以一键修改。

如何使用颜色变量？还是这个按钮的例子。

首先，我们给主色创建一个颜色变量。创建好会它会自动在颜色变量面板中生成。

之后，确保我们的对象都使用了颜色变量（色板[icon](https://www.uisdc.com/tag/icon)处于激活状态就是正在使用）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021647908.png)

之后，我们只需要在变量中一键修改，即可迅速实现文本、填充和线框的全局迭代，非常非常的方便。（是不是有点像Ai的重新着色？）

当然，如果你是想替换别的颜色，<kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>F</kbd> 即可实现一键替换。（不限于颜色变量）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021649474.gif)

### 3. 颜色变量的劣势

可惜的是，覆盖层目前依然仅支持图层样式和字符样式，而没有颜色变量的选项。你没有办法直接在组件中更换变量。也就是说，我想在页面中添加一个新颜色的按钮，那只能通过增加新的symbol来实现，这无疑增加了维护、迭代的难度。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021649428.png)

所以，在Sketch对颜色变量有所行动之前，我建议组件库依旧使用图层样式来搭建颜色库。

## 创建一个组件

比如我们要创建一个按钮，直接在顶部工具栏点选“创建组件”这个菱形即可。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021649044.png)

△ 旧版Sketch是个环状加载icon

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021650952.gif)

默认选择的“发送组件到组件页面”是指，你创建的这个组件不仅仅反映在当前的图层中，同时将生成一个Symbol Source（后面统一翻译为源组件）反映在组件页面中。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021650296.png)

## 调用一个组件

如果我们在一个页面中想复用到这个按钮，可以在菜单栏或者工具栏中直接调用。

不过一旦组件过多，查找某个组件其实是相当吃力的，不过！Sketch在69版本推出了一个“组件视图”功能，在这个可视化的宫格视图下，你可以迅速找到你需要的组件。选中后右键点击置入即可实现调用。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021650676.png)

但是，这些并非最快捷的调用方法。

还记得Mac的“spotlight（聚焦搜索）”吗？自从习惯了聚焦搜索，我很久没有再去访达的文件夹手动找东西了。可以说这是mac系统得以高效办公的一个精髓所在，你几乎不需要在“找东西”上花费任何精力。

Sketch大概是吸收到了spotlight的创意，在69版本中同时上线了“Insert Menu（插入菜单）”的功能。只需要按下快捷键C，即可呼出一个面板。

面板采用了和组件视图一致的更易辨识和区分的宫格布局。你可以通过侧边[导航](https://www.uisdc.com/topic/%E5%AF%BC%E8%88%AA)或者全局搜索迅速定位到你想要的组件，拖拽或者双击即可实现迅速调用！！最高效、也最推荐的调用方法，没有之一。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021651277.gif)

## 编辑一个组件

**1. 我对组件本身有意见**

对组件本身有意见可以理解为想在源头修改，即修改源组件。

可以双击图层中的组件or组件视图中的组件，进入组件页面编辑。当对源组件进行编辑后，所有已经复用好的组件都会跟随变化。（敲黑板，不到万不得已一定要谨慎修改！唉说多了都是泪）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021653540.gif)

**2. 我对组件样式有意见**

如果仅仅是样式的问题，那就很好办了。

我们只需要在右侧的Overrides（覆盖层）面板中替换成我们想要的样式即可，这些样式来自我们之前对颜色、文本样式的预先定义。我们只是改动原子，所以并不会影响到源组件本身。

## 替换一个组件

组件选择器中选择即可，不用多说。（如果组件存在嵌套，则覆盖层也可以进行子组件的替换）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021653327.gif)

## 管理一群组件

当你想要对一些事物进行高效管理时，分组是最关键的手段之一。

而Sketch的symbol可以通过格式化的命名来高效地编组管理。

Sketch独特的命名格式是：xxx/…/xxx

“/”这个符号可以实现父子集的划分，/之前的内容是/之后内容的父级，一次“/”即可实现一次编组，可以进行嵌套。

比如这四种不同的按钮组件，就可以在各自名称前加入“按钮/”来将它们统一归纳到“按钮“组中。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021654515.png)

但是，一旦组件多起来，一个个的命名编组是一件非常痛苦的事情。

没事，我们神奇的69版本又一次解决了这个痛点。

现在，我们不需要在把精力花费在这些没有技术含量的重复劳动力上面，只需要不断地创造它们，然后ctrl+G，Duang~~Duang~~，完美解决。而且也支持通过解组、拖曳来实现编组的调整。（现在我唯一后悔的就是没早点升级Sketch版本）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021654155.png)

## 嵌套一个组件

我在之前的原子设计文章中提到，原子设计的核心就在于它以原子、分子、组织、模板和界面这五个层级为基础，来一步步进行搭建。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021654505.png)

而其中原子到分子、分子到组织、组织到模板的过程就属于嵌套。落实到组件库中，主要对应着原子到分子的嵌套。

下面这个按钮就是典型的一个嵌套行为。我们希望这种文字+icon形式的按钮能够实现形状、图标的自由搭配，因此提前将各个形状和图标作为原子制定好symbol，然后再嵌套，成为一个新的分子组件。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021655344.png)

嵌套过程也很简单，我们只需要选中原子（形状组件、图标组件和文本），进行二次创建即可。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021655009.png)

最后，我们可以在覆盖层自由地配置原子。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021655777.gif)

仅仅改动icon和形状就能适配到不同的场景。即便后面业务有新的类似的功能需求，我们只需要在组件库中增加icon、形状即可。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021655876.png)

不过，如果我们仅仅负责建立组件，而不考虑组件内容发生变化后的动态响应是远远不够的。这部分相对比较难懂，我单独放在了下篇进行讲解~

> 很多地方会涉及到Sketch69版本上线的新功能，暂未更新的童鞋强烈建议去升级下版本，你会切实感受到不为工具所累的爽快感。

## 什么是动态响应式

响应式估计大家都不陌生，专业点讲就是，系统对不同的媒介（运行 web 的设备）及视窗（显示网页的浏览器窗口）所产生的适应变化。

做跨设备响应的朋友接触会比较多，从大屏（pc）、中屏（平板）到小屏（移动端），为了适配不同的设备需要产出至少三个断点的[设计方案](https://www.uisdc.com/tag/%E8%AE%BE%E8%AE%A1%E6%96%B9%E6%A1%88)。

而要说市面做全局响应做的比较好的，antD （<https://ant.design/index-cn>）算一个，大家可以去官网感受下蚂蚁是如何实现媒介、视窗的完美响应的。

回归到主题，组件的响应式和页面响应式其实本质都是一样的，都是元素跟随父级的所产生的适应变化。只不过组件的父级可以是一个编组、也可以是页面。

对组件进行响应式处理意义重大。拿前文的这个商品卡片举例，如果我们对其不做任何适配处理，那在进行尺寸拉伸时就会这样：

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021657918.gif)

图片、间距变形失真，整个组件都遭到了破坏，效果非常的挫。

但是如果我们对组件进行一个适配处理，一切都变得非常自然柔顺：

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021657383.gif)

而在 [sketch](https://www.uisdc.com/tag/sketch) 中，实现动态响应效果的功能就是 Resizing（后面统一翻译为弹性布局）

## 关于弹性布局

所谓的弹性布局，就是让元素跟随父级编组或者画板的尺寸变化而产生的适应变化。在 sketch 中对应着右侧面板的 Resizing 功能。包含 Pin to Edge（固定边缘）、Fix Size（固定尺寸）和 Preview（预览）。（请忽略中文版截图蹩脚的翻译。。）

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021658593.png)

不过要注意的是，弹性布局需要拥有一个参照物实现尺寸和位置关系的控制。所以弹性布局面板只有在元素存在父级关系时才会出现，这里的父级包括编组和画板。如果元素没有任何父级关系包裹，仅仅在一个页面中，那并不会出现弹性布局的功能。

拿商品卡片举例，一开始这个卡片存在于一个画板中，这就意味着它是作为一个子级存在于画板父级之下，所以会出现弹性布局功能。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021658429.png)

但是，当我们将画板给它撤掉，让它独立得存在于页面中，你会发现弹性布局功能消失了。就是因为此时的商品卡片缺失了父级关系，没有办法使用参照物来控制其尺寸和位置关系。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021658636.png)

不过，当我们将其编组后，弹性布局再次出现，就是由于商品卡片再一次获得了父级关系，只是这次的父级由画板变更为编组了。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021658229.png)

## 固定边缘

固定边缘（Pin to Edge），即固定元素到边缘的内间距。

不论怎么拉伸，我自岿然不动。

拿商品标签举例。未固定边缘时，拉伸会直接破坏组件内的间距，显然这不是我们想要的。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021659672.gif)

我们希望内容与与左侧边缘的内间距保持不变，这该怎么搞呢？

非常简单，进入源组件页面，在右侧弹性布局面板中将内容固定到左侧边缘即可。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021659335.png)

回到标签组件，就会发现不论我们怎么拉伸，内容始终是固定在左侧边缘的。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021659633.gif)

## 关于固定尺寸

固定尺寸（Fix Size）即固定元素自身的尺寸大小。

拿商品图为例，没有固定尺寸时，拉伸后会失真变形。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021700425.gif)

我们想要商品图尺寸不随编组或者画板尺寸的改变而改变，所以选择固定图片的宽高。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021700946.png)

不论我们怎么拉伸编组，82 年的拉菲尺寸依旧保持不变。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021700370.gif)

## 关于预览

我们在选定一种属性后可以实时在右侧窗口中预览到效果，以帮助我们判断是不是自己想要的。注意，我们在点选后预览动画只会播放一次。如果想要再次观看效果，需要 hover 在预览窗口上哦～

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021701921.gif)

不过在很多组件中，固定边缘和固定尺寸往往是相互搭配、多次使用，下面我们通过一些实战来巩固。

## 手把手实战环节

依旧是我们的这个商品卡片，我们的目标就是让卡片中的所有元素能够适配任意的尺寸，包括不同的宽度和高度。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021701712.png)

**第一步，确定参照物。**

我们确定整个商品卡片这个组件为响应参照物，后续所有的子级元素都要跟随它尺寸的变化而变化。

**第二步，确定响应策略。**

在这一步，我们确定卡片中所有元素的位置关系和尺寸的响应规则。

首先，我们需要商品标题、商品价格和标签保持下方和左侧的内间距固定，同时它们的尺寸保持固定（已经提前建立了从左至右的自适应规则）所以我们固定左下边缘和宽高。

其中，标签由于是嵌套在商品卡片组件当中的，所以我们需要对标签组件内部做一次弹性布局。固定左侧边缘和宽高即可。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021702934.png)

商品图我们希望保持尺寸不跟随改变，所以直接固定其宽高。商品图背景需要始终保持四个方向内间距的一致，因此固定上下左右的边缘。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021702158.png)

最后来个弹性布局的总览。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021702240.png)

**第三步，响应效果测试。**

到了激动人心的测试环节了！嗯，看着相当完美。任意尺寸都能轻松 hold 住。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021702784.gif)

当然，这一步环节的效果如果不在我们的预期之内，需要返回检查每一个元素的弹性布局在哪里出了问题，比如文字的对齐方式啊，比如父子级的关系啊等等，反复调试～​

## 弹性布局的嵌套

弹性布局是可以嵌套使用的。

比如，我对 A 使用了弹性布局，那么 A 的父级 B 也可以使用弹性布局。一层层嵌套下去，就可以应对那些复杂页面的响应效果。只是嵌套的调试适配较为麻烦，而且很容易在某个环节忽略掉。

这里我借鉴了幺零三大佬所使用的办法，将具备父子级关系的元素一层层得逐级拆解，并在每一层分层进行弹性布局规则制定。

比如这个页面，它包含了较多的层级，如果直接草率上手做弹性布局会很麻烦，而且毫无逻辑的做法也很低效。正确的做法是一步步拆解后分层展开。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021703717.png)

为了便于阅读理解，下面每一层的版块和元素抽象成了骨架图。

**第一层弹性布局**

首先，从一整个版面来看，我们确定整个画板作为响应参照物，而内容区域需要保持不变的安全边距。所以我们直接固定内容区域四个方向的边缘。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021703810.png)

**第二层弹性布局**

接着，我们对内容区域进行拆解。现在我们的弹性布局对象变为拆解后的四个版块，而参照物依旧是整个画板。我们希望搜索框和 banner 的高度与上方间距保持不变，因此固定高度和上方边缘。商品版块宽高可以自由变化，所以仅固定上方边缘。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021703126.png)

**第三层弹性布局**

最后，我们对各个版块再次拆解，绝大部分被拆解为了最小颗粒。此时的弹性布局子级对象变为了这些更加细分的元素，比如暗提示、图标、大标题、折扣标等等。而响应参照物则变为了元素所依附的父级。比如搜索框是暗提示和图标元素的父级，而 banner 就是文字、按钮和图片的父级。最后的布局规则如下，具体逻辑不再赘述~

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021703219.png)

基于这个拆解的步骤，我们可以清晰得在每一层级进行分层弹性布局~​

来看下骨架图的响应效果，没啥问题。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212021704823.gif)

再来看下界面的响应效果~可以

## 最后

sketch 搭建组件库系列就此结束了，从组件的搭建、到组件的动态自适应、再到组件的动态响应式，这三个环节缺一不可。不过很多东西我自己也在摸索阶段，所以文章尚且不能面面俱到。后续有任何的疑问或者建议，欢迎随时留言。
