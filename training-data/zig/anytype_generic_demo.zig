const std = @import("std");

fn printValue(value: anytype) void {
    std.debug.print("{any}\n", .{value});
}

fn addValues(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return a + b;
}

pub fn main() void {
    printValue(42);
    printValue(3.14);
    printValue(true);
    std.debug.print("{d}\n", .{addValues(2, 3)});
    std.debug.print("{d}\n", .{addValues(2.5, 1.5)});
}
