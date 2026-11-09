const std = @import("std");

const Value = union(enum) {
    int: i32,
    float: f64,
    none,
};

pub fn main() void {
    const vs = [_]Value{ .{ .int = 3 }, .{ .float = 1.5 }, .none };
    for (vs) |v| switch (v) {
        .int => |i| std.debug.print("int {d}\n", .{i}),
        .float => |f| std.debug.print("float {d}\n", .{f}),
        .none => std.debug.print("none\n", .{}),
    };
}
