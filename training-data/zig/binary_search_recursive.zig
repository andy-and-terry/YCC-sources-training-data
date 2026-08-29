const std = @import("std");

fn binarySearch(arr: []const i32, low: i32, high: i32, target: i32) i32 {
    if (low > high) return -1;
    const mid = @divTrunc(low + high, 2);
    const val = arr[@intCast(mid)];
    if (val == target) return mid;
    if (val < target) return binarySearch(arr, mid + 1, high, target);
    return binarySearch(arr, low, mid - 1, target);
}

pub fn main() void {
    const data = [_]i32{ 1, 3, 5, 7, 9, 11 };
    std.debug.print("{d}\n", .{binarySearch(&data, 0, data.len - 1, 7)});
}
