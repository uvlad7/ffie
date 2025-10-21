#!/usr/bin/env ruby
require 'ffi'
require 'pycall/import'
require 'rjb'
# require "colorize"
require 'rainbow'
# require 'paint'
require 'gobject-introspection'

# 2.7.0 :017 > mod = Module.new
#  => #<Module:0x000055e202a2eab0> 
# 2.7.0 :018 > loader = GObjectIntrospection::Loader.new(mod)
#  => #<GObjectIntrospection::Loader:0x000055e2028a2cf0 @base_module=#<Module:0x000055e202a2eab0>, @version=nil> 
# 2.7.0 :019 > loader.load 'gvallie'
#  => nil 
# 2.7.0 :020 > mod.hello
# Hello from GObject Vala!
#  => nil 

# 2.7.0 :036 > repo = GObjectIntrospection::Repository.default
#  => #<GObjectIntrospection::Repository:0x000055e2028b4bd0 ptr=0x000055e2021b5030> 
# 2.7.0 :037 > repo.require 'gvallie'
#  => nil 
# 2.7.0 :038 > repo.find("gvallie", 'GVallie')
#  => nil 
# 2.7.0 :039 > repo.find("gvallie", 'hello')
#  => #<GObjectIntrospection::FunctionInfo:0x000055e2030a08d0 ptr=0x000055e2021b5230 own=true signature=<hello(): void> name="hello" arguments=[] return_type=#<GObjectIntrospection::TypeInfo:0x000055e20309f9f8 ptr=0x000055e2021b5050 own=true tag=#<GObjectIntrospection::TypeTag void>> may_return_type_null=false lock_gvl_default=true> 
# 2.7.0 :040 > repo.find("gvallie", 'hello').call
# Traceback (most recent call last):
#         6: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `<main>'
#         5: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `eval'
#         4: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `<main>'
#         3: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `load'
#         2: from /home/vladimir/.local/share/rtx/installs/ruby/2.7.8/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe/irb:11:in `<top (required)>'
#         1: from (irb):40
# NoMethodError (undefined method `call' for #<GObjectIntrospection::FunctionInfo:0x000055e2029ecb88>)
# 2.7.0 :041 > repo.find("gvallie", 'hello')[]
# Traceback (most recent call last):
#         8: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `<main>'
#         7: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `eval'
#         6: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `<main>'
#         5: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `load'
#         4: from /home/vladimir/.local/share/rtx/installs/ruby/2.7.8/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe/irb:11:in `<top (required)>'
#         3: from (irb):40
#         2: from (irb):41:in `rescue in irb_binding'
#         1: from (irb):41:in `[]'
# ArgumentError (wrong number of arguments (given 0, expected 1))
# 2.7.0 :042 > repo.find("gvallie", 'hello').invoke
# Traceback (most recent call last):
#         8: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `<main>'
#         7: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/ruby_executable_hooks:22:in `eval'
#         6: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `<main>'
#         5: from /home/vladimir/.local/share/mise/installs/ruby/2.7.8/bin/irb:25:in `load'
#         4: from /home/vladimir/.local/share/rtx/installs/ruby/2.7.8/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe/irb:11:in `<top (required)>'
#         3: from (irb):41
#         2: from (irb):42:in `rescue in irb_binding'
#         1: from (irb):42:in `invoke'
# ArgumentError (wrong number of arguments (given 0, expected 1))
# 2.7.0 :043 > repo.find("gvallie", 'hello')
#  => #<GObjectIntrospection::FunctionInfo:0x000055e2030878f8 ptr=0x000055e2022c4800 own=true signature=<hello(): void> name="hello" arguments=[] return_type=#<GObjectIntrospection::TypeInfo:0x000055e203086a48 ptr=0x000055e2021b5320 own=true tag=#<GObjectIntrospection::TypeTag void>> may_return_type_null=false lock_gvl_default=true> 
# 2.7.0 :044 > repo.find("gvallie", 'hello').invoke []
# Hello from GObject Vala!
#  => nil 


# vladimir@np940x5n:~/ffie (master)$ bundle exec irb                                                                                                                                                                                                                
# 2.7.0 :001 > require "gobject-introspection"
#  => true 
# 2.7.0 :002 > repo = GObjectIntrospection::Repository.prepend_search_path(File.join(__dir__, 'gvallie')).default
#  => #<GObjectIntrospection::Repository:0x0000564a97b8eec0 ptr=0x0000564a97b26030> 
# 2.7.0 :003 > repo.require 'gvallie'
#  => nil 
# 2.7.0 :004 > repo.find("gvallie", 'hello').invoke []
# Hello from GObject Vala!
#  => nil 
# 2.7.0 :005 > 
# Bye from GObject Vala!

# vladimir@np940x5n:~/ffie (master)$ bundle exec irb                                                                                                                                                                                                                                         
# 2.7.0 :001 > require "gobject-introspection"
#  => true 
# 2.7.0 :002 > GObjectIntrospection::Repository.prepend_search_path(File.join(__dir__, 'gvallie'))
#  => GObjectIntrospection::Repository 
# 2.7.0 :003 > mod = Module.new
#  => #<Module:0x000056cde861cc88> 
# 2.7.0 :004 > loader = GObjectIntrospection::Loader.new(mod)
#  => #<GObjectIntrospection::Loader:0x000056cde815ed18 @base_module=#<Module:0x000056cde861cc88>, @version=nil> 
# 2.7.0 :005 > loader.load 'gvallie'
#  => nil 
# 2.7.0 :006 > mod.hello
# Hello from GObject Vala!
#  => nil 
# 2.7.0 :007 > 
# Bye from GObject Vala!


# GObjectIntrospection.prepend_typelib_path './gvallie'
# 2.7.0 :027 > GObjectIntrospection.load('gvallie', version: '0.1').hello
# Hello from GObject Vala!
# => nil 


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
