#!/usr/bin/env bash
# nimble c -d:release --app:lib --noMain --mm:orc \
# --passC:"'-Wl,-init,init_nim -Wl,-fini,exit_nim'" \
# --passL:"'-Wl,-init,init_nim -Wl,-fini,exit_nim'" \
# src/nimmie.nim
nimble c -d:release --app:lib --noMain --mm:orc src/nimmie.nim && cp src/libnimmie.so .

# https://forum.nim-lang.org/t/9366
# https://forum.nim-lang.org/t/10520
# https://github.com/nim-lang/RFCs/issues/538#issuecomment-1774233504

# https://forum.nim-lang.org/t/2821 - compile to C
# nim c -c --nimcache=nimcache -d:release --app:lib  --noMain --mm:orc src/nimmie.nim
