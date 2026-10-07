const std = @import("std");

const Direction = enum {
    north,
    east,
    south,
    west,

    fn turnRight(self: Direction) Direction {
        return switch (self) {
            .north => .east,
            .east => .south,
            .south => .west,
            .west => .north,
        };
    }

    fn opposite(self: Direction) Direction {
        return self.turnRight().turnRight();
    }
};

pub fn main() void {
    var d = Direction.north;
    for (0..5) |_| {
        std.debug.print("{s} (opposite {s}, value {d})\n", .{ @tagName(d), @tagName(d.opposite()), @intFromEnum(d) });
        d = d.turnRight();
    }
}
