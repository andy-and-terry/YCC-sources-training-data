const std = @import("std");

// Pell numbers: P(0) = 0, P(1) = 1, P(n) = 2*P(n-1) + P(n-2).
pub fn main() void {
    var p: [15]u32 = undefined;
    p[0] = 0;
    p[1] = 1;
    for (2..p.len) |n| p[n] = 2 * p[n - 1] + p[n - 2];
    for (p) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
