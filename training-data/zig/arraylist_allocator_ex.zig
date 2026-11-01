const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();

    var list = std.ArrayList(i32).init(alloc);
    defer list.deinit();
    for (0..5) |i| try list.append(@intCast(i * i));
    std.debug.print("{any}\n", .{list.items});
}
