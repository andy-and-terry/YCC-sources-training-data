// Population count (number of set bits) for 0..15
const std = @import("std");

pub fn main() void {
    var n: u8 = 0;
    while (n < 16) : (n += 1) {
        std.debug.print("{d} ", .{@popCount(n)});
    }
    std.debug.print("\n", .{});
}
