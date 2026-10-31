const std = @import("std");

fn primeFactorCount(value: u32) u32 {
    var n = value;
    var count: u32 = 0;
    var p: u32 = 2;
    while (p * p <= n) : (p += 1) {
        while (n % p == 0) {
            n /= p;
            count += 1;
        }
    }
    return if (n > 1) count + 1 else count;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 30) : (n += 1) {
        if (primeFactorCount(n) == 2) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
