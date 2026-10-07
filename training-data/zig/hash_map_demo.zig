const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var scores = std.StringHashMap(i32).init(allocator);
    defer scores.deinit();

    try scores.put("alice", 90);
    try scores.put("bob", 78);
    try scores.put("carol", 85);

    if (scores.get("bob")) |score| {
        std.debug.print("bob: {d}\n", .{score});
    }

    _ = scores.remove("alice");
    std.debug.print("count after remove: {d}\n", .{scores.count()});

    var it = scores.iterator();
    var total: i32 = 0;
    while (it.next()) |entry| {
        total += entry.value_ptr.*;
    }
    std.debug.print("total: {d}\n", .{total});
}
