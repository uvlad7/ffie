#!/usr/bin/env bash
valac --pkg posix --library=gvallie --gir gvallie-0.1.gir -H gvallie.h gvallie.vala -X -fPIC -X -shared -o libgvallie.so && g-ir-compiler --shared-library=$(realpath libgvallie.so) --output=gvallie-0.1.typelib gvallie-0.1.gir
