const std = @import("std");
// const testing = std.testing;
const ansi_term = @import("ansi-term");
const format = ansi_term.format;
const style = ansi_term.style;
const Style = style.Style;
const Color = style.Color;
const ColorRGB = style.ColorRGB;

extern fn atexit(func: *const fn () callconv(.C) void) callconv(.C) c_int;
extern fn callme(func: *const fn () callconv(.C) void) callconv(.C) c_int;
extern fn hello_cittie() callconv(.C) void;
export fn bye() callconv(.C) void {
    // std.debug.print("Hello from exit handler!\n", .{});
}

// https://zig.news/almmiko/building-zig-libraries-with-c-dependencies-25a
export fn bye_ziggie() callconv(.C) void {
    const stdout = std.io.getStdOut().writer();
    const zig_clr = ColorRGB { .r = 246, .g = 163, .b = 29 };
    const zig_sty = Style{
        .foreground = Color{ .RGB = zig_clr },
    };
    const empty_sty = Style{};
    stdout.print("Bye from ", .{}) catch return;
    format.updateStyle(stdout, zig_sty, empty_sty) catch return;
    stdout.print("Zig", .{}) catch return;
    format.updateStyle(stdout, empty_sty, zig_sty) catch return;
    stdout.print("!\n", .{}) catch return;
}


// https://github.com/ziglang/zig/issues/17908#issuecomment-1801125950
// https://github.com/ziglang/zig/issues/23574#issuecomment-2869397797
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
    // const ptr: *const fn () callconv(.C) void = bye_ziggie;
    // stdout.print("bye_ziggie: {}\n", .{ptr}) catch return;

    // Correct function pointer type
    // const ptr = @extern(*const fn () callconv(.C) void, .{
    //     .name = "hello_cittie",
    // });
    // const func_ptr = @as(*const fn () callconv(.C) void, &bye_ziggie);
    // const ret = atexit(func_ptr);
    const ret = callme(&bye_ziggie);
    stdout.print("callme: {}\n", .{ret}) catch return;
    // _ = atexit(&bye_ziggie);s
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
