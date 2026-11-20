const std = @import("std");

// Wilson's theorem primality test.
fn wilson(n: u64) bool {
    if (n < 2) return false;
    var f: u64 = 1;
    var i: u64 = 2;
    while (i < n) : (i += 1) f = f * i % n;
    return f == n - 1;
}

pub fn main() void {
    var n: u64 = 2;
    while (n < 20) : (n += 1) {
        if (wilson(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
