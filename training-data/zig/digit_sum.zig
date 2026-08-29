const std = @import("std");

fn digitSum(n: i32) i32 {
    var num = n;
    var total: i32 = 0;
    while (num > 0) {
        total += @rem(num, 10);
        num = @divTrunc(num, 10);
    }
    return total;
}

pub fn main() void {
    std.debug.print("{d}\n", .{digitSum(12345)});
}
