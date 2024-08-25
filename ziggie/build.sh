#!/usr/bin/env bash
# `gyro build` is broken
gyro fetch && zig build -Drelease-safe=true
# zig build-lib -dynamic --name ziggie src/main.zig
