#!/bin/bash -e

install_vscode() {
    if which code &> /dev/null; then
        echo "The vscode already exists."
        return
    fi
    # https://code.visualstudio.com/docs/setup/linux
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
    sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt-get install code -y
    echo "Completed to install vscode"
}

install_vscode