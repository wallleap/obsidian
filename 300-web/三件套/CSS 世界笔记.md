

![Cover6](https://cdn.wallleap.cn/img/pic/illustrtion/202210121558633.jpg)

本文内容来自个人学习张鑫旭老师的《CSS 世界》整理的笔记，通过阅读这本书，发现了很多之前没注意到的细节，文中加入了自己的想法和理解，舍弃了有关 IE 兼容性的问题，建议有一定 CSS 基础的同学阅读，如有错误请指正。

> CSS 有别于传统程序语言，在 CSS 的世界里，页面上的任何看似简单的呈现都是由许许多多 CSS 属性共同作用的结果。CSS 并无逻辑可言，看重的是特性间的相互联系和具象能力。

## 基本概念

### 层叠样式表

CSS 全称是 Cascading Style Sheets，翻译成中文就是“层叠样式表”，所谓“层叠”，顾名思义，就是样式可以层层累加，比方说页面元素都继承了 12 像素的大小，某标题就可以设置成 14 像素进行叠加。这种层叠策略对于样式的显示是相当的灵活。

### CSS 规则集

CSS 是由一个个规则集(ruleset)组成的，规则集包括选择器和声明块两部分

- 选择器(Selector)：在规则的开头，用于选择出需要定义样式的 HTML 元素，需要同时选中多个选择器用 `,` 分隔
- 声明块：用 `{}` 包括起来的内容，其中每一条是一个声明(Declaration)，声明是一组键值对（使用冒号隔开，左边的是键，右边的是值），每条声明用 `;` 隔开
  - 属性(Property)： 可读的标识符，指示您想要更改的样式特征，例如高度、颜色、字体大小
  - 属性值(Property value)：数值、百分比值、长度值、颜色值、关键字等

![Code](https://cdn.wallleap.cn/img/pic/illustrtion/202210101050755.png)

其他概念：

- 注释：在 CSS 中，注释放在  `/* */` 之间，不支持类似 `/* 注释1 /* 注释2 */ */` 的嵌套
- 功能符：值以函数的形式指定（就是被括号括起来的那种），主要用来表示颜色（`rgba` 和 `hsla`）、背景图片地址（`url`）、元素属性值、计算（`calc`）和过渡效果等，如 `rgba(0,0,0,.5)`、`url('css-world.png')`、`attr('href')` 和 `scale(-1)`。
- @规则：指的是以 `@` 字符开始的一些规则，像`@media`、`@font-face`、`@page` 或者 `@support`，诸如此类。

### 选择器

选择器是用来瞄准目标元素的东西，例如，上面的 `.selector` 就是一个选择器。

- 类选择器：指以 `.` 这个点号开头的选择器。很多元素可以应用同一个类选择器。 “类”，天生就是被公用的命。
-  ID 选择器：`#` 打头，权重相当高。ID 一般指向**唯一元素**。但是，在 CSS 中，**ID 样式出现在多个不同的元素上并不会只渲染第一个**，而是雨露均沾。但显然不推荐这么做。
- 属性选择器：指含有`[]` 的选择器，形如 `[title]{}`、`[title= "css-world"]{}`、`[title~="css-world"]{}`、`[title^= "css-world"]{}` 和 `[title$="css-world"]{}` 等。
- 伪类选择器：一般指前面有个英文冒号 `:` 的选择器，如 `:first-child` 或 `:last-child` 等。
- 伪元素选择器：就是有连续两个冒号的选择器，如 `::first-line`、`::first-letter`、`::before` 和 `::after`。
- 关系选择器是指根据与其他元素的关系选择元素的选择器，常见的符号有`空格`、`>`、`~`，还有`+`等，这些都是非常常用的选择器。
  - 后代选择器：选择所有合乎规则的后代元素。空格连接。
  - 相邻后代选择器：仅仅选择合乎规则的儿子元素，孙子、重孙元素忽略，因此又称“子选择器”。`>` 连接。
  - 兄弟选择器：选择当前元素后面的所有合乎规则的兄弟元素。`~` 连接。
  - 相邻兄弟选择器：仅仅选择当前元素相邻的那个合乎规则的兄弟元素。`+` 连接。

###  CSS 世界中的“未定义行为”

Web 应用场景千变万化，Web 标准也是不可能面面俱到的，也会存在规范描述以外的场景，此时，各大浏览器厂家只能根据自己的理解与喜好去实现，一旦个性化就会出现差异，就比如 Firefox 和 IE/Chrome 浏览器表现不一样。实际上，此时遇到的表现差异并不是浏览器的 bug，用计算机领域的专业术语描述应该是“未定义行为”（undefined behavior）。

## CSS 世界的“世界观”

- CSS 世界是一点一点创造出来的

- CSS 世界的诞生就是为图文信息展示服务的
- SVG 显然要比 Flash 优秀很多，SVG 开发、标准，和 CSS 和 JavaScript 都能很方便地进行交互，SVG 的强项是图形，其文字内容的呈现实在不敢恭维
- 为什么 CSS 世界的图文显示能力那么强？为什么它可以抑制 SVG 这么多年？答案就是：流！

### 文档流

“流”实际上是 CSS 世界中的一种基本的定位和布局机制，可以理解为现实世界的一套物理规则，“流”跟现实世界的“水流”有异曲同工的表现。所谓“流”，就是 CSS 世界中引导元素排列和定位的一条看不见的“水流”。

CSS 世界构建的基石是 HTML，而 HTML 最具代表的两个基石 `<div>` 和 `<span>` 正好是 CSS 世界中块级元素和内联级元素的代表，它们对应的正是图 1-3 所示的盛水容器中的水和木头，其特性表现也正如现实世界的水和木头，如图 1-4 所示。

![](https://cdn.wallleap.cn/img/pic/illustrtion/202210101027496.png)

流是如何影响整个 CSS 世界的？

- 擒贼先擒王CSS 世界的基石是 HTML，HTML 默认的表现符合“流”，所以整个 CSS 世界就可以被“流”统治
- 特殊布局与流的破坏。实际的网页是有很多复杂的布局的，可以通过破坏“流”来实现特殊布局
- 流向的改变。默认的文档流从左往右自上而下，这种流向我们是可以改变的，可以让 CSS 的展现更为丰富

> table 自己的世界，“流”的特性对 `<table>` 并不适用

### CSS 世界的基石 HTML 元素

HTML 常见的标签有 `<div>`、`<p>`、`<li>` 和 `<table>` 以及 `<span>`、`<img>`、`<strong>` 和 `<em>` 等。虽然标签种类繁多，但通常我们就把它们分为两类：块级元素（block-level element）和内联元素（inline element）。

#### 块级元素

块级元素占据其父元素（容器）的整个水平空间（一般独占一行），垂直空间等于其内容高度，常见的块级元素有 `<div>`、`<li>` 和 `<table>` 等。

这些元素的 `display` 属性值默认是 `block`、`table`、`list-item` 等。

应用：**清除浮动**

正是由于“块级元素”具有换行特性，因此理论上它都可以配合 `clear` 属性来清除浮动带来的影响。

```css
.clearfix:after {
    content: '';
    display: table; // 也可以是 block，或者是 list-item
    clear: both;
}
```

> 为什么 `list-item` 元素会出现项目符号
>
> ——之所以 `list-item` 元素会出现项目符号是因为生成了一个附加的盒子，学名“标记盒子”（marker box），专门用来放圆点、数字这些项目符号。

#### 内联元素

内联元素又叫行内元素，指只占据它对应标签的边框所包含的空间的元素，这些元素如果父元素宽度足够则并排在一行显示的，如 `span`、`a`、`em`、`i`、`img`、`td` 等。“内联元素”的“内联”特指后文提到的“外在盒子”，这些元素的 `display` 值默认是 `inline`、`inline-block`、`inline-table`、`table-cell` 等。

> 一般情况下，行内元素只能包含数据和其他行内元素，而块级元素可以包含行内元素和其他块级元素
>
> 就行为表现来看，“内联元素”的典型特征就是可以和文字在一行显示，浮动元素貌似也是可以和文字在一个水平上显示的，实际上，浮动元素和后面的文字并不在一行显示，它已经在文档流之外了，浮动元素会生成“块盒子”

## CSS 盒模型

### 外在盒子和内在盒子

每个元素都两个盒子，外在盒子和内在盒子

- 外在盒子负责元素是可以一行显示，还是只能换行显示，“外在盒子”有 `inline`、`block` 和 `run-in` 三种水平（其中 `run-in` 鲜有人使用，且有淘汰风险，可以忽略）。外在盒子是流体布局的本质所在，从作用上来讲，块级负责结构，内联负责内容。
- 内在盒子负责宽高、内容呈现什么的，专业的名称叫作“**容器盒子**”（`width` 和 `height` 是作用在这个盒子的），“内在盒子”又被分成了 4 个盒子，分别是 `content-box`、`padding-box`、`border-box` 和 `margin box` (`margin ` 的背景永远是透明的)

按照 `display` 的属性值不同，外在盒子和内在盒子组成不同

- 值为 `block` 的元素的盒子实际由外在的“块级盒子”和内在的“块级容器盒子”组成，所以独占一行且可设置宽高
- 值为 `inline-block` 的元素则由外在的“内联盒子”和内在的“块级容器盒子”组成，没有独占一行但可设置宽高
- 值为 `inline` 的元素则内外均是“内联盒子”，设置宽高无效且不会独占一行

> 在 CSS 中，所有的元素都被一个个的“盒子（box）”包围着（*容器盒子*），每个盒子由四个部分（或称*区域*）组成，其效用由它们各自的边界（Edge）所定义，与盒子的四个组成区域相对应，每个盒子有四个边界：*内容边界* *Content edge*、*内边距边界* *Padding Edge*、*边框边界* *Border Edge*、*外边框边界* *Margin Edge*。

### 标准盒模型和怪异盒模型

- w3c 标准盒模型：`box-sizing: content-box` 此模式下，设定的 `width` 属性值为 `content` 的宽度（这个是浏览器默认值）。

- IE 盒模型：`box-sizing: border-box` 此模式下，设定的 `width` 属性值为 `border`+`padding`+`content` 的宽度总和（实际开发时一般使用这个）。

```css
.box1 { box-sizing: content-box; } /* 默认值 */
.box2 { box-sizing: padding-box; } /* Firefox 曾经支持 */
.box3 { box-sizing: border-box; } /* 全线支持 */
.box4 { box-sizing: margin-box; } /* 从未支持过，本身就没有价值（设定好了宽高之后 margin 值并不能再影响盒子大小） */
```

![box-sizing](https://cdn.wallleap.cn/img/pic/illustrtion/202210111001826.png)

### 内联盒模型

这里介绍的“**内联**盒模型”是简易版

![内联盒模型](https://cdn.wallleap.cn/img/pic/illustrtion/202210101717155.png)

- 内容区域（content area）指一种**围绕文字看不见的盒子**，其大小仅受**字符**本身特性控制，本质上是一个字符盒子（character box）；但是有些元素，如图片这样的替换元素，其内容显然不是文字，不存在字符盒子之类的，因此，对于这些元素，内容区域可以看成**元素自身**。
- `inline-box` 又名内联盒子，通常由一些标签包裹形成，最常用的如`<span>`标签包裹文字会形成内联盒子，那些没有标签包裹的文字默认自己形成一个盒子称为`anonymous inline box`匿名内联盒子。
- `line-box` 名为行框盒子，从名字就可以看出，它是由单行内联元素形成的一个区域，注意是每一行都会形成，如果文字由五行，就会形成5个行框。行框的高度基本上是由行框中行高最大的内联盒子决定的。我使用基本上这个词，是因为还有其他情况，比如受到`vertical-align`属性的影响。
- `container-box` 就是包含块的意思，在内联元素中，包含块是由行框组成的。说白了就是包裹在所有行框外面的那层盒子。
- `struct`，**”幽灵空白节点“**，这个节点透明，不占据任何宽度，看不见也无法通过脚本获取，并且行高和字体大小都与该元素相同。

> ✨ 内联元素的所有解析和渲染表现就如同每个行框盒子的前面有一个“空白节点”一样。这个“空白节点”永远透明，不占据任何宽度，看不见也无法通过脚本获取，就好像幽灵一样。
>
> “幽灵空白节点”实际上也是一个盒子，不过是个假想盒，名叫“strut”，中文直译为“支柱”，是一个存在于每个“行框盒子”前面，同时具有该元素的字体和行高属性的 0 宽度的内联盒。

## 基本尺寸

### width 和 height

因为块级元素的流体特性主要体现在水平方向上，所以我们这里先着重讨论  `width`。

`width`/`height` 的默认值是 `auto`；`max-width` 和 `max-height` 的初始值是`none`，虽然 MDN 和 W3C 维基的文档上都显示 `min-width`/`min-height` 的初始值是 `0`，但是，根据作者的分析和测试，所有浏览器中的 `min-width`/`min-height` 的初始值都是 `auto`。

#### 深藏不露的 width:auto

`width` 的默认值是 `auto`，它至少包含了以下 4 种不同的宽度表现：

- 充分利用可用空间。比方说，`<div>`、`<p>` 这些元素的宽度默认是 100%于父级容器的。这种充分利用可用空间的行为还有个专有名字，叫作 `fill-available`
- 收缩与包裹。典型代表就是浮动、绝对定位、`inline-block` 元素或 `table` 元素，英文称为 `shrink-to-fit`，直译为“收缩到合适”，有那么点儿意思，但不够形象，我一直把这种现象称为“包裹性”。CSS3 中的 `fit-content` 指的就是这种宽度表现。
- 收缩到最小。这个最容易出现在 `table-layout` 为 `auto` 的表格中，想必有经验的人一定见过图 3-4 所示的这样一柱擎天的盛况吧！
- 超出容器限制。除非有明确的 `width` 相关设置，否则上面 3 种情况尺寸都不会主动超过父级容器宽度的，但是存在一些特殊情况。例如，内容很长的连续的英文和数字，或者内联元素被设置了 `white-space:nowrap`，则表现为“恰似一江春水向东流，流到断崖也不回头”。

#### 相对简单而单纯的 height:auto

CSS 的默认流是水平方向的，宽度是稀缺的，高度是无限的，宽度的分配规则就比较复杂，高度就显得比较随意。

`height:auto` 的表现：有几个元素盒子，每个多高，然后一加，就是最终的高度值了。

####  height:100%

`height` 和 `width` 还有一个比较明显的区别就是对百分比单位的支持。

对于 `width` 属性，就算父元素 `width` 为 `auto`，其百分比值也是支持的；但是，对于 `height` 属性，如果父元素 `height` 为 `auto`，只要子元素在文档流中，其百分比值完全就被忽略了。

让元素支持 `height:100%` 效果：

- 设定显式的高度值。对于普通文档流中的元素，百分比高度值要想起作用，其父级必须有一个可以生效的高度值！

```css
html, body {
	height: 100%;
}
```

- 使用绝对定位

```css
div {
    height: 100%;
    position: absolute;
}
```

> 绝对定位的宽高百分比计算是相对于 padding box 的，也就是说会把  `padding` 大小值计算在内；非绝对定位元素则是相对于 content box 计算的

### min-width/max-width 和 min-height/max-min-height

CSS 世界中，`min-width`/`max-width` 和 `min-height`/`max-height` 属性间，以及与 `width` 和 `height` 之间有一套相互覆盖的规则：**超越 `!important`，超越最大**

- 超越 `!important` 指的是 `max-width` 会覆盖 `width`
- 超越最大指的是 `min-width` 覆盖 `max-width`

例子1：图片最后呈现的宽度是 `256px`

```css
<img src="1.jpg" style="width:480px !important;">
img { max-width: 256px; }
```

例子2：最小宽度比最大宽度设置得还大，此时，“超越最大”规则，`min-width` 活下来，`max-width` 被忽略，`.container` 元素表现为至少 1400 像素宽

```css
.container {
    min-width: 1400px;
    max-width: 1200px;
}
```

> 案例：任意高度元素的展开收起动画技术

```css
.element {
    max-height: 0;
    overflow: hidden;
    transition: max-height .25s;
}
.element.active {
	max-height: 666px; /* 一个足够大的最大高度值 */
}
```

展开后的 `max-height` 值，我们只需要设定为保证**比展开内容高度大的值**就可以，但是，如果 `max-height` 值太大，在收起的时候可能会有“效果延迟”的问题

## 玩转盒模型

盒尺寸中的 4 个盒子 content box、padding box、border box 和 margin box 分别对应 CSS 世界中的 `content`、`padding`、`border` 和 `margin` 属性

### content 与替换元素

CSS 的 `content` CSS 属性用于在元素的 [`::before`](https://developer.mozilla.org/zh-CN/docs/Web/CSS/::before) 和 [`::after`](https://developer.mozilla.org/zh-CN/docs/Web/CSS/::after) 伪元素中插入内容。使用 `content` 属性插入的内容都是匿名的*[可替换元素](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Replaced_element)。*

#### 可替换元素

根据“外在盒子”是内联还是块级我们可以把元素分为内联元素和块级元素，而根据是否具有可替换内容，我们也可以把元素分为替换元素和非替换元素

- 替换元素：通过修改某个属性值（例如 `value`、`src` 等）呈现的内容就可以被替换的元素就称为“替换元素”，`<img>`、`<object>`、`<video>`、`<iframe>` 或者表单元素 `<textarea>` 和 `<input>` 都是典型
  的替换元素
  - **内容可替换**
  - 基本样式外部 CSS 很难改变，需要通过特定的伪元素选择
  - 有自己的尺寸，有默认的尺寸，有些和浏览器有关
  - 基线是下边缘 （`vertical-align` 的默认值的 `baseline`，但是替换元素不适用）
  - 所有的替换元素都是**内联水平元素**
- 非替换元素：内容不可替换，除了上述的元素基本都是非替换元素

替换元素的尺寸：从内而外分为 3 类——固有尺寸、HTML 尺寸和 CSS 尺寸

![](https://cdn.wallleap.cn/img%2Fpic%2Fillustrtion%2F202210241522768.png)

- 固有尺寸指的是替换内容原本的尺寸
- “HTML 尺寸”只能通过HTML 原生属性改变，这些 HTML 原生属性包括 `<img>` 的 `width` 和 `height` 属性、`<input>` 的 `size` 属性、`<textarea>` 的 `cols` 和 `rows` 属性等
- CSS 尺寸特指可以通过 CSS 的 `width` 和 `height` 或者 `max-width`/`min-width` 和 `max-height`/`min-height` 设置的尺寸，对应盒尺寸中的 content box

替换元素的尺寸计算规则：

- 如果没有 CSS 尺寸和 HTML 尺寸，则使用**固有尺寸**作为最终的宽高
- 如果没有 CSS 尺寸，则使用 **HTML 尺寸**作为最终的宽高
- 如果有 CSS 尺寸，则最终尺寸由 **CSS 属性**决定
- 如果“固有尺寸”含有固有的宽高比例，同时仅设置了宽度或仅设置了高度，则元素依然按照固有的宽高比例显示（图片只设置宽，高度会按原图片比例缩放）
- 如果上面的条件都不符合，则最终宽度表现为 300 像素，高度为 150 像素，宽高比 2 : 1（例如 `video`/`canvas`/`iframe` 在现代浏览器下的尺寸表现为 `300x150px`，图片除外）
- 内联替换元素和块级替换元素使用上面同一套尺寸计算规则（即使给 `img` 标签设置 `display: block` 但是尺寸还是按照上述规则计算）

> 首屏以下的图片处理

Web 开发的时候，为了提高加载性能以及节约带宽费用，首屏以下的图片就会通过滚屏加载的方式异步加载，当图片的 `src` 属性缺省的时候，图片不会有任何请求

```html
<img src="./img/pic.jpg" > <!-- 首屏图片 -->
<img data-src="./img/pic1.jpg"> <!-- 首屏之外的图片 -->
<style>
img {
    display: inline-block; /* 对于 Firefox 浏览器，src 缺省的 <img> 不是替换元素，而是一个普通的内联元素，宽高会无效 */
    visibility: hidden;
}
img[src] { visibility: visible; }
</style>
```

> 使用 `content` 属性生成图片

在 Chrome 浏览器下，所有的元素都支持 `content` 属性

直接使用 `content` 属性添加图片路径，视觉上和 `src` 引入路径一致；如果图片原来是有 `src` 地址的，我们也是可以使用 `content` 属性把图片内容给置换掉的

`content` 属性改变的仅仅是视觉呈现，当我们以右键或其他形式保存这张图片的时候，所保存的还是原来 `src` 对应的图片

可前往 [content 属性测试 - JS Bin](http://js.jirengu.com/benum/1/edit) 查看

![图片来源于网络，仅作展示用](https://cdn.wallleap.cn/img/pic/illustrtion/202210121646937.gif)

> H1 显示 logo 图片

使用 `content` 属性，我们还可以让普通标签元素变成替换元素

之前实现网站主标题处仅显示 logo，不显示文字（视觉上展示图片，SEO 仍索引标题文字）是这样实现的：

```html
<h1>网站主标题</h1>
<style>
h1 {
    width: 180px;
    height: 36px;
    background: url(logo.png);
    /* 隐藏文字 */
    text-indent: -999px;
}
</style>
```

我们可以通过添加 `content` 属性实现，代码更简洁但效果相同（传统 CSS 代码的 `<h1>` 是一个普通元素，因此需要设定尺寸隐藏文字；但是，后面使用 `content` 属性实现，`<h1>` 分分钟就变成了替换元素，文字自动被替换，同时尺寸规则就是替换元素的尺寸规则，完美适应原始图片大小）

```css
h1 {
	content: url(logo.png);
}
```

查看：[H1 title - JS Bin](http://js.jirengu.com/xiyoj/1/edit)

在 CSS 世界中，我们把 `content` 属性生成的对象称为“匿名**替换元素**”（anonymous replaced element）

- 使用 `content` 生成的文本是无法选中、无法复制的，对可访问性和 SEO 都很不友好，`content` 属性只能用来生成一些无关紧要的内容，如装饰性图形或者序号之类
- 不能左右 `:empty` 伪类（元素里面无内容的时候进行匹配）
- `content` 动态生成值无法获取，例如计数器属性

#### content 内容生成技术

在实际项目中，`content` 属性几乎都是用在 `::before`/`::after` 这两个伪元素中，因此，“content 内容生成技术”有时候也称 “::before/::after 伪元素技术”。

> 把 content 的属性值设置为空字符串，再利用其他 CSS 代码来生成辅助元素，或实现图形效果

```css
.element:before { 
   content: ''; 
} 
```



> 清除浮动带来的影响

```css
.clear:after { 
  content: ''; 
  display: table;  /* 也可以是'block' */ 
  clear: both;
}
```



> 辅助实现“两端对齐”以及“垂直居中/上边缘/下边缘对齐”效果

```html
<div class="box"><i class="bar"></i> 
   <i class="bar"></i> 
   <i class="bar"></i> 
   <i class="bar"></i> 
</div> 
<style>
.box { 
   width: 256px; height: 256px; 
   /* 两端对齐关键 */ 
   text-align: justify; } 
.box:before { 
   content: ""; 
   display: inline-block; 
   height: 100%; } 
.box:after { 
   content: ""; 
   display: inline-block; 
   width: 100%; } 
.bar { 
   display: inline-block; 
   width: 20px; } 
</style>
```



`:before` 伪元素用于辅助实现底对齐，`:after` 伪元素用于辅助实现两端对齐

使用这种方式，需要注意 HTML 代码有些地方不能换行或者空格，有些地方则必 须要换行或者有空格

> **content** 字符内容生成：，比较常见的应用就是配合 @font-face 规则实现图标字体效果

```html
<span class="icon-home"></span> 
<style>
@font-face { 
 font-family: "myico"; 
 src:  url("/fonts/4/myico.eot"); 
 src:  url("/fonts/4/myico.eot#iefix") format("embedded-opentype"), 
   url("/fonts/4/myico.ttf") format("truetype"), 
   url("/fonts/4/myico.woff") format("woff"); }
.icon-home:before { 
 font-size: 64px; 
 font-family: myico; 
 content: "家"; 
}
</style>
```



除常规字符之外，我们还可以插入 Unicode 字符，例如换行符

```css
:after { 
   content: '\A'; 
   white-space: pre; 
}
```



> 来实现字符动画效果

```html
正在加载中<dot>...</dot>
<style>
dot { 
   display: inline-block;  
   height: 1em; 
   line-height: 1; 
   text-align: left; 
   vertical-align: -.25em; 
   overflow: hidden; } 
dot::before { 
   display: block; 
   content: '...\A..\A.';
   white-space: pre-wrap; 
   animation: dot 3s infinite step-start both; } 
@keyframes dot { 
   33% { transform: translateY(-2em); } 
   66% { transform: translateY(-1em); } } 
</style>
```



> **content** 图片生成

```css
/* 直接用 url 功能符显示图片 */
div:before { 
  content: url(1.jpg); 
} 
/* 伪元素中的图片更多的是使用 background-image 模拟 */
div:before { 
  content: ''; 
  background: url(1.jpg);
} 
```



>  **content** 开启闭合符号生成

常规实现：

```css
q:before { 
   content: '“'; 
} 
q:after { 
   content: '”'; 
}
```



自带属性 `quotes`：

```html
<p lang="ch"><q>这本书很赞！</q></p> 
<p lang="en"><q>This book is very good!</q></p>
<p lang="no"><q>denne bog er fantastisk!</q></p>
<script>
 /* 为不同语言指定引号的表现 */ 
:lang(ch) > q { quotes: '“' '”'; } 
:lang(en) > q { quotes: '"' '"'; } 
:lang(no) > q { quotes: '«' '»'; } 
/* 在 q 标签的前后插入引号 */ 
q:before { content: open-quote; } 
q:after { content: close-quote; } 
</script>
```



可以任意指定 `quotes` 的字符，CSS 中还有 no-open-quote 和 no-close-quote 关键字，顾名思义，引号不需要了

> **content attr** 属性值内容生成

```css
img::after { 
   /* 生成 alt 信息 */ 
   content: attr(alt); 
   /* 其他 CSS 略 */ 
}
/* 也支持自定义的 HTML 属性 */
.icon:before { 
   content: attr(data-title); 
}
```



> 使用 `counter()` 实现 `ol` 前的序号展示

[CSS](https://developer.mozilla.org/zh-CN/docs/Web/CSS) 函数 **`counter()`**，返回一个代表计数器的当前值的字符串。它通常和伪元素搭配使用，但是理论上可以在支持 `<string>` 值的任何地方使用。
可以直接看这篇文章：[使用 CSS 计数器更改有序列表序号样式](https://myblog.wallleap.cn/#/post/90)

- 初始化/重置计数器：`counter-reset: name 初始值`

- 计数器递增：`counter-increment:  name 递增值`
- 显示计数： `content: counter(name, style)`/`content: counters()`
  - **list-style-type**：disc | circle | square | decimal | lower-roman | upper-roman |  lower-alpha | upper-alpha | none | armenian | cjk-ideographic | georgian | lower-greek | hebrew | hiragana | hiragana-iroha | katakana | katakana-iroha | lower-latin | upper-latin

> **content** 内容生成的混合特性

各种 content 内容生成语法是可以混合在 一起使用的

```css
a:after { 
	content: "(" attr(href) ")"; 
} 
q:before { 
	content: open-quote url(1.jpg); 
} 
.counter:before { 
	content: counters(name, '-') '. '; 
}
```



- 函数不要加引号
- 连接符就是一个空格，不需要逗号
- 引号内可以是任意内容



### 温和的 padding 属性

”温和”指的是我们在使用 `padding` 进行页面开发的时候很少会出现意想不到的情况。

- `padding` 指盒子的内补间
- CSS 中默认的 `box-sizing` 是 `content-box`，所以使用 `padding` 会增加元素的尺寸
- 设置 ` box-sizing:border-box`，`padding` 小的时候元素尺寸就不会变化；但是，如果 `padding` 值足够大，那么这个盒子还是会被撑大的（取大的值）
- 内联元素的 `padding` 在垂直方向同样会影响布局，只是因为内联元素没有可视宽度和可视高度的说法（`clientHeight` 和 `clientWidth` 永远是 0），垂直方向的行为表现完全受 `line-height` 和 `vertical-align` 的影响，视觉上并没有 改变和上一行下一行内容的间距，因此，给我们的感觉就会是垂直 `padding` 没有起作用
- 对于非替换元素的内联元素，不仅 `padding` 不会加入行盒高度的计算，`margin` 和 `border` 也都是如此，都是不计算高度，但实际上在内联盒周围发生了渲染
- `padding` 百分比值无论是水平方向还是垂直方向均是相对于宽度计算的
- 如果是内联元素
  - 同样相对于宽度计算
  - 默认的高度和宽度细节有差异
  - `padding` 会断行( `padding` 区域是跟着内联盒模型中的行框盒子走的)
  - 内联元素的垂直 `padding` 会让“幽灵空白 节点”显现，也就是规范中的“strut”出现（内联元素默认的高度完全受 `font-size` 大小控制，可以把 `font-size` 设为0）
- 标签元素内置的 **padding**
  - `ol`/`ul` 列表内置 `padding-left`，但是单位是 `px`，如果列表中的字体大小很小，则元素的项目符号（如点或数字）就会离元素的左边缘距离很开；如果 `font-size` 比较大，则项目符号可能跑到列表元素的外面
  - 很多表单元素都内置 `padding`
  - 所有浏览器 `<input>`/`<textarea>` 输入框内置 `padding`
  - 所有浏览器 `<button>` 按钮内置 `padding`，按钮元素的 `padding` 最难控制！Chrome 下 `button { padding: 0; }` 就可以了，Firefox 下可以试试 `button::-moz-focus-inner { padding: 0; }`
  - 部分浏览器 `<select>` 下拉内置 `padding`，如 Firefox、IE8 及以上版本浏览器可以设置 `padding`
  - 所有浏览器 `<radio>`/`<checkbox>` 单复选框**无内置** `padding`
  - 平常制作网页的时候很少使用原生的可点击的控件显示，而是利用 `<label>` 元素去模拟 `button`、`checkbox`、`radio`（这些元素隐藏，`<label>` 元素的 `for` 属性值和元素的 `id` 值对应即可）

CSS 中还有很多其他场景或属性会出现这种不影响其他元素布局而是出现层叠效果的现象，可以分为两类

- 纯视觉层叠，不影响外部尺寸：`box-shadow` 以及 `outline`
- 会影响外部尺寸：`inline` 元素的 `padding` 层叠

判断：如果父容器 `overflow:auto`，层叠区域超出父 容器的时候，没有滚动条出现，则是纯视觉的；如果出现滚动条，则会影响尺寸、影响布局

> 在不影响当前布局的情况下，优雅地增加链接或按钮的点击区域大小

```css
article a { 
   padding: .25em 0; 
}
```



> 利用内联元素的 padding 实现高度可控的分隔线

```html
<a href="">登录</a><a href="">注册</a>
<style>
a + a:before { 
	content: ""; 
    font-size: 0; 
    padding: 10px 3px 1px; 
    margin-left: 6px; 
	border-left: 1px solid gray; 
}
</style>
```



> 不使用伪元素，仅一层标签实现大队长的“三道杠”分类图标效果

```css
.icon-menu { 
   display: inline-block; 
   width: 140px; height: 10px; 
   padding: 35px 0; 
   border-top: 10px solid; 
   border-bottom: 10px solid; 
   background-color: currentColor; 
   background-clip: content-box; 
}
```



> 不使用伪元素，仅一层标签实现双层圆点效果

```css
.icon-dot { 
   display: inline-block; 
   width: 100px; height: 100px; 
   padding: 10px; 
   border: 10px solid; 
   border-radius: 50%; 
   background-color: currentColor; 
   background-clip: content-box; 
} 
```



### 功勋卓越的 border 属性

`border` 就是“边框”，border 属性在图形构建、体验优 化以及网页布局这块几大放异彩，同时保证其良好的兼容性和稳定的特性表现

- 虽然同属盒模型基本成员，但是 `border-width` 却不支持百分比，主要是因为没有需要使用百分比值的场景（`outline`、`box-shadow`、`text-shadow` 这些也不支持百分比，原因相同）
- `border-width` 除了常见的数字+长度单位（0的时候可以省略长度单位）还支持若干关键字
  - `thin`：薄薄的，等同于 `1px`
  - `medium`（默认值）：薄厚均匀，等同于 `3px` (这个是因为 `border-style:double` 至少 `3px` 才有效果)
  - `thick`：厚厚的，等同于 `4px`
- `border-style` 的默认值是 `none`，因此设定了 `border-width` 和 `border-color` 之后并不会有边框显示
  - `border-style:solid`：实线边框
  - `border-style:dashed`：虚线边框，虚线颜色区的宽高比以及颜色区和透明区的宽度比例在不同浏 览器下是有差异的
  - `border-style:dotted`：虚点边框，在表现上同样有兼容性差异
  - `border-style:double`：双实线边框，`border-width` 大小不同，其表现不同（表现规则：双线宽度永远相等，中间间隔±1）
  - 其他：`inset`（内凹）、`outset`（外凸）、`groove`（沟槽）、`ridge` （山脊）风格老土过时，且浏览器表现形式不一，因此，它 们没有任何实用价值，但是他们的出现无形中规范了实线边框的转角连接规则
- 当没有指定 `border-color` 颜色值的时候，会使用当前元素的 `color` 计算值作为边框色（`outline`、`box-shadow` 和 `text-shadow` 也是这样），可以不设定边框颜色，`hover` 时只修改 `color` 值，悬浮时它和它的伪元素边框颜色值也会变化

> 右下方 **background** 定位的技巧

假设现在有一个宽度不固定的元素，我们需要在距离右边缘 50 像素的位置设置一个背景图片，可以使用透明边框（默认 `background` 背景图片是相对于 padding box 定位的，也就是说，`background-position:100%` 的位置计算默认是不会把 `border-width` 计算在内的）：

```css
.box { 
  border-right: 50px solid transparent;  /* 对 50px 的间距我们使用 transparent 边框表示 */
  background-position: 100% 50%; /* 使用百分比 background- position 定位到我们想要的位置 */
}
```



> 优雅地增加点击区域大小

可以在 icon 外嵌套一层标签或者在 icon 上使用 `padding` 或透明 `border`

```css
.icon-clear { 
  width: 16px; 
  height: 16px; 
  border: 11px solid transparent; 
  ... 
}
```



> 三角等图形绘制

`border` 属性可以轻松实现兼容性非常好的三角图形效果，其底层原因受 `inset`/`outset` 等看上去没有实用价值的 `border-style` 属性影响，这一转角规则也被 `solid` 类型的边框给沿用了，**只要是与三角形或者梯形相关的图形，都可以使用 `border` 属性来模拟**

```css
/* 四色边框，只留一边有颜色就是梯形，将宽高置为0就是三角形 */
div { 
   width: 10px; height: 10px;  
   border: 10px solid;  
   border-color: #f30 #00f #396 #0f0; 
} 
/* 等腰直角三角形 */
div { 
   width: 0; height: 0;  
   border: 10px solid transparent;  /* 仅调整垂直方向 border-width 可以让其更扁或更高 */
   border-color-top: #f30; /* 保留两个方向的颜色，可以构造更多不同的三角形 */
} 
/* 利用梯形可以构造倒角矩形 */
div {
  position: relative;
  width: 200px;
  height: 100px;
  background: red;
  margin: 20px 20px;
}
div::before, div::after {
  content: '';
  position: absolute;
  box-sizing: border-box;
  width: 200px;
  height: 10px;
  border: 10px solid transparent;
}
div::before{
  top: -20px;
  border-bottom-color: red;
}
div::after{
  top: 100px;
  border-top-color: red;
}
```



> 使用 border 实现等高布局

如下：左侧深色背景区域是由 `border-left` 属性生成的，元素边框高度总是和元素 自身高度保持一致，**因此可以巧妙地实现等高布局效果**

```html
<div class="box clearfix">
  <nav>
    <h3 class="nav">导航1</h3>
  </nav>
  <section>
    <div class="module">模块1</div>
  </section>
</div>
<style>
/* 需要用 clearfix 清除浮动，这里不写出来 */
.box { 
 border-left: 150px solid #333; 
 background-color: #f0f3f9; 
}
.box > nav { 
 width: 150px; 
 margin-left: -150px; 
 float: left; 
}
.box > section { 
 overflow: hidden; 
}
</style>
```



### 激进的 margin 属性

方便后面理解，先看下元素尺寸相关概念：

- 元素尺寸：包括 `padding` 和 `border`，也就是元素的 border box 的尺寸。在原生的 DOM API 中写作 `offsetWidth` 和 `offsetHeight`，所以，有时候也成为“元素偏移尺寸”。
- 元素内部尺寸：包括 `padding` 但不包括 `border`，也就是元素的 padding box 的尺寸。在原生的 DOM API 中写作 `clientWidth` 和 `clientHeight`，所以，有时候也称为“元素可视尺寸”。
- 元素外部尺寸：包括 `padding` 和 `border`，还包括 `margin`， 也就是元素的 margin box 的尺寸。没有相对应的原生的 DOM API。外部尺寸的大小有可能是负数，可以理解成元素占据的空间尺寸。

#### margin 与元素的内部尺寸：

`margin` 同样可以改变元素的可视尺寸，但是和 `padding` 几乎是互补态势

- 对于 `padding`，元素设定了 `width` 或者保持“包裹性”的时候，会改变元素可视尺寸
- 对于 `margin` 则相反，元素设定了 `width` 值或者保持“包裹性”的时候，`margin` 对尺寸没有 影响（宽度设定，`margin` 就无法改变元素尺寸）；只有元素是“充分利用可用空间”状态的时候，`margin` 才可以改变元素的可视尺寸（只要元素的尺寸表现符合“充分利用可用空间”，无论是垂直方向还是水平方向，都可以通过 `margin` 改变尺寸）

```html
<div class="father"> 
  <div clas+s="son"></div>
</div>
<script>
.father { width: 300px; }  /* 宽度300 */ 
.son {  margin: 0 -20px; } /* 宽度340(300+20+20) */ 
</script>
```



对于普通块状元素，在默认的水平流下，`margin` 只能改变左右方向的内部尺寸，垂直方向则无法改变；但是，对于具有拉伸特性的绝对定位元素，则水平或垂直方向都可以；使用 `writing-mode` 改变流向为垂直流，则水平方向内部尺寸无法改变，垂直方向可以改变（这是由 `margin:auto` 的计算规则决定的）

> 一侧定宽的两栏自适应布局效果

一下案例文字内容就会根据 `.box` 盒子的宽度变化而自动排列，形成自适应布局效果，无论盒子是 200 像素还是 400 像素，布局依然良好，不会像纯浮动布局那样发生错位

```html
<style>
    .box { overflow: hidden; } 
    .box > img { float: left; } 
    /* .box > img { float: right; } */ /* 图片右侧定位 */
    .box > p { margin-left: 140px; }
</style>
<div class="box"> 
	<img src="1.jpg"> <p>文字内容...</p>
</div> 
```



图片右侧定位，但是按 HTML 顺序

```html
<style>
    .box { overflow: hidden; } 
	.full { width: 100%; float: left; } 
	.box > img { float: left; margin-left: -128px; }
    .full > p { margin-right: 140px; }
</style>
<div class="box"> 
	<div class="full"> 
        <p>文字内容...</p>
	</div> 
	<img src="1.jpg">
</div> 
```



> 两端对齐布局

列表块两端对齐，一行显示 3 个，中间有 2 个 20 像素的间隙

```css
li { 
   float: left; 
   width: 100px; 
   margin-right: 20px; 
}
/* 最右边也会有30的 margin，可以用下面的选择器或在第3个加上个类名 */
li:nth-of-type(3n) { 
   margin-right: 0; 
}
```



还可以通过给父容器添加 margin 属性，增加容器的可用宽度来实现，此时 `ul` 的宽度就相当于`100%+20px`

```css
ul { 
   margin-right: -20px; 
} 
ul > li { 
   float: left; 
   width: 100px; 
   margin-right: 20px; 
}
```



#### margin 与元素的外部尺寸：

对于外部尺寸，`margin` 属性的影响则更为广泛，只要元素具有**块状特性**，无论有没有 设置 `width`/`height`，无论是水平方向还是垂直方向，即使发生了 `margin` 合并，`margin` 对外部尺寸都着着实实**发生了影响**

> 借助 `margin` 的外部尺寸特性来实现底部留白

只能使用**子元素**的 `margin-bottom` 来实现滚动容器的底部留白

```html
<div style="height:200px;"> 
	<img height="300" style="margin:50px 0;">
</div>
```



> 利用 `margin` 外部尺寸实现等高布局

针对具有块状特性的元素而言，垂直方向 `margin` 无法改变元素的内部尺寸，但却能改变外部尺寸，默认情况下，垂 直方向块级元素上下距离是 0，一旦 margin-bottom:-9999px 就意味着后面所有元素和上面元 素的空间距离变成了-9999px，也就是后面元素都往上移动了 9999px。此时，通过神来一笔 padding-bottom:9999px 增加元素高度，这正负一抵消，对布局层并无影响，但却带来了我们 需要的东西—视觉层多了 9999px 高度的可使用的背景色，需要配合父级 overflow:hidden 把多出来的色块背景隐藏掉，于是实现了视觉上的等高布局效果。如果需要有子元素定位到容器之 外，父级的 overflow:hidden 是一个棘手的限制；其次，当触发锚点定位或者使用DOM.scrollIntoview()方法的时候，可能就会出现奇怪的定位问题

```css
.column-box { 
   overflow: hidden; 
} 
.column-left, .column-right { 
   margin-bottom: -9999px; 
   padding-bottom: 9999px; 
}
```



**内联元素**垂直方向的 margin 是没有任何影响的，既不会影响外部尺寸，也不会影响内部尺寸，有种石沉大海的感觉。对于水平方向，由于内联元素宽度表现为“包裹性”，也不会影响内部尺寸



#### **margin** 的百分比值 

和 padding 属性一样，margin 的百分比值无论是水平方向还是垂直方向都是相对于宽度计算的

元素设置 margin 在垂直方向上无法改变元素自身的内部尺寸，往往需要父元素作为载体，此外，由于 margin 合并的存在，垂直方向往往需要双倍尺寸才能和 padding 表现一致



#### **margin** 合并场景

块级元素的上外边距（margin-top）与下外边距（margin-bottom）有时会合并为单个外边距，这样的现象称为“margin 合并”

- 块级元素，但不包括浮动和绝对定位元素，尽管浮动和绝对定位可以让元素块状化
- 只发生在和当前文档流方向的相垂直的方向上，由于默认文档流 是水平流，因此发生 margin 合并的就是垂直方向

 margin 合并的意义：对于兄弟元素的 margin 合并其作用和 em 类似，都是让图文信息的排版更加舒服自然；父子 margin 合并使得在页面中任何地方嵌套或直接放入任何裸 `<div>`，都不会影响原来的块状布局；自身 margin 合并的意义在于可以避免不小心遗落或者生成的空标签影响排版和布局。

**margin** 合并的 3 种场景

（1）相邻兄弟元素 margin 合并

```html
<p>第一行</p>
<p>第二行</p>
<style>
p { margin: 1em 0; outline: 1px solid red;} 
</style>
```



![margin合并](https://cdn.wallleap.cn/img%2Fpic%2Fillustrtion%2F202210251907216.png)

（2）父级和第一个/最后一个子元素

```html
<!-- 三种写法，无论是 son 还是 father 距离上边的距离都是 80px -->
<div class="father"> 
   <div class="son" style="margin-top:80px;"></div> 
</div> 
<div class="father" style="margin-top:80px;"> 
   <div class="son"></div> 
</div> 
<div class="father" style="margin-top:80px;"> 
   <div class="son" style="margin-top:80px;"></div> 
</div>
```



![margin合并](https://cdn.wallleap.cn/img%2Fpic%2Fillustrtion%2F202210251911838.png)

解决父子 margin 合并：

对于 margin-top 合并，可以进行如下操作（满足一个条件即可）： 

- 父元素设置为**块状格式化上下文**元素；
- 父元素设置 border-top 值；
- 父元素设置 padding-top 值；
- 父元素和第一个子元素之间添加内联元素进行分隔。

对于 margin-bottom 合并，可以进行如下操作（满足一个条件即可）： 

- 父元素设置为块状格式化上下文元素；
- 父元素设置 border-bottom 值；
- 父元素设置 padding-bottom 值；
- 父元素和最后一个子元素之间添加内联元素进行分隔；
- 父元素设置 height、min-height 或 max-height。

（3）空块级元素的 margin 合并

因为垂直方向的上下 margin 值合二为一了，所以垂直方向的外部尺寸只有水平方向的一半。

```html
<!-- 此时.father 所在的这个父级元素高度仅仅是 1em，因为.son 这个空元 素的 margin-top 和 margin-bottom 合并在一起了 -->
<div class="father"> 
   <div class="son"></div>
</div>
<!-- 此时第一行和第二行之间的距离还是 1em，中间看上去隔了一个<div>元素，但对最终效果却 没有任何影响 -->
<p>第一行</p>
<div></div>
<p>第二行</p>
<style>
div { outline: 1px solid red;} 
.father { overflow: hidden; }
.son { margin: 1em 0; }
    
p { margin: 1em 0; }
</style>
```



如果不希望空元素有 margin 合并，可以进行如下操作： 

- 设置垂直方向的 border；
- 设置垂直方向的 padding；
- 里面添加内联元素（直接 Space 键空格是没用的）；
- 设置 height 或者 min-height。



#### **margin** 合并的计算规则

- “正正取大值”

- “正负值相加”

- “负负最负值”

如果同号，取绝对值最大的那个；如果异号，则 margin 结果为相加的值



####  margin:auto

margin:auto 的填充规则如下：

- 如果一侧定值，一侧 auto，则 auto 为**剩余空间大小**。

- 如果两侧均是 auto，则**平分剩余空间**。

> margin 属性的 auto 计算就是为块级元素左中右对齐而设计的，和内联元素使用 text-align 控制左中右对 齐正好遥相呼应（对于替换元素，如果我们设置 display:block，则 margin:auto 的计算规则同 样适合）

```css
.container {
    margin: 0 auto;
    width: 200px;
}
```



触发 margin:auto 计算有一个前提条件，就是 width 或 height 为 auto 时， 元素是具有对应方向的自动填充特性的，需要 margin:auto 可以让元素在垂直方向居中：

- 使用 writing-mode 改变文档流的方向
- 绝对定位元素的 margin:auto 居中

```css
/* 第一种 */
.father { 
   height: 200px; 
   writing-mode: vertical-lr; /* 更改文档流方向 */
} 
.son { 
   height: 100px; 
   margin: auto;
}
/* 第二种 */
.father { 
   width: 300px; height:150px; 
   position: relative;
}
.son { 
   position: absolute;  
   top: 0; right: 0; bottom: 0; left: 0; 
   width: 200px; height: 100px; 
   margin: auto;
}
```



#### **margin** 无效情形

- display 计算值 inline 的非替换元素的垂直 margin 是无效的。对于内联替换元素，垂直 margin 有效，并且没有 margin 合并的问题，所以图片永远不会发生 margin 合并。
- 表格中的和元素或者设置 display 计算值是 table-cell 或 table-row 的元素的 margin 都是无效的。但是，如果计算值是 table-caption、table 或者 inline-table 则没有此问题，可以通过 margin 控制外间距，甚至 ::first-letter 伪元素也可以解析 margin。
- margin 合并的时候，更改 margin 值可能是没有效果的（例如父子有一个 margin 值很大，只要另一个值比他小那一直是无效的）。
- 绝对定位元素非定位方位的 margin 值“无效”。
- 定高容器的子元素的 margin-bottom 或者宽度定死的子元素的 margin-right 的 定位“失效”。
- 鞭长莫及导致的 margin 无效。
- 内联特性导致的 margin 无效。

## 内联元素与流

> 块级元素负责结构，内联元素接管内容，而CSS世界是面向图文混排，也就是内联元素设计的

### 行高 line-height

#### line-height 对元素高度的影响

- 默认空 `div` 的高度是0，在里面写几个文字，他的高度本质上是由 `line-height` 属性决定的
- 对于非替换元素的**纯内联元素**，他的可视高度**完全**由 `line-height` 决定，`padding`、`border` 属性对它的可视高度没有任何影响
	- 内联元素的高度由固定高度和不固定高度组成，这个不固定的部分就是这里的“行距”。换句话说，`line-height` 之所以起作用，就是通过改变“行距”来实现的
	- 在 CSS 中，“行距”分散在当前文字的上方和下方，也就是即使是第一行文字，其上方也是有“行距”的，只不过这个“行距”的高度仅仅是完整“行距”高度的**一半**，因此，也被称为“半行距”
	- ![](https://cdn.wallleap.cn/img/pic/illustrtion/202212281032697.png)
	- 行距 = `line-height` - `font-size`（行距 = 行高− `em-box`）
	- 对于纯文本元素，`line-height` 直接决定了最终的高度
- `line-height` 不可以影响替换元素（如图片的高度）
	- 图片为内联元素，会构成一个“行框盒子”，而在 HTML5 文档模式下，每一个“行框盒子”的前面都有一个宽度为 0 的“幽灵空白节点”，其内联特性表现和普通字符一模一样
	- 如果纯文本同时有替换元素，则 `line-height` 只能决定最小高度，对最终的高度表现有望尘莫及之感。一是替换元素的高度不受 `line-height` 影响，二是 `vertical-align` 属性在背后作祟
- 对于块级元素，`line-height` 对其本身是没有任何作用的
	- 平时改变 `line-height`，块级元素的高度跟着变化实际上是通过改变块级元素里面内联级别元素占据的高度实现的
	- 块级元素可以通过 `line-height`、`height`和 `min-height` 以及盒模型中的 `margin`、`padding` 和 `border` 等属性改变占据的高度，所有这一切就构成了CSS世界完整的高度体系

#### line-height 属性值

- 默认值为 `normal`
	- `normal` 实际上是一个和 `font-family` 有着密切关联的变量值
	- 不同系统不同浏览器的默认 `line-height` 都是有差异的
- **数值**：如 `line-height:1.5`，其最终的计算值是和当前 `font-size` 相乘后的值
	- 所有的子元素继承的都是这个值（并非最终计算值，而是 `1.5`）
- 百分比值：如 `line-height:150%`，其最终的计算值是和当前 `font-size` 相乘后的值
	- 所有的子元素继承的是**最终的计算值**
- 长度值：也就是带单位的值，如 `line-height:21px` 或者 `line-height:1.5em` 等
	- 所有的子元素继承的是**最终的计算值**

#### **内联元素** line-height 的“大值特性”

看一下示例代码：

```html
<div class="box"> <span>内容...</span> </div>
<div class="box1"> <span>内容...</span> </div>
<style>
.box { line-height: 96px; } .box span { line-height: 20px; }
.box1 { line-height: 20px; } .box1 span { line-height: 96px; }
</style>
```

会发现 `.box` 和 `.box1` 全都是96px高

> 无论内联元素 `line-height` 如何设置，最终父级元素的高度都是由**数值大**的那个 `line-height` 决定的，我称之为“内联元素 `line-height` 的大值特性”

解释：**幽灵节点**！！！

- 内联元素是支持 `line-height` 的， `<span>` 元素上的 `line-height` 也确实覆盖了 `.box` 元素
- 在每个“行框盒子”前面有一个宽度为0的具有该元素的字体和行高属性的看不见的“幽灵空白节点”
- 如果套用本案，则这个“幽灵空白节点”就在 `<span>` 元素的前方
- 当 `.box` 元素设置 `line-height:96px` 时，“字符”高度 `96px`
- 当 `.box1` 设置 `line-height:20px` 时，`<span>` 元素的高度则变成了 `96px` ，而行框盒子的高度是由高度最高的那个“内联盒子”决定的
- 要避免“幽灵空白节点”的干扰，例如，设置 `<span>` 元素 `display:inline-block`，创建一个独立的“行框盒子”，这样 `<span>` 元素设置的 `line-height:20px` 就可以生效了，这也是下文多行文字垂直居中示例中这么设置的原因

#### 利用 line-height 实现文本居中

> 要让单行文字垂直居中，只需要 `line-height` 这一个属性就可以，并不需要依靠 `height` 属性

```css
.title { line-height: 24px; }
```

`line-height` 可以让单行或多行元素**近似垂直居中**（通过 `line-height` 设置的垂直居中，并不是真正意义上的垂直居中）
- 行高可以实现“垂直居中”原因在于 CSS 中“**行距的上下等分机制**”
- “近似”是因为文字字形的垂直中线位置普遍要比真正的“行框盒子”的垂直中线位置低

> 行高实现多行文本或者图片等替换元素的垂直居中效果

```html
<style>
.box { line-height: 120px; background-color: #f0f3f9; }
.content { display: inline-block; line-height: 20px; margin: 0 20px; vertical-align: middle; }
</style>
<div class="box">
<div class="content">基于行高实现的...</div>
</div>
```

实现原理
- 多行文字使用一个标签包裹，然后设置 `display` 为 `inline-block`
	- 重置外部的 `line-height` 为正常的大小
	- 又能保持内联元素特性，从而可以设置 `vertical-align` 属性，以及产生一个非常关键的“行框盒子”（让幽灵空白节点撑起高度）
- 因为内联元素默认都是基线对齐的，所以通过对 `.content` 元素设置 `vertical- align:middle` 来调整多行文本的垂直位置

### 垂直对齐 vertical-align

> 凡是 `line-height` 起作用的地方 `vertical-align` 也一定起作用

#### 字母 x

在各种内联相关模型中，凡是涉及垂直方向的排版或者对齐的，都离不开最基本的基线（baseline）

-   `line-height` 行高的定义就是两基线的间距
- `vertical-align` 的默认值就是基线，其他中线顶线一类的定义也离不开基线

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212281421592.png)

> 字母x的下边缘（线）就是我们的基线

![](https://cdn.wallleap.cn/img/pic/illustrtion/202212281422699.png)

- `x-height` 指的就是小写字母 x 的高度，术语描述就是基线和等分线（mean line）（也称作中线，midline）之间的距离。
	- ascender height: 上下线高度
	- cap height: 大写字母高度
	- median: 中线
	- descender height: 下行线高度
![](https://cdn.wallleap.cn/img/pic/illustrtion/202212281424669.png)

`vertical- align:middle` 中 `middle` 指的是基线往上`1/2 x-height` 高度。我们可以近似理解为字母 x 交叉点那个位置。
`vertical-align:middle` 并不是绝对的垂直居中对齐，我们平常看到的 middle 效果只是一种近似效果，因为不同的字体在行内盒子中的位置是不一样的。
对于内联元素垂直居中应该是对文字，而非居外部的块级容器所言。

- `ex` 是 CSS 中的一个相对单位，指的是小写字母 x 的高度，即 `x-height`
	- `ex` 不受字体和字号影响的内联元素的垂直居中对齐效果

应用：小图标对齐

```css
.icon-arrow { 
	display: inline-block; width: 20px;
	height: 1ex;
	background: url(arrow.png) no-repeat center; }
```

内联元素默认是基线对齐的，而基线就是 x 的底部，而 `1ex` 就是一个x的高度。设想一下，假如图标高度就是 `1ex` ，同时背景图片居中，岂不是图标和文字天然垂直居中，而且完全不受字体和字号的影响？因为 `ex` 就是一个相对于字体和字号的单位。

#### vertical-align 作用的前提

- 只能应用于**内联元素**以及 `display` 值为 `table-cell` 的元素
- 即 `vertical-align` 属性只能作用在 `display` 计算值为`inline`、`inline- block`，`inline-table` 或 `table-cell` 的元素上
- **默认情况下**，`<span>`、`<strong>`、`<em>` 等内联元素，`<img>`、`<button>`、`<input>` 等替换元素，非 HTML 规范的自定义标签元素，以及 `<td>` 单元格，都是支持 `vertical-align` 属性的，其他**块级元素则不支持**
- 有一些 CSS 属性值会在背后默默地改变元素 `display` 属性的计算值，从而导致 `vertical-align` 不起作用
	- 例如浮动和绝对定位会让元素块状化
- 行框盒子前面的“幽灵空白节点”高度太小，也会不生效，如果我们通过设置一个足够大的行高让“幽灵空白节点”高度足够，就会看到 `vertical-align:middle` 起作用了
- `table-cell` 元素设置 `vertical-align` 垂直对齐的是子元素，但是其作用的并不是子元素，而是 `table-cell` 元素自身

#### vertical-align 属性值

除去 inherit 这类全局属性值不谈，可以把 `vertical-align` 属性值分为以下4类：

- 线类，如 `baseline`（默认值）、`top`、`middle`、`bottom`
	- 默认值是 `baseline`，内联元素默认都是沿着字母 x 的下边缘对齐的
	- 对于图片等替换元素，往往使用元素本身的下边缘作为基线
	- 文本之类的内联元素是相对字母 x 的下边缘对齐，而中文和部分英文字形的下边缘要低于字母 x 的下边缘，因此，会给人感觉文字是明显偏下的，一般都会使用数值进行调整
	- 一个 `inline-block` 元素，如果里面没有内联元素，或者 `overflow` 不是 `visible`，则该元素的基线就是其 `margin` 底边缘；否则其基线就是元素里面最后一行内联元素的基线
	- `vertial-align:top` 就是垂直上边缘对齐（`bottom` 则相反）
		- 内联元素：元素底部和当前**行框盒子**的顶部对齐（和这一行位置最高的内联元素的顶部对齐）
		- `table-cell` 元素：元素底 `padding` 边缘和表格行的顶部对齐（类似  `<td>` 元素，则和 `<tr>` 元素上边缘对齐）
	-   `line-height` 和 `vertial-align: middle` 实现的多行文本或者图片的垂直居中全部都是“近似垂直居中”
		- 内联元素：元素的垂直中心点和行框盒子基线往上 `1/2 x-height` 处对齐（可以看作是 x 的交叉位置）
		- `table-cell` 元素：单元格填充盒子相对于外面的表格行居中对齐
		- 基本上所有的字体中，字符 x 的位置都是偏下一点儿的，`font-size` 越大偏移越明显，这才导致默认状态下的 `vertial-align:middle` 实现的都是“近似垂直居中”
		- 如果想要实现真正意义上的垂直居中对齐，只要想办法让字符 x 的中心位置就是容器的垂直中心位置即可，通常的做法是设置 `font-size:0`，整个字符 x 缩小成了一个看不见的点，根据 `line-height` 的半行间距上下等分规则，这个点就正好是整个容器的垂直中心位置
		- 平常我们开发的时候，`font-size` 可能就 12px 或 14px，虽然最终的效果是“近似垂直居中”，但偏差也就 1px～2px 的样子，普通用户其实是很难觉察到其中的差异的
- 文本类，如 `text-top`、`text-bottom`
	- `vertical-align:text-top`：盒子的顶部和父级内容区域的顶部对齐（“父级内容区域”指的就是在父级元素当前 `font-size` 和 `font-family` 下应有的内容区域大小）
	- `vertical-align:text-bottom`：盒子的底部和父级内容区域的底部对齐
	- ![](https://cdn.wallleap.cn/img/pic/illustrtion/202212281520363.png)
- 上标下标类，`sub`、`super` 两个值，分别表示下标和上标
	- `vertical-align:super`：提高盒子的基线到父级合适的上标基线位置
	- `vertical-align:sub`：降低盒子的基线到父级合适的下标基线位置
- 数值百分比类，如 `20px`、`2em`、`20%` 等
	- `vertical- align` 的计算值如果是负值，往下偏移，如果是正值，往上偏移
	- 数值大小全部都是相对于基线位置计算的（`vertical-align:baseline` 等同于 `vertical-align:0`）
	- `vertical- align` 属性的百分比值是相对于 `line-height` 的计算值计算的（`margin` 和 `padding` 是相对于宽度计算的，`line-height` 是相对于 `font-size` 计算的）

#### 无处不在的 vertical-align

> 对于**内联元素**，如果遇到不太好理解的现象，请一定要意识到，有个“**幽灵空白节点**”以及无处不在的 `vertical-align` 属性

不同属性值定义完全不同，且很多属性 `table-cell` 元素有着不同的定义；同时最终表现与字符 x、`line-height`，和 `font-size`、`font-family` 属性密切相关

> 基于20px图标对齐的处理技巧

- 图标高度和当前行高都是20px
- 图标标签里面永远有字符（伪元素生成空格）
- 图标 CSS 不使用 `overflow:hidden` 保证基线为里面字符的基线，但是要让里面潜在的字符不可见

```css
.icon { 
	display: inline-block; width: 20px; height: 20px;
	background: url(sprite.png) no-repeat;
	white-space: nowrap; letter-spacing: -1em; text-indent: -999em;
} 
.icon:before { 
	content: '\3000'; 
} 
/* 具体图标 */
.icon-xxx { 
	background-position: 0 -20px; 
}
...
```

> 基于 `vertical-align` 属性的水平垂直居中弹框

无论浏览器尺寸是多大，也无论弹框尺寸是多少，弹框永远都是居中的

```html
<div class="container"> 
	<div class="dialog"></div>
</div>
<style>
.container { 
	position: fixed; top: 0; right: 0; bottom: 0; left: 0;
	background-color: rgba(0,0,0,.5);
	text-align: center; font-size: 0; white-space: nowrap;
	overflow: auto;
}
.container:after { 
	content: '';
	display: inline-block; height: 100%; vertical-align: middle; 
}
.dialog { 
	display: inline-block; vertical-align: middle; text-align: left;
	font-size: 14px; white-space: normal; 
}
</style>
```

## 流的破坏与保护

CSS 世界中正常的流内容或者流布局虽然也足够强大，但是实现的总是方方正正、规规矩矩的效果，有时候需要一些特殊的布局表现，例如，文字环绕效果，或者元素固定在某个位置，浮动和定位就在这里生效了。

### 浮动 float

浮动的本质就是为了实现==**文字环绕效果**==

纯浮动布局容错性差，容易出现比较严重的布局问题，也容易出现意料之外的情况，这里的意料之外除了float属性自身特性（如父元素高度塌陷）导致的布局问题外，还包括~~诸多兼容性问题~~

#### `float` 的特性

- 包裹性
	- 包裹：正常情况块级元素不设置宽度，它的宽度将是父元素的宽度，子元素设定宽度也不影响它；但是加上浮动，父元素的宽度不变，但是它的宽度将变成子元素的宽度
	- 自适应性：如果它下面除了子元素还有很多文字，当文字数量少时，宽度将被撑大，直到达到浮动元素的宽度
- 块状化并格式化上下文
	- 块状化：属性值不为 `none` 时它的 `display` 计算值就是 `block` 或 `table`（`display` 值中除了 `inline-table` 将转换成 `table` 外，其他的都是 `block`）
- **破坏文档流**
- 没有任何 `margin` 合并

#### float 的作用机制

- `float` 有一个特性表现：会让父元素的高度塌陷
- `float` 属性让父元素高度塌陷的原因就是为了实现文字环绕效果
- 为“文字环绕效果”是由两个特性（即“父级高度塌陷”和“行框盒子区域限制”）共同作用的结果
	- **“高度塌陷”只是让跟随的内容可以和浮动元素在一个水平线上**
	- “**行框盒子和浮动元素的不可重叠性**”，也就是“行框盒子如果和浮动元素的垂直高度有重叠，则行框盒子在正常定位状态下**只会跟随浮动元素，而不会发生重叠**”，即使 `margin-left` 设置无穷大，和浮动元素在同一水平线上因为被约束也不会往它左边走

#### float 与流体布局

利用 `float` 破坏 CSS 正常流的特性，实现两栏或多栏的自适应布局

> 一侧定宽的两栏自适应布局

```html
<div class="father">
  <div class="menu"></div>
  <div class="content">this is content … Lorem100</div>
</div>
<style>
.father {   overflow: hidden; } 
.father .menu {   width: 60px; height: 64px;   float: left; background: #eee;} 
.father .content {   margin-left: 70px; background: #eee;} 
</style>
```

![](https://cdn.wallleap.cn/img/pic/illustrtion/202301031131921.png)

左侧定宽且浮动，右侧元素 `margin-left` 比左侧宽多 10 像素，不会发生环绕，且是自适应的

#### 清除浮动 `clear`

`clear: none | left | right | both`

`clear:both` 的作用本质是让自己不和 `float` 元素在一行显示，并不是真正意义上的清除浮动







不是的。实际上，浮动元素和后面的文字并不在一行显示，浮动元素已经在文档流之外了。证据就是，当后面文字足够多的时候，文字并不是在浮动元素的下面，而是继续在后面。这就说明，浮动元素和后面文字不在一行，只是它们恰好站在了一起而已。真相是，浮动元素会生成“块盒子”，这就是后话了。