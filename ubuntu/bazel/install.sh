#!/bin/bash

install_sh_file=bazel-0.26.0-installer-linux-x86_64.sh
apt-get install -y pkg-config zip g++ zlib1g-dev unzip python wget
#wget https://github.com/bazelbuild/bazel/releases/download/0.26.0/$install_sh_file
chmod +x $install_sh_file
./$install_sh_file --user
