const std = @import("std");

fn classify(n: u32) []const u8 {
    return switch (n) {
        0 => "zero",
        1...9 => "digit",
        10, 20, 30 => "round",
        11...99 => "two digits",
        else => "big",
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
    const values = [_]u32{ 0, 5, 20, 42, 1000 };
    for (values) |v| {
        std.debug.print("{d}: {s}\n", .{ v, classify(v) });
    }
    std.debug.print("{c} {c} {c}\n", .{ grade(95), grade(85), grade(10) });
}
