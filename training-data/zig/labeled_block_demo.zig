const std = @import("std");

// Labeled blocks (`blk: { ... break :blk value; }`) let a multi-branch
// computation produce a value without a temporary `var`, and labeled loops
// let an inner loop skip straight to the next iteration of an outer one.
fn classify(n: i32) []const u8 {
    const label = blk: {
        if (n < 0) break :blk "negative";
        if (n == 0) break :blk "zero";
        if (@mod(n, 2) == 0) break :blk "positive-even";
        break :blk "positive-odd";
    };
    return label;
}

fn findPair(matrix: []const []const i32, target: i32) ?[2]usize {
    outer: for (matrix, 0..) |row, i| {
        for (row, 0..) |value, j| {
            if (value == target) {
                return [2]usize{ i, j };
            }
            if (value > target) {
                continue :outer;
            }
        }
    }
    return null;
}

pub fn main() void {
    std.debug.print("{s}\n", .{classify(-5)});
    std.debug.print("{s}\n", .{classify(0)});
    std.debug.print("{s}\n", .{classify(4)});
    std.debug.print("{s}\n", .{classify(7)});

    const row0 = [_]i32{ 1, 3, 5 };
    const row1 = [_]i32{ 2, 4, 6 };
    const rows = [_][]const i32{ &row0, &row1 };
    const found = findPair(&rows, 4);
    if (found) |pos| {
        std.debug.print("found at {d},{d}\n", .{ pos[0], pos[1] });
    } else {
        std.debug.print("not found\n", .{});
    }
}
