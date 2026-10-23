const std = @import("std");

fn lucasLehmer(p: u6) bool {
    if (p == 2) return true;
    const m: u64 = (@as(u64, 1) << p) - 1;
    var s: u64 = 4;
    var k: u64 = 0;
    while (k < @as(u64, p) - 2) : (k += 1) {
        s = (s * s + m - 2) % m;
    }
    return s == 0;
}

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    const ps = [_]u6{ 2, 3, 5, 7, 11, 13, 17, 19 };
    var first = true;
    for (ps) |p| {
        if (!lucasLehmer(p)) continue;
        if (!first) try out.writeByte(' ');
        first = false;
        try out.print("{d}", .{p});
    }
    try out.writeByte('\n');
}
