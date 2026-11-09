const std = @import("std");

pub fn main() void {
    var i: u32 = 0;
    var sum: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 1) continue;
        sum += i;
    }
    std.debug.print("{d}\n", .{sum});
}
