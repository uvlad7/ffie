#!/usr/bin/env bash
# julia -q --project -e 'using Pkg; Pkg.add("PackageCompiler")'
julia -q --project -e 'using Pkg; Pkg.activate("."); Pkg.instantiate();
using PackageCompiler;
create_library(".", "target";
                      lib_name="libjulitie",
                      filter_stdlibs=true,
                      header_files = ["./src/julitie.h"],
                      force=true);
exit()' \
&& rm -rf julia/ libjulia.so* libjulitie.so \
&& mv target/lib/julia/ target/lib/libjulia.so* target/lib/libjulitie.so .
# cp -R target/lib/* . # causes crash