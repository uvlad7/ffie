const std = @import("std");
// const testing = std.testing;
const ansi_term = @import("ansi-term");
const format = ansi_term.format;
const style = ansi_term.style;
const Style = style.Style;
const Color = style.Color;
const ColorRGB = style.ColorRGB;

export fn hello_ziggie() void {
    const stdout = std.io.getStdOut().writer();
    const zig_clr = ColorRGB { .r = 246, .g = 163, .b = 29 };
    const zig_sty = Style{
        .foreground = Color{ .RGB = zig_clr },
    };
    const empty_sty = Style{};
    stdout.print("Hello from ", .{}) catch return;
    format.updateStyle(stdout, zig_sty, empty_sty) catch return;
    stdout.print("Zig", .{}) catch return;
    format.updateStyle(stdout, empty_sty, zig_sty) catch return;
    stdout.print("!\n", .{}) catch return;
    // stdout.print("Hello from Zig!\n", .{}) catch return;
    // // Returns a `File` corresponding to stdout.
    // const stdout_file = try std.io.getStdOut();

    // // Get the `FileOutStream` corresponding to stdout.
    // var stdout_stream = stdout_file.outStream();

    // // Bind the generic `OutStream` field of `FileOutStream` which contains
    // // all the formatted output functions.
    // var stdout = &stdout_stream.stream;

    // try stdout.print("Hello, {}\n", "world");

    // // stdout is for the actual output of your application, for example if you
    // // are implementing gzip, then only the compressed bytes should be sent to
    // // stdout, not any debugging messages.
    // const stdout_file = std.io.getStdOut().writer();
    // var bw = std.io.bufferedWriter(stdout_file);
    // const stdout = bw.writer();

    // // try stdout.print("Run `zig build test` to run the tests.\n", .{});
    // stdout.print("Run `zig build test` to run the tests.\n", .{}) catch return;
    // // stdout.print("Run `zig build test` to run the tests.\n", .{}) catch unreachable;

    // // try bw.flush(); // don't forget to flush!
    // // bw.flush() catch unreachable; // don't forget to flush!
    // bw.flush() catch return; // don't forget to flush!
}

// export fn add(a: i32, b: i32) i32 {
//     return a + b;
// }

// test "basic add functionality" {
//     try testing.expect(add(3, 7) == 10);
// }
