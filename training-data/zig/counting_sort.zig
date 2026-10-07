const std = @import("std");

fn countingSort(allocator: std.mem.Allocator, items: []i32, max_value: i32) !void {
    const range: usize = @intCast(max_value + 1);
    const counts = try allocator.alloc(i32, range);
    defer allocator.free(counts);
    @memset(counts, 0);

    for (items) |v| {
        counts[@intCast(v)] += 1;
    }

    var idx: usize = 0;
    var value: usize = 0;
    while (value < range) : (value += 1) {
        var c = counts[value];
        while (c > 0) : (c -= 1) {
            items[idx] = @intCast(value);
            idx += 1;
        }
    }
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var data = [_]i32{ 4, 2, 2, 8, 3, 3, 1 };
    try countingSort(allocator, &data, 8);
    std.debug.print("{any}\n", .{data});
}
