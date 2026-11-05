const std = @import("std");

fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

pub fn main() void {
    std.debug.print("{} {d:.1}\n", .{ max(i32, 3, 9), max(f64, 2.5, 1.5) });
}
