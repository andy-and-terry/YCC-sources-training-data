const std = @import("std");

const Config = struct {
    width: u32,
    height: u32,
    name: []const u8,
};

fn printFields(value: anytype) void {
    const T = @TypeOf(value);
    inline for (@typeInfo(T).Struct.fields) |field| {
        std.debug.print("{s} = {any}\n", .{ field.name, @field(value, field.name) });
    }
}

pub fn main() void {
    const cfg = Config{ .width = 800, .height = 600, .name = "demo" };
    printFields(cfg);
}
