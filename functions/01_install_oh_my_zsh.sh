#!/bin/bash -e

install_oh_my_zsh () {
    if which zsh &> /dev/null; then
        echo "Zsh already exists."
    fi
    # install zsh
    sudo apt update && sudo apt install zsh -y
    basePath="${HOME}/.oh-my-zsh"
    customPath="${basePath}/custom"
    # refer to: https://ohmyz.sh/
    if [[ -d "${basePath}" ]]; then
        echo "oh-my-zsh already exists."
        return
    fi
    echo "y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # install zsh-autosuggestions
    if [[ ! -d "${customPath}/plugins/zsh-autosuggestions" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    # install zsh-syntax-highlighting
    if [[ ! -d "${customPath}/plugins/zsh-syntax-highlighting" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
    # install spaceship-prompt
    if [[ ! -d "${customPath}/themes/spaceship-prompt" ]]; then
        git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
        ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
    fi
    # set plugins=(zsh-autosuggestions zsh-syntax-highlighting) in ~/.zshrc
    # set ZSH_THEME="spaceship" in ~/.zshrc
    sed -i '/^ZSH_THEME/c ZSH_THEME="spaceship"' ~/.zshrc
    sed -i '/^plugins=/c plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc
    echo "Completed to set zsh, please login out and login in again."
}

install_oh_my_zsh