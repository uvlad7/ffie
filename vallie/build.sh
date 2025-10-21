#!/usr/bin/env bash
valac --pkg posix --library=vallie -H vallie.h vallie.vala -X -fPIC -X -shared -o libvallie.so
# valac --pkg posix --library=vallie --gir vallie-0.1.gir -H vallie.h vallie.vala -X -fPIC -X -shared -o libvallie.so && g-ir-compiler --shared-library=libvallie.so --output=vallie-0.1.typelib vallie-0.1.gir
