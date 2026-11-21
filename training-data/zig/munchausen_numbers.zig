const std = @import("std");

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
fn isMunchausen(n: u32) bool {
    var sum: u32 = 0;
    var m = n;
    while (m > 0) : (m /= 10) {
        const d = m % 10;
        if (d > 0) sum += std.math.pow(u32, d, d);
    }
    return sum == n;
}

pub fn main() void {
    var n: u32 = 1;
    while (n < 5000) : (n += 1) {
        if (isMunchausen(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
