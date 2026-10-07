const std = @import("std");

pub fn main() void {
    const max: u8 = 250;

    std.debug.print("wrapping: {d}\n", .{max +% 10});
    std.debug.print("saturating: {d}\n", .{max +| 10});
    std.debug.print("wrapping sub: {d}\n", .{@as(u8, 3) -% 5});
    std.debug.print("saturating sub: {d}\n", .{@as(u8, 3) -| 5});
    std.debug.print("saturating mul: {d}\n", .{@as(i8, 100) *| 3});
    std.debug.print("wrapping neg: {d}\n", .{-%@as(i8, -128)});

    const r = @addWithOverflow(max, @as(u8, 10));
    std.debug.print("addWithOverflow: value={d} overflowed={d}\n", .{ r[0], r[1] });

    const m = @mulWithOverflow(@as(u16, 300), @as(u16, 300));
    std.debug.print("mulWithOverflow: value={d} overflowed={d}\n", .{ m[0], m[1] });

    const big: i32 = 300;
    const small: u8 = @truncate(@as(u32, @intCast(big)));
    std.debug.print("truncate: {d}\n", .{small});

    const checked = std.math.add(u8, 200, 100) catch |err| blk: {
        std.debug.print("checked add failed: {s}\n", .{@errorName(err)});
        break :blk 0;
    };
    std.debug.print("{d}\n", .{checked});
}
