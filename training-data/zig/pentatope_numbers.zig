const std = @import("std");

// n(n+1)(n+2)(n+3)/24
fn term(n: i64) i64 {
    return @divTrunc((((n * (n + 1)) * (n + 2)) * (n + 3)), 24);
}

pub fn main() void {
    var n: i64 = 1;
    while (n <= 15) : (n += 1) {
        std.debug.print("{d:>2} -> {d}\n", .{ n, term(n) });
    }
}
