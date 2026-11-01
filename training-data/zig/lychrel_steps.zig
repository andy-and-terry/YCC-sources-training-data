const std = @import("std");

fn reverseDigits(start: u64) u64 {
    var n = start;
    var r: u64 = 0;
    while (n > 0) : (n /= 10) r = r * 10 + n % 10;
    return r;
}

// Reverse-and-add until a palindrome; count the steps.
fn steps(start: u64) i32 {
    var n = start;
    var count: i32 = 0;
    while (count < 50) : (count += 1) {
        if (count > 0 and n == reverseDigits(n)) return count;
        n += reverseDigits(n);
    }
    return -1;
}

pub fn main() void {
    const starts = [_]u64{ 56, 57, 59, 79, 89 };
    for (starts) |s| std.debug.print("{d} ", .{steps(s)});
    std.debug.print("\n", .{});
}
