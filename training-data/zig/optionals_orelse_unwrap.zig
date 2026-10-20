const std = @import("std");

fn find(items: []const i32, target: i32) ?usize {
    for (items, 0..) |x, i| if (x == target) return i;
    return null;
}

pub fn main() void {
    const items = [_]i32{ 5, 3, 8, 1 };
    const idx = find(&items, 8) orelse 99;
    const missing = find(&items, 7) orelse 99;
    std.debug.print("{d} {d}\n", .{ idx, missing });
    if (find(&items, 3)) |i| std.debug.print("found at {d}\n", .{i});
    var maybe: ?i32 = null;
    std.debug.print("{any}\n", .{maybe});
    maybe = 10;
    std.debug.print("{d}\n", .{maybe.?});
    var it = std.mem.tokenizeScalar(u8, "a b c", ' ');
    while (it.next()) |tok| std.debug.print("[{s}]", .{tok});
    std.debug.print("\n", .{});
}
