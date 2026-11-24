const std = @import("std");

// Hexagonal numbers: n(2n-1).
pub fn main() void {
    var n: u32 = 1;
    while (n <= 10) : (n += 1) std.debug.print("{d} ", .{n * (2 * n - 1)});
    std.debug.print("\n", .{});
}
