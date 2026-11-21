const std = @import("std");

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
fn isBouncy(n: u32) bool {
    var inc = true;
    var dec = true;
    var prev = n % 10;
    var m = n / 10;
    while (m > 0) : (m /= 10) {
        const d = m % 10;
        if (d > prev) inc = false;
        if (d < prev) dec = false;
        prev = d;
    }
    return !inc and !dec;
}

pub fn main() void {
    var count: u32 = 0;
    var n: u32 = 1;
    while (n < 1000) : (n += 1) {
        if (isBouncy(n)) count += 1;
    }
    std.debug.print("{d}\n", .{count});
}
