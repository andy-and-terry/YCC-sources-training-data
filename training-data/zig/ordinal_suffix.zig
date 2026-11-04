const std = @import("std");

fn suffix(n: u32) []const u8 {
    const r100 = n % 100;
    if (r100 >= 11 and r100 <= 13) return "th";
    return switch (n % 10) {
        1 => "st",
        2 => "nd",
        3 => "rd",
        else => "th",
    };
}

pub fn main() void {
    for ([_]u32{ 1, 2, 3, 4, 11, 12, 13, 21, 101, 111 }) |n| {
        std.debug.print("{d}{s} ", .{ n, suffix(n) });
    }
    std.debug.print("\n", .{});
}
