const std = @import("std");

const Cat = struct {
    fn speak() []const u8 {
        return "meow";
    }
};
const Dog = struct {
    fn speak() []const u8 {
        return "woof";
    }
};

fn sumFields(value: anytype) i64 {
    var total: i64 = 0;
    inline for (std.meta.fields(@TypeOf(value))) |field| {
        total += @field(value, field.name);
    }
    return total;
}

pub fn main() void {
    const animals = .{ Cat, Dog };
    inline for (animals) |T| {
        std.debug.print("{s} says {s}\n", .{ @typeName(T), T.speak() });
    }

    const Stats = struct { a: i32, b: i32, c: i32 };
    std.debug.print("sum = {d}\n", .{sumFields(Stats{ .a = 1, .b = 20, .c = 300 })});

    const sizes = [_]type{ u8, u16, u32, u64 };
    inline for (sizes) |T| {
        std.debug.print("{s}: {d} bytes, max {d}\n", .{ @typeName(T), @sizeOf(T), std.math.maxInt(T) });
    }

    var count: usize = 0;
    inline for (0..4) |i| {
        count += i * i;
    }
    std.debug.print("sum of squares below 4: {d}\n", .{count});
}
