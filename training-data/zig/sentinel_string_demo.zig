const std = @import("std");

pub fn main() void {
    const s: [:0]const u8 = "hello";
    std.debug.print("len={d} first={c} sentinel={d}\n", .{ s.len, s[0], s[s.len] });

    var buf = [_:0]u8{ 'z', 'i', 'g', 0 };
    const p: [*:0]const u8 = &buf;
    std.debug.print("c string length={d}\n", .{std.mem.len(p)});
}
