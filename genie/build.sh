#!/usr/bin/env bash
valac --pkg posix --library=genie -H genie.h genie.gs -X -fPIC -X -shared -o libgenie.so
