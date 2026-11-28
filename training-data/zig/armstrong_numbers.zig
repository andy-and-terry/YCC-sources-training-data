const std = @import("std");

fn isArmstrong(n: u32) bool {
    var len: u32 = 0;
    var m = n;
    while (m > 0) : (m /= 10) len += 1;
    var sum: u32 = 0;
    m = n;
    while (m > 0) : (m /= 10) sum += std.math.pow(u32, m % 10, len);
    return sum == n;
}

pub fn main() void {
    var n: u32 = 1;
    while (n < 1000) : (n += 1) {
        if (isArmstrong(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{}); // 1..9 153 370 371 407
}
