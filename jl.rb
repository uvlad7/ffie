require 'ffi'

module JLLib
  extend FFI::Library
  ffi_lib_flags :now, :global
  ffi_lib File.join(ENV['JULIA_DIR'], 'lib', 'libjulia.so')

  attach_function :jl_init, [], :void
  attach_function :jl_atexit_hook, [:int], :void
  attach_function :jl_eval_string, [:string], :pointer
  attach_function :jl_unbox_float64, [:pointer], :double
  attach_variable :jl_float64_type, :pointer
  attach_function :jl_isa, [:pointer, :pointer], :int
end

JLLib.jl_init
at_exit { JLLib.jl_atexit_hook(0) }

JLLib.jl_eval_string('println("Hello from Julia")')
JLLib.jl_eval_string('display([ i + j*im for i=1:3, j=1:4 ] .* [1:3])')
ret = JLLib.jl_eval_string('sqrt(2.0)')
if JLLib.jl_isa(ret, JLLib.jl_float64_type).nonzero?
  printf("sqrt(2.0) in Ruby: %e \n", JLLib.jl_unbox_float64(ret))
else
  printf("ERROR: unexpected return type from sqrt(::Float64)\n")
end
