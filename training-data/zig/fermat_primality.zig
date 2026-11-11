// Fermat primality test; Carmichael number 561 fools it.
const std = @import("std");

fn powmod(base: u64, exp: u64, m: u64) u64 {
    var result: u64 = 1;
    var b = base % m;
    var e = exp;
    while (e > 0) : (e >>= 1) {
        if (e & 1 == 1) result = result * b % m;
        b = b * b % m;
    }
    return result;
}

fn probablyPrime(n: u64) bool {
    return n > 2 and powmod(2, n - 1, n) == 1;
}

pub fn main() void {
    for ([_]u64{ 97, 91, 561 }) |n| {
        std.debug.print("{d} {}\n", .{ n, probablyPrime(n) });
    }
}
