const std = @import("std");

// Pentagonal numbers: n(3n-1)/2.
pub fn main() void {
    var n: u32 = 1;
    while (n <= 10) : (n += 1) std.debug.print("{d} ", .{n * (3 * n - 1) / 2});
    std.debug.print("\n", .{});
}
