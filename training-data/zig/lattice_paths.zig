const std = @import("std");

// Lattice paths with a DP row, evaluated at compile time.
fn lattice(comptime n: usize) u64 {
    var row = [_]u64{1} ** (n + 1);
    for (0..n) |_| {
        for (1..n + 1) |j| row[j] += row[j - 1];
    }
    return row[n];
}

pub fn main() void {
    const result = comptime lattice(3);
    std.debug.print("{d}\n", .{result});
}
