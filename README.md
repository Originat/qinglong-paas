# 使用容器（Paas）搭建青龙面板

因找了一圈自己的服务器，没有一台适合的，就想到使用容器（Paas）来搭建，加上搭建完后省事，不用因为机器的原因而重新搭建，进而自己琢磨了一个出来。

方便一键安装在 Railway 、Fly.io 这两个容器上  
缺点是在容器重建时，数据会丢失  
使用Railway不能直接使用SSH连接（理论上可以使用内网穿透，但是试了好久，只成功连接过一次），进而不能安装傻妞的机器人等服务  
使用fly.io是可以直接打开SSH来实现管理的

## 1. 使用 Railway 部署

点击以下按钮直接部署使用即可

[![Deploy on Railway](https://www.railway.app/button.svg)](https://railway.app/?referralCode=Xh3DQG/new/template?template=https://github.com/Originat/qinglong-paas)

## 2. 使用 [fly.io](https://fly.io) 部署（免费版并不能完整部署）

> 注册fly.io需要绑定银行卡，支持银联借记卡。同时使用fly.io主要通过命令行工具flyctl，详情到[fly.io](https://fly.io)官网了解。

下载仓库源代码，修改 `fly.toml` 中的app为自己创建的名字。在终端使用 `flyctl deploy` 部署即可。

`因为Fly.io免费版是全时运行 3 个具有 256MB RAM 的共享 cpu-1x VM，单独一个都低于青龙面板所需的内存，需要添加256MB RAM才能完整运行，而添加则需要加钱。`
