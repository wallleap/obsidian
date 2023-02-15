---
title: ICON 绘制
date: 2023-02-15 21:54
updated: 2023-02-15 22:04
cover: //cdn.wallleap.cn/img/post/1.jpg
image-auto-upload: true
author: Luwang
comments: true
aliases:
  - ICON 绘制
rating: 1
tags:
  - ICON
category: design
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: //myblog.wallleap.cn/post/1
---

图标是具有指代意义的图形符号，具有高度浓缩并快捷传达信息、便于记忆的特性​

---

## 设计原则​

- 准确​
	- 信息图形化，准确表达图标含义；屏显准确，减少锯齿的出现。​
- 简洁​
	- 形式与笔画的简洁，去繁从简，在保证表意的前提下，去除多余细节；​
- 可用​
	- 通过检测图标的访问情况，保证图标的可识别性和可用性；​
- 统一​
	- 保证图标大小、线条粗细、感情特征、端点特征、拐角特征、倾斜角度、基本形状等的统一性；​

## ​KeyLine及栅格​

Keyline规范保证了设计图标的统一性，其大小、比例、复杂程度都会标准化、清晰化；栅格用于图标元素绘制的参考并帮助建立清晰的内容轮廓边界；

![](https://cdn.wallleap.cn/img/pic/illustration/202302152156078.png)

下载模板：<https://wallleap.lanzoub.com/ilAL20nos3ti>

## 基础形状​

组成图标的基本形状有：矩形、正方形、圆、三角形；

![](https://cdn.wallleap.cn/img/pic/illustration/202302152159338.png)

## 大小尺寸​

图标绘制基于 48x48dp 画布绘制的线性图标，线宽默认为 4px，不同场景等比缩放使用；

![](https://cdn.wallleap.cn/img/pic/illustration/202302152159127.png)

## 组成元素

- 线段与端点：指组成图标的线段的粗细规范及线段端点规范；​

- 断口与间距：指图标内元素及断口之间间距规范；​

- 倾斜角度：指对非垂直及水平线的倾斜角度规范；​

- 拐角度数：指基于一定规则对图标的拐角弧度进行限定，从而规范图标拐角度数；​

- 封闭与非封闭：封闭区域由闭合曲线构成，可以进行独立颜色填充；非封闭区域则由非闭合曲线构成，无法进行填充；​

### 1.  线段与端点​

为保证风格的整体一致性，图标所有线段端点默认样式均为与线段同宽的圆角端点（当端点为圆时，为保证视觉统一，圆形直径需比线段宽度略大）；通常情况下线段端点和可编辑节点坐标以整数坐标为佳;​

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152200799.png)

### 2.  断口与间距​

建议图标元素之间的间距不得小于默认线宽4px；相对复杂的特殊图标元素之间间距最小为线宽1/2px（对应到默认4px的线粗是不得小于2px）；在间距上建议使用偶数，可以为2的倍数作为参考。

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152201307.png)

### 3.  倾斜角度​

图标中的线段倾斜角度应为15度的倍数，保持与Keyline中的对角线或十字垂直相交线保持平行关系；
​
![](https://cdn.wallleap.cn/img/pic/illustration/202302152201390.png)

### 4. 拐角度数

![](https://cdn.wallleap.cn/img/pic/illustration/202302152202478.png)

### 5.  封闭与非封闭​

图标的封闭与非封闭的属性，将决定是否可以顺利进行风格的转换，当图标的元素由闭合曲线构成时，则可以进行独立颜色填则，否则无法进行填充属性的变换；​

封闭图形：​

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152202023.png)

非封闭图形：​

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152203206.png)

当封闭图形为曲线形状且有相交线段时，原则上是不能通过[IconPark](http://iconpark.bytedance.com/)技术能力实现独立的颜色填充；​

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152203665.png)

## 图标命名规范​

图标命名符合图标表意，统一命名格式，加入分类的前缀作区分；更便于后期管理与维护；​

​![](https://cdn.wallleap.cn/img/pic/illustration/202302152203086.png)

- 中文命名​

中文名称要中文名称、易理解、无歧义的原则，当表达状态时用“-”连接；​

`例：收藏、喜欢、正方形、矩形、文件夹-下载、文件夹-添加​`

- 英文命名​

英文命名应为小写，多个单词之间用横杠分割，不能有大写字母、空格、特殊符号，长单词、复合单词视情况可采取首字母缩写的命名方式；​

`例：collection、like、square、distance、folder-download、folder-add​`

- 相同含义图标命名​

相同含义图标的多个图标，通过后缀加数字方式区别；​

`例：like、like-one、like-two​`

​
