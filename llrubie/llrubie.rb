# LLVM 'Hello, World!' example from
# http://llvm.org/docs/LangRef.html#module-structure
require 'llvm/core'
require 'llvm/execution_engine'
# require 'paint'
require 'rainbow'

module LlRubie
  public

  def self.hello_llrubie
    Rainbow.enabled = true
    # modules hold functions and variables
    mod = LLVM::Module.new('hello')
    # hello_str = LLVM::ConstantArray.string("Hello from #{Paint['Ruby', [136, 17, 2]]}#{Paint['LLVM', [43, 97, 122]]}!")
    hello_str = LLVM::ConstantArray.string("Hello from #{Rainbow('Ruby').color(136, 17, 2)}#{Rainbow('LLVM').color(43, 97, 122)}!")

    # Declare the string constant as a global constant.
    hello = mod.globals.add(hello_str, :hello) do |var|
      var.linkage = :private
      var.global_constant = true
      var.unnamed_addr = true
      var.initializer = hello_str
    end

    # External declaration of the `puts` function
    cputs = mod.functions.add('puts', [LLVM.Pointer(LLVM::Int8)], LLVM::Int32) do |function, string|
      function.add_attribute :no_unwind_attribute
      string.add_attribute :no_capture_attribute
      string.add_attribute :readonly_attribute
    end

    # Definition of hello_llrubie function
    # a function is made up of connected BasicBlocks and must have _one entry and exit
    # basic blocks are (mostly) simple machine instructions and can be connected in a graph
    hello_llrubie_fn = mod.functions.add('hello_llrubie', [], LLVM::Int32) do |function|
      function.basic_blocks.append.build do |b|
        zero = LLVM.Int(0) # a LLVM Constant value

        # Read here what GetElementPointer (gep) means http://llvm.org/releases/3.2/docs/GetElementPtr.html
        # Convert [13 x i8]* to i8  *...
        cast210 = b.gep hello, [zero, zero], 'cast210'
        # Call puts function to write out the string to stdout.
        b.call cputs, cast210
        b.ret zero
      end
    end
    LLVM.init_jit

    engine = LLVM::JITCompiler.new(mod, opt_level: 3)
    engine.run_function(hello_llrubie_fn)
    engine.dispose
  end
end
