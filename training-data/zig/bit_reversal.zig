const std = @import("std");

fn reverseBits(value: u8) u8 {
    return @bitReverse(value);
}

pub fn main() void {
    const inputs = [_]u8{ 1, 6, 13, 128 };
    for (inputs) |v| {
        std.debug.print("{d} {d}\n", .{ v, reverseBits(v) }); // 128 96 176 1
    }
}
