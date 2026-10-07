const std = @import("std");

fn hammingBits(a: u32, b: u32) u32 {
    return @popCount(a ^ b);
}

fn hammingStrings(a: []const u8, b: []const u8) ?usize {
    if (a.len != b.len) return null;
    var d: usize = 0;
    for (a, b) |x, y| {
        if (x != y) d += 1;
    }
    return d;
}

pub fn main() void {
    std.debug.print("bits(93, 73) = {d}\n", .{hammingBits(93, 73)});
    std.debug.print("strings = {?d}\n", .{hammingStrings("karolin", "kathrin")});
    std.debug.print("mismatched = {?d}\n", .{hammingStrings("abc", "ab")});
}
