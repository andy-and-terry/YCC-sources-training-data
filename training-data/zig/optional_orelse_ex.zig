const std = @import("std");

fn find(items: []const i32, target: i32) ?usize {
    for (items, 0..) |v, i| if (v == target) return i;
    return null;
}

pub fn main() void {
    const xs = [_]i32{ 4, 8, 15 };
    std.debug.print("{d} {d}\n", .{ find(&xs, 8) orelse 99, find(&xs, 1) orelse 99 });
    if (find(&xs, 15)) |i| std.debug.print("at {d}\n", .{i});
}
