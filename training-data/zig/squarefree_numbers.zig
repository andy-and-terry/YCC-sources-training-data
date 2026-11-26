// Squarefree numbers up to 100; expect 61.
const std = @import("std");

fn squarefree(n: u32) bool {
    var d: u32 = 2;
    while (d * d <= n) : (d += 1) {
        if (n % (d * d) == 0) return false;
    }
    return true;
}

pub fn main() void {
    var c: u32 = 0;
    var n: u32 = 1;
    while (n <= 100) : (n += 1) {
        if (squarefree(n)) c += 1;
    }
    std.debug.print("{d}\n", .{c});
}
