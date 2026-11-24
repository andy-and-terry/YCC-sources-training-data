const std = @import("std");

// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
pub fn main() void {
    var r: u64 = 0;
    var n: u32 = 1;
    while (n <= 8) : (n += 1) {
        r = r * 10 + 1;
        const note = if (r % 3 == 0) "  (divisible by 3)" else "";
        std.debug.print("{d}{s}\n", .{ r, note });
    }
}
