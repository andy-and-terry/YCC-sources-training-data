const std = @import("std");

fn binarySearch(arr: []const i32, target: i32) ?usize {
    var low: usize = 0;
    var high: usize = arr.len - 1;
    while (low <= high) {
        const mid = (low + high) / 2;
        if (arr[mid] == target) return mid;
        if (arr[mid] < target) {
            low = mid + 1;
        } else {
            if (mid == 0) return null;
            high = mid - 1;
        }
    }
    return null;
}

pub fn main() void {
    const sorted = [_]i32{ 1, 3, 5, 7, 9, 11, 13 };
    std.debug.print("{any}\n", .{binarySearch(&sorted, 7)});
    std.debug.print("{any}\n", .{binarySearch(&sorted, 4)});
}
