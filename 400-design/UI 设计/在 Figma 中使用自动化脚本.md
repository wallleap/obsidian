---
title: 在 Figma 中使用自动化脚本
date: 2022-11-21 15:00
updated: 2022-11-21 15:03
cover: //cdn.wallleap.cn/img/post/1.jpg
author: Luwang
comments: true
aliases:
  - 文章别名
rating: 10
tags:
  - Figma
category: design
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: null
---

最近在 Figma 的交流群里参与了一个公共项目：[526 个中国传统颜色-色谱](https://www.figma.com/community/file/1063024145039495423)。这个项目主要的工作是根据 [中国色](http://zhongguose.com/) 网站的色彩，在 Figma 中为每个颜色创建一个卡片，并创建一个色彩样式，我们几个群友要制作 500 多张卡片，一开始还挺开心，不过做着做着就不堪重负了 😂，所以就一起探索了一下如何自动化来完成这些枯燥的任务

![中国传统颜色](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500570.png)

[中国传统颜色](https://www.figma.com/community/file/1063024145039495423)

## 使用控制台来操作 Figma

Figma 有[插件系统](https://www.figma.com/plugin-docs/intro/)来对 Figma 进行自动化，但是为了日常的一些工作而开发插件很麻烦，所以直接在 Figma 网页的控制台里操作 Figma 更适合， 以下内容需要有 JavaScript 基础，可以参考一些[JavaScript 入门资料](https://www.w3school.com.cn/js/index.asp)

![控制台](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500571.png)

控制台

首先，我们需要先打开控制台

- 在 Figma 网页中打开控制 在 Chrome 浏览器的主菜单 -> 更多工具 -> 开发者工具 ，打开开发者工具，定位到 `Console` 标签页

- 在 Figma 客户端中打开控制台 在客户端菜单的 Help 中打开 Developer Tools，定位到 `Console` 标签页

	![在 Figma 客户端打开 Developer Tools](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500572.png)

	在 Figma 客户端打开 Developer Tools

在控制台中可以使用直接用访问全局对象 `figma` 来访问 [Figma 提供的 JavaScript API](https://www.figma.com/plugin-docs/api/api-reference/)，其使用方式与 Figma 插件的脚本是一模一样的，像是这样

![控制台中的  全局对象](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500573.png)

控制台中的 `figma` 全局对象

## 实战：制作「中国传统颜色」色卡

现在我们就以做「中国传统颜色」色卡的 Figma 素材的的过程当例子来说明一下

### 1. 加载 FigmaConsoleKit

我们先加载一个控制台增强工具 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit) ,它可以在控制台里增加一些 Figma 脚本常用的功能 ，比如直接通过 `activeNode` 来获取当前选中的图层，`setNodeText(node,'text')`来设置文本图层的文本等等。

在控制台输入以下表达式，回车执行，就可以在控制台加载 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit)

```JavaScript
fetch("https://raw.githubusercontent.com/Moonvy/FigmaConsoleKit/master/dist/FigmaConsoleKit.js?v1.2.0").then((r) =>
    r.text().then((c) => eval(c))
)
```

### 2. 准备数据

我们手上准备好的 [JSON 格式的数据](https://github.com/Moonvy/FigmaConsoleScripts/tree/master/data)，在控制台新建一个变量 `let list` 然后设置为 JSON 数据

```JavaScript
let list = [
    {
        CMYK: [62, 42, 56, 34],
        RGB: [94, 102, 91],
        hex: "#5e665b",
        name: "田螺绿",
        pinyin: "tianluolv",
    },
    {
        CMYK: [74, 42, 65, 40],
        RGB: [72, 91, 77],
        hex: "#485b4d",
        name: "白屈菜绿",
        pinyin: "baiqucailv",
    },
    // ......
]
```

### 3. 创建一个母组件

我们手动创建一个母组件，做好基本的图层结构，把“颜色名”、“拼音”等要填充的数据都创建一个文本图层

![创建一个母组件](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500574.png)

创建一个母组件

### 4. 创建一个生成子组件的函数

我们的目的是让每个颜色数据生成一个卡片，我们先考虑根据一个颜色生成卡片的函数

```JavaScript
/** 用母组件 main，根据数据 color 生成一个卡片 */
function createCard(main, color) {
    // 创建子组件
    // 填充数据
    // 创建图层样式
}
```

#### 4.1 创建子组件

创建子组件，调用母组件的 `createInstance()` 方法即可

```JavaScript
// 创建子组件
let ins = main.createInstance()
// 设置图层名称
ins.name = color.name
```

#### 4.2 填充数据

我们的母组件做好了图层结构，我们只要向实例的对应图层填充数据就好了。Figma API 为文本图层设置文本是比较麻烦的操作，要先载入字体，确保字体可用。这里使用 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit) 提供的 `setNodeText()` 函数来设置文本，就简单多了

```JavaScript
// ⚠️ 注意脚本中图层顺序与 Figma 图层列表中显示的正好相反，序号 0 是图层列表中最后一个图层
setNodeText(ins.children[0], `CMYK (${color.CMYK.join(", ")})`)
setNodeText(ins.children[1], `RGB (${color.RGB.join(", ")})`)
setNodeText(ins.children[2], color.hex)
setNodeText(ins.children[3], color.pinyin)
setNodeText(ins.children[4], color.name)
```

#### 4.3 调整文本的颜色

因为我们做的颜色卡片有的颜色深有的颜色浅，在浅色背景上要使用黑字，在深色背景上要显示白字，这里我们使用 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit) 提供的 `fontColorContrast()` 函数来自动判断要用那种文本颜色

```JavaScript
// 自动判断要用那种文本颜色
let textColor = toFloatColor(Color(fontColorContrast(color.RGB)).color)

// 为组件实例的每个文本图层设置文本颜色
ins.children.forEach((node) => {
    if (node.type === "TEXT") {
        node.fills = [
            {
                blendMode: "NORMAL",
                color: textColor,
                opacity: 1,
                type: "SOLID",
                visible: true,
            },
        ]
    }
})
```

#### 4.4 创建颜色的图层样式

我们还要为每一种颜色生成一个图层样式，并为我们的组件实例设置图层样式

```JavaScript
// 使用 / 来表示文件夹结构
let styleName = `中国传统颜色/${color.name}`
let style = figma.createPaintStyle()
style.name = styleName
// 为样式设置具体的数据
style.paints = [
    {
        blendMode: "NORMAL",
        color: toFloatColor(color.RGB),
        opacity: 1,
        type: "SOLID",
        visible: true,
    },
]
// 为我们的组件实例设置图层样式
ins.fillStyleId = style.id
```

最后我们的「生成子组件的函数」就编写完成了 😚，把在控制台中执行，我们之后就可以调用 `createCard(main, color)` 来创建颜色卡片了

```JavaScript
/** 用母组件 main，根据数据 color 生成一个卡片 */
function createCard(main, color) {
    // 创建子组件
    let ins = main.createInstance()
    // 设置图层名称
    ins.name = color.name

    // ⚠️ 注意脚本中图层顺序与 Figma 图层列表中显示的正好相反，序号 0 是图层列表中最后一个图层
    setNodeText(ins.children[0], `CMYK (${color.CMYK.join(", ")})`)
    setNodeText(ins.children[1], `RGB (${color.RGB.join(", ")})`)
    setNodeText(ins.children[2], color.hex)
    setNodeText(ins.children[3], color.pinyin)
    setNodeText(ins.children[4], color.name)

    // 自动判断要用那种文本颜色
    let textColor = toFloatColor(Color(fontColorContrast(color.RGB)).color)
    // 为组件实例的每个文本图层设置文本颜色
    ins.children.forEach((node) => {
        if (node.type === "TEXT") {
            node.fills = [
                {
                    blendMode: "NORMAL",
                    color: textColor,
                    opacity: 1,
                    type: "SOLID",
                    visible: true,
                },
            ]
        }
    })

    // 创建样式
    let styleName = `中国传统颜色/${color.name}`
    let style = figma.createPaintStyle()
    style.name = styleName
    // 为样式设置具体的数据
    style.paints = [
        {
            blendMode: "NORMAL",
            color: toFloatColor(color.RGB),
            opacity: 1,
            type: "SOLID",
            visible: true,
        },
    ]
    // 为我们的组件实例设置图层样式
    ins.fillStyleId = style.id

    // 返回新创建的组件实例
    return ins
}
```

### 5. 用数据创建卡片组件

好了，一切都准备就绪了，我们的颜色数据在变量 `list` 里，现在我们在 Figma 里选中母组件然后执行

```JavaScript
// 获取当前选中的图层，也就是你选中的母组件
let main = activeNode
let cards = list.map((color) => createCard(main, color))
```

![生成的卡片](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500575.png)

生成的卡片

等待一会你就会看见创建的卡片了，但是它们位置相同的，都堆在一起，我们要重新排列他们，我们使用 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit) 提供的 `tidyX()` 函数来重排全部卡片

