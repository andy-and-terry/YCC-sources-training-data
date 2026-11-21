const std = @import("std");

// Disarium numbers: digits raised to their 1-based positions sum to n.
fn isDisarium(n: u32) bool {
    var buf: [16]u8 = undefined;
    const s = std.fmt.bufPrint(&buf, "{d}", .{n}) catch unreachable;
    var sum: u32 = 0;
    for (s, 0..) |c, i| {
        sum += std.math.pow(u32, c - '0', @intCast(i + 1));
    }
    return sum == n;
}

pub fn main() void {
    var n: u32 = 1;
    while (n < 1000) : (n += 1) {
        if (isDisarium(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
