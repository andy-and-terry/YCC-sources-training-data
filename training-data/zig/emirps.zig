// Emirps below 200; expect 15.
const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

fn rev(n: u32) u32 {
    var m = n;
    var r: u32 = 0;
    while (m > 0) : (m /= 10) r = r * 10 + m % 10;
    return r;
}

pub fn main() void {
    var c: u32 = 0;
    var n: u32 = 2;
    while (n < 200) : (n += 1) {
        if (rev(n) != n and isPrime(n) and isPrime(rev(n))) c += 1;
    }
    std.debug.print("{d}\n", .{c});
}
