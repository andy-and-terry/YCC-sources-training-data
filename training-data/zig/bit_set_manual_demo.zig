const std = @import("std");

pub fn main() void {
    var set: u64 = 0;
    const items = [_]u6{ 3, 7, 7, 12, 63 };
    for (items) |i| set |= @as(u64, 1) << i;

    std.debug.print("count = {d}\n", .{@popCount(set)});
    for (0..64) |i| {
        if ((set >> @intCast(i)) & 1 == 1) std.debug.print("{d} ", .{i});
    }
    std.debug.print("\nlowest = {d}, highest = {d}\n", .{ @ctz(set), 63 - @clz(set) });
}
