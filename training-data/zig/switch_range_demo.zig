const std = @import("std");

fn classify(score: u8) []const u8 {
    return switch (score) {
        0...59 => "fail",
        60...69 => "pass",
        70...89 => "good",
        90...100 => "excellent",
        else => "invalid",
    };
}

fn charKind(c: u8) []const u8 {
    return switch (c) {
        'a'...'z', 'A'...'Z' => "letter",
        '0'...'9' => "digit",
        ' ', '\t', '\n' => "space",
        else => "other",
    };
}

pub fn main() void {
    const scores = [_]u8{ 42, 65, 80, 95, 120 };
    for (scores) |s| {
        std.debug.print("{d}: {s}\n", .{ s, classify(s) });
    }
    for ("a1 !") |c| {
        std.debug.print("'{c}': {s}\n", .{ c, charKind(c) });
    }
}
