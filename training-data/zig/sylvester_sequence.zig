const std = @import("std");

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// u64 holds s(0)..s(6); stop before s(7) since Zig panics on overflow.
pub fn main() void {
    var s: u64 = 2;
    for (0..7) |i| {
        std.debug.print("s({d}) = {d}\n", .{ i, s });
        if (i < 6) s = s * s - s + 1;
    }
}
