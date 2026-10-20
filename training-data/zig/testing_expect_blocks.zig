const std = @import("std");
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;

fn abs(n: i32) i32 {
    return if (n < 0) -n else n;
}

fn divide(a: i32, b: i32) !i32 {
    if (b == 0) return error.DivByZero;
    return @divTrunc(a, b);
}

test "abs" {
    try expect(abs(-5) == 5);
    try expectEqual(@as(i32, 7), abs(7));
}

test "divide errors" {
    try std.testing.expectError(error.DivByZero, divide(1, 0));
    try expectEqual(@as(i32, -3), try divide(-7, 2));
}

test "slices" {
    const a = [_]u8{ 1, 2, 3 };
    try std.testing.expectEqualSlices(u8, &a, a[0..]);
    try std.testing.expectEqualStrings("zig", "zig");
}

pub fn main() void {
    std.debug.print("run `zig test` to execute the tests\n", .{});
}
