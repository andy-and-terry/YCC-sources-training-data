const std = @import("std");

fn pairWithSum(sorted: []const i32, target: i32) ?[2]i32 {
    if (sorted.len < 2) return null;
    var left: usize = 0;
    var right: usize = sorted.len - 1;
    while (left < right) {
        const sum = sorted[left] + sorted[right];
        if (sum == target) return [2]i32{ sorted[left], sorted[right] };
        if (sum < target) left += 1 else right -= 1;
    }
    return null;
}

pub fn main() void {
    const data = [_]i32{ 1, 3, 4, 6, 8, 11 };
    std.debug.print("{any}\n", .{pairWithSum(&data, 10)});
    std.debug.print("{any}\n", .{pairWithSum(&data, 100)});
}
