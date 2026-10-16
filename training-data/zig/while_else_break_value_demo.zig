const std = @import("std");

fn firstSquareOver(limit: u32) u32 {
    var i: u32 = 1;
    return while (i < 1000) : (i += 1) {
        if (i * i > limit) break i * i;
    } else 0;
}

pub fn main() void {
    std.debug.print("{d}\n", .{firstSquareOver(50)});
    std.debug.print("{d}\n", .{firstSquareOver(2_000_000)});
}
