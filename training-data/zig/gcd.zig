const std = @import("std");

fn gcd(a: i32, b: i32) i32 {
    var x = a;
    var y = b;
    while (y != 0) {
        const temp = y;
        y = @mod(x, y);
        x = temp;
    }
    return x;
}

pub fn main() void {
    std.debug.print("{}\n", .{gcd(48, 18)});
    std.debug.print("{}\n", .{gcd(100, 75)});
}
