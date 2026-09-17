const std = @import("std");

const MinHeap = struct {
    items: [16]i32 = undefined,
    len: usize = 0,

    fn push(self: *MinHeap, value: i32) void {
        self.items[self.len] = value;
        self.len += 1;
        var i = self.len - 1;
        while (i > 0) {
            const parent = (i - 1) / 2;
            if (self.items[parent] <= self.items[i]) break;
            const tmp = self.items[parent];
            self.items[parent] = self.items[i];
            self.items[i] = tmp;
            i = parent;
        }
    }

    fn pop(self: *MinHeap) ?i32 {
        if (self.len == 0) return null;
        const top = self.items[0];
        self.len -= 1;
        self.items[0] = self.items[self.len];
        var i: usize = 0;
        while (true) {
            const left = 2 * i + 1;
            const right = 2 * i + 2;
            var smallest = i;
            if (left < self.len and self.items[left] < self.items[smallest]) smallest = left;
            if (right < self.len and self.items[right] < self.items[smallest]) smallest = right;
            if (smallest == i) break;
            const tmp = self.items[smallest];
            self.items[smallest] = self.items[i];
            self.items[i] = tmp;
            i = smallest;
        }
        return top;
    }
};

pub fn main() void {
    var heap = MinHeap{};
    for ([_]i32{ 5, 3, 8, 1, 9, 2 }) |v| heap.push(v);
    while (heap.pop()) |v| {
        std.debug.print("{d} ", .{v});
    }
    std.debug.print("\n", .{});
}
