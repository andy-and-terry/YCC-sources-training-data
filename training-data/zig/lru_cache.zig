const std = @import("std");
const allocator = std.heap.page_allocator;

const LRUCache = struct {
    capacity: usize,
    map: std.AutoHashMap(i32, i32),
    order: std.ArrayList(i32),

    fn init(capacity: usize) LRUCache {
        return LRUCache{
            .capacity = capacity,
            .map = std.AutoHashMap(i32, i32).init(allocator),
            .order = std.ArrayList(i32).init(allocator),
        };
    }

    fn get(self: *LRUCache, key: i32) ?i32 {
        if (self.map.get(key)) |value| {
            for (self.order.items, 0..) |k, i| {
                if (k == key) {
                    _ = self.order.orderedRemove(i);
                    break;
                }
            }
            self.order.append(key) catch unreachable;
            return value;
        }
        return null;
    }

    fn put(self: *LRUCache, key: i32, value: i32) void {
        if (self.map.contains(key)) {
            for (self.order.items, 0..) |k, i| {
                if (k == key) {
                    _ = self.order.orderedRemove(i);
                    break;
                }
            }
        }
        self.map.put(key, value) catch unreachable;
        self.order.append(key) catch unreachable;
        if (self.order.items.len > self.capacity) {
            const evict = self.order.orderedRemove(0);
            _ = self.map.remove(evict);
        }
    }
};

pub fn main() void {
    var cache = LRUCache.init(2);
    cache.put(1, 1);
    cache.put(2, 2);
    std.debug.print("{any}\n", .{cache.get(1)});
    cache.put(3, 3);
    std.debug.print("{any}\n", .{cache.get(2)});
}
