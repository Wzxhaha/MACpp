#!/usr/bin/env bash

load_config() {
    python3 "load.py" $1;
}

bash install.sh homebrew
bash install.sh python3;
load_config "config";