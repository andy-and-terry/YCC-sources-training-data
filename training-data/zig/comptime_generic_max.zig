const std = @import("std");

fn genericMax(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

pub fn main() void {
    std.debug.print("{d}\n", .{genericMax(i32, 3, 7)});
    std.debug.print("{d}\n", .{genericMax(f64, 2.5, 1.5)});
}
