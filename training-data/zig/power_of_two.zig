const std = @import("std");

fn isPowerOfTwo(n: i32) bool {
    return n > 0 and (n & (n - 1)) == 0;
}

pub fn main() void {
    std.debug.print("{}\n", .{isPowerOfTwo(16)});
    std.debug.print("{}\n", .{isPowerOfTwo(18)});
}
