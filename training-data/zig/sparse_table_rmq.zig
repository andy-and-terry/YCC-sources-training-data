const std = @import("std");

// Sparse table for O(1) range-minimum queries after O(n log n)
// preprocessing, using overlapping power-of-two blocks.
const N = 9;
const LOG = 4;

fn log2Floor(n: usize) usize {
    var v = n;
    var acc: usize = 0;
    while (v > 1) {
        v /= 2;
        acc += 1;
    }
    return acc;
}

fn pow2(j: usize) usize {
    var result: usize = 1;
    for (0..j) |_| result *= 2;
    return result;
}

fn buildSparseTable(arr: [N]i32, table: *[LOG][N]i32) void {
    for (0..N) |i| table[0][i] = arr[i];
    for (1..LOG) |j| {
        var i: usize = 0;
        while (i + pow2(j) <= N) {
            const left = table[j - 1][i];
            const right = table[j - 1][i + pow2(j - 1)];
            table[j][i] = @min(left, right);
            i += 1;
        }
    }
}

fn queryMin(table: *const [LOG][N]i32, l: usize, r: usize) i32 {
    const len = r - l + 1;
    const j = log2Floor(len);
    const left = table[j][l];
    const right = table[j][r - pow2(j) + 1];
    return @min(left, right);
}

pub fn main() void {
    const arr = [N]i32{ 5, 2, 4, 7, 1, 3, 6, 0, 8 };
    var table: [LOG][N]i32 = undefined;
    buildSparseTable(arr, &table);

    std.debug.print("{d}\n", .{queryMin(&table, 1, 5)});
    std.debug.print("{d}\n", .{queryMin(&table, 0, 8)});
}
