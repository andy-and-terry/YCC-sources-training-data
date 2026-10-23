const std = @import("std");

const Color = enum(u8) {
    red = 1,
    green = 2,
    blue = 4,
    _, // non-exhaustive: other values are allowed
};

const Level = enum { low, medium, high };

fn describe(c: Color) []const u8 {
    return switch (c) {
        .red => "red",
        .green => "green",
        .blue => "blue",
        _ => "unknown",
    };
}

pub fn main() void {
    const c = Color.green;
    std.debug.print("{s} = {d}\n", .{ @tagName(c), @intFromEnum(c) });

    // Int to enum; the result type comes from the declared type.
    const from_int: Color = @enumFromInt(4);
    std.debug.print("4 -> {s}\n", .{describe(from_int)});

    const odd: Color = @enumFromInt(99);
    std.debug.print("99 -> {s}\n", .{describe(odd)});

    // Safe parsing from a string.
    const parsed = std.meta.stringToEnum(Level, "medium");
    if (parsed) |lvl| {
        std.debug.print("parsed level index {d}\n", .{@intFromEnum(lvl)});
    }
    std.debug.print("bogus: {any}\n", .{std.meta.stringToEnum(Level, "extreme")});

    // Iterate all fields of an exhaustive enum.
    inline for (std.meta.fields(Level)) |f| {
        std.debug.print("field {s} = {d}\n", .{ f.name, f.value });
    }
}
