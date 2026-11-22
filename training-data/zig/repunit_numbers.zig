const std = @import("std");

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
pub fn main() void {
    var r: u64 = 0;
    var i: u32 = 0;
    while (i < 8) : (i += 1) {
        r = r * 10 + 1;
        std.debug.print("{d} ", .{r});
    }
    std.debug.print("\n", .{});
}
