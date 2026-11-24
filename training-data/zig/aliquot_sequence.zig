const std = @import("std");

// Aliquot sequence: replace n by the sum of its proper divisors.
fn aliquotSum(n: u32) u32 {
    var s: u32 = 0;
    var d: u32 = 1;
    while (d <= n / 2) : (d += 1) {
        if (n % d == 0) s += d;
    }
    return s;
}

pub fn main() void {
    var n: u32 = 12;
    std.debug.print("{d}", .{n});
    var i: u32 = 0;
    while (i < 20 and n > 1) : (i += 1) {
        n = aliquotSum(n);
        std.debug.print(" {d}", .{n});
    }
    std.debug.print("\n", .{});
}
