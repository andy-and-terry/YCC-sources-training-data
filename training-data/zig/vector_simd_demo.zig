const std = @import("std");

pub fn main() void {
    const a: @Vector(4, i32) = .{ 1, 2, 3, 4 };
    const b: @Vector(4, i32) = .{ 10, 20, 30, 40 };

    const sum = a + b;
    const product = a * b;

    std.debug.print("{any}\n", .{sum});
    std.debug.print("{any}\n", .{product});

    const total = @reduce(.Add, sum);
    std.debug.print("{d}\n", .{total});
}
