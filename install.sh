#!/usr/bin/env bash


is_install() {
    ret=""
    if command -v $1 >/dev/null; then
        echo >&2 "$1 is installed, continue..."
        ret="true"
    else
        ret="false"
    fi
    echo $ret
}

install_homebrew() {
    if [ "$( is_install brew )" == "false" ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    fi
}

install_jq() {
    if [ "$( is_install jq )" == "false" ]; then
        brew install jq;
    fi
}

install_zsh() {
    if [ "$( is_install zsh )" == "false" ]; then
        brew install zsh;
        curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh;
    fi
}

install_cocoapods() {
    if [ "$( is_install pod )" == "false" ]; then
        sudo gem install -n /usr/local/bin cocoapods;
        pod setup;
        sudo gem update --system;
    fi
}

load_config() {
    module=$( cat config.json | jq ".mac" )
    echo $module
    for m in $module 
    do
        if [ "$m" == "zsh" ]; then
            install_zsh;
        elif [ "$m" == "cocoapods" ]; then
            install_cocoapods;
        fi
    done
}

install_homebrew;
install_jq;
load_config;