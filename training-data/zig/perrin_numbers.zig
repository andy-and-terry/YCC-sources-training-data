const std = @import("std");

// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
pub fn main() void {
    var p: [15]u32 = undefined;
    p[0] = 3;
    p[1] = 0;
    p[2] = 2;
    for (3..p.len) |n| p[n] = p[n - 2] + p[n - 3];
    for (p) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
