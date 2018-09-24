#!/bin/bash

current_dir=`pwd`
apt-get install -y vim
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
apt-get install -y git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Waiting for vim vundle plugins processed..."
vim +PluginInstall +qa

# Compile ycm
apt-get install -y build-essential cmake
apt-get install -y python-dev python3-dev
apt-get install -y golang-go
cd ~/.vim/bundle/YouCompleteMe
# C#         support: install Mono and add --cs-completer when calling ./install.py.
# Go         support: install Go and add --go-completer when calling ./install.py.
# TypeScript support: install Node.js and npm then install the TypeScript SDK with npm install -g typescript.
# JavaScript support: install Node.js and npm and add --js-completer when calling ./install.py.
# Rust       support: install Rust and add --rust-completer when calling ./install.py.
# To simply compile with everything enabled, there's a --all flag. So, to install with all        language features, ensure xbuild, g    o, tsserver, node, npm, rustc, and cargo tools are         installed and in your PATH, then simply run:# cd ~/.vim/bundle/YouCompleteMe
# ./install.py --all
./install.py --clang-completer --go-completer

cd ${current_dir}
rm -rf ~/.vim/vimrc
cp vimrc ~/.vim/vimrc
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~
