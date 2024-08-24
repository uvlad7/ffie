# using Pkg; Pkg.add("PackageCompiler")
using Pkg;
Pkg.activate(".");
Pkg.instantiate();
using PackageCompiler;

create_library(".", "target";
                      lib_name="libjulitie",
                    #   filter_stdlibs=true,
                      header_files = ["./src/julitie.h"],
                      julia_init_c_file = ["./src/julia_init.c"],
                      julia_init_h_file = ["./src/julia_init.h"],
                      incremental=true,
                      force=true);
exit()
