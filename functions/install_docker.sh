#!/bin/bash -e

# 安装 docker-ce 和 docker-compose
# https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/
install_docker() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get update
    sudo apt-get install docker-ce -y
}

# https://docs.docker.com/install/linux/linux-postinstall/
# 需要 log out 使得配置生效
set_no_sudo_and_start_on_boot() {
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
}

install_docker_compose() {
    # 从 github 安装可能不太稳定
    # sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    # sudo chmod +x /usr/local/bin/docker-compose
    # https://get.daocloud.io/
    sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}


main() {
    if which docker &> /dev/null; then
        echo "Docker already exists."
    else
        install_docker
        set_no_sudo_and_start_on_boot
        echo "Completed to install docker, please login out to make configuration effective."
    fi
    if which docker-compose &> /dev/null; then
        echo "Docker compose already exists."
    else
        install_docker_compose
        echo "Completed to install docker-compose."
    fi
}

main