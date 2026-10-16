const std = @import("std");

const Err = error{ TooSmall, TooLarge };

fn check(n: i32) Err!i32 {
    if (n < 0) return error.TooSmall;
    if (n > 100) return error.TooLarge;
    return n;
}

fn doubleChecked(n: i32) Err!i32 {
    const v = try check(n);
    return try check(v * 2);
}

pub fn main() void {
    for ([_]i32{ 10, 60, -5 }) |n| {
        if (doubleChecked(n)) |r| {
            std.debug.print("{d} -> {d}\n", .{ n, r });
        } else |e| {
            std.debug.print("{d} -> {s}\n", .{ n, @errorName(e) });
        }
    }
}
