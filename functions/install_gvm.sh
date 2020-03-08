#!/bin/bash -e

install_gvm() {
    # https://github.com/moovweb/gvm
    if [[ -d "$HOME/.gvm" ]]; then
        echo "Gvm already exists."
        return
    fi
    sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
}

# 需要挂代理
install_go() {
    source ~/.gvm/scripts/gvm
    gvm install go1.4 -B
    gvm use go1.4
    echo $GOROOT
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.13.4
    gvm use go1.13.4 --default
    go env -w GO111MODULE=auto
    go env -w GOPROXY=https://goproxy.cn,direct
}

install_gvm
install_go
