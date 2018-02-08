#!/usr/bin/env bash

install_homebrew() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
}

install_zsh() {
    brew install zsh;
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh;
}

install_cocoapods() {
    sudo gem install -n /usr/local/bin cocoapods;
    pod setup;
    sudo gem update --system;
}

load_config() {

}

load_config;