const std = @import("std");

const fact = [10]u32{ 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };

fn isFactorion(n: u32) bool {
    var m = n;
    var sum: u32 = 0;
    while (m > 0) : (m /= 10) sum += fact[m % 10];
    return sum == n;
}

pub fn main() void {
    var n: u32 = 1;
    while (n < 50000) : (n += 1) {
        if (isFactorion(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
