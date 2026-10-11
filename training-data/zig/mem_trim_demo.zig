const std = @import("std");

pub fn main() void {
    const raw = "   \t padded text \n  ";
    const t = std.mem.trim(u8, raw, " \t\n");
    std.debug.print("[{s}]\n", .{t});
    std.debug.print("[{s}]\n", .{std.mem.trimLeft(u8, raw, " \t\n")});
    std.debug.print("[{s}]\n", .{std.mem.trimRight(u8, "xx--data--xx", "x-")});
    std.debug.print("[{s}]\n", .{std.mem.trim(u8, "--data--", "-")});
}
