---
title: Vim —— 写代码更高效
date: 2022-11-15 15:06
updated: 2022-11-15 15:08
cover: //cdn.wallleap.cn/img/post/1.jpg
author: Luwang
comments: true
aliases:
  - 文章别名
rating: 10
tags:
  - blog
  - Vim
category: web
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: null
---

Vim 是从 vi 发展出来的一个文本编辑器。代码补全、编译及错误跳转等方便编程的功能特别丰富，在程序员中被广泛使用。

简单的来说， vi 是老式的字处理器，不过功能已经很齐全了，但是还是有可以进步的地方。 vim 则可以说是程序开发者的一项很好用的工具。

连 vim 的官方网站 (<https://www.vim.org/>) 自己也说 vim 是一个程序开发工具而不是文字处理软件。

![键盘图](https://cdn.wallleap.cn/img/pic/illustrtion/202208121721944.gif)

## （一）三种模式

基本上 vi/vim 共分为三种模式，分别是**正常模式（Normal Mode）**、**输入模式（Insert Mode）** 和 **命令模式（Line mode）**。

三种模式相互切换：

- 正常模式：是进入 Vim 的默认模式，这个模式可以用各种指令实现快捷操作
	- <kbd>i</kbd> 插入字符，会进入输入模式
	- <kbd>:</kbd> 切换到命令模式，一般在底部会显示输入的命令
- 输入模式：可以像正常的编辑器一样输入文本
	- <kbd>ESC</kbd> 退出输入模式，回到正常模式
- 命令模式：在这个模式下可以实现保存、退出等操作
	- `q` 退出 Vim，后面加`!`可以强制执行
	- `w` 保存文件

## （二）记单词

除了移动其他的基本上都是单词首字母

移动：

- `hjkl`，以<kbd>k</kbd>键为基准，左边一个键（左移的），右边两个键分别是上右

- 上下左右键

- 可以搭配数字使用，`数字+方向`，例如：`30j`代表往上30行，`2→`代表右移两格

```code
    ^
    k		 提示： h 的键位于左边，每次按下就会向左移动。
< h   l >		   l 的键位于右边，每次按下就会向右移动。
    j			   j 键看起来很象一支尖端方向朝下的箭头。
    v
```

- `w` / `W` to move **word** by word
- `b` / `B` to move **backwards** word by word
- `e` to jump to the **end** of a word
- `ge` to jup to the end of the previous word
- `E` is like `e` but operates on WORDS
- `gE` is like `ge` but operates on WORDS
- `0`: Moves to the first character of a line
- `^`: Moves to the first non-blank character of a line
- `$`: Moves to the end of a line
- `g_`: Moves to the non-blank character at the end of a line
- `}` jumps entire paragraphs downwards
- `{` similarly but upwards
- `CTRL-D` lets you move down half a page by scrolling the page
- `CTRL-U` lets you move up half a page also by scrolling

常用操作：;

- 删除光标所在行：<kbd>dd</kbd>
- 删除标签内的内容：光标在标签内 <kbd>dit</kbd> （delete in tag） 好像只能在 VSCode 里用
- 删除花括号 `{}` 中的内容：光标先移动到花括号中 <kbd>c</kbd> + <kbd>i</kbd> + <kbd>Shift</kbd> + <kbd>[</kbd>（change in 花括号） 还可以是单引号 `''`、圆括号 `()` 等