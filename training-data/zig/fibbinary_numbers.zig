const std = @import("std");

// Fibbinary numbers: no two adjacent 1 bits.
pub fn main() void {
    var n: u32 = 0;
    while (n < 50) : (n += 1) {
        if (n & (n >> 1) == 0) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
