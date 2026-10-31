const std = @import("std");

fn isPowerful(value: u32) bool {
    var n = value;
    var p: u32 = 2;
    while (p * p <= n) : (p += 1) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return false;
            while (n % p == 0) n /= p;
        }
    }
    return n == 1;
}

pub fn main() void {
    var n: u32 = 1;
    while (n <= 100) : (n += 1) {
        if (isPowerful(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
