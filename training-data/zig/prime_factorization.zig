const std = @import("std");

fn primeFactors(n_in: u64, out: []u64) usize {
    var n = n_in;
    var count: usize = 0;
    var d: u64 = 2;
    while (d * d <= n) {
        while (n % d == 0) {
            out[count] = d;
            count += 1;
            n /= d;
        }
        d += 1;
    }
    if (n > 1) {
        out[count] = n;
        count += 1;
    }
    return count;
}

pub fn main() void {
    const inputs = [_]u64{ 360, 97, 1001 };
    var buf: [64]u64 = undefined;
    for (inputs) |n| {
        const k = primeFactors(n, &buf);
        std.debug.print("{d} = {any}\n", .{ n, buf[0..k] });
    }
}
