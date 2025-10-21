#!/usr/bin/env ruby
require 'ffi'
require 'pycall/import'
require 'rjb'
# require "colorize"
require 'rainbow'
# require 'paint'

module JulitieLib
  extend FFI::Library
  # ffi_lib_flags :now, :global
  ffi_lib File.join(__dir__, 'julitie/libjulitie.so')

  attach_function :hello_julitie, [], :void
end

module RustieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'rustie/librustie.so')

  attach_function :hello_rustie, [], :void
end

module CrystieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'crystie/libcrystie.so')

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

module SharpieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'sharpie/libsharpie.so')

  attach_function :hello_sharpie, [], :void
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

  attach_function :hello_haskie, [], :void
end

module LltieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'lltie/liblltie.so')

  attach_function :hello_lltie, [], :void
end

module NimmieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'nimmie/libnimmie.so')

  attach_function :hello_nimmie, [], :void
end

module VallieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'vallie/libvallie.so')

  attach_function :hello_vallie, [], :void
end

module GenieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'genie/libgenie.so')

  attach_function :hello_genie, [], :void
end

module OddieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'oddie/liboddie.so')

  attach_function :hello_oddie, [], :void
end

module Rubie
  def self.hello_rubie
    Rainbow.enabled = true
    # puts "Hello from #{"Ruby".colorize(:red)}!"
    # puts "Hello from #{Rainbow("Ruby").color(176, 18, 5)}!"
    puts "Hello from #{Rainbow("Ruby").color(136, 17, 2)}!"
    # puts "Hello from #{Paint['Ruby', [136, 17, 2]]}!"
    at_exit do
      Rainbow.enabled = true
      puts "Bye from #{Rainbow("Ruby").color(136, 17, 2)}!"
      # puts "Bye from #{Paint['Ruby', [136, 17, 2]]}!"
    end
  end
end

require_relative 'llrubie/llrubie'

extend PyCall::Import
pyimport :sys
sys.path.insert(0, __dir__)
pyfrom :pythonie, import: :Pythonie

module PyCallFFI
  extend FFI::Library
  ffi_lib FFI::CURRENT_PROCESS
  # raises NotFoundError if called early, as pycall uses lazy initialization
  # so call this when some python calls were already executed
  attach_function :Py_FinalizeEx, [], :int
end

at_exit do
  PyCallFFI.Py_FinalizeEx()
end

Rjb.load
Rjb.add_jar(File.join(__dir__, 'javie/javie.jar'))
Javie = Rjb.import 'Javie'

at_exit { Rjb.unload }

# pipenv run bundle exec rubie.rb

if File.expand_path($PROGRAM_NAME) == File.expand_path(__FILE__)
  RustieLib.hello_rustie

  CrystieLib.hello_crystie

  GotieLib.hello_gotie

  CittieLib.hello_cittie

  CpptieLib.hello_cpptie

  SharpieLib.hello_sharpie

  JulitieLib.hello_julitie

  ZiggieLib.hello_ziggie

  DittieLib.hello_dittie

  SwiftieLib.hello_swiftie

  HaskieLib.hello_haskie

  LltieLib.hello_lltie

  NimmieLib.hello_nimmie

  VallieLib.hello_vallie

  GenieLib.hello_genie

  OddieLib.hello_oddie

  LlRubie.hello_llrubie

  Rubie.hello_rubie

  Pythonie.hello_pythonie

  Javie.hello_javie
end
