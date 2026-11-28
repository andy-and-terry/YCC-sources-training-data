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
    var p: u32 = 3;
    while (p + 2 <= 50) : (p += 1) {
        if (isPrime(p) and isPrime(p + 2)) std.debug.print("({d}, {d})\n", .{ p, p + 2 });
    }
}
