// Circular primes below 100 (digit rotation by arithmetic); expect 13.
const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

fn circular(n: u32) bool {
    var scale: u32 = 1;
    while (scale * 10 <= n) scale *= 10;
    var x = n;
    var digits: u32 = 0;
    var t = n;
    while (t > 0) : (t /= 10) digits += 1;
    var i: u32 = 0;
    while (i < digits) : (i += 1) {
        if (!isPrime(x)) return false;
        x = (x % 10) * scale + x / 10;
    }
    return true;
}

pub fn main() void {
    var c: u32 = 0;
    var n: u32 = 2;
    while (n < 100) : (n += 1) {
        if (circular(n)) c += 1;
    }
    std.debug.print("{d}\n", .{c});
}
