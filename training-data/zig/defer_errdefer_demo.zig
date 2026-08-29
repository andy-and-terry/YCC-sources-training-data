const std = @import("std");
const allocator = std.heap.page_allocator;

fn allocateAndUse() !void {
    const buffer = try allocator.alloc(u8, 10);
    defer allocator.free(buffer);
    @memset(buffer, 'A');
    std.debug.print("{s}\n", .{buffer});
}

pub fn main() !void {
    try allocateAndUse();
}