```JavaScript
// 之前我们用 cards 变量保存了全部卡片
// 排列成 20 列，卡片间距 32
tidyX(cards, 20, 32)
```

这下我们就大功告成了，接下来就可以调整母组件的样式，来进行最后的设计了

最后提供一个[脚本文件](https://github.com/Moonvy/FigmaConsoleScripts/blob/master/%E4%B8%AD%E5%9B%BD%E4%BC%A0%E7%BB%9F%E8%89%B2%E5%BD%A9.js)供大家参考

![完成](https://cdn.wallleap.cn/img/pic/illustrtion/202211211500576.png)

完成

## 总结

在 Figma 控制台中使用 [FigmaConsoleKit](https://github.com/Moonvy/FigmaConsoleKit) 来进行自动化操作是非常方便的方式，不像用插件环境需要编译运行非常缓慢还不好调试。编写起来有开发者工具自带的调试功能，无论是查看表达式结果，还是查看数据结构，比使用 [Scripter](https://www.figma.com/community/plugin/757836922707087381/Scripter) 插件要更方便。非常推荐有 JavaScript 基础的人使用。

另外对于没有技术基础的设计师来说 Figma 的自动化一般仰赖于成品插件，如果遇到定制化的独特需求就很难办，虽然有像 [Automator](https://www.figma.com/community/plugin/1005114571859948695/Automator) 这样的插件但限制比较大。

之后我们会探索如何在「表现力」、「功能性」、「简单」上平衡，推出一款面向没有技术基础的用户的设计自动化工具。

[去推特留言](https://twitter.com/FarSideOfMoonvy/status/1481206463968444418?s=20)
