const std = @import("std");
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;
const expectEqualStrings = std.testing.expectEqualStrings;

fn clamp(v: i32, lo: i32, hi: i32) i32 {
    return @max(lo, @min(v, hi));
}

test "clamp inside range" {
    try expectEqual(@as(i32, 5), clamp(5, 0, 10));
}

test "clamp outside range" {
    try expectEqual(@as(i32, 0), clamp(-3, 0, 10));
    try expectEqual(@as(i32, 10), clamp(99, 0, 10));
}

test "strings compare" {
    try expectEqualStrings("zig", "zig");
    try expect(std.mem.eql(u8, "a", "a"));
}

pub fn main() void {
    std.debug.print("{d}\n", .{clamp(15, 0, 10)});
}
