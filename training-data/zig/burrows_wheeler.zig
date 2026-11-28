const std = @import("std");

const text = "banana$";

fn lessThan(_: void, a: usize, b: usize) bool {
    var k: usize = 0;
    while (k < text.len) : (k += 1) {
        const x = text[(a + k) % text.len];
        const y = text[(b + k) % text.len];
        if (x != y) return x < y;
    }
    return false;
}

pub fn main() void {
    var idx: [text.len]usize = undefined;
    for (&idx, 0..) |*v, i| v.* = i;
    std.mem.sort(usize, &idx, {}, lessThan);
    for (idx) |i| std.debug.print("{c}", .{text[(i + text.len - 1) % text.len]});
    std.debug.print("\n", .{});
}
