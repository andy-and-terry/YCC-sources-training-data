const std = @import("std");

fn classify(n: u32) []const u8 {
    return switch (n) {
        0 => "zero",
        1...9 => "single digit",
        10, 20, 30 => "round number",
        11...99 => "double digit",
        else => "large",
    };
}

fn charKind(c: u8) []const u8 {
    return switch (c) {
        'a'...'z' => "lower",
        'A'...'Z' => "upper",
        '0'...'9' => "digit",
        ' ', '\t', '\n' => "space",
        else => "other",
    };
}

pub fn main() void {
    const inputs = [_]u32{ 0, 7, 20, 42, 1000 };
    for (inputs) |n| {
        std.debug.print("{d}: {s}\n", .{ n, classify(n) });
    }
    for ("aZ5 !") |c| {
        std.debug.print("'{c}': {s}\n", .{ c, charKind(c) });
    }

    const x: i32 = -3;
    const sign: i8 = switch (x) {
        std.math.minInt(i32)...-1 => -1,
        0 => 0,
        else => 1,
    };
    std.debug.print("sign={d}\n", .{sign});
}
