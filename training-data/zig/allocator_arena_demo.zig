const std = @import("std");

fn buildLabels(allocator: std.mem.Allocator, count: usize) ![]u8 {
    const buffer = try allocator.alloc(u8, count);
    for (buffer, 0..) |*b, i| {
        b.* = @as(u8, 'a') + @as(u8, @intCast(i));
    }
    return buffer;
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const first = try buildLabels(allocator, 5);
    const second = try buildLabels(allocator, 3);

    std.debug.print("{s}\n", .{first});
    std.debug.print("{s}\n", .{second});
}
