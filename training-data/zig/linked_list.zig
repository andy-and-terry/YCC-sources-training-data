const std = @import("std");

const Node = struct {
    value: i32,
    next: ?*Node,
};

const LinkedList = struct {
    head: ?*Node = null,
    allocator: std.mem.Allocator,

    fn pushFront(self: *LinkedList, value: i32) !void {
        const node = try self.allocator.create(Node);
        node.* = .{ .value = value, .next = self.head };
        self.head = node;
    }

    fn print(self: *LinkedList) void {
        var current = self.head;
        while (current) |node| {
            std.debug.print("{d} ", .{node.value});
            current = node.next;
        }
        std.debug.print("\n", .{});
    }

    fn deinit(self: *LinkedList) void {
        var current = self.head;
        while (current) |node| {
            const next = node.next;
            self.allocator.destroy(node);
            current = next;
        }
        self.head = null;
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = LinkedList{ .allocator = allocator };
    defer list.deinit();

    try list.pushFront(3);
    try list.pushFront(2);
    try list.pushFront(1);

    list.print();
}
