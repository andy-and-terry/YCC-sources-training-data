const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();

    var list = std.ArrayList(i32).init(alloc);
    defer list.deinit();
    for (1..6) |i| try list.append(@intCast(i * i));
    _ = list.orderedRemove(0);
    std.debug.print("{any} len={d}\n", .{ list.items, list.items.len });

    var map = std.StringHashMap(u32).init(alloc);
    defer map.deinit();
    try map.put("a", 1);
    try map.put("b", 2);
    const gop = try map.getOrPut("a");
    gop.value_ptr.* += 10;
    std.debug.print("{d} {d} {any}\n", .{ map.get("a").?, map.count(), map.get("z") });

    const buf = try alloc.alloc(u8, 4);
    defer alloc.free(buf);
    @memset(buf, 'x');
    std.debug.print("{s}\n", .{buf});

    var arena = std.heap.ArenaAllocator.init(alloc);
    defer arena.deinit();
    const s = try std.fmt.allocPrint(arena.allocator(), "{d}-{s}", .{ 7, "seven" });
    std.debug.print("{s}\n", .{s});
}
