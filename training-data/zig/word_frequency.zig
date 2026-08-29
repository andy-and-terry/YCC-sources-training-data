const std = @import("std");
const allocator = std.heap.page_allocator;

pub fn main() !void {
    const text = "the quick brown fox the lazy fox";
    var freq = std.StringHashMap(i32).init(allocator);
    defer freq.deinit();

    var it = std.mem.splitScalar(u8, text, ' ');
    while (it.next()) |word| {
        const entry = try freq.getOrPut(word);
        if (entry.found_existing) {
            entry.value_ptr.* += 1;
        } else {
            entry.value_ptr.* = 1;
        }
    }

    var iter = freq.iterator();
    while (iter.next()) |kv| {
        std.debug.print("{s}: {d}\n", .{ kv.key_ptr.*, kv.value_ptr.* });
    }
}
