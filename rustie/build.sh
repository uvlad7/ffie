#!/usr/bin/env bash
# cbindgen
cargo build --release && cp target/release/*.so .
