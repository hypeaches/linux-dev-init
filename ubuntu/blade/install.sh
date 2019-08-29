#!/bin/bash

user_bin_src=$HOME/.bin/src/
user_bin=$HOME/.bin/bin

if [ ! -d $user_bin_src ]
then
	mkdir -p $user_bin_src
fi
cd $user_bin_src

git clone https://github.com/chen3feng/blade-build.git
cd blade-build
sed -i 's/benchmark/# benchmark/' blade.conf
sed -i 's/extra_incs/# extra_incs/' blade.conf

if [ ! -d $user_bin ]
then
	mkdir -p $user_bin
fi
ln -s $user_bin_src/blade-build/blade $user_bin/blade

apt-get install -y python scons
