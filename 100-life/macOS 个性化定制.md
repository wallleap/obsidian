---
title: macOS个性化定制
date: 2022-10-08
---
六年 macOS 使用经验，推荐好用的软件和一些配置，并提供资源备份

## 系统设置

### 允许安装任意来源的 APP
```zsh
sudo spctl --master-disable
```

![允许任何来源](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005904.png)

### 安装 Xcode Command Line Tools

完整的 Xcode 占用空间太大，而且也不一定使用，Command Line Tools 是在 Xcode 中的一款工具，macOS 下不少开发工具都会依赖这个，手动安装一下，后面安装其他工具可以省下不少麻烦：

```zsh
xcode-select --install
```

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

-   默认的 Dock 栏效果：
    
    -   呆呆傻傻，没有动画，显示最近使用的应用程序（关掉了还会占位置）
    -   ![默认的程序坞](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005907.png)
    -   恢复默认 Dock 的命令：`defaults delete com.apple.dock; killall Dock`
-   系统设置-程序坞与菜单栏，设置图标大小和动画（长按拖动分割线可以快速调整图标大小、按住 shift 键长按分割线上下左右拖动快速调整位于屏幕上的位置、右键分割线可以快速设置隐藏等）
    -   ![分割线](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005908.png)
    -   ![程序坞与菜单栏](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005909.png)
-   添加和删除图标：
    -   添加需要的图标：拖动应用/文件夹到程序坞进行添加（文件夹可以放到分割线右侧），或者右击正在运行的应用图标，在选项中选择在程序坞保留
    -   去除无用的图标：不需要的时候长按图标往上拖，出现移除时之后松手就能删除，或者右键需要删除的图标选择从程序坞中移除
-   添加空白占位图标，右键选择从程序坞中移除可以删掉
```zsh
# 添加空白图标
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# 重启 Dock 生效
killall Dock
```
![添加空白分割](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005910.png)

-   按住 Alt 键再右击应用图标可以强制退出应用程序
    

### 菜单栏

-   按住 Command 键拖动图标可以移动图标在菜单栏中的位置
    
-   系统设置里可以设置是否在菜单栏显示，一般在底部
    
    -   ![蓝牙设置](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005911.png)
        
-   后面软件部分推荐一款可以点击隐藏图标的应用
    

### 访达

-   菜单栏-访达-偏好设置（快捷键是 Command + ,）
    
    -   ![偏好设置](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005912.jpeg)
        
    -   边栏大小设置在系统设置-通用中
        
-   工具栏设置，右击工具栏选择自定工具栏，根据自己喜好添加删除排序
    
    -   ![工具栏](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005913.png)
        
-   显示，菜单栏-显示
    
    -   ![显示](https://cdn.wallleap.cn/img/pic/illustrtion/20221009005914.jpeg)
        
-   常用操作：
    
    -   排序：空白处右键-排序方式-名称/时间/大小
        
    -   放大/缩小文件图标：<kbd>Command</kbd> + <kbd>+</kbd>/<kbd>-</kbd>
        
    -   返回上一层：<kbd>Command</kbd> + <kbd>↑</kbd>，下键为下一层
        
    -   列表视图下，<kbd>option</kbd> + <kbd>↑</kbd>/<kbd>↓</kbd>，快速到达第一个/最后一个文件
        
    -   按住 <kbd>option</kbd> 键，拖动访达窗口大小，下次打开大小仍保留
        
    -   空格键快速查看文件
        

## 软件推荐

推荐到软件官网下载或者到 [MacWk](https://www.macwk.com/) 下载

### 菜单栏增强——iStat Menus/iStatistica、Bartender/Dozer



## 参考文章

[https://www.sqlsec.com/2019/12/macos.html](https://www.sqlsec.com/2019/12/macos.html)