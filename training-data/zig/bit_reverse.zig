const std = @import("std");

fn reverseBits(comptime T: type, value: T) T {
    var result: T = 0;
    var v = value;
    var i: usize = 0;
    while (i < @bitSizeOf(T)) : (i += 1) {
        result = (result << 1) | (v & 1);
        v >>= 1;
    }
    return result;
}

pub fn main() void {
    std.debug.print("{b:0>8}\n", .{reverseBits(u8, 0b00010011)});
    std.debug.print("{x}\n", .{reverseBits(u16, 0x0001)});
    std.debug.print("builtin: {b:0>8}\n", .{@bitReverse(@as(u8, 0b00010011))});
}
