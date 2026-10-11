const std = @import("std");

fn swap(comptime T: type, a: *T, b: *T) void {
    const tmp = a.*;
    a.* = b.*;
    b.* = tmp;
}

pub fn main() void {
    var x: i32 = 1;
    var y: i32 = 2;
    swap(i32, &x, &y);
    std.debug.print("x={d} y={d}\n", .{ x, y });

    var s1: []const u8 = "left";
    var s2: []const u8 = "right";
    swap([]const u8, &s1, &s2);
    std.debug.print("s1={s} s2={s}\n", .{ s1, s2 });
}
