const std = @import("std");

pub fn main() void {
    const haystack = "the quick brown fox";
    const needle = "brown";

    std.debug.print("{}\n", .{std.mem.eql(u8, "abc", "abc")});
    std.debug.print("{}\n", .{std.mem.eql(u8, "abc", "abd")});

    if (std.mem.indexOf(u8, haystack, needle)) |pos| {
        std.debug.print("found at {d}\n", .{pos});
    }

    std.debug.print("{}\n", .{std.mem.startsWith(u8, haystack, "the")});
    std.debug.print("{}\n", .{std.mem.endsWith(u8, haystack, "fox")});
}
