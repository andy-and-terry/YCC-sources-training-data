const std = @import("std");

fn cubeFromOdds(n: u64) u64 {
    const start = n * n - n + 1;
    var sum: u64 = 0;
    var i: u64 = 0;
    while (i < n) : (i += 1) sum += start + 2 * i;
    return sum;
}

pub fn main() void {
    var n: u64 = 1;
    while (n <= 5) : (n += 1) {
        std.debug.print("{d} {d} {}\n", .{ n, cubeFromOdds(n), cubeFromOdds(n) == n * n * n });
    }
}
