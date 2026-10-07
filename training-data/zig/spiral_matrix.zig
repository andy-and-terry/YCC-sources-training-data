const std = @import("std");

const Rows = 3;
const Cols = 4;

pub fn main() void {
    const m = [Rows][Cols]u8{
        .{ 1, 2, 3, 4 },
        .{ 5, 6, 7, 8 },
        .{ 9, 10, 11, 12 },
    };

    var top: isize = 0;
    var bottom: isize = Rows - 1;
    var left: isize = 0;
    var right: isize = Cols - 1;

    while (top <= bottom and left <= right) {
        var c = left;
        while (c <= right) : (c += 1) std.debug.print("{d} ", .{m[@intCast(top)][@intCast(c)]});
        top += 1;

        var r = top;
        while (r <= bottom) : (r += 1) std.debug.print("{d} ", .{m[@intCast(r)][@intCast(right)]});
        right -= 1;

        if (top <= bottom) {
            c = right;
            while (c >= left) : (c -= 1) std.debug.print("{d} ", .{m[@intCast(bottom)][@intCast(c)]});
            bottom -= 1;
        }
        if (left <= right) {
            r = bottom;
            while (r >= top) : (r -= 1) std.debug.print("{d} ", .{m[@intCast(r)][@intCast(left)]});
            left += 1;
        }
    }
    std.debug.print("\n", .{});
}
