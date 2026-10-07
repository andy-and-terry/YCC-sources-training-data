const std = @import("std");

fn classify(n: i32) []const u8 {
    return switch (n) {
        std.math.minInt(i32)...-1 => "negative",
        0 => "zero",
        1, 2, 3 => "small",
        4...99 => "medium",
        else => "large",
    };
}

fn daysIn(month: u8, leap: bool) u8 {
    return switch (month) {
        1, 3, 5, 7, 8, 10, 12 => 31,
        4, 6, 9, 11 => 30,
        2 => if (leap) 29 else 28,
        else => 0,
    };
}

pub fn main() void {
    const samples = [_]i32{ -5, 0, 2, 50, 1000 };
    for (samples) |n| std.debug.print("{d}: {s}\n", .{ n, classify(n) });
    std.debug.print("{d} {d} {d}\n", .{ daysIn(1, false), daysIn(2, true), daysIn(4, false) });

}
