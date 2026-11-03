const std = @import("std");

fn isPerfectSquare(n: u64) bool {
    const r = std.math.sqrt(n);
    return r * r == n;
}

pub fn main() void {
    var n: u64 = 0;
    while (n < 30) : (n += 1) {
        if (isPerfectSquare(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
