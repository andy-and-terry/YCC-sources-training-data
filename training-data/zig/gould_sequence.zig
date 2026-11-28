const std = @import("std");

fn gould(n: u32) u32 {
    return @as(u32, 1) << @intCast(@popCount(n));
}

pub fn main() void {
    var n: u32 = 0;
    while (n < 16) : (n += 1) std.debug.print("{d} ", .{gould(n)});
    std.debug.print("\n", .{});
}
