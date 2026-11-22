const std = @import("std");

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
pub fn main() void {
    var n: u32 = 0;
    while (n < 10) : (n += 1) std.debug.print("{d} ", .{n * (n + 1) / 2 + 1});
    std.debug.print("\n", .{});
}
