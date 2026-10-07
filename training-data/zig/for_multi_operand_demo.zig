const std = @import("std");

pub fn main() void {
    const names = [_][]const u8{ "ann", "bob", "cy" };
    const ages = [_]u32{ 31, 17, 45 };

    for (names, ages) |name, age| {
        std.debug.print("{s} is {d}\n", .{ name, age });
    }

    for (names, 0..) |name, i| {
        std.debug.print("{d}: {s}\n", .{ i, name });
    }

    var scores = [_]i32{ 1, 2, 3, 4 };
    for (&scores) |*s| {
        s.* *= 10;
    }
    std.debug.print("{any}\n", .{scores});

    var total: i32 = 0;
    for (scores, 1..) |s, weight| {
        total += s * @as(i32, @intCast(weight));
    }
    std.debug.print("weighted total {d}\n", .{total});
}
