const std = @import("std");

fn rho(n: u64) u64 {
    if (n % 2 == 0) return 2;
    var x: u64 = 2;
    var y: u64 = 2;
    var d: u64 = 1;
    while (d == 1) {
        x = (x * x + 1) % n;
        y = (y * y + 1) % n;
        y = (y * y + 1) % n;
        d = std.math.gcd(if (x > y) x - y else y - x, n);
    }
    return d;
}

pub fn main() void {
    const n: u64 = 8051;
    const p = rho(n);
    std.debug.print("{d} = {d} * {d}\n", .{ n, p, n / p });
}
