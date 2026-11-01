const std = @import("std");

// n is triangular iff 8n + 1 is a perfect square.
fn isTriangular(n: u32) bool {
    const s = 8 * n + 1;
    const r: u32 = std.math.sqrt(s);
    return r * r == s;
}

pub fn main() void {
    var n: u32 = 0;
    while (n <= 20) : (n += 1) {
        if (isTriangular(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
