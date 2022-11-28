---
title: macOS个性化定制
date: 2022-10-08T00:00:00.000Z
updated: 2022-11-27 20:13
cover: //cdn.wallleap.cn/img/post/1.jpg
author: Luwang
comments: true
aliases:
  - macOS 个性化定制
rating: 10
tags:
  - blog
category: 分类
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: //myblog.wallleap.cn/post/
---

六年 macOS 使用经验，推荐好用的软件和一些配置，并提供资源备份（以目前最新版 macOS Ventura 13.0 为例）

## 系统设置

### 允许安装任意来源的 APP

```zsh
sudo spctl --master-disable
```

![允许任何来源](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005904.png)

如果之后打开 app 还是报错

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211272032523.png)

可以再到这个界面看下有没有提示，如果有，请选择【仍要打开】

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211272033851.png)

### 安装 Xcode Command Line Tools

完整的 Xcode 占用空间太大，而且也不一定使用，Command Line Tools 是在 Xcode 中的一款工具，macOS 下不少开发工具都会依赖这个，手动安装一下，后面安装其他工具可以省下不少麻烦：

```zsh
xcode-select --install
```

## 安装 HomeBrew

好用的软件包管理器，官网为：[The Missing Package Manager for macOS (or Linux) — Homebrew](https://brew.sh/)（可以直接到官网首页搜索框搜软件，之后直接复制到终端运行）

由于国内直接运行安装命令会报错，所以需要先配置好代理（自行解决），或者使用镜像（自己搜索教程）

之后到命令行执行（端口号 10809 10808 改成自己的）

```sh
export https_proxy=http://127.0.0.1:10809 http_proxy=http://127.0.0.1:10809 all_proxy=socks5://127.0.0.1:10808
```

之后再执行安装命令

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

如果前面安装顺利，之后弹出提示的话，可以按照它给出的提示，运行命令

测试
### 修改启动台图标行和列数

启动台里面也可以设置应用的列和宽，使用如下命令即可：

```zsh
# 设置列数为 9  
defaults write com.apple.dock springboard-columns -int 9  

# 设置行数为 6  
defaults write com.apple.dock springboard-rows -int 6  

# 重启 Dock 生效  
killall Dock
```

![启动台](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005905.png)

恢复默认启动台：

```zsh
# 恢复默认的列数和行数  
defaults write com.apple.dock springboard-rows Default  
defaults write com.apple.dock springboard-columns Default  

# 重启 Dock 生效  
killall Dock
```

### 鼠标滚动方向

个人习惯了 Win 的方式，把自然的选项去掉

![鼠标滚动方向](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005906.png)

### 程序坞

- 默认的 Dock 栏效果：
	- 呆呆傻傻，没有动画，显示最近使用的应用程序（关掉了还会占位置）
	- ![默认的程序坞](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005907.png)
	- 可以先记住恢复默认 Dock 的命令：`defaults delete com.apple.dock; killall Dock`
- 系统设置-程序坞与菜单栏，设置图标大小和动画（长按拖动分割线可以快速调整图标大小、按住 shift 键长按分割线上下左右拖动快速调整位于屏幕上的位置、右键分割线可以快速设置隐藏等）
	- ![分割线](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005908.png)
	- ![程序坞与菜单栏](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005909.png)
- 添加和删除图标：
	- 添加需要的图标：拖动应用/文件夹到程序坞进行添加（文件夹可以放到分割线右侧），或者右击正在运行的应用图标，在选项中选择在程序坞保留
	- 去除无用的图标：不需要的时候长按图标往上拖，出现移除时之后松手就能删除，或者右键需要删除的图标选择从程序坞中移除
- 添加空白占位图标，右键选择从程序坞中移除可以删掉

```zsh
# 添加空白图标
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# 重启 Dock 生效
killall Dock
```

![添加空白分割](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005910.png)

- 按住 Alt 键再右击应用图标可以强制退出应用程序

### 菜单栏

- 按住 Command 键拖动图标可以移动图标在菜单栏中的位置
- 系统设置里可以设置是否在菜单栏显示，一般在底部

	- ![蓝牙设置](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005911.png)

- 后面软件部分推荐一款可以点击隐藏图标的应用

### 访达

- 菜单栏-访达-偏好设置（大部分 app 的首选项设置快捷键都是 Command + ,）

	- ![偏好设置](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005912.jpeg)

	- 边栏大小设置在系统设置-通用中
- 工具栏设置，右击工具栏选择自定工具栏，根据自己喜好添加删除排序

	- ![工具栏](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005913.png)
- 显示，菜单栏-显示

	- ![显示](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005914.jpeg)
- 常用操作：

	- 排序：空白处右键-排序方式-名称/时间/大小

	- 放大/缩小文件图标：<kbd>Command</kbd> + <kbd>+</kbd>/<kbd>-</kbd>

	- 返回上一层：<kbd>Command</kbd> + <kbd>↑</kbd>，下键为下一层

	- 列表视图下，<kbd>option</kbd> + <kbd>↑</kbd>/<kbd>↓</kbd>，快速到达第一个/最后一个文件

	- 按住 <kbd>option</kbd> 键，拖动访达窗口大小，下次打开大小仍保留

	- 空格键快速查看文件

## 软件推荐

推荐到软件官网下载或者到 [MacWk](https://www.macwk.com/) 下载

[精品MAC应用分享 (xclient.info)](https://xclient.info/)

### 菜单栏增强——iStat Menus/iStatistica、Bartender/Dozer

前两者是可以在菜单栏显示系统状态

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211272019218.png)

后两者个人仅用于解决状态栏图标过多的问题（隐藏不需要的图标）

如果你和我一样只需要隐藏图标的话可以只使用 Dozer，安装之后简单设置就可以使用：
- 首先点击这个圆点
- 然后按住 <kbd>Command</kbd> 键同时拖动状态栏的图标移动到两个点的左边
- 再次点击圆点就可以隐藏两个圆点左边的图标了
- 最主要的是显示隐藏图标的时候只会显示 Dozer 的名字，状态栏基本可以看到所有的图标了

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211272024131.png)

演示：

![](https://cdn.wallleap.cn/img/pic/illustrtion/202211272155291.gif)






[KeyCastr替代品和类似软件 — Altapps.net](https://zh.altapps.net/soft/keycastr)




## 参考文章

<https://www.sqlsec.com/2019/12/macos.html>
