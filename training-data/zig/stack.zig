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

        fn pop(self: *Self) ?T {
            return self.items.popOrNull();
        }

        fn isEmpty(self: *Self) bool {
            return self.items.items.len == 0;
        }
    };
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var stack = Stack(i32).init(gpa.allocator());
    try stack.push(1);
    try stack.push(2);
    try stack.push(3);
    std.debug.print("{any} {}\n", .{ stack.pop(), stack.isEmpty() });
}
