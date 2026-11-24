const std = @import("std");

// Moser-de Bruijn sequence: binary digits of n read in base 4.
fn moser(start: u32) u32 {
    var n = start;
    var result: u32 = 0;
    var place: u32 = 1;
    while (n > 0) : (n >>= 1) {
        if (n & 1 == 1) result += place;
        place *= 4;
    }
    return result;
}

pub fn main() void {
    var n: u32 = 0;
    while (n < 12) : (n += 1) std.debug.print("{d} ", .{moser(n)});
    std.debug.print("\n", .{});
}
