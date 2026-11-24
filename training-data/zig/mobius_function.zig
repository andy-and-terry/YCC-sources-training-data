const std = @import("std");

// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
fn mobius(start: u32) i32 {
    var n = start;
    var result: i32 = 1;
    var p: u32 = 2;
    while (p * p <= n) : (p += 1) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return 0;
            result = -result;
        }
    }
    return if (n > 1) -result else result;
}

pub fn main() void {
    var n: u32 = 1;
    while (n <= 30) : (n += 1) std.debug.print("{d} ", .{mobius(n)});
    std.debug.print("\n", .{});
}
