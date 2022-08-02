# 使用容器（Paas）搭建青龙面板

因找了一圈自己的服务器，没有一台适合的，就想到使用容器（Paas）来搭建，加上搭建完后省事，不用因为机器的原因而重新搭建，进而自己琢磨了一个出来。

方便一键安装在 Railway 、Fly.io 这两个容器上  
缺点是在容器重建时，数据会丢失  
使用Railway不能直接使用SSH连接（理论上可以使用内网穿透，但是试了好久，只成功连接过一次），进而不能安装傻妞的机器人等服务  
使用fly.io是可以直接打开SSH来实现管理的

## 1. 使用 Railway 部署

[注册 Railway](https://railway.app/?referralCode=Xh3DQG)

点击以下按钮直接部署，然后在 `Variables` 添加关键字`PORT`，值为`5700`

[![Deploy on Railway](https://www.railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/Originat/qinglong-paas)

## 2. 使用 [fly.io](https://fly.io) 部署

> 注册fly.io需要绑定银行卡，支持银联借记卡。同时使用fly.io主要通过命令行工具flyctl，详情到[fly.io](https://fly.io)官网了解。

下载仓库源代码，修改 `fly.toml` 中的app为自己创建的名字。在终端使用 `flyctl deploy` 部署即可。

`因为Fly.io免费版是全时运行 3 个具有 256MB RAM 的共享 cpu-1x VM，单独一个都低于青龙面板所需的内存，需要添加256MB RAM才能完整运行，而添加则需要加钱。但是 5 美元以下是不收取费用的，所以可以添加 256MB RAM 来完整部署青龙面板`

## 3. 使用 Divio 搭建

>该容器的免费计划中，项目在不活动 30 分钟后会睡眠

该容器分为 `TEST` 和 `LIVE` 两部分，我们直接部署在 `LIVE` 中

1. Fork [qinglong-paas](https://github.com/Originat/qinglong-paas) 项目
2. [注册Divio](https://www.divio.com/)
3. 创建新的应用，在 `NAME` 中填写应用名字，在后面会检测应用名字的重复性
4. 选择仓库时，选 `CUSTOM`
5. 在自己的Fork项目的下复制 `SSH` 链接
6. 在第4步中选 `CUSTOM` 后的弹框中，把复制的 `SSH` 链接粘贴到 `REPOSITORY URL` 中,然后复制密钥
7. 把复制的密钥粘贴到Fork项目中，Settings -> Deploy keys -> Add deploy key ，名字随意
8. 回到Divio中，点击`CONTINUE`
9. 进入新建的Divio项目中，在 `LIVE` 中的 `Env Variables` 添加关键字`PORT`，值为`5700`
10. 在应用中回到Environments，在 `LIVE` 中点击 `DEPLOY`，出现 `succeeded`后，表示部署完成，点击 `ENV URL` 就可以打开网站了
