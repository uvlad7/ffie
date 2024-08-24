sofiles = libjulia.so libjulia.so.1.10.4 libjulia.so.1.10 libjulitie.so
sodirs = julia/
srcfiles = Manifest.toml Project.toml src/julia_init.c src/julia_init.h src/julitie.h src/julitie.jl test/runtests.jl build.jl

uninstall:
	rm -rf $(sodirs)
	rm -f $(sofiles)

target: $(srcfiles)
	julia --quiet --project build.jl

.DEFAULT_GOAL := target

install: $(sofiles) $(sodirs)

$(sodirs): target
	cp -R target/lib/$@ .

$(sofiles): target
	cp target/lib/$@ .

.PHONY: uninstall install
