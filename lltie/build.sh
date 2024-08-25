#!/usr/bin/env bash
llc -filetype=obj -relocation-model=pic -O2 -o lltie.o lltie.ll && \
    clang -shared -o liblltie.so lltie.o && rm lltie.o
