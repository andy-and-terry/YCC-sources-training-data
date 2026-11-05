const std = @import("std");

pub fn main() void {
    var i: u32 = 0;
    var sum: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 1) continue;
        sum += i;
    }
    const found = blk: {
        for ([_]u32{ 3, 6, 9 }) |x| if (x > 4) break :blk x;
        break :blk 0;
    };
    std.debug.print("{} {}\n", .{ sum, found });
}
