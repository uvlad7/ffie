This project is created to demonstrate how to create shared libraries in different languages and use them from Ruby

<pre><samp>
vladimir@np940x5n:~/ffie$ rake > /dev/null 2>&1 && pipenv run bundle exec ./rubie.rb && pipenv run ./pythonie.py
Hello from Rust!
Hello from Crystal!
Hello from Go!
Hello from C!
Hello from C++!
Hello from Julia!
Hello from Zig!
Hello from D!
Hello from Swift!
Hello from Haskell!
Hello from LLVM!
Hello from RubyLLVM!
Hello from Ruby!
Hello from Python!
Hello from Rust!
Hello from Crystal!
Hello from Go!
Hello from C!
Hello from C++!
Hello from Julia!
Hello from Zig!
Hello from D!
Hello from Swift!
Hello from Haskell!
Hello from LLVM!
Hello from Python!
</samp><pre>
<div align="center">
    <img src="Readme.svg" alt="teminal output">
</div>


# Tools

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
brew install dub ldc # versions dub 1.38.1 and ldc 1.39.0
```

## Ruby, LLVM

```bash
linuxbrew install llvm@15
```

or

```zsh
brew install llvm@15
```

```bash
$ mise use ruby@2.7.8
$ gem install bundler -v 2.4.2
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
$ pip install pipenv==2023.10.3
```

## Rust

```bash
$ mise use rust@1.72.1
```

## Swift

```bash
linuxbrew install swift # 5.10
```

## Zig

```bash
# todo: migrate to latest zig and its own package manager
$ mise use zig@0.10.1
# gyro https://github.com/mattnite/gyro/releases
```

## Nim

```
$ mise use nim@2.0.2
```
