const std = @import("std");

pub fn main() void {
    const nums = [_]u32{ 4, 1, 2, 1, 2 };
    var acc: u32 = 0;
    for (nums) |n| acc ^= n;
    std.debug.print("{d}\n", .{acc}); // 4
}
