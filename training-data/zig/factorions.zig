const std = @import("std");

pub fn main() void {
    const fact = [10]u32{ 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };
    var n: u32 = 1;
    while (n < 50000) : (n += 1) {
        var s: u32 = 0;
        var m = n;
        while (m > 0) : (m /= 10) s += fact[m % 10];
        if (s == n) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{}); // 1 2 145 40585
}
