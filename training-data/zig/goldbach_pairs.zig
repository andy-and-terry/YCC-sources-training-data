const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

pub fn main() void {
    const n: u32 = 28;
    var p: u32 = 2;
    while (p <= n / 2) : (p += 1) {
        if (isPrime(p) and isPrime(n - p)) std.debug.print("{d} + {d}\n", .{ p, n - p });
    }
}
