const std = @import("std");

fn twoSum(nums: []const i32, target: i32) ?[2]usize {
    for (nums, 0..) |a, i| {
        for (nums[i + 1 ..], i + 1..) |b, j| {
            if (a + b == target) return [2]usize{ i, j };
        }
    }
    return null;
}

pub fn main() void {
    const nums = [_]i32{ 2, 7, 11, 15 };
    std.debug.print("{any}\n", .{twoSum(&nums, 9)});
}
