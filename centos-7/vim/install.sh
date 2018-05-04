#!/bin/bash

current_dir=`pwd`
yum install -y vim
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
if [ -f ~/.vim/vimrc ]; then
    mv ~/.vim/vimrc ~/.vim/vimrc.bak
fi
cp vimrc_plugins ~/.vim/vimrc
yum install -y git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Waiting for vim vundle plugins processed..."
vim +PluginInstall +qa

cd ${current_dir}
rm -rf ~/.vim/vimrc
cp vimrc ~/.vim/vimrc
