const std = @import("std");

fn factorial(comptime n: comptime_int) comptime_int {
    return if (n <= 1) 1 else n * factorial(n - 1);
}

pub fn main() void {
    // comptime_int has no fixed width; 25! is far beyond u64.
    const big = comptime factorial(25);
    std.debug.print("25! = {d}\n", .{big});
    const small: u8 = comptime factorial(5) / 2;
    std.debug.print("5!/2 = {d}\n", .{small});
}
