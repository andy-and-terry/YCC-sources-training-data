const std = @import("std");

fn minmax(a: i32, b: i32) struct { i32, i32 } {
    return if (a < b) .{ a, b } else .{ b, a };
}

pub fn main() void {
    const t = .{ 1, "two", 3.0 };
    std.debug.print("{d} {s} {d}\n", .{ t[0], t[1], t[2] });
    std.debug.print("len = {d}\n", .{t.len});
    const lo_hi = minmax(9, 4);
    std.debug.print("{d} {d}\n", .{ lo_hi[0], lo_hi[1] });
    const named = .{ .name = "zig", .year = 2016 };
    std.debug.print("{s} {d}\n", .{ named.name, named.year });
}
