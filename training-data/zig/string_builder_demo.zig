const std = @import("std");
const allocator = std.heap.page_allocator;

pub fn main() !void {
    var builder = std.ArrayList(u8).init(allocator);
    defer builder.deinit();

    try builder.writer().print("{s}, {s}! You are {d} years old.\n", .{ "Hello", "Zig", 10 });
    try builder.appendSlice("Goodbye.\n");

    std.debug.print("{s}", .{builder.items});
}
