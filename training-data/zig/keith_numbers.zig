const std = @import("std");

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
fn isKeith(n: u32) bool {
    var seq: [64]u32 = undefined;
    var tmp: [10]u32 = undefined;
    var k: usize = 0;
    var m = n;
    while (m > 0) : (m /= 10) {
        tmp[k] = m % 10;
        k += 1;
    }
    for (0..k) |i| seq[i] = tmp[k - 1 - i];
    var len = k;
    while (seq[len - 1] < n) {
        var sum: u32 = 0;
        for (seq[len - k .. len]) |v| sum += v;
        seq[len] = sum;
        len += 1;
    }
    return seq[len - 1] == n;
}

pub fn main() void {
    var n: u32 = 10;
    while (n < 1200) : (n += 1) {
        if (isKeith(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
