const std = @import("std");

pub fn main() void {
    const hay = "the quick brown fox jumps";
    std.debug.print("indexOf 'quick': {?}\n", .{std.mem.indexOf(u8, hay, "quick")});
    std.debug.print("indexOf 'cat':   {?}\n", .{std.mem.indexOf(u8, hay, "cat")});
    std.debug.print("indexOfScalar 'o': {?}\n", .{std.mem.indexOfScalar(u8, hay, 'o')});
    std.debug.print("lastIndexOfScalar 'o': {?}\n", .{std.mem.lastIndexOfScalar(u8, hay, 'o')});
    std.debug.print("count 'o': {d}\n", .{std.mem.count(u8, hay, "o")});
    std.debug.print("contains: {}\n", .{std.mem.containsAtLeast(u8, hay, 1, "fox")});
}
