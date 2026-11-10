const std = @import("std");

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) if (n % i == 0) return false;
    return true;
}

pub fn main() void {
    var count: u32 = 0;
    var p: u64 = 2;
    while (count < 10) : (p += 1) {
        if (isPrime(p) and isPrime(2 * p + 1)) {
            std.debug.print("{d} ", .{p});
            count += 1;
        }
    }
    std.debug.print("\n", .{}); // 2 3 5 11 23 29 41 53 83 89
}
