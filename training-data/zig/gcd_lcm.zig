const std = @import("std");

fn myGcd(a: i32, b: i32) i32 {
    var x = a;
    var y = b;
    while (y != 0) {
        const t = y;
        y = @rem(x, y);
        x = t;
    }
    return @intCast(@abs(x));
}

fn myLcm(a: i32, b: i32) i32 {
    return @divTrunc(@abs(a * b), myGcd(a, b));
}

pub fn main() void {
    std.debug.print("{d}\n", .{myGcd(48, 18)});
    std.debug.print("{d}\n", .{myLcm(4, 6)});
}
