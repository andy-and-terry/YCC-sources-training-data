const std = @import("std");

fn equilibriumIndex(nums: []const i32) i32 {
    var total: i32 = 0;
    for (nums) |v| total += v;
    var left: i32 = 0;
    for (nums, 0..) |v, i| {
        if (left == total - left - v) return @intCast(i);
        left += v;
    }
    return -1;
}

pub fn main() void {
    std.debug.print("{d}\n", .{equilibriumIndex(&[_]i32{ 1, 7, 3, 6, 5, 6 })}); // 3
}
