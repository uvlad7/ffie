#!/usr/bin/env bash
shards install && crystal build --release src/crystie.cr --single-module --link-flags="-shared -Wl,-init,init_crystal -Wl,-fini,exit_crystal" -o libcrystie.so
