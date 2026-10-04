const std = @import("std");

pub fn main() void {
    var i: u32 = 0;
    var sum: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 1) continue;
        sum += i;
    }
    std.debug.print("sum of evens below 10: {d}\n", .{sum});

    var a: u32 = 0;
    var b: u32 = 1;
    var n: u32 = 0;
    while (n < 10) : ({
        const t = a + b;
        a = b;
        b = t;
        n += 1;
    }) {
        std.debug.print("{d} ", .{a});
    }
    std.debug.print("\n", .{});

    var opt: ?u32 = 3;
    while (opt) |v| {
        std.debug.print("countdown {d}\n", .{v});
        opt = if (v == 0) null else v - 1;
    }
}
