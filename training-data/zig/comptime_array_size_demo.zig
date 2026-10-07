const std = @import("std");

fn sumArray(comptime n: usize, values: [n]i32) i32 {
    var total: i32 = 0;
    for (values) |v| total += v;
    return total;
}

fn identityMatrix(comptime n: usize) [n][n]i32 {
    var matrix: [n][n]i32 = undefined;
    for (0..n) |r| {
        for (0..n) |c| {
            matrix[r][c] = if (r == c) 1 else 0;
        }
    }
    return matrix;
}

pub fn main() void {
    const values = [_]i32{ 1, 2, 3, 4, 5 };
    std.debug.print("{d}\n", .{sumArray(5, values)});

    const identity = identityMatrix(3);
    std.debug.print("{any}\n", .{identity});
}
