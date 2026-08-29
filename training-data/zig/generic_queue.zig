const std = @import("std");

fn Queue(comptime T: type) type {
    return struct {
        items: std.ArrayList(T),

        const Self = @This();

        fn init(allocator: std.mem.Allocator) Self {
            return Self{ .items = std.ArrayList(T).init(allocator) };
        }

        fn enqueue(self: *Self, item: T) !void {
            try self.items.append(item);
        }

        fn dequeue(self: *Self) T {
            return self.items.orderedRemove(0);
        }
    };
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var q = Queue(i32).init(allocator);
    try q.enqueue(1);
    try q.enqueue(2);
    try q.enqueue(3);
    std.debug.print("{d}\n", .{q.dequeue()});
    std.debug.print("{d}\n", .{q.dequeue()});
}
