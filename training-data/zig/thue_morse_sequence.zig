const std = @import("std");

// Thue-Morse: t(n) is the parity of the number of 1 bits in n
pub fn main() void {
    var n: u32 = 0;
    while (n < 32) : (n += 1) {
        std.debug.print("{d}", .{@popCount(n) % 2});
    }
    std.debug.print("\n", .{});
}
