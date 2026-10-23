const std = @import("std");

pub fn main() void {
    const data = [_]i32{ 1, 3, 5, 7, 9, 11 };

    var it = std.mem.window(i32, &data, 3, 1);
    while (it.next()) |w| {
        var sum: i32 = 0;
        for (w) |v| sum += v;
        std.debug.print("{any} sum={d}\n", .{ w, sum });
    }

    var chunks = std.mem.window(i32, &data, 2, 2);
    while (chunks.next()) |c| {
        std.debug.print("chunk {any}\n", .{c});
    }
}
