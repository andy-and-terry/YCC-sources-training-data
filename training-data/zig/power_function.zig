const std = @import("std");

fn myPower(base: i32, exp: i32) i32 {
    if (exp == 0) return 1;
    if (@rem(exp, 2) == 0) {
        const half = myPower(base, @divTrunc(exp, 2));
        return half * half;
    }
    return base * myPower(base, exp - 1);
}

pub fn main() void {
    std.debug.print("{d}\n", .{myPower(2, 10)});
    std.debug.print("{d}\n", .{myPower(3, 5)});
}
