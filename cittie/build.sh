#!/usr/bin/env bash
cmake -S . -B ./build/release -D CMAKE_BUILD_TYPE=Release && cmake --build ./build/release --target cittie -j 1 && cp ./build/release/*.so .
