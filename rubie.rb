#!/usr/bin/env ruby
require "ffi"
# require "colorize"
# require "rainbow"
require "paint"

module RustieLib
  extend FFI::Library
  ffi_lib "rustie/librustie.so"

  attach_function :hello, [], :void
end

module CrystieLib
  extend FFI::Library
  ffi_lib 'crystie/libcrystie.so'

  attach_function :init, [], :void
  init
  undef init

  attach_function :hello, [], :void
end

module GotieLib
  extend FFI::Library
  ffi_lib 'gotie/libgotie.so'

  attach_function :hello, [], :void
end

module CittieLib
  extend FFI::Library
  ffi_lib "cittie/libcittie.so"

  attach_function :hello, [], :void
end

module CpptieLib
  extend FFI::Library
  ffi_lib "cpptie/libcpptie.so"

  attach_function :hello, [], :void
end

RustieLib.hello

CrystieLib.hello

GotieLib.hello

CittieLib.hello

CpptieLib.hello

# puts "Hello from #{"Ruby".colorize(:red)}!"
# puts "Hello from #{Rainbow("Ruby").color(176, 18, 5)}!"
# puts "Hello from #{Rainbow("Ruby").color(136, 17, 2)}!"
puts "Hello from #{Paint['Ruby', [136, 17, 2]]}!"
