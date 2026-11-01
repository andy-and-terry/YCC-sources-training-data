const std = @import("std");

// Sum of prime factors counted with multiplicity.
fn sopfr(start: u32) u32 {
    var n = start;
    var total: u32 = 0;
    var p: u32 = 2;
    while (p * p <= n) : (p += 1) {
        while (n % p == 0) {
            total += p;
            n /= p;
        }
    }
    if (n > 1) total += n;
    return total;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 110) : (n += 1) {
        if (sopfr(n) == sopfr(n + 1)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
