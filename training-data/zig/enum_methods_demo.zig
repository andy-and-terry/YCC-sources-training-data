const std = @import("std");

const Direction = enum(u8) {
    north,
    east,
    south,
    west,

    fn opposite(self: Direction) Direction {
        return switch (self) {
            .north => .south,
            .south => .north,
            .east => .west,
            .west => .east,
        };
    }

    fn turnRight(self: Direction) Direction {
        const next = (@intFromEnum(self) + 1) % 4;
        return @enumFromInt(next);
    }

    fn isVertical(self: Direction) bool {
        return self == .north or self == .south;
    }
};

const Color = enum {
    red,
    green,
    blue,

    pub const count = @typeInfo(Color).Enum.fields.len;
};

pub fn main() void {
    var d = Direction.north;
    var i: usize = 0;
    while (i < 5) : (i += 1) {
        std.debug.print("{s} (vertical: {any}) opposite {s}\n", .{ @tagName(d), d.isVertical(), @tagName(d.opposite()) });
        d = d.turnRight();
    }

    std.debug.print("raw value of west: {d}\n", .{@intFromEnum(Direction.west)});
    std.debug.print("color count: {d}\n", .{Color.count});

    const parsed = std.meta.stringToEnum(Color, "green");
    if (parsed) |c| {
        std.debug.print("parsed {s}\n", .{@tagName(c)});
    }
    std.debug.print("missing: {any}\n", .{std.meta.stringToEnum(Color, "purple")});
}
