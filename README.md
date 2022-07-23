# 使用容器（Paas）搭建青龙面板

因找了一圈自己的服务器，没有一台适合的，就想到使用免费容器（Paas）来搭建，加上搭建完后省事，不用因为机器的原因而重新搭建，结果我在网上找了一圈，就是没有这样的教程，那我就只好自己琢磨一个出来了。

方便一键安装在 Railway 、Fly.io 这两个容器上  
缺点是在容器重建时，数据会丢失

## 1. 使用 Railway 部署

点击以下按钮直接部署使用即可

[![Deploy on Railway](https://www.railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/Originat/qinglong-paas)

## 2. 使用 [fly.io](https://fly.io) 部署（免费版并不能完整部署）

> 注册fly.io需要绑定银行卡，支持银联借记卡。同时使用fly.io主要通过命令行工具flyctl，详情到[fly.io](https://fly.io)官网了解。

下载仓库源代码，修改 `fly.toml` 中的app为自己创建的名字。在终端使用 `flyctl deploy` 部署即可。

`因为Fly.io免费版是全时运行 3 个具有 256MB RAM 的共享 cpu-1x VM，单独一个都低于青龙面板所需的内存，需要添加256MB RAM才能完整运行，而添加则需要加钱。`
