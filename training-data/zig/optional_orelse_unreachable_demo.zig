const std = @import("std");

fn findFirstEven(items: []const u32) ?u32 {
    for (items) |v| if (v % 2 == 0) return v;
    return null;
}

pub fn main() void {
    const a = [_]u32{ 3, 5, 8, 9 };
    const b = [_]u32{ 1, 3, 5 };
    const first = findFirstEven(&a) orelse 0;
    const none = findFirstEven(&b) orelse 999;
    const known = findFirstEven(&a).?;
    std.debug.print("{d} {d} {d}\n", .{ first, none, known });
    if (findFirstEven(&b)) |v| {
        std.debug.print("found {d}\n", .{v});
    } else {
        std.debug.print("no even value\n", .{});
    }
}
