const std = @import("std");

pub fn main() void {
    const n = 8;
    for (0..n) |r| {
        for (0..n - r - 1) |_| std.debug.print(" ", .{});
        for (0..r + 1) |c| std.debug.print("{s}", .{if (r & c == c) "* " else "  "});
        std.debug.print("\n", .{});
    }
}
