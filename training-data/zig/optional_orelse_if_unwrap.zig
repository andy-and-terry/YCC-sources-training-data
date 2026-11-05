const std = @import("std");

fn find(xs: []const i32, want: i32) ?usize {
    for (xs, 0..) |x, i| if (x == want) return i;
    return null;
}

pub fn main() void {
    const xs = [_]i32{ 4, 8, 15 };
    std.debug.print("{}\n", .{find(&xs, 8) orelse 99});
    if (find(&xs, 7)) |i| {
        std.debug.print("at {}\n", .{i});
    } else {
        std.debug.print("missing\n", .{});
    }
}
