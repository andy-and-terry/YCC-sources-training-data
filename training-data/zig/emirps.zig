const std = @import("std");

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) if (n % i == 0) return false;
    return true;
}

fn reverse(n: u64) u64 {
    var x = n;
    var r: u64 = 0;
    while (x > 0) : (x /= 10) r = r * 10 + x % 10;
    return r;
}

pub fn main() void {
    var count: u32 = 0;
    var n: u64 = 2;
    while (count < 10) : (n += 1) {
        const r = reverse(n);
        if (r != n and isPrime(n) and isPrime(r)) {
            std.debug.print("{d} ", .{n});
            count += 1;
        }
    }
    std.debug.print("\n", .{}); // 13 17 31 37 71 73 79 97 107 113
}
