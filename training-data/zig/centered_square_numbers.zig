const std = @import("std");

// Centered square numbers: n^2 + (n+1)^2.
pub fn main() void {
    var n: u32 = 0;
    while (n < 10) : (n += 1) std.debug.print("{d} ", .{n * n + (n + 1) * (n + 1)});
    std.debug.print("\n", .{});
}
