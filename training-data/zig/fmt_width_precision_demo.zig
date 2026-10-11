const std = @import("std");

pub fn main() void {
    std.debug.print("[{d:>6}]\n", .{42});
    std.debug.print("[{d:<6}]\n", .{42});
    std.debug.print("[{d:^6}]\n", .{42});
    std.debug.print("[{d:0>6}]\n", .{42});
    std.debug.print("[{s:*^11}]\n", .{"mid"});
    std.debug.print("[{d:.3}]\n", .{3.14159});
    std.debug.print("[{d:8.2}]\n", .{2.71828});
    std.debug.print("[{x:0>4}] [{X}] [{b}] [{o}]\n", .{ 255, 255, 5, 64 });
    std.debug.print("[{c}] [{u}]\n", .{ 'A', 0x263A });
}
