require 'ffi'
require 'fiddle'
require 'benchmark'

module CittieLib
  extend FFI::Library
  ffi_lib File.join(__dir__, 'cittie/libcittie.so')

  attach_function :hello_cittie_ffi, :hello_cittie, [], :void
end

module RbFFI
  extend FFI::Library
  ffi_lib FFI::CURRENT_PROCESS

  attach_function :rb_define_global_function, [:string, :pointer, :int], :void
  attach_function :rb_define_singleton_method, [:ulong, :string, :pointer, :int], :void
end

hello_cittie_rb = nil
CittieLib.ffi_libraries.each { |lib| break if hello_cittie_rb = lib.find_function('hello_cittie_rb') }
RbFFI.rb_define_global_function('hello_cittie_global_rb', hello_cittie_rb, 0)
RbFFI.rb_define_singleton_method(Fiddle::dlwrap(CittieLib), 'hello_cittie_rb', hello_cittie_rb, 0)

n = 500_000
# Benchmark.bm(27) do |x|
#   x.report('hello_cittie_global_rb') { n.times do; hello_cittie_global_rb; end }
#   x.report('CittieLib.hello_cittie_rb') { n.times do; CittieLib.hello_cittie_rb; end }
#   x.report('CittieLib.hello_cittie_ffi') { n.times do; CittieLib.hello_cittie_ffi; end }
# end

data = [
  Benchmark.measure('hello_cittie_global_rb') { n.times do; hello_cittie_global_rb; end },
  Benchmark.measure('CittieLib.hello_cittie_rb') { n.times do; CittieLib.hello_cittie_rb; end },
  Benchmark.measure('CittieLib.hello_cittie_ffi') { n.times do; CittieLib.hello_cittie_ffi; end },
]

puts data
