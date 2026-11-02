const std = @import("std");

const Val = union(enum) { int: i64, flt: f64, none };

pub fn main() void {
    const vs = [_]Val{ .{ .int = 3 }, .{ .flt = 2.5 }, .none };
    for (vs) |v| switch (v) {
        .int => |i| std.debug.print("int {}\n", .{i}),
        .flt => |f| std.debug.print("flt {d}\n", .{f}),
        .none => std.debug.print("none\n", .{}),
    };
}
