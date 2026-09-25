const std = @import("std");
const allocator = std.heap.page_allocator;

fn fib(n: u64, cache: *std.AutoHashMap(u64, u64)) !u64 {
    if (n < 2) return n;
    if (cache.get(n)) |cached| return cached;

    const result = try fib(n - 1, cache) + try fib(n - 2, cache);
    try cache.put(n, result);
    return result;
}

pub fn main() !void {
    var cache = std.AutoHashMap(u64, u64).init(allocator);
    defer cache.deinit();

    for (0..15) |n| {
        std.debug.print("fib({d}) = {d}\n", .{ n, try fib(n, &cache) });
    }
}
