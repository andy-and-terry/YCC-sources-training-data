const std = @import("std");

const Point = struct { x: i32, y: i32, z: i32 };

fn sumFields(p: Point) i32 {
    var total: i32 = 0;
    inline for (std.meta.fields(Point)) |f| {
        total += @field(p, f.name);
    }
    return total;
}

pub fn main() void {
    const p = Point{ .x = 1, .y = 2, .z = 3 };
    std.debug.print("sum = {d}\n", .{sumFields(p)});

    inline for (std.meta.fields(Point)) |f| {
        std.debug.print("{s} = {d}\n", .{ f.name, @field(p, f.name) });
    }

    inline for (.{ i8, i16, u32 }) |T| {
        std.debug.print("{s}: {d} bits\n", .{ @typeName(T), @bitSizeOf(T) });
    }
}
