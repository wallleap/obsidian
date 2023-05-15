---
title: WebPack
date: 2023-05-15 09:30
updated: 2023-05-15 09:51
cover: //cdn.wallleap.cn/img/post/1.jpg
image-auto-upload: true
author: Luwang
comments: true
aliases:
  - WebPack
rating: 1
tags:
  - web
category: web
keywords:
  - 关键词1
  - 关键词2
  - 关键词3
description: 文章描述
source: null
url: //myblog.wallleap.cn/post/1
---

模块化之后，前端面临一个更大的问题——用户要下载太多文件，由此需要通过前端自动化来解决这个问题

![文件太多](https://cdn.wallleap.cn/img/pic/illustration/202305150932230.png)

## 文件太多怎么办

**前端自动化（借助 Node.js）**

- Concat - 拼接，把所有文件拼接成一个大文件
- Minify - 压缩，删除注释、空白、分号等以减小代码体积
- Uglify - 混淆，把局部变量 username 改为 a 以减小代码体积
- Treeshaking - 摇树，不打包没用到的导出变量
- Code Split - 分割，让可以推后加载的文件单独下载以加快首屏渲染

或者**优化网络**、让后端将 HTTP/1.1 升级为 **HTTP/2**、让用户将**浏览器升级到最新**

## 如何实现自动化

选择有很多：

- Browserify（已过时）
- Webpack（市场占有率高）
- Rollup（现在流行）
- Vite（很受欢迎）
- Parcel（零配置）
- create-react-app（老旧）
- `@vue/cli` （Vue 上个时代的自动化工具）

之后将以 Webpack 为例，来入门前端工程化

## 为什么选 Webpack

- 功能强大
	- 几乎满足了前端各种变态的要求
- 使用广泛
	- 大中小型公司都在用
- 生态繁荣
	- Webpack 周边插件应有尽有
- 缺点
	- 配置复杂，需要熟悉英文
	- 运行速度慢，需要多等待
	- 质量参差不齐，有很多坑

## 查看 Webpack 文档

<https://webpack.js.org/>

- 版本选择
	- 不同版本功能可能不同
- 安装
	- 全局安装
	- 局部安装 + scripts/npx
- Cli
	- 命令行的使用
- 概念
	- Entry、Output、Loader、Plugin、Mode
- 文档的作用
	- 先通看一遍，然后用的时候搜索关键词

## 初始化一个 Webpack 项目

事先下载好 NVM，并通过 NVM 下载好 Node18（最新偶数版本）

下载好 pnpm

开始创建一个 Webpack 项目

```sh
mkdir webpack-demo-001
cd webpack-demo-001
pnpm init
pnpm config set save-prefix=""
pnpm install webpack webpack-cli -D
```

如何运行 webpack

```sh
npx webpack
./node_modules/.bin/webpack
```

init 的时候会创建 `package.json`，安装好插件之后 `devDependencies` 开发依赖中会默认加上

```json
{
  "name": "my-webpack-001",
  "version": "0.0.1",
  "description": "My webpack project",
-  "main": "src/index.js",
+  "private": true
  "scripts": {
    "build": "webpack",
    "test": "echo \"Error: no test specified\" && exit 1",
    "preview": "http-server -c -1 ./"
  },
  "keywords": [],
  "author": "luwang",
  "license": "ISC",
  "devDependencies": {
    "http-server": "14.1.1",
    "webpack": "5.82.1",
    "webpack-cli": "5.1.1"
  }
}
```

可以在 `"scripts"` 中加上 `"build": "webpack"`，这样运行 `pnpm run build` 的时候会自动找到 webpack 的位置，并运行

## 创建 Webpack 配置文件

在根目录下创建  `webpack.config.js` 文件

```js
const path = require('path')
module.exports = {
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js',
  }
}
```

CommonJS  的语法，暴露了一个对象

配置了入口 entry 和 出口 output，入口默认是 `src/index.js`，出口路径使用到了 NodeJS 的 `path` 变量，需要导入（默认出口为 `dist/main.js`）

配置好之后，在 `src/index.js` 中随便写点内容，然后执行 `pnpm run build`

```sh
> my-webpack-001@0.0.1 build /Users/luwang/Workspace/code/my-webpack-001
> webpack

asset bundle.js 29 bytes [emitted] [minimized] (name: main)
./src/index.js 28 bytes [built] [code generated]

WARNING in configuration
The 'mode' option has not been set, webpack will fallback to 'production' for this value.
Set 'mode' option to 'development' or 'production' to enable defaults for each environment.
You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/configuration/mode/

webpack 5.82.1 compiled with 1 warning in 115 ms
```

有个警告，可以加上 `mode` 选项，值可以为 `development` 或 `production`

```sh
npx webpack --mode production
./node_modules/.bin/webpack --mode production
# 多一个 -- 代表是里面的配置
pnpm run build -- --mode production
# 或者直接在 package.json 的配置项里加好 "build": "webpack --mode production"
pnpm run build
```

或者到配置文件 `webpack.config.js` 中配置

```js
module.exports = {
  mode: 'production'
}
```

这样也只用运行 `pnpm run build` 就可以了

- production 尽量优化、压缩、混淆
- development 尽量方便开发、调试