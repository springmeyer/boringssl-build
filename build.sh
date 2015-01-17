#!/usr/bin/env bash

set -e -u
set -o pipefail

if [[ ! -d src ]]; then
    git clone https://boringssl.googlesource.com/boringssl src
fi

if [[ ! -d gyp ]]; then
    git clone --depth 1 https://chromium.googlesource.com/external/gyp.git
fi

if [[ ! -f boringssl.tar.gz ]]; then
    wget https://chromium.googlesource.com/experimental/chromium/src/+archive/master/third_party/boringssl.tar.gz
    tar xvf boringssl.tar.gz
fi

python update_gypi_and_asm.py

./gyp/gyp boringssl.gyp --depth=. --generator-output=./build --format=make -Dcomponent=static_library -Dtarget_arch=x64
make V=1 -j8 -C build

