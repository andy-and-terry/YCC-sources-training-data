const std = @import("std");

fn Stack(comptime T: type) type {
    return struct {
        items: std.ArrayList(T),

        const Self = @This();

        fn init(allocator: std.mem.Allocator) Self {
            return Self{ .items = std.ArrayList(T).init(allocator) };
        }

        fn push(self: *Self, item: T) !void {
            try self.items.append(item);
        }

        fn pop(self: *Self) T {
            return self.items.pop().?;
        }
    };
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var s = Stack(i32).init(allocator);
    try s.push(1);
    try s.push(2);
    try s.push(3);
    std.debug.print("{d}\n", .{s.pop()});
    std.debug.print("{d}\n", .{s.pop()});
}
