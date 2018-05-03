#!/bin/bash

yum install -y git zsh

if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
fi
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
cp zshrc ~/.zshrc
chsh -s /bin/zsh
