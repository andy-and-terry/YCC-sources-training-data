const std = @import("std");

pub fn main() void {
    var arr = [_]u8{ 1, 2, 3, 4, 5, 6 };
    const mid = arr[1..4];
    mid[0] = 99;
    std.debug.print("{any} len={d}\n", .{ arr, mid.len });
    const s: [:0]const u8 = "hello";
    std.debug.print("{s} {d}\n", .{ s, s.len });
}
