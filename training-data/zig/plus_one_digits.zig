const std = @import("std");

/// Increments in place; returns true if a carry-out digit is needed
/// (in which case every digit is now 0 and the caller prepends a 1).
fn plusOne(digits: []u8) bool {
    var i = digits.len;
    while (i > 0) {
        i -= 1;
        if (digits[i] < 9) {
            digits[i] += 1;
            return false;
        }
        digits[i] = 0;
    }
    return true;
}

pub fn main() void {
    var a = [_]u8{ 1, 2, 9 };
    _ = plusOne(&a);
    std.debug.print("{any}\n", .{a}); // { 1, 3, 0 }
    var b = [_]u8{ 9, 9 };
    const carry = plusOne(&b);
    std.debug.print("carry={} {any}\n", .{ carry, b }); // carry=true { 0, 0 }
}
