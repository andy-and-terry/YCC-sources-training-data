const std = @import("std");

const Point = struct { x: i32, y: i32, label: []const u8 };

pub fn main() void {
    const info = @typeInfo(Point).Struct;
    inline for (info.fields) |f| {
        std.debug.print("field {s}: {s}\n", .{ f.name, @typeName(f.type) });
    }
    std.debug.print("field count = {d}\n", .{info.fields.len});
}
