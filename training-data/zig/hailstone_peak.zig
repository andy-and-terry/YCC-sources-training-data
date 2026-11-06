// Highest value reached by the Collatz (hailstone) sequence from n.
const std = @import("std");

fn peak(start: u64) u64 {
    var n = start;
    var best = n;
    while (n != 1) {
        n = if (n % 2 == 0) n / 2 else 3 * n + 1;
        best = @max(best, n);
    }
    return best;
}

pub fn main() void {
    std.debug.print("{d}\n", .{peak(27)});
}
