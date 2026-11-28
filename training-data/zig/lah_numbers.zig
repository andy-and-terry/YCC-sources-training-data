const std = @import("std");

fn lah(n: u64, k: u64) u64 {
    var c: u64 = 1;
    var i: u64 = 0;
    while (i + 1 < k) : (i += 1) c = c * (n - 1 - i) / (i + 1);
    var f: u64 = 1;
    var j: u64 = k + 1;
    while (j <= n) : (j += 1) f *= j;
    return c * f;
}

pub fn main() void {
    var n: u64 = 1;
    while (n <= 5) : (n += 1) {
        var k: u64 = 1;
        while (k <= n) : (k += 1) std.debug.print("{d} ", .{lah(n, k)});
        std.debug.print("\n", .{});
    }
}
