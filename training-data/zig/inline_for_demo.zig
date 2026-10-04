const std = @import("std");

const Point = struct { x: i32, y: i32, label: []const u8 };

pub fn main() void {
    // inline for unrolls at compile time and lets each iteration see a different type
    const values = .{ @as(u8, 7), @as(i32, -3), @as(f32, 1.5), "text", true };
    inline for (values, 0..) |v, i| {
        std.debug.print("{d}: {s} = {any}\n", .{ i, @typeName(@TypeOf(v)), v });
    }

    const p = Point{ .x = 3, .y = -4, .label = "p" };
    inline for (std.meta.fields(Point)) |field| {
        std.debug.print("field {s}: {any}\n", .{ field.name, @field(p, field.name) });
    }

    const types = [_]type{ u8, u16, u32, u64 };
    inline for (types) |T| {
        std.debug.print("{s}: {d} bits, max {d}\n", .{ @typeName(T), @bitSizeOf(T), std.math.maxInt(T) });
    }
}
