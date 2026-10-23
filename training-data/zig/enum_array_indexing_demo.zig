const std = @import("std");

const Color = enum { red, green, blue };

pub fn main() void {
    var counts = std.EnumArray(Color, u32).initFill(0);
    const seen = [_]Color{ .red, .blue, .blue, .green, .blue, .red };

    for (seen) |c| counts.set(c, counts.get(c) + 1);

    var it = counts.iterator();
    while (it.next()) |entry| {
        std.debug.print("{s}: {d}\n", .{ @tagName(entry.key), entry.value.* });
    }
}
