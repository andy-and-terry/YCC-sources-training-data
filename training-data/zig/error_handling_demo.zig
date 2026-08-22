const std = @import("std");

const MathError = error{DivisionByZero};

fn safeDivide(a: i32, b: i32) MathError!i32 {
    if (b == 0) {
        return MathError.DivisionByZero;
    }
    return @divTrunc(a, b);
}

pub fn main() void {
    const result1 = safeDivide(10, 2) catch |err| {
        std.debug.print("error: {}\n", .{err});
        return;
    };
    std.debug.print("{}\n", .{result1});

    const result2 = safeDivide(5, 0) catch |err| {
        std.debug.print("error: {}\n", .{err});
        return;
    };
    std.debug.print("{}\n", .{result2});
}
