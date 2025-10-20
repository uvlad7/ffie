#!/usr/bin/env bash
valac --pkg posix --library=vallie -H vallie.h vallie.vala -X -fPIC -X -shared -o libvallie.so
