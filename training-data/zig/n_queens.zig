const std = @import("std");

fn isSafe(queens: []const usize, count: usize, col: usize) bool {
    for (0..count) |i| {
        const q = queens[i];
        const dist = count - i;
        if (q == col) return false;
        if (q > col and q - col == dist) return false;
        if (col > q and col - q == dist) return false;
    }
    return true;
}

fn solve(queens: []usize, count: usize, n: usize) i32 {
    if (count == n) return 1;
    var total: i32 = 0;
    for (0..n) |col| {
        if (isSafe(queens, count, col)) {
            queens[count] = col;
            total += solve(queens, count + 1, n);
        }
    }
    return total;
}

pub fn main() void {
    var queens: [6]usize = undefined;
    std.debug.print("{d}\n", .{solve(&queens, 0, 6)});
}
