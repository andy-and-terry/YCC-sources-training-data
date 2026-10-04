const std = @import("std");

fn classify(n: u32) []const u8 {
    return switch (n) {
        0 => "zero",
        1...9 => "single digit",
        10, 20, 30 => "round ten",
        11...99 => "double digit",
        else => "large",
    };
}

fn grade(score: u8) u8 {
    return switch (score) {
        90...100 => 'A',
        80...89 => 'B',
        70...79 => 'C',
        else => 'F',
    };
}

pub fn main() void {
    const inputs = [_]u32{ 0, 5, 20, 42, 1000 };
    for (inputs) |n| {
        std.debug.print("{d}: {s}\n", .{ n, classify(n) });
    }

    const scores = [_]u8{ 95, 85, 72, 10 };
    for (scores) |s| {
        std.debug.print("{d} -> {c}\n", .{ s, grade(s) });
    }

    const c: u8 = 'k';
    const kind = switch (c) {
        'a'...'z' => "lower",
        'A'...'Z' => "upper",
        '0'...'9' => "digit",
        else => "other",
    };
    std.debug.print("{c} is {s}\n", .{ c, kind });
}
