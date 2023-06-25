#!/usr/bin/env ruby
require 'ffi'
require 'pycall/import'
# require "colorize"
# require "rainbow"
require 'paint'

# It works
# But only if loaded before crystal and go
# And init_julia still causes segmentation fault from time to time
# module JulitieLib
#   extend FFI::Library
#   ffi_lib File.join(__dir__, 'julitie/libjulitie.so')

#   attach_function :init_julia, [], :void
#   init_julia
#   undef init_julia

#   attach_function :hello_julitie, [], :void
# end

module RustieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'rustie/librustie.so')

  attach_function :hello_rustie, [], :void
end

module CrystieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'crystie/libcrystie.so')

  attach_function :init_crystal, [], :void
  init_crystal
  undef init_crystal

  attach_function :hello_crystie, [], :void
end

module GotieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'gotie/libgotie.so')

  attach_function :hello_gotie, [], :void
end

module CittieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'cittie/libcittie.so')

  attach_function :hello_cittie, [], :void
end

module CpptieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'cpptie/libcpptie.so')

  attach_function :hello_cpptie, [], :void
end

module ZiggieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'ziggie/libziggie.so')

  attach_function :hello_ziggie, [], :void
end

module DittieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'dittie/libdittie.so')

  attach_function :hello_dittie, [], :void
end

module SwiftieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'swiftie/libswiftie.so')

  attach_function :hello_swiftie, [], :void
end

module HaskieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'haskie/libhaskie.so')

  attach_function :init_haskell, [], :void
  init_haskell
  undef init_haskell

  at_exit do
    attach_function :exit_haskell, [], :void
    exit_haskell
    undef exit_haskell
  end

  attach_function :hello_haskie, [], :void
end

module LltieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'lltie/liblltie.so')

  attach_function :hello_lltie, [], :void
end

module Rubie
  def self.hello_rubie
    # puts "Hello from #{"Ruby".colorize(:red)}!"
    # puts "Hello from #{Rainbow("Ruby").color(176, 18, 5)}!"
    # puts "Hello from #{Rainbow("Ruby").color(136, 17, 2)}!"
    puts "Hello from #{Paint['Ruby', [136, 17, 2]]}!"
  end
end

module LlRubie
  extend(catch(:wrapper) { load(File.join(__dir__, 'llrubie/llrubie.rb'), true) })
end

module Pythonie
  extend PyCall::Import
  pyimport :sys
  sys.path.insert(0, '')
  pyfrom :pythonie, import: :Pythonie

  def self.hello_pythonie
    Pythonie.hello_pythonie
  end
end

# pipenv run bundle exec rubie.rb

if $PROGRAM_NAME == __FILE__
  RustieLib.hello_rustie

  CrystieLib.hello_crystie

  GotieLib.hello_gotie

  CittieLib.hello_cittie

  CpptieLib.hello_cpptie

  # JulitieLib.hello_julitie

  ZiggieLib.hello_ziggie

  DittieLib.hello_dittie

  SwiftieLib.hello_swiftie

  HaskieLib.hello_haskie

  LltieLib.hello_lltie

  LlRubie.hello_llrubie

  Rubie.hello_rubie

  Pythonie.hello_pythonie
end
