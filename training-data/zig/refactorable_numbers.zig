const std = @import("std");

fn tau(n: u32) u32 {
    var c: u32 = 0;
    var d: u32 = 1;
    while (d <= n) : (d += 1) {
        if (n % d == 0) { c += 1; }
    }
    return c;
}

pub fn main() void {
    var n: u32 = 1;
    while (n < 60) : (n += 1) if (n % tau(n) == 0) std.debug.print("{d} ", .{n});
    std.debug.print("\n", .{}); // 1 2 8 9 12 18 24 36 40 56
}
