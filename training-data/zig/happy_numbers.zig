const std = @import("std");

fn digitSquareSum(n: u32) u32 {
    var m = n;
    var s: u32 = 0;
    while (m > 0) : (m /= 10) s += (m % 10) * (m % 10);
    return s;
}

fn isHappy(n: u32) bool {
    var slow = n;
    var fast = n;
    while (true) {
        slow = digitSquareSum(slow);
        fast = digitSquareSum(digitSquareSum(fast));
        if (slow == fast) break;
    }
    return slow == 1;
}

pub fn main() void {
    var found: u32 = 0;
    var n: u32 = 1;
    while (found < 8) : (n += 1) {
        if (isHappy(n)) {
            std.debug.print("{d} ", .{n});
            found += 1;
        }
    }
    std.debug.print("\n", .{}); // 1 7 10 13 19 23 28 31
}
