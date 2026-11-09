const std = @import("std");

const Flags = packed struct {
    read: bool,
    write: bool,
    exec: bool,
    _pad: u5 = 0,
};

pub fn main() void {
    const f = Flags{ .read = true, .write = false, .exec = true };
    std.debug.print("{d} size={d}\n", .{ @as(u8, @bitCast(f)), @sizeOf(Flags) });
}
