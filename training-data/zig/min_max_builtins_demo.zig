const std = @import("std");

fn clamp(v: i32, lo: i32, hi: i32) i32 {
    return @max(lo, @min(v, hi));
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ @min(3, 7), @max(3, 7) });
    std.debug.print("{d}\n", .{@min(@as(i32, 4), 2, 9)});
    std.debug.print("{d} {d} {d}\n", .{ clamp(-5, 0, 10), clamp(5, 0, 10), clamp(50, 0, 10) });

    const items = [_]i32{ 4, -2, 9, 0, 7 };
    var lo = items[0];
    var hi = items[0];
    for (items[1..]) |v| {
        lo = @min(lo, v);
        hi = @max(hi, v);
    }
    std.debug.print("range [{d}, {d}]\n", .{ lo, hi });

    std.debug.print("{d} {d}\n", .{ @abs(@as(i32, -8)), std.math.sign(@as(i32, -8)) });
}
