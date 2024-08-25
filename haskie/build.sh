#!/usr/bin/env bash
# I haven't found a better solution
cabal build --enable-optimization=2 && cp $(find ./dist*/  -name 'libhaskie.so' -print -quit) .
