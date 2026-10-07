const std = @import("std");

fn MinHeap(comptime T: type) type {
    return struct {
        items: std.ArrayList(T),

        const Self = @This();

        fn init(allocator: std.mem.Allocator) Self {
            return Self{ .items = std.ArrayList(T).init(allocator) };
        }

        fn push(self: *Self, value: T) !void {
            try self.items.append(value);
            var i = self.items.items.len - 1;
            while (i > 0) {
                const parent = (i - 1) / 2;
                if (self.items.items[parent] <= self.items.items[i]) break;
                std.mem.swap(T, &self.items.items[parent], &self.items.items[i]);
                i = parent;
            }
        }

        fn pop(self: *Self) T {
            const top = self.items.items[0];
            const last = self.items.pop().?;
            if (self.items.items.len > 0) {
                self.items.items[0] = last;
                var i: usize = 0;
                while (true) {
                    const left = 2 * i + 1;
                    const right = 2 * i + 2;
                    var smallest = i;
                    if (left < self.items.items.len and self.items.items[left] < self.items.items[smallest]) smallest = left;
                    if (right < self.items.items.len and self.items.items[right] < self.items.items[smallest]) smallest = right;
                    if (smallest == i) break;
                    std.mem.swap(T, &self.items.items[i], &self.items.items[smallest]);
                    i = smallest;
                }
            }
            return top;
        }
    };
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var heap = MinHeap(i32).init(allocator);
    try heap.push(5);
    try heap.push(3);
    try heap.push(8);
    try heap.push(1);
    try heap.push(9);
    std.debug.print("{d}\n", .{heap.pop()});
    std.debug.print("{d}\n", .{heap.pop()});
    std.debug.print("{d}\n", .{heap.pop()});
}
