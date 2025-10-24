This project is created to demonstrate how to create shared libraries in different languages and use them from Ruby and Python

```bash
$ bundle exec rake > /dev/null 2>&1
$ pipenv run bundle exec ./rubie.rb
Hello from Rust!
Hello from Crystal!
Hello from Go!
Hello from C!
Hello from C++!
Hello from C#!
Hello from Julia!
Hello from Zig!
Hello from D!
Hello from Swift!
Hello from Haskell!
Hello from LLVM!
Hello from Nim!
Hello from Vala!
Hello from Genie!
Hello from Odin!
Hello from Vala/GObject!
Hello from RubyLLVM!
Hello from Ruby!
Hello from Python!
Hello from Java!
Bye from Ruby!
Bye from Java!
Bye from Python!
Bye from Rust!
Bye from Crystal!
Bye from C!
Bye from D!
Bye from Swift!
Bye from LLVM!
Bye from Nim!
Bye from Vala!
Bye from Genie!
Bye from Odin!
Bye from Haskell!
Bye from RubyLLVM!
Bye from Vala/GObject!
Bye from C++!
Bye from Go!
Bye from Julia!
$ pipenv run ./pythonie.py
Hello from Rust!
Hello from Crystal!
Hello from Go!
Hello from C!
Hello from C++!
Hello from C#!
Hello from Julia!
Hello from Zig!
Hello from D!
Hello from Swift!
Hello from Haskell!
Hello from LLVM!
Hello from Nim!
Hello from Vala!
Hello from Genie!
Hello from Odin!
Hello from Vala/GObject!
Hello from Python!
Bye from Python!
Bye from Rust!
Bye from Crystal!
Bye from C!
Bye from D!
Bye from Swift!
Bye from Haskell!
Bye from LLVM!
Bye from Nim!
Bye from Vala!
Bye from Genie!
Bye from Odin!
Bye from Vala/GObject!
Bye from C++!
Bye from Go!
Bye from Julia!
```
<div align="center">
    <img src="Readme.svg" alt="colorful terminal output">
</div>

Note that exit "Bye" callbacks order is different than the order in which libraries are loaded and "Hello" functions are called. That's because different approaches are used:

- Ruby, Python and Java use their own `at_exit`/`atexit`/`addShutdownHook` hooks; Ruby triggers Python's and Java's hooks inside its own
- Rust, C, C++, D, Go, Swift, Zig, Vala, Genie, Odin, both LLVM examples, use C stdlib `atexit`; they aren't called in the reverse order because they are registered across different shared libraries
- Nim uses its own std hook, triggered in the finalizer executed on `dlclose` (custom implemented destructor annotation)
- Crystal (fini) and Julia (C wrapper destructor annotation) use their own standart hooks triggered by runtime shutdown, which is done by finalizers called in `dlclose`
- C# doesn't have a standart approach and uses a custom solution triggered as the previous ones
- Haskell doesn't have a standart approach and uses C stdlib `atexit`, runtime shutdown is also deferred into `atexit`

You can use `poetry` instead of `pipenv`.

You can use `pipenv run inv` or `poetry run inv` or `poetry run poe build` instead of `bundle exec rake`. All these commands use [`tasks.py`](/tasks.py) for [Invoke](https://www.pyinvoke.org/) - and [Poe the Poet](https://poethepoet.natn.io/index.html), configured in the `[tool.poe.tasks]` section of the [`pyproject.toml`](/pyproject.toml) for the last one - instead of Rake and [`Rakefile`](/Rakefile).

# Installation

## C, C++

cmake version 3.22.1

```bash
$ sudo apt install cmake=3.22.1-1ubuntu1.22.04.2
```

## Crystal

```bash
$ mise use crystal@1.11.2
```

## D

```bash
$ sudo apt install dub='1.27.0-2' ldc='1:1.28.0-1ubuntu1'
```

or

```zsh
$ brew install dub ldc # versions dub 1.38.1 and ldc 1.39.0
```

## Ruby, LLVM

```bash
$ sudo apt install llvm-17
```

or

```zsh
$ brew install llvm@17
```

```bash
$ mise use ruby@2.7.8
$ gem install bundler -v 2.4.2 && bundle install
```

## Go

```bash
$ mise use go@1.20.4
```

## Haskell

```bash
$ mise use haskell@9.8.1 # was 9.2.8, had to upgrade
```

## Java

```bash
$ mise use java@17.0.2
```

## Julia

```bash
$ mise use julia@1.10.4 # was 1.8.5
```

## Nim

```
$ mise use nim@2.0.2
```

## Python

```bash
$ mise use python@3.10.12
# use pipenv or poetry
$ mise use pipenv@2023.10.3 && pipenv install --dev
# or
# $ mise use poetry@1.5.1 && poetry install
```

## Rust

```bash
$ mise use rust@1.72.1
```

## C#

```bash
$ mise use dotnet@8.0.100
```

## Swift

```bash
$ linuxbrew install swift # 5.10
```

## Zig

```bash
$ mise use zig@0.14.0
```

## Vala and Genie

```bash
$ sudo apt install valac
```

or

```zsh
$ brew install vala
```

## Odin

```bash
$ mise use odin@dev-2025-06
```

# Todo:
 - Fix Haskell's `build.sh` (copies a wrong `.so`), unify Zig's (symlink)
 - Fix C# at exit
 - Hide unnecessary exported symbols: `nm -D */lib*.so | grep -Pe '\s(bye|init|exit)_'`
 <!-- - Check `NO_COLOR` everywhere (only Crystal, Swift, RubyLLVM and Ruby implementations do that) -->
 <!-- - Check `tty?` everywhere (only Swift implementation does that) -->
 <!-- - Check for truecolor support and fallback to ansi/ascii -->
 <!-- - Fix Crystal - impl exit_crystal to make `at_exit` work, get rid of [init](https://stackoverflow.com/a/32701238/13500870) -->
 - Get rid of `-init`/`-fini`
 - Python atexit from pycall (use Py_Finalize)
 - [`Ocaml`](https://ocaml.org/manual/5.0/native.html)
 <!-- - Vala -->
 <!-- - Odin -->
 - Mojo
 - Carbon
 - [Kotlin Native](https://kotlinlang.org/docs/native-dynamic-libraries.html#compile-and-run-the-project)
 - [Dart](https://github.com/fuzzybinary/dart_shared_library)
 - [Natalie](https://news.ycombinator.com/item?id=29660883)
 - MRuby
 - [Lisp](https://stackoverflow.com/questions/1797328/programming-languages-that-compile-to-native-code-and-have-the-batteries-include)
 - Delphi
 - [Elixir/Erlang](https://stackoverflow.com/questions/31861544/can-elixir-or-erlang-programs-be-compiled-to-a-standalone-binary)
 - GraalVM native - [Java](https://github.com/bestie/libnjkafka/blob/main/Makefile), Ruby
 - bindings libs like Magnus, maturin pyo3 and rust-cpython, Rice, pybind11, boost python, etc
 - auto bindings like UniFFI, [GObject](https://discourse.gnome.org/t/writing-a-gobject-introspectible-library-in-rust-in-2023/18254), SWIG
 - WASM libs and runtimes
