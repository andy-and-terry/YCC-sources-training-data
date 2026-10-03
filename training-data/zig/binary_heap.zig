const std = @import("std");

const MinHeap = struct {
    items: std.ArrayList(i32),

    const Self = @This();

    fn init(allocator: std.mem.Allocator) Self {
        return Self{ .items = std.ArrayList(i32).init(allocator) };
    }

    fn deinit(self: *Self) void {
        self.items.deinit();
    }

    fn push(self: *Self, value: i32) !void {
        try self.items.append(value);
        var i = self.items.items.len - 1;
        while (i > 0) {
            const parent = (i - 1) / 2;
            if (self.items.items[parent] <= self.items.items[i]) break;
            const tmp = self.items.items[parent];
            self.items.items[parent] = self.items.items[i];
            self.items.items[i] = tmp;
            i = parent;
        }
    }

    fn pop(self: *Self) i32 {
        const min = self.items.items[0];
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
                const tmp = self.items.items[i];
                self.items.items[i] = self.items.items[smallest];
                self.items.items[smallest] = tmp;
                i = smallest;
            }
        }
        return min;
    }
};

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var heap = MinHeap.init(allocator);
    defer heap.deinit();

    for ([_]i32{ 5, 3, 8, 1, 4 }) |v| {
        try heap.push(v);
    }

    while (heap.items.items.len > 0) {
        std.debug.print("{d} ", .{heap.pop()});
    }
    std.debug.print("\n", .{});
}
