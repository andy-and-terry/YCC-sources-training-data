const std = @import("std");

pub fn main() void {
    var buffer: [64]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    const nums = allocator.alloc(i32, 4) catch unreachable;
    for (nums, 0..) |*n, i| {
        n.* = @intCast(i * i);
    }
    std.debug.print("{any}\n", .{nums});

    if (allocator.alloc(u8, 1000)) |_| {
        std.debug.print("unexpected success\n", .{});
    } else |err| {
        std.debug.print("error: {}\n", .{err});
    }
}
