const std = @import("std");

// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
fn isHamming(start: u32) bool {
    var n = start;
    for ([_]u32{ 2, 3, 5 }) |p| {
        while (n % p == 0) n /= p;
    }
    return n == 1;
}

pub fn main() void {
    var count: u32 = 0;
    var n: u32 = 1;
    while (count < 20) : (n += 1) {
        if (isHamming(n)) {
            std.debug.print("{d} ", .{n});
            count += 1;
        }
    }
    std.debug.print("\n", .{});
}
