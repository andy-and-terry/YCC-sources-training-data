const std = @import("std");

const N = 3;

fn multiply(a: [N][N]i32, b: [N][N]i32) [N][N]i32 {
    var out: [N][N]i32 = undefined;
    for (0..N) |i| {
        for (0..N) |j| {
            var sum: i32 = 0;
            for (0..N) |k| {
                sum += a[i][k] * b[k][j];
            }
            out[i][j] = sum;
        }
    }
    return out;
}

fn printMatrix(m: [N][N]i32) void {
    for (m) |row| {
        for (row) |v| {
            std.debug.print("{d:>4}", .{v});
        }
        std.debug.print("\n", .{});
    }
}

pub fn main() void {
    const a = [N][N]i32{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    };
    var identity = std.mem.zeroes([N][N]i32);
    for (0..N) |i| identity[i][i] = 1;

    printMatrix(multiply(a, identity));
    std.debug.print("--\n", .{});
    printMatrix(multiply(a, a));

    var trace: i32 = 0;
    for (0..N) |i| trace += a[i][i];
    std.debug.print("trace = {d}\n", .{trace});

    const filled = [_][2]u8{.{ 1, 2 }} ** 3;
    std.debug.print("rows = {d}, cols = {d}, last = {d}\n", .{ filled.len, filled[0].len, filled[2][1] });
}
