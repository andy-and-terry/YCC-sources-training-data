const std = @import("std");

fn sum(a: anytype, b: anytype) @TypeOf(a, b) {
    return a + b;
}

fn describe(value: anytype) void {
    const T = @TypeOf(value);
    switch (@typeInfo(T)) {
        .Int, .ComptimeInt => std.debug.print("integer: {d}\n", .{value}),
        .Float, .ComptimeFloat => std.debug.print("float: {d}\n", .{value}),
        else => std.debug.print("other type: {any}\n", .{value}),
    }
}

pub fn main() void {
    std.debug.print("{d}\n", .{sum(2, 3)});
    std.debug.print("{d}\n", .{sum(2.5, 1.5)});
    describe(42);
    describe(3.14);
    describe(true);
}
