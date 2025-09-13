#!/usr/bin/env bash
llc -filetype=obj -relocation-model=pic -O3 -o lltie.o lltie.ll && \
    clang -shared -o liblltie.so lltie.o && rm lltie.o
# clang -S -emit-llvm library.c
# to produce library.ll
# https://stackoverflow.com/a/9149406
# https://borretti.me/article/compiling-llvm-ir-binary
# https://llvm.org/docs/GettingStarted.html
# clang -O3 -emit-llvm hello.c -c -o hello.bc
# https://llvm.org/doxygen/IR_2Module_8h.html
# https://llvm.org/doxygen/classllvm_1_1orc_1_1LLJIT.html
# https://llvm.org/doxygen/classllvm_1_1BitcodeModule.html
