const std = @import("std");

pub fn main() void {
    // Continue expression runs after every iteration, even on `continue`.
    var i: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 0) continue;
        std.debug.print("{d} ", .{i});
    }
    std.debug.print("\n", .{});

    // Two variables updated together.
    var a: u32 = 0;
    var b: u32 = 10;
    while (a < b) : ({
        a += 1;
        b -= 1;
    }) {
        std.debug.print("({d},{d}) ", .{ a, b });
    }
    std.debug.print("\n", .{});

    // while with optional payload
    const stack = [_]?u8{ 3, 2, 1, null };
    var idx: usize = 0;
    while (stack[idx]) |value| : (idx += 1) {
        std.debug.print("got {d}\n", .{value});
    }

    // while as an expression with else
    var n: u32 = 0;
    const found = while (n < 100) : (n += 1) {
        if (n * n > 200) break n;
    } else 0;
    std.debug.print("first n with n*n > 200: {d}\n", .{found});
}
