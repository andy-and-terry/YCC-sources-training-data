const std = @import("std");

pub fn main() void {
    var i: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 0) continue;
        std.debug.print("odd {d}\n", .{i});
    }

    var a: u32 = 0;
    var b: u32 = 1;
    var steps: u32 = 0;
    while (a < 100) : ({
        const next = a + b;
        a = b;
        b = next;
        steps += 1;
    }) {}
    std.debug.print("first fib >= 100 is {d} after {d} steps\n", .{ a, steps });

    var n: u32 = 27;
    var collatz: u32 = 0;
    while (n != 1) : (collatz += 1) {
        n = if (n % 2 == 0) n / 2 else 3 * n + 1;
    }
    std.debug.print("collatz steps: {d}\n", .{collatz});

    const items = [_]i32{ 4, 8, 15, 16, 23, 42 };
    var idx: usize = 0;
    var sum: i32 = 0;
    while (idx < items.len) : (idx += 1) {
        sum += items[idx];
    }
    std.debug.print("sum = {d}\n", .{sum});

    var maybe: ?u32 = 3;
    while (maybe) |value| : (maybe = if (value > 0) value - 1 else null) {
        std.debug.print("countdown {d}\n", .{value});
    }
}
