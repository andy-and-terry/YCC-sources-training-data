const std = @import("std");

const MathError = error{ DivByZero, Negative };

fn div(a: i32, b: i32) MathError!i32 {
    if (b == 0) return MathError.DivByZero;
    if (a < 0) return MathError.Negative;
    return @divTrunc(a, b);
}

pub fn main() void {
    const r = div(10, 0) catch |e| switch (e) {
        error.DivByZero => -1,
        error.Negative => -2,
    };
    std.debug.print("{}\n", .{r});
    std.debug.print("{}\n", .{div(9, 3) catch 0});
}
