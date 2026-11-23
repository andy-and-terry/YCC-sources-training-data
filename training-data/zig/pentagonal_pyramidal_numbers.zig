const std = @import("std");

// n^2(n+1)/2
fn term(n: i64) i64 {
    return @divTrunc(((n * n) * (n + 1)), 2);
}

pub fn main() void {
    var n: i64 = 1;
    while (n <= 15) : (n += 1) {
        std.debug.print("{d:>2} -> {d}\n", .{ n, term(n) });
    }
}
