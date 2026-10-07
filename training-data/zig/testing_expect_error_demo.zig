const std = @import("std");
const expectError = std.testing.expectError;
const expectEqual = std.testing.expectEqual;

const MathError = error{DivisionByZero};

fn safeDivide(a: i32, b: i32) MathError!i32 {
    if (b == 0) return MathError.DivisionByZero;
    return @divTrunc(a, b);
}

test "safeDivide returns a value for valid input" {
    try expectEqual(@as(i32, 5), try safeDivide(10, 2));
}

test "safeDivide reports division by zero" {
    try expectError(MathError.DivisionByZero, safeDivide(10, 0));
}

pub fn main() void {
    std.debug.print("{d}\n", .{safeDivide(10, 2) catch -1});
}
