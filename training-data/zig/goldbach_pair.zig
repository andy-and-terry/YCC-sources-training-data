const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % d == 0) return false;
    }
    return true;
}

// Goldbach pair returned as an optional struct.
fn goldbach(n: u32) ?struct { u32, u32 } {
    var p: u32 = 2;
    while (p <= n / 2) : (p += 1) {
        if (isPrime(p) and isPrime(n - p)) return .{ p, n - p };
    }
    return null;
}

pub fn main() void {
    if (goldbach(28)) |pair| std.debug.print("{d} + {d}\n", .{ pair[0], pair[1] });
}
