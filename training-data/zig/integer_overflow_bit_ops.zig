const std = @import("std");

pub fn main() void {
    var a: u8 = 250;
    a +%= 10;
    std.debug.print("{d} ", .{a});
    const sat: u8 = 250 +| 10;
    std.debug.print("{d}\n", .{sat});
    const r = @addWithOverflow(@as(u8, 200), @as(u8, 100));
    std.debug.print("{d} overflow={d}\n", .{ r[0], r[1] });
    std.debug.print("{d} {d} {d} {d}\n", .{ 5 & 3, 5 | 3, 5 ^ 3, ~@as(u8, 5) });
    std.debug.print("{d} {d}\n", .{ @as(u32, 1) << 10, @as(u32, 1024) >> 3 });
    std.debug.print("{d} {d} {d}\n", .{ @popCount(@as(u32, 255)), @clz(@as(u32, 1)), @ctz(@as(u32, 8)) });
    std.debug.print("{d} {d} {d}\n", .{ @divTrunc(-7, 2), @divFloor(-7, 2), @mod(-7, 3) });
    std.debug.print("{d} {d}\n", .{ @rem(-7, 3), std.math.maxInt(i16) });
    const f: f32 = 3.99;
    std.debug.print("{d} {d} {d}\n", .{ @as(i32, @intFromFloat(f)), @as(f32, @floatFromInt(@as(i32, 7))) / 2, @round(f) });
    std.debug.print("{x} {b} {o}\n", .{ 255, 5, 8 });
    std.debug.print("{d} {d}\n", .{ std.math.pow(u32, 2, 10), std.math.sqrt(@as(f64, 144)) });
}
