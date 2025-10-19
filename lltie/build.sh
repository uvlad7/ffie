#!/usr/bin/env bash
llc-17 -filetype=obj -relocation-model=pic -O3 -o lltie.o lltie.ll && \
    clang-17 -shared -o liblltie.so lltie.o && rm lltie.o
