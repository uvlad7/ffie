#!/usr/bin/env bash
# `gyro build` is broken
gyro fetch && zig build
# zig build-lib -dynamic --name ziggie src/main.zig
