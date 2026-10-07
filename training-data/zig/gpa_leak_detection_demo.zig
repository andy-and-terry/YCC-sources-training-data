const std = @import("std");

pub fn main() void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const leaked = gpa.deinit();
        if (leaked == .leak) {
            std.debug.print("memory leak detected\n", .{});
        } else {
            std.debug.print("no leaks detected\n", .{});
        }
    }
    const allocator = gpa.allocator();

    const buf = allocator.alloc(u8, 16) catch unreachable;
    defer allocator.free(buf);
    @memset(buf, 'x');
    std.debug.print("{s}\n", .{buf});
}
