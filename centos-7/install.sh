#!/bin/bash

install_dir_array=(
    dev
    docker
    vim
    zsh
)

apt-get update
install_root_dir=`pwd`
for install_dir in ${install_dir_array[@]}
do
    cd $install_dir
    echo "=====installing ${install_dir}====="
    ./install.sh
    cd $install_root_dir
    echo "installed:${install_dir}" >> log
done
