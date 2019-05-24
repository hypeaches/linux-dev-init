#!/bin/bash

user_bin_src=$HOME/bin/src/

if [ ! -d $user_bin_src ]
then
	mkdir -p $user_bin_src
fi
cd $user_bin_src

git clone https://github.com/chen3feng/blade-build.git
cd blade-build
./install
sed -i 's/benchmark/# benchmark/' blade.conf
sed -i 's/extra_incs/# extra_incs/' blade.conf

apt-get install -y python scons
