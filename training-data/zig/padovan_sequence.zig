const std = @import("std");

// Padovan sequence: P(n) = P(n-2) + P(n-3), with P(0) = P(1) = P(2) = 1.
pub fn main() void {
    var p: [15]u32 = undefined;
    p[0] = 1;
    p[1] = 1;
    p[2] = 1;
    for (3..p.len) |n| p[n] = p[n - 2] + p[n - 3];
    for (p) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
