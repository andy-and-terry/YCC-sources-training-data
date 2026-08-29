const std = @import("std");

pub fn main() void {
    const s = "Hello, Zig World!";
    std.debug.print("{d}\n", .{s.len});
    std.debug.print("{}\n", .{std.mem.eql(u8, s[0..5], "Hello")});
    var it = std.mem.splitScalar(u8, s, ' ');
    while (it.next()) |word| {
        std.debug.print("{s}\n", .{word});
    }
}
