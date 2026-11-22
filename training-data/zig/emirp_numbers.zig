const std = @import("std");

// Emirps: primes whose digit reversal is a different prime.
fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

fn reverse(n: u32) u32 {
    var m = n;
    var r: u32 = 0;
    while (m > 0) : (m /= 10) r = r * 10 + m % 10;
    return r;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 200) : (n += 1) {
        const r = reverse(n);
        if (r != n and isPrime(n) and isPrime(r)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
