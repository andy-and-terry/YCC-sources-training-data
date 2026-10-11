const std = @import("std");

pub fn main() void {
    const big: u32 = 0x1234_5678;
    const low: u8 = @truncate(big);
    std.debug.print("truncate: 0x{X}\n", .{low});

    const small: u8 = 200;
    const wide: i32 = small;
    std.debug.print("widened: {d}\n", .{wide});

    const neg: i32 = -1;
    const as_unsigned: u32 = @bitCast(neg);
    std.debug.print("bitcast: {d}\n", .{as_unsigned});

    const f: f32 = 3.99;
    const i: i32 = @intFromFloat(f);
    std.debug.print("intFromFloat: {d}\n", .{i});
    const back: f32 = @floatFromInt(i);
    std.debug.print("floatFromInt: {d}\n", .{back});
}
