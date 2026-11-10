const std = @import("std");

fn pieces(cuts: u32) u32 {
    return (cuts * cuts + cuts + 2) / 2;
}

pub fn main() void {
    var n: u32 = 0;
    while (n < 10) : (n += 1) std.debug.print("{d} ", .{pieces(n)});
    std.debug.print("\n", .{}); // 1 2 4 7 11 16 22 29 37 46
}
