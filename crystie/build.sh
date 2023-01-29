#!/usr/bin/env bash
shards install && crystal build --release src/crystie.cr --single-module --link-flags="-shared" -o libcrystie.so
