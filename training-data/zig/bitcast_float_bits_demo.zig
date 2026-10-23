const std = @import("std");

pub fn main() void {
    const x: f32 = 1.0;
    const bits: u32 = @bitCast(x);
    std.debug.print("1.0 bits = 0x{x}\n", .{bits});

    const sign: u32 = bits >> 31;
    const exponent: u32 = (bits >> 23) & 0xFF;
    const mantissa: u32 = bits & 0x7FFFFF;
    std.debug.print("sign={d} exp={d} mantissa={d}\n", .{ sign, exponent, mantissa });

    const back: f32 = @bitCast(@as(u32, 0x40490fdb));
    std.debug.print("back = {d:.5}\n", .{back});

    const neg: i32 = -1;
    const as_unsigned: u32 = @bitCast(neg);
    std.debug.print("-1 as u32 = {d}\n", .{as_unsigned});
}
