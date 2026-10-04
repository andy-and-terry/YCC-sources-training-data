const std = @import("std");

pub fn main() void {
    const a: u8 = 250;
    std.debug.print("wrapping add: {d}\n", .{a +% 10});
    std.debug.print("saturating add: {d}\n", .{a +| 10});
    std.debug.print("wrapping sub: {d}\n", .{@as(u8, 5) -% 10});
    std.debug.print("saturating sub: {d}\n", .{@as(u8, 5) -| 10});

    const result = @addWithOverflow(a, 10);
    std.debug.print("overflow add: value={d} overflowed={d}\n", .{ result[0], result[1] });

    const checked = std.math.add(u8, 200, 100) catch |err| blk: {
        std.debug.print("checked add failed: {s}\n", .{@errorName(err)});
        break :blk 0;
    };
    std.debug.print("checked = {d}\n", .{checked});

    std.debug.print("max u16 = {d}, min i8 = {d}\n", .{ std.math.maxInt(u16), std.math.minInt(i8) });
}
