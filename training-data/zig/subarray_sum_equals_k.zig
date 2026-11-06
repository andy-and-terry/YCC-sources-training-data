// Count contiguous subarrays whose sum equals k (O(n^2) running sums).
const std = @import("std");

fn countSubarrays(nums: []const i32, k: i32) u32 {
    var count: u32 = 0;
    for (0..nums.len) |i| {
        var sum: i32 = 0;
        for (nums[i..]) |x| {
            sum += x;
            if (sum == k) count += 1;
        }
    }
    return count;
}

pub fn main() void {
    std.debug.print("{d}\n", .{countSubarrays(&[_]i32{ 1, 1, 1 }, 2)});
}
