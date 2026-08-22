const std = @import("std");

fn factorial(n: u64) u64 {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

pub fn main() void {
    var i: u64 = 0;
    while (i <= 10) : (i += 1) {
        std.debug.print("{} ", .{factorial(i)});
    }
    std.debug.print("\n", .{});
}
