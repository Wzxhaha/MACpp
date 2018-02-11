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

install_python3() {
    if [ "$( is_install python3 )" == "false" ]; then
        brew install python3;
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

cmd=$1

if [ "$cmd"x == "homebrew"x ]; then
    install_homebrew;
elif [ "$cmd"x == "python3"x ]; then
    install_python3;
elif [ "$cmd"x == "zsh"x ]; then
    install_zsh;
elif [ "$cmd"x == "cocoapods"x ]; then
    install_cocoapods;
fi

