// Emirps: primes whose digit reversal is a different prime.
const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var i: u32 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

fn reverse(n: u32) u32 {
    var r: u32 = 0;
    var m = n;
    while (m > 0) : (m /= 10) r = r * 10 + m % 10;
    return r;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 100) : (n += 1) {
        const r = reverse(n);
        if (r != n and isPrime(n) and isPrime(r)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
