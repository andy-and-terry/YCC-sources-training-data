const std = @import("std");

fn popcount(n_in: u64) u32 {
    var n = n_in;
    var c: u32 = 0;
    while (n != 0) : (c += 1) n &= n - 1;
    return c;
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ popcount(0xB7), @popCount(@as(u64, 0xB7)) });
}
