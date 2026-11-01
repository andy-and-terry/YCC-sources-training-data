const std = @import("std");

// Positive n expressible as a*a + b*b with a, b >= 0.
fn representable(n: u32) bool {
    var a: u32 = 0;
    while (a * a <= n) : (a += 1) {
        var b: u32 = a;
        while (a * a + b * b <= n) : (b += 1) {
            if (a * a + b * b == n) return true;
        }
    }
    return false;
}

pub fn main() void {
    var n: u32 = 1;
    while (n <= 30) : (n += 1) {
        if (representable(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
