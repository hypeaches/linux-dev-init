#!/bin/bash

install_root_dir=`pwd`
src_dir=${install_root_dir}/src

yum install gcc gcc-c++ make -y

# Set vundle here
yum install vim -y
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
if [ -f ~/.vim/vimrc ]; then
    mv ~/.vim/vimrc ~/.vim/vimrc.bak
fi
cp ${src_dir}/vimrc_plugins ~/.vim/vimrc
yum install git -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Waiting for vim vundle plugins processed..."
vim +PluginInstall +qa

# Compile ycm
yum install cmake -y
yum install python -y
yum install golang -y
cd ~/.vim/bundle/YouCompleteMe
# C#         support: install Mono and add --cs-completer when calling ./install.py.
# Go         support: install Go and add --go-completer when calling ./install.py.
# TypeScript support: install Node.js and npm then install the TypeScript SDK with npm install -g typescript.
# JavaScript support: install Node.js and npm and add --js-completer when calling ./install.py.
# Rust       support: install Rust and add --rust-completer when calling ./install.py.
# To simply compile with everything enabled, there's a --all flag. So, to install with all language features, ensure xbuild, g    o, tsserver, node, npm, rustc, and cargo tools are installed and in your PATH, then simply run:
# cd ~/.vim/bundle/YouCompleteMe
# ./install.py --all
./install.py --clang-completer --go-completer
cd $install_root_dir

# This must be the last
cp ${src_dir}/vimrc ~/.vim/vimrc
