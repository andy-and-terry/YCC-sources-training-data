const std = @import("std");

pub fn main() void {
    const s: [:0]const u8 = "hello";
    const sub = s[1..4];
    std.debug.print("{s} {}\n", .{ sub, s.len });
}
