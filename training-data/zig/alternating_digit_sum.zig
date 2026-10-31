const std = @import("std");

fn alternatingDigitSum(value: i64) i64 {
    var n = value;
    var total: i64 = 0;
    var sign: i64 = 1;
    while (n > 0) : (n = @divTrunc(n, 10)) {
        total += sign * @rem(n, 10);
        sign = -sign;
    }
    return total;
}

pub fn main() void {
    for ([_]i64{ 1234, 99999, 1000 }) |n| {
        std.debug.print("{d} {d}\n", .{ n, alternatingDigitSum(n) });
    }
}
