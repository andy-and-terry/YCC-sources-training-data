// Deficient numbers below 100; expect 76.
const std = @import("std");

fn properSum(n: u32) u32 {
    var t: u32 = 0;
    var d: u32 = 1;
    while (d < n) : (d += 1) {
        if (n % d == 0) t += d;
    }
    return t;
}

pub fn main() void {
    var c: u32 = 0;
    var n: u32 = 1;
    while (n < 100) : (n += 1) {
        if (properSum(n) < n) c += 1;
    }
    std.debug.print("{d}\n", .{c});
}
