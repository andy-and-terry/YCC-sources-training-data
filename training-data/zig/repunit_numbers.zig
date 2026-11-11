// Repunits: numbers made only of the digit 1.
const std = @import("std");

pub fn main() void {
    var r: u64 = 0;
    for (0..5) |_| {
        r = r * 10 + 1;
        std.debug.print("{d} ", .{r});
    }
    std.debug.print("\n", .{});
}
