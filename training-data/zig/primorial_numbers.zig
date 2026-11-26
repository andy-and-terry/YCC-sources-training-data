// Primorials up to 1e6, including 1; expect 8.
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
    var acc: u64 = 1;
    var count: u32 = 1;
    var p: u32 = 2;
    std.debug.print("1\n", .{});
    while (true) : (p += 1) {
        if (!isPrime(p)) continue;
        acc *= p;
        if (acc > 1_000_000) break;
        count += 1;
        std.debug.print("{d}\n", .{acc});
    }
    std.debug.print("count: {d}\n", .{count});
}
