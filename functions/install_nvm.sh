#!/bin/bash -e

# https://github.com/nvm-sh/nvm#installing-and-updating
install_nvm() {
    if [[ -d "$HOME/.nvm" ]]; then
        return
    fi
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh
}

install_node() {
    zsh -c "source $HOME/.zshrc && nvm install v8.17.0"
}

install_nvm
install_node