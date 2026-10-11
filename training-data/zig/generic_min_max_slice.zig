const std = @import("std");

fn minMax(comptime T: type, items: []const T) struct { min: T, max: T } {
    var lo = items[0];
    var hi = items[0];
    for (items[1..]) |v| {
        if (v < lo) lo = v;
        if (v > hi) hi = v;
    }
    return .{ .min = lo, .max = hi };
}

pub fn main() void {
    const ints = [_]i32{ 4, -2, 9, 0 };
    const floats = [_]f32{ 2.5, 1.25, 7.75 };
    const a = minMax(i32, &ints);
    const b = minMax(f32, &floats);
    std.debug.print("ints {d}..{d}\n", .{ a.min, a.max });
    std.debug.print("floats {d:.2}..{d:.2}\n", .{ b.min, b.max });
}
