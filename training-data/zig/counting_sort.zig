const std = @import("std");
const allocator = std.heap.page_allocator;

fn countingSort(items: []const i32) ![]i32 {
    if (items.len == 0) return try allocator.alloc(i32, 0);
    var max: i32 = items[0];
    for (items) |x| {
        if (x > max) max = x;
    }
    const counts = try allocator.alloc(usize, @as(usize, @intCast(max)) + 1);
    defer allocator.free(counts);
    @memset(counts, 0);
    for (items) |x| counts[@intCast(x)] += 1;

    const result = try allocator.alloc(i32, items.len);
    var idx: usize = 0;
    for (counts, 0..) |c, v| {
        var k: usize = 0;
        while (k < c) : (k += 1) {
            result[idx] = @intCast(v);
            idx += 1;
        }
    }
    return result;
}

pub fn main() !void {
    const data = [_]i32{ 4, 2, 2, 8, 3, 3, 1, 0 };
    const sorted = try countingSort(&data);
    defer allocator.free(sorted);
    std.debug.print("{any}\n", .{sorted});
}
