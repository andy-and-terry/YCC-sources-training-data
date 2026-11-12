const std = @import("std");
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var l = std.ArrayList(i32).init(gpa.allocator());
    defer l.deinit();
    try l.append(1); try l.append(2);
    std.debug.print("{any}\n", .{l.items});
}
