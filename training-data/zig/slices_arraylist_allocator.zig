const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var list = std.ArrayList(i32).init(gpa.allocator());
    defer list.deinit();
    for (0..5) |i| try list.append(@intCast(i * i));
    var sum: i32 = 0;
    for (list.items) |x| sum += x;
    std.debug.print("{any} sum={}\n", .{ list.items, sum });
}
