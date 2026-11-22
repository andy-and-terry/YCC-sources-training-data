const std = @import("std");

// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
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
        if (isPrime(p) and isPrime(p + 2)) std.debug.print("{d} ", .{p});
    }
    std.debug.print("\n", .{});
}
