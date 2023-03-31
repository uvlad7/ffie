#!/usr/bin/env ruby
require 'ffi'
# require "colorize"
# require "rainbow"
require 'paint'

# It works
# But only if loaded before crystal and go
# And init_julia still causes segmentation fault from time to time
# module JulitieLib
#   extend FFI::Library
#   ffi_lib "julitie/libjulitie.so"

#   attach_function :init_julia, [], :void
#   init_julia
#   undef init_julia

#   attach_function :hello_julitie, [], :void
# end

module RustieLib
  extend FFI::Library
  ffi_lib 'rustie/librustie.so'

  attach_function :hello_rustie, [], :void
end

module CrystieLib
  extend FFI::Library
  ffi_lib 'crystie/libcrystie.so'

  attach_function :init_crystal, [], :void
  init_crystal
  undef init_crystal

  attach_function :hello_crystie, [], :void
end

module GotieLib
  extend FFI::Library
  ffi_lib 'gotie/libgotie.so'

  attach_function :hello_gotie, [], :void
end

module CittieLib
  extend FFI::Library
  ffi_lib 'cittie/libcittie.so'

  attach_function :hello_cittie, [], :void
end

module CpptieLib
  extend FFI::Library
  ffi_lib 'cpptie/libcpptie.so'

  attach_function :hello_cpptie, [], :void
end

module ZiggieLib
  extend FFI::Library
  ffi_lib 'ziggie/libziggie.so'

  attach_function :hello_ziggie, [], :void
end

def hello_rubie
  # puts "Hello from #{"Ruby".colorize(:red)}!"
  # puts "Hello from #{Rainbow("Ruby").color(176, 18, 5)}!"
  # puts "Hello from #{Rainbow("Ruby").color(136, 17, 2)}!"
  puts "Hello from #{Paint['Ruby', [136, 17, 2]]}!"
end

RustieLib.hello_rustie

CrystieLib.hello_crystie

GotieLib.hello_gotie

CittieLib.hello_cittie

CpptieLib.hello_cpptie

# JulitieLib.hello_julitie

ZiggieLib.hello_ziggie

hello_rubie
