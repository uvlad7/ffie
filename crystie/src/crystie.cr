require "colorize"

fun init_crystal : Void
  # We need to initialize the GC
  GC.init

  # We need to invoke Crystal's "main" function, the one that initializes
  # all constants and runs the top-level code (none in this case, but without
  # constants like STDOUT and others the last line will crash).
  # We pass 0 and null to argc and argv.
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)
end

fun hello_crystie : Void
  # puts "Hello from #{"Crystal".colorize(:blue)}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(0, 0, 0))}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(46, 16, 82))}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(220, 125, 248))}!"
  puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(119, 103, 144))}!"
end
