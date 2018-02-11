#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os, sys
import json
from enum import Enum
import subprocess

class Category(Enum):
    mac = "mac"
    git = "git"
    zsh = "zsh"

class Type(Enum):
    theme   = "theme"
    alias   = "alias"
    modules = "modules"

class Loader:
    def __init__(self, file):
        self.file = file
        self.category = ""
        self.type = ""

    def load(self):
        with open(self.file, 'r') as f:
            for line in f.readlines():
                if self.update_category_ifneed(line):
                    continue
                elif self.update_type_ifneed(line):
                    continue
                else:
                    self.install_config(line)
                print("category: " + self.category + ", type: " + self.type + ", " + line)
    
    def update_category_ifneed(self, line):
        r = False
        for c in Category:
            name = c.value
            if "[[" + name + "]]" in line:
                self.category = name
                r = True
        return r

    def update_type_ifneed(self, line):
        r = False
        for t in Type:
            name = t.value
            if "[" + name + "]" in line:
                self.type = name
                r = True
        return r
    
    def install_config(self, line): 
        if self.category == Category.mac:
            self.install_mac_config(line)
        elif self.category == Category.git:
            self.install_git_config(line)
        elif self.category == Category.zsh:
            self.install_zsh_config(line)

    def install_mac_config(self, line):
        return
    def install_git_config(self, line):
        return
    def install_zsh_config(self, line):
        return


if __name__ == '__main__':
    loader = Loader(sys.argv[1])
    loader.load()
