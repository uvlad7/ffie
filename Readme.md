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
Hello from RubyLLVM!
Hello from Ruby!
Hello from Python!
Bye from Ruby!
Bye from Python!
Bye from Crystal!
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
Hello from Python!
Bye from Python!
Bye from Crystal!
Bye from Julia!
```
<div align="center">
    <img src="Readme.svg" alt="teminal output">
</div>

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
$ linuxbrew install llvm@15
```

or

```zsh
$ brew install llvm@15
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

## Julia

```bash
$ mise use julia@1.10.4 # was 1.8.5
```

## Python

```bash
$ mise use python@3.10.12
# use pipenv or poetry
$ mise use pipenv@2023.10.3 && pipenv install --dev
# or
$ mise use poetry@1.5.1 && poetry install
```

## Rust

```bash
$ mise use rust@1.72.1
```

## Swift

```bash
$ linuxbrew install swift # 5.10
```

## Zig

```bash
$ mise use zig@0.13.1
```

## Nim

```
$ mise use nim@2.0.2
```

# Todo:
 - Check `NO_COLOR` everywhere (only Crystal, Swift, RubyLLVM and Ruby implementations do that)
 - Check `tty?` everywhere (only Swift implementation does that)
 - Check for truecolor support and fallback to ansi/ascii
 - Fix Crystal - impl exit_crystal to make `at_exit` work, get rid of [init](https://stackoverflow.com/a/32701238/13500870)
 - Python atexit from pycall (use Py_Finalize)
 - [`Ocaml`](https://ocaml.org/manual/5.0/native.html)
 - Vala
 - bindings libs like Magnus, maturin pyo3 and rust-cpython, Rice, pybind11, boost python, etc
 - auto bindings like UniFFI, GObject, SWIG
