const std = @import("std");

// Bead (gravity) sort.
pub fn main() void {
    const nums = [_]usize{ 5, 3, 1, 4, 2 };
    var cols = [_]usize{0} ** 5;
    for (nums) |n| {
        for (0..n) |i| cols[i] += 1;
    }
    var rows: [5]usize = undefined;
    for (0..nums.len) |r| {
        var c: usize = 0;
        for (cols) |v| {
            if (v > r) c += 1;
        }
        rows[nums.len - 1 - r] = c;
    }
    std.debug.print("{any}\n", .{rows});
}
