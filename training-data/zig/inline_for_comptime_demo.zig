const std = @import("std");

fn describeAll(values: anytype) void {
    inline for (values) |value| {
        std.debug.print("{d} (type={s})\n", .{ value, @typeName(@TypeOf(value)) });
    }
}

pub fn main() void {
    describeAll(.{ 1, 2.5, @as(i64, 100) });

    comptime var total: i32 = 0;
    inline for ([_]i32{ 1, 2, 3, 4 }) |n| {
        total += n;
    }
    std.debug.print("comptime total: {d}\n", .{total});
}
