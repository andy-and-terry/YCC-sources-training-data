const std = @import("std");

fn binaryToDecimal(s: []const u8) i32 {
    return std.fmt.parseInt(i32, s, 2) catch unreachable;
}

pub fn main() void {
    std.debug.print("{d}\n", .{binaryToDecimal("1011")});
}
