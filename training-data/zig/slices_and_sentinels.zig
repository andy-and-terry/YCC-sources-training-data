const std = @import("std");

pub fn main() void {
    const arr = [_]u8{ 1, 2, 3, 4, 5 };
    const s = arr[1..4];
    std.debug.print("{any} len={d}\n", .{ s, s.len });
    const str: [:0]const u8 = "hello";
    std.debug.print("{s} {d}\n", .{ str, str.len });
}
