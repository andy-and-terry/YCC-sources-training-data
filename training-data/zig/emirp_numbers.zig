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
    var m = n;
    var r: u32 = 0;
    while (m > 0) : (m /= 10) r = r * 10 + m % 10;
    return r;
}

pub fn main() void {
    var p: u32 = 2;
    while (p < 200) : (p += 1) {
        const r = reverse(p);
        if (r != p and isPrime(p) and isPrime(r)) std.debug.print("{d} ", .{p});
    }
    std.debug.print("\n", .{}); // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
}
