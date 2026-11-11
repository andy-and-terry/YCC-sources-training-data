// Lazy caterer sequence: max pieces from n cuts
const std = @import("std");

fn term(n: i64) i64 {
    return @divTrunc((n * (n + 1)), 2) + 1;
}

pub fn main() void {
    var n: i64 = 0;
    while (n < 10) : (n += 1) {
        std.debug.print("{d} ", .{term(n)});
    }
    std.debug.print("\n", .{});
}
