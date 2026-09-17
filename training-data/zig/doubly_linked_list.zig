const std = @import("std");
const allocator = std.heap.page_allocator;

const Node = struct {
    value: i32,
    prev: ?*Node,
    next: ?*Node,
};

const DoublyLinkedList = struct {
    head: ?*Node = null,
    tail: ?*Node = null,

    fn pushBack(self: *DoublyLinkedList, value: i32) !void {
        const node = try allocator.create(Node);
        node.* = Node{ .value = value, .prev = self.tail, .next = null };
        if (self.tail) |t| {
            t.next = node;
        } else {
            self.head = node;
        }
        self.tail = node;
    }

    fn printForward(self: *DoublyLinkedList) void {
        var current = self.head;
        while (current) |node| {
            std.debug.print("{d} ", .{node.value});
            current = node.next;
        }
        std.debug.print("\n", .{});
    }

    fn printBackward(self: *DoublyLinkedList) void {
        var current = self.tail;
        while (current) |node| {
            std.debug.print("{d} ", .{node.value});
            current = node.prev;
        }
        std.debug.print("\n", .{});
    }
};

pub fn main() !void {
    var list = DoublyLinkedList{};
    try list.pushBack(1);
    try list.pushBack(2);
    try list.pushBack(3);
    list.printForward();
    list.printBackward();
}
