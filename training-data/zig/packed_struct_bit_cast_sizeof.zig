const std = @import("std");

const Flags = packed struct {
    a: bool,
    b: bool,
    mode: u6,
};

pub fn main() void {
    const f = Flags{ .a = true, .b = false, .mode = 5 };
    const raw: u8 = @bitCast(f);
    std.debug.print("{} {}\n", .{ @sizeOf(Flags), raw });
}
