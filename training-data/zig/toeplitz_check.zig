const std = @import("std");

fn isToeplitz(m: []const []const i32) bool {
    for (1..m.len) |i| {
        for (1..m[i].len) |j| {
            if (m[i][j] != m[i - 1][j - 1]) return false;
        }
    }
    return true;
}

pub fn main() void {
    const a = [_][]const i32{ &.{ 1, 2, 3 }, &.{ 4, 1, 2 }, &.{ 5, 4, 1 } };
    const b = [_][]const i32{ &.{ 1, 2 }, &.{ 2, 2 } };
    std.debug.print("{} {}\n", .{ isToeplitz(&a), isToeplitz(&b) });
}
