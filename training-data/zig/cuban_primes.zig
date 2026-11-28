const std = @import("std");

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

pub fn main() void {
    var found: u32 = 0;
    var y: u64 = 1;
    while (found < 8) : (y += 1) {
        const p = 3 * y * y + 3 * y + 1;
        if (isPrime(p)) {
            std.debug.print("{d} ", .{p});
            found += 1;
        }
    }
    std.debug.print("\n", .{});
}
