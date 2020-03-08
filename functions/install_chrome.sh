#!/bin/bash -e

install_chrome() {
    if which google-chrome &> /dev/null; then
        echo "Chrome already exists."
        return
    fi
    # sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt update
    sudo apt install google-chrome-stable -y
    echo "Completed to install chrome."
}

install_chrome