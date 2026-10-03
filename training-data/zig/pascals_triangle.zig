const std = @import("std");

// Builds row n (0-indexed) of Pascal's triangle in place, updating
// from the right so each slot sees the previous row's value before
// it is overwritten.
fn pascalRow(row: []i32, n: usize) void {
    @memset(row, 0);
    row[0] = 1;
    for (1..n + 1) |i| {
        var j = i;
        while (j > 0) {
            row[j] += row[j - 1];
            j -= 1;
        }
    }
}

pub fn main() void {
    var row: [8]i32 = undefined;
    for (0..7) |n| {
        pascalRow(&row, n);
        std.debug.print("{any}\n", .{row[0 .. n + 1]});
    }
}
