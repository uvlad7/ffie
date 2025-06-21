require "colorize"

# Ignore NO_COLOR
Colorize.enabled = true

fun init_crystal : Void
  # We need to initialize the GC
  GC.init

  # We need to invoke Crystal's "main" function, the one that initializes
  # all constants and runs the top-level code (none in this case, but without
  # constants like STDOUT and others the last line will crash).
  # We pass 0 and null to argc and argv.
  Crystal.main_user_code(0, Pointer(Pointer(UInt8)).null)
end

fun hello_crystie : Void
  # puts "Hello from #{"Crystal".colorize(:blue)}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(0, 0, 0))}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(46, 16, 82))}!"
  # puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(220, 125, 248))}!"
  puts "Hello from #{"Crystal".colorize(Colorize::ColorRGB.new(119, 103, 144))}!"
  at_exit do
    puts "Bye from #{"Crystal".colorize(Colorize::ColorRGB.new(119, 103, 144))}!"
  end
end

# https://github.com/crystal-lang/crystal/blob/8878c8b61e85bc4d473178252bbb41d59514e7ce/src/crystal/main.cr#L52
fun exit_crystal : Void
  Crystal.exit(0, nil)
end
