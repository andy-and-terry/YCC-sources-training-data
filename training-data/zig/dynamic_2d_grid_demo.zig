const std = @import("std");
const allocator = std.heap.page_allocator;

pub fn main() !void {
    var grid = std.ArrayList(std.ArrayList(i32)).init(allocator);
    defer {
        for (grid.items) |*row| row.deinit();
        grid.deinit();
    }

    for (0..3) |r| {
        var row = std.ArrayList(i32).init(allocator);
        for (0..3) |c| {
            try row.append(@intCast(r * 3 + c));
        }
        try grid.append(row);
    }

    for (grid.items) |row| {
        std.debug.print("{any}\n", .{row.items});
    }

    grid.items[1].items[1] = 99;
    std.debug.print("updated center: {d}\n", .{grid.items[1].items[1]});
}
