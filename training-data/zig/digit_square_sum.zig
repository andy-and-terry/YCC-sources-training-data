const std = @import("std");

fn digitSquareSum(n: i64) u64 {
    var m: u64 = @intCast(if (n < 0) -n else n);
    var sum: u64 = 0;
    while (m > 0) : (m /= 10) {
        const d = m % 10;
        sum += d * d;
    }
    return sum;
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ digitSquareSum(123), digitSquareSum(-99) });
}
