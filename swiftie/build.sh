#!/usr/bin/env bash
# swift package resolve && swiftc Sources/swiftie/swiftie.swift -emit-module -emit-library
# swift package resolve && swiftc Sources/swiftie/swiftie.swift -emit-library -emit-objc-header-path swiftie.h
# swiftc -emit-library -emit-module-interface [...] source.swift
swift build -c release && cp .build/debug/libswiftie.so .
