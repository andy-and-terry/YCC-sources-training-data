const std = @import("std");

pub fn main() !void {
    var list = std.ArrayList(u32).init(std.heap.page_allocator);
    defer list.deinit();
    for (1..6) |i| try list.append(@intCast(i * i));
    var sum: u32 = 0;
    for (list.items) |v| sum += v;
    std.debug.print("{}\n", .{sum});
}
