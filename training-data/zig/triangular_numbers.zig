const std = @import("std");

pub fn main() void {
    var sum: u32 = 0;
    var n: u32 = 1;
    while (n <= 10) : (n += 1) {
        sum += n;
        std.debug.print("{d} ", .{sum});
    }
    std.debug.print("\n", .{});
}
