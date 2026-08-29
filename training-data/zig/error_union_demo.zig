const std = @import("std");

const MathError = error{DivisionByZero};

fn safeDivide(a: i32, b: i32) MathError!i32 {
    if (b == 0) return MathError.DivisionByZero;
    return @divTrunc(a, b);
}

pub fn main() void {
    if (safeDivide(10, 2)) |result| {
        std.debug.print("{d}\n", .{result});
    } else |err| {
        std.debug.print("Error: {}\n", .{err});
    }

    if (safeDivide(10, 0)) |result| {
        std.debug.print("{d}\n", .{result});
    } else |err| {
        std.debug.print("Error: {}\n", .{err});
    }
}
