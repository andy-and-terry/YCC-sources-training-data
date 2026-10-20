const std = @import("std");

pub fn main() void {
    const x = blk: {
        var sum: u32 = 0;
        for (1..11) |i| sum += @intCast(i);
        break :blk sum;
    };
    std.debug.print("{d}\n", .{x});
    outer: for (1..6) |i| {
        for (1..6) |j| {
            if (i * j == 12) {
                std.debug.print("found {d}x{d}\n", .{ i, j });
                break :outer;
            }
        }
    }
    var n: u32 = 27;
    var steps: u32 = 0;
    while (n != 1) : (steps += 1) n = if (n % 2 == 0) n / 2 else 3 * n + 1;
    std.debug.print("{d}\n", .{steps});
    const arr = [_]u8{ 'a', 'b', 'c' };
    for (arr, 0..) |c, i| std.debug.print("{d}{c} ", .{ i, c });
    std.debug.print("\n", .{});
    var count: usize = 0;
    for (0..20) |i| {
        if (i % 3 != 0) continue;
        count += 1;
    }
    std.debug.print("{d}\n", .{count});
    const r = while (true) {
        break @as(u8, 42);
    };
    std.debug.print("{d}\n", .{r});
}
