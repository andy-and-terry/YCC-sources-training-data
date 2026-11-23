const std = @import("std");

// 6n(n-1)+1
fn term(n: i64) i64 {
    return ((6 * n) * (n - 1)) + 1;
}

pub fn main() void {
    var n: i64 = 1;
    while (n <= 15) : (n += 1) {
        std.debug.print("{d:>2} -> {d}\n", .{ n, term(n) });
    }
}
