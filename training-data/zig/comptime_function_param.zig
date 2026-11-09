const std = @import("std");

fn Array(comptime T: type, comptime n: usize) type {
    return struct { items: [n]T };
}

pub fn main() void {
    const A = Array(i32, 3);
    const a = A{ .items = .{ 1, 2, 3 } };
    std.debug.print("{d}\n", .{a.items.len});
}
