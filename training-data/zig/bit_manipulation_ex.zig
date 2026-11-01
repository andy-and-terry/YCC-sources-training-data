const std = @import("std");

pub fn main() void {
    const x: u32 = 0b1011_0000;
    std.debug.print("{d} {d} {d}\n", .{ @popCount(x), @clz(x), @ctz(x) });
    std.debug.print("{b}\n", .{x >> 4 | 1 << 8});
    const wrapped: u8 = 250 +% 10;
    std.debug.print("{d}\n", .{wrapped});
}
