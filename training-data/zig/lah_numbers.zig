const std = @import("std");

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fn fact(n: u64) u64 {
    var f: u64 = 1;
    var i: u64 = 2;
    while (i <= n) : (i += 1) f *= i;
    return f;
}

fn comb(n: u64, k: u64) u64 {
    return fact(n) / (fact(k) * fact(n - k));
}

pub fn main() void {
    const n: u64 = 5;
    var k: u64 = 1;
    while (k <= n) : (k += 1) std.debug.print("{d} ", .{comb(n - 1, k - 1) * fact(n) / fact(k)});
    std.debug.print("\n", .{});
}
