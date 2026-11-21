const std = @import("std");

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
fn powMod(b0: u64, e0: u64, m: u64) u64 {
    var b = b0 % m;
    var e = e0;
    var r: u64 = 1;
    while (e > 0) : (e >>= 1) {
        if (e & 1 == 1) r = r * b % m;
        b = b * b % m;
    }
    return r;
}

fn isPrime(n: u64) bool {
    var p: u64 = 2;
    while (p * p <= n) : (p += 1) {
        if (n % p == 0) return false;
    }
    return n > 1;
}

fn isCarmichael(n: u64) bool {
    if (isPrime(n)) return false;
    var a: u64 = 2;
    while (a < n) : (a += 1) {
        if (std.math.gcd(a, n) == 1 and powMod(a, n - 1, n) != 1) return false;
    }
    return true;
}

pub fn main() void {
    var n: u64 = 3;
    while (n < 3000) : (n += 2) {
        if (isCarmichael(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
