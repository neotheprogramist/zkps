#!/bin/bash

git clone --depth=1 -b v2.7.1 https://github.com/starkware-libs/cairo.git starkware-libs-cairo && \
    mv starkware-libs-cairo/corelib/ . && \
    rm -rf starkware-libs-cairo
