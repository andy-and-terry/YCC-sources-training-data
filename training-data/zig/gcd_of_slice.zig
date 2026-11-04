const std = @import("std");

fn gcd(a: u64, b: u64) u64 {
    var x = a;
    var y = b;
    while (y != 0) {
        const t = x % y;
        x = y;
        y = t;
    }
    return x;
}

fn gcdAll(nums: []const u64) u64 {
    var g: u64 = 0;
    for (nums) |n| g = gcd(g, n);
    return g;
}

pub fn main() void {
    std.debug.print("{d}\n", .{gcdAll(&.{ 12, 18, 24 })});
    std.debug.print("{d}\n", .{gcdAll(&.{ 7, 13 })});
}
