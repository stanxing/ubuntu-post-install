#!/bin/bash -e

must_install() {
    sudo apt update
    sudo apt install git curl wget apt-transport-https vim net-tools openvpn network-manager-openvpn -y
}

must_install
