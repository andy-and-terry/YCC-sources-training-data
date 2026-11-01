const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

// Pernicious numbers: the popcount is prime.
pub fn main() void {
    var n: u32 = 1;
    while (n <= 20) : (n += 1) {
        if (isPrime(@popCount(n))) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
