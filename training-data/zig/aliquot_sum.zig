const std = @import("std");

fn aliquot(n: u32) u32 {
    var s: u32 = 0;
    var d: u32 = 1;
    while (d < n) : (d += 1) {
        if (n % d == 0) s += d;
    }
    return s;
}

pub fn main() void {
    for ([_]u32{ 6, 12, 15, 28 }) |n| {
        const a = aliquot(n);
        const kind = if (a == n) "perfect" else if (a > n) "abundant" else "deficient";
        std.debug.print("{d} {d} {s}\n", .{ n, a, kind });
    }
}
