const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const a = gpa.allocator();
    var l = std.ArrayList(i32).init(a);
    defer l.deinit();
    for (1..5) |i| try l.append(@intCast(i * i));
    var s: i32 = 0;
    for (l.items) |x| s += x;
    std.debug.print("{}\n", .{s});
}
