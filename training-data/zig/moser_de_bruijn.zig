const std = @import("std");

// Read the binary digits of i as base-4 digits.
fn moserDeBruijn(i: u32) u64 {
    var x = i;
    var power: u64 = 1;
    var value: u64 = 0;
    while (x > 0) : (x >>= 1) {
        if (x & 1 == 1) value += power;
        power *= 4;
    }
    return value;
}

pub fn main() void {
    var i: u32 = 0;
    while (i < 10) : (i += 1) std.debug.print("{d} ", .{moserDeBruijn(i)});
    std.debug.print("\n", .{}); // 0 1 4 5 16 17 20 21 64 65
}
