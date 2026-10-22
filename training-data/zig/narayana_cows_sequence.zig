const std = @import("std");

// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
pub fn main() void {
    var n: [15]u32 = undefined;
    n[0] = 1;
    n[1] = 1;
    n[2] = 1;
    for (3..n.len) |i| n[i] = n[i - 1] + n[i - 3];
    for (n) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
