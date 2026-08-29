const std = @import("std");

fn factorial(n: i32) i32 {
    var result: i32 = 1;
    var i: i32 = 1;
    while (i <= n) : (i += 1) {
        result *= i;
    }
    return result;
}

pub fn main() void {
    std.debug.print("{d}\n", .{factorial(10)});
}
