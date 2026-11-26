// Sexy primes below 100; expect 16 pairs.
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
    var c: u32 = 0;
    var p: u32 = 2;
    while (p < 100) : (p += 1) {
        if (isPrime(p) and isPrime(p + 6)) c += 1;
    }
    std.debug.print("{d}\n", .{c});
}
