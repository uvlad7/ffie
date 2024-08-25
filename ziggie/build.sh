#!/usr/bin/env bash
zig build --prefix . --prefix-lib-dir . --release=safe -Doptimize=ReleaseSafe
