const std = @import("std");

// Cantor pairing function and its inverse.
fn pair(x: u64, y: u64) u64 {
    return (x + y) * (x + y + 1) / 2 + y;
}

fn unpair(z: u64) [2]u64 {
    const w: u64 = (std.math.sqrt(8 * z + 1) - 1) / 2;
    const y = z - w * (w + 1) / 2;
    return .{ w - y, y };
}

pub fn main() void {
    std.debug.print("{d}\n", .{pair(3, 4)});
    const p = unpair(32);
    std.debug.print("{d} {d}\n", .{ p[0], p[1] });
}
