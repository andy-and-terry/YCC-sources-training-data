const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var i: u32 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
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
    var p: u32 = 2;
    while (p < 100) : (p += 1) {
        if (isPrime(p) and rev(p) != p and isPrime(rev(p))) std.debug.print("{d} ", .{p});
    }
    std.debug.print("\n", .{});
}
