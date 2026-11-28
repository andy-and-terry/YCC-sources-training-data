const std = @import("std");

fn isAutomorphic(n: u64) bool {
    var mod: u64 = 1;
    var m = n;
    while (m > 0) : (m /= 10) mod *= 10;
    return (n * n) % mod == n;
}

pub fn main() void {
    var n: u64 = 1;
    while (n < 1000) : (n += 1) {
        if (isAutomorphic(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{}); // 1 5 6 25 76 376 625
}
