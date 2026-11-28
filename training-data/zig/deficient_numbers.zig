const std = @import("std");

fn sigma(n: u32) u32 {
    var s: u32 = 0;
    var d: u32 = 1;
    while (d <= n) : (d += 1) {
        if (n % d == 0) s += d;
    }
    return s;
}

pub fn main() void {
    var n: u32 = 1;
    while (n <= 20) : (n += 1) {
        if (sigma(n) < 2 * n) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
