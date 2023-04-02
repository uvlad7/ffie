#!/usr/bin/env bash
# I haven't found a better solution
cabal build && cp $(find ./dist*/  -name 'libhaskie.so' -print -quit) .
