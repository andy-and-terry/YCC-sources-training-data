const std = @import("std");

fn isPronic(x: u64) bool {
    const n: u64 = std.math.sqrt(x);
    return n * (n + 1) == x;
}

pub fn main() void {
    var n: u64 = 0;
    while (n < 10) : (n += 1) std.debug.print("{d} ", .{n * (n + 1)});
    std.debug.print("\n", .{}); // 0 2 6 12 20 30 42 56 72 90
    std.debug.print("{} {}\n", .{ isPronic(56), isPronic(57) }); // true false
}
