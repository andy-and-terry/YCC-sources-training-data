const std = @import("std");

// Leyland numbers: x^y + y^x for x >= y >= 2.
fn leyland(x: u64, y: u64) u64 {
    return std.math.pow(u64, x, y) + std.math.pow(u64, y, x);
}

pub fn main() void {
    var x: u64 = 2;
    while (x <= 4) : (x += 1) {
        var y: u64 = 2;
        while (y <= x) : (y += 1) {
            std.debug.print("{d} ", .{leyland(x, y)});
        }
    }
    std.debug.print("\n", .{});
}
