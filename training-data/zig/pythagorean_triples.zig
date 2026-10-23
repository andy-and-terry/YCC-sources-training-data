const std = @import("std");

pub fn main() void {
    const limit: u32 = 20;
    var a: u32 = 1;
    while (a < limit) : (a += 1) {
        var b: u32 = a;
        while (b < limit) : (b += 1) {
            const c2 = a * a + b * b;
            const c: u32 = std.math.sqrt(c2);
            if (c <= limit and c * c == c2) {
                std.debug.print("{d}^2 + {d}^2 = {d}^2\n", .{ a, b, c });
            }
        }
    }
}
