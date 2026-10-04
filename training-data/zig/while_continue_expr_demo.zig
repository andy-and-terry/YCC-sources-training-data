const std = @import("std");

pub fn main() void {
    var i: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 3 == 0) continue;
        std.debug.print("{d} ", .{i});
    }
    std.debug.print("\n", .{});

    var a: u32 = 0;
    var b: u32 = 1;
    var steps: u32 = 0;
    while (b < 100) : ({
        const t = a + b;
        a = b;
        b = t;
        steps += 1;
    }) {}
    std.debug.print("first fib >= 100 is {d} after {d} steps\n", .{ b, steps });

    var items = [_]?u32{ 3, 1, null, 4 };
    var idx: usize = 0;
    while (idx < items.len) : (idx += 1) {
        while (items[idx]) |*v| {
            std.debug.print("item {d} = {d}\n", .{ idx, v.* });
            break;
        } else {
            std.debug.print("item {d} is null\n", .{idx});
        }
    }
}
