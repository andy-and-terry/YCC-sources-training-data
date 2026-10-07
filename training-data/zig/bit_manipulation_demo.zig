const std = @import("std");

pub fn main() void {
    const value: u32 = 0b0000_0000_0000_0000_0000_0000_0101_1010;

    std.debug.print("popcount: {d}\n", .{@popCount(value)});
    std.debug.print("leading zeros: {d}\n", .{@clz(value)});
    std.debug.print("trailing zeros: {d}\n", .{@ctz(value)});

    const a: u8 = 0b1100_1010;
    const b: u8 = 0b1010_1100;
    std.debug.print("and: 0b{b:0>8}\n", .{a & b});
    std.debug.print("or:  0b{b:0>8}\n", .{a | b});
    std.debug.print("xor: 0b{b:0>8}\n", .{a ^ b});
    std.debug.print("shl: 0b{b:0>8}\n", .{a << 1});
}
