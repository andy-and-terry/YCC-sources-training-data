const std = @import("std");

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
fn isPractical(n: u6) bool {
    var reach: u64 = 1; // bit i set <=> i is a subset sum
    var d: u6 = 1;
    while (d <= n) : (d += 1) {
        if (n % d == 0) reach |= reach << d;
    }
    const mask: u64 = (@as(u64, 1) << (n + 1)) - 1;
    return (reach & mask) == mask;
}

pub fn main() void {
    var n: u6 = 1;
    while (n <= 40) : (n += 1) {
        if (isPractical(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
