const std = @import("std");

const Dir = enum { north, east, south, west };

fn turn(d: Dir) Dir {
    return switch (d) {
        .north => .east,
        .east => .south,
        .south => .west,
        .west => .north,
    };
}

pub fn main() void {
    std.debug.print("{s}\n", .{@tagName(turn(.west))});
}
