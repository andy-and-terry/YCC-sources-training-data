const std = @import("std");

fn rotateRight(comptime T: type, items: []T, k: usize) void {
    if (items.len == 0) return;
    const shift = k % items.len;
    std.mem.reverse(T, items);
    std.mem.reverse(T, items[0..shift]);
    std.mem.reverse(T, items[shift..]);
}

pub fn main() void {
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7 };
    rotateRight(i32, &nums, 3);
    std.debug.print("{any}\n", .{nums});
    rotateRight(i32, &nums, 7);
    std.debug.print("{any}\n", .{nums});
}
