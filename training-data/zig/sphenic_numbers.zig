const std = @import("std");

fn isSphenic(value: u32) bool {
    var n = value;
    var distinct: u32 = 0;
    var p: u32 = 2;
    while (p * p <= n) : (p += 1) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return false;
            distinct += 1;
        }
    }
    if (n > 1) distinct += 1;
    return distinct == 3;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 80) : (n += 1) {
        if (isSphenic(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
