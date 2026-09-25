const std = @import("std");

fn findFirstMatch(matrix: []const [3]i32, target: i32) ?[2]usize {
    var found: ?[2]usize = null;
    outer: for (matrix, 0..) |row, r| {
        for (row, 0..) |value, c| {
            if (value == target) {
                found = [2]usize{ r, c };
                break :outer;
            }
        }
    }
    return found;
}

fn sumEvenRows(matrix: []const [3]i32) i32 {
    var total: i32 = 0;
    rows: for (matrix, 0..) |row, r| {
        if (r % 2 != 0) continue :rows;
        for (row) |value| total += value;
    }
    return total;
}

pub fn main() void {
    const matrix = [_][3]i32{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    };

    std.debug.print("{any}\n", .{findFirstMatch(&matrix, 5)});
    std.debug.print("{any}\n", .{findFirstMatch(&matrix, 42)});
    std.debug.print("{d}\n", .{sumEvenRows(&matrix)});
}
