#!/usr/bin/env bash
# swift package resolve && swiftc Sources/swiftie/swiftie.swift -emit-module -emit-library
# swift package resolve && swiftc Sources/swiftie/swiftie.swift -emit-library
swift build && cp .build/debug/libswiftie.so .