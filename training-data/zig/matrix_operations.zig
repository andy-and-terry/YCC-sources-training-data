const std = @import("std");

fn transpose(matrix: [2][2]i32) [2][2]i32 {
    var result: [2][2]i32 = undefined;
    for (0..2) |r| {
        for (0..2) |c| {
            result[c][r] = matrix[r][c];
        }
    }
    return result;
}

pub fn main() void {
    const a = [2][2]i32{ .{ 1, 2 }, .{ 3, 4 } };
    const t = transpose(a);
    std.debug.print("{any}\n", .{t});
}
