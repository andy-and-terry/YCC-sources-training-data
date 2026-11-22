const std = @import("std");

// Sophie Germain primes: p prime and 2p + 1 prime.
fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

pub fn main() void {
    var p: u32 = 2;
    while (p < 100) : (p += 1) {
        if (isPrime(p) and isPrime(2 * p + 1)) std.debug.print("{d} ", .{p});
    }
    std.debug.print("\n", .{});
}
