const std = @import("std");

fn build(alloc: std.mem.Allocator) ![]u8 {
    const buf = try alloc.alloc(u8, 4);
    errdefer alloc.free(buf);
    @memset(buf, 'z');
    return buf;
}

pub fn main() !void {
    const alloc = std.heap.page_allocator;
    const b = try build(alloc);
    defer alloc.free(b);
    std.debug.print("{s}\n", .{b});
}
