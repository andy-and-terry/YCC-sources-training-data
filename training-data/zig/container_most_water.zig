const std = @import("std");

fn maxArea(h: []const u32) u32 {
    var lo: usize = 0;
    var hi: usize = h.len - 1;
    var best: u32 = 0;
    while (lo < hi) {
        const area = @min(h[lo], h[hi]) * @as(u32, @intCast(hi - lo));
        best = @max(best, area);
        if (h[lo] < h[hi]) lo += 1 else hi -= 1;
    }
    return best;
}

pub fn main() void {
    std.debug.print("{d}\n", .{maxArea(&[_]u32{ 1, 8, 6, 2, 5, 4, 8, 3, 7 })}); // 49
}
