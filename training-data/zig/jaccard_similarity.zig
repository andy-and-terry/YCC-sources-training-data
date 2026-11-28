const std = @import("std");

// sets are bitmasks over small non-negative integers
fn jaccard(a: u64, b: u64) f64 {
    const u = @popCount(a | b);
    if (u == 0) return 1.0;
    return @as(f64, @floatFromInt(@popCount(a & b))) / @as(f64, @floatFromInt(u));
}

pub fn main() void {
    const a: u64 = (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4);
    const b: u64 = (1 << 3) | (1 << 4) | (1 << 5);
    std.debug.print("{d:.2}\n", .{jaccard(a, b)});
}
