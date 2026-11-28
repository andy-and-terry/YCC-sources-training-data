const std = @import("std");

pub fn main() void {
    var seq: [15]u32 = undefined;
    seq[0] = 0;
    seq[1] = 1;
    var i: usize = 2;
    while (i < seq.len) : (i += 1) {
        seq[i] = if (i % 2 == 0) seq[i / 2] else seq[i / 2] + seq[i / 2 + 1];
    }
    for (seq) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{}); // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
}
