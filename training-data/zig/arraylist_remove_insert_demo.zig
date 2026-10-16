const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = std.ArrayList(i32).init(allocator);
    defer list.deinit();
    try list.appendSlice(&[_]i32{ 10, 20, 30, 40 });
    try list.insert(1, 15);
    std.debug.print("{any}\n", .{list.items});
    _ = list.orderedRemove(0);
    std.debug.print("{any}\n", .{list.items});
    const swapped = list.swapRemove(0);
    std.debug.print("swapRemove -> {d}, now {any}\n", .{ swapped, list.items });
    std.debug.print("pop -> {?d}\n", .{list.popOrNull()});
    list.clearRetainingCapacity();
    std.debug.print("len after clear: {d}\n", .{list.items.len});
}
