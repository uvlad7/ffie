package oddie

import "core:fmt" // Import the core:fmt package for printing
import "core:c/libc"
import "base:runtime"

Color :: struct {
	r: u8,
	g: u8,
	b: u8,
}

bye_oddie :: proc "c" () {
    context = runtime.default_context()

    color := Color{0, 84, 146}
    fmt.printf("Bye from \x1b[38;2;%d;%d;%dmOdin\x1b[0m!\n", color.r, color.g, color.b)
}

@(export)
hello_oddie :: proc() {
    // Using fmt.printf for formatted output
    color := Color{0, 84, 146}
    fmt.printf("Hello from \x1b[38;2;%d;%d;%dmOdin\x1b[0m!\n", color.r, color.g, color.b)
    libc.atexit(bye_oddie)
}
