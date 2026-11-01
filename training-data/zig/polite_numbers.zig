const std = @import("std");

// Ways to write n as a sum of two or more consecutive positive integers.
fn politeWays(n: u32) u32 {
    var ways: u32 = 0;
    var k: u32 = 2;
    while (k * (k + 1) / 2 <= n) : (k += 1) {
        if ((n - k * (k - 1) / 2) % k == 0) ways += 1;
    }
    return ways;
}

pub fn main() void {
    var n: u32 = 1;
    while (n <= 16) : (n += 1) {
        std.debug.print("{d} ", .{politeWays(n)});
    }
    std.debug.print("\n", .{});
}
