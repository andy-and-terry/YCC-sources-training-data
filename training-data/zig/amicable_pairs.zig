const std = @import("std");

// Amicable pairs below 1500 via sums of proper divisors.
fn s(n: u32) u32 {
    var t: u32 = 0;
    var d: u32 = 1;
    while (d < n) : (d += 1) {
        if (n % d == 0) t += d;
    }
    return t;
}

pub fn main() void {
    var a: u32 = 2;
    while (a < 1500) : (a += 1) {
        const b = s(a);
        if (b > a and s(b) == a) std.debug.print("{d} {d}\n", .{ a, b });
    }
}
