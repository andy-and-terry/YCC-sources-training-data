const std = @import("std");

fn hanoi(n: u32, a: u8, b: u8, c: u8, count: *u32) void {
    if (n == 0) return;
    hanoi(n - 1, a, c, b, count);
    std.debug.print("{c}->{c} ", .{ a, c });
    count.* += 1;
    hanoi(n - 1, b, a, c, count);
}

pub fn main() void {
    var count: u32 = 0;
    hanoi(3, 'A', 'B', 'C', &count);
    std.debug.print("\n{d} moves\n", .{count});
}
