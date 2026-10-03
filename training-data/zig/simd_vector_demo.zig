const std = @import("std");

// @Vector gives portable SIMD: elementwise arithmetic/comparison compile to
// vector instructions where the target supports them, and @reduce folds a
// vector down to a scalar.
pub fn main() void {
    const a: @Vector(4, i32) = .{ 1, 2, 3, 4 };
    const b: @Vector(4, i32) = .{ 10, 20, 30, 40 };

    const sum = a + b;
    const product = a * b;
    const total = @reduce(.Add, sum);

    std.debug.print("{any}\n", .{sum});
    std.debug.print("{any}\n", .{product});
    std.debug.print("{d}\n", .{total});

    const mask = a > @as(@Vector(4, i32), @splat(2));
    std.debug.print("{any}\n", .{mask});
}
