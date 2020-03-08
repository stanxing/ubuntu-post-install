# ubuntu-post-install

##　介绍

工作中一直使用 ubuntu 作为开发机器，本脚本支持 ubuntu 18.04 在安装成功后一键搭建开发环境，目前包括以下几类软件：

- 必备软件：curl, wget, git, openvpn 等

- 最好用的 shell 环境： oh-my-zsh， 以及必装的两个插件（zsh-autosuggestions， zsh-syntax-highlighting）

- 开发语言环境：gvm(golang), nvm(nodejs) 

- 开发工具：vscode， chrome, docker 等

- 科学上网安装包：Trojan-Qt5

- 清理不必要的软件

本项目包含两个目录和一个 `ubuntu-post-install.sh` 启动脚本，结构简单明了：
- functions 下的脚本都会按照顺序执行， 如果某个脚本报错会使得整个脚本退出，方便定位错误原因，整个脚本可以重复执行。
- files 下存放一些文件可能供脚本操作，比如 .gitconfig 等。

## 使用

- 为了避免频繁输入 sudo 的密码，请在 shell 中执行 `echo "$USER ALL=(ALL) NOPASSWD:ALL"` 命令，并将打印的结果写入到 /etc/sudoers 中(需要使用 `sudo visudo` 命令)，当然如果很在意权限问题当我没说。

- 最好先安装 oh-my-zsh，安装完成后重新登录桌面以使得 zsh 配置生效，然后跑脚本即可（不会重复安装）。直接跑脚本可能会有些环境变量设置的有问题。完全安装成功后还需要再次重新登录，因为 docker 需要重新登录使得 no sudo 配置生效。

- 按照下面命令执行脚本

    ```shell
    git clone git@github.com:stanxing/ubuntu-post-install.git
    cd ubuntu-post-install
    ./ubuntu-post-install.sh
    ```
