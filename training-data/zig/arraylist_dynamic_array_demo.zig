const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var list = std.ArrayList(i32).init(allocator);
    defer list.deinit();

    try list.append(10);
    try list.append(20);
    try list.append(30);
    try list.insert(1, 15);

    std.debug.print("{any}\n", .{list.items});
    std.debug.print("len: {d}\n", .{list.items.len});

    const removed = list.orderedRemove(0);
    std.debug.print("removed: {d}\n", .{removed});
    std.debug.print("{any}\n", .{list.items});

    const last = list.pop().?;
    std.debug.print("popped: {d}\n", .{last});
}
