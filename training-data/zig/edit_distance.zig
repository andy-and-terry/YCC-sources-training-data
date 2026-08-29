const std = @import("std");

fn editDistance(a: []const u8, b: []const u8) usize {
    var table: [10][10]usize = undefined;
    for (0..a.len + 1) |i| table[i][0] = i;
    for (0..b.len + 1) |j| table[0][j] = j;
    for (1..a.len + 1) |i| {
        for (1..b.len + 1) |j| {
            const cost: usize = if (a[i - 1] == b[j - 1]) 0 else 1;
            table[i][j] = @min(table[i - 1][j] + 1, @min(table[i][j - 1] + 1, table[i - 1][j - 1] + cost));
        }
    }
    return table[a.len][b.len];
}

pub fn main() void {
    std.debug.print("{d}\n", .{editDistance("kitten", "sitting")});
}
