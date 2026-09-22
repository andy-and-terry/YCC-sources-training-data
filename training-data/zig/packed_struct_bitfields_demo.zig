const std = @import("std");

const Flags = packed struct {
    read: bool,
    write: bool,
    execute: bool,
    reserved: u5 = 0,
};

comptime {
    std.debug.assert(@sizeOf(Flags) == 1);
}

pub fn main() void {
    const f = Flags{ .read = true, .write = true, .execute = false };
    const raw: u8 = @bitCast(f);
    std.debug.print("size={d} raw=0b{b:0>8}\n", .{ @sizeOf(Flags), raw });
}
