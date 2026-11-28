const std = @import("std");

pub fn main() void {
    const a = [_]i32{ 10, 9, 2, 5, 3, 7, 101, 18 };
    var tails: [a.len]i32 = undefined;
    var len: usize = 0;
    for (a) |x| {
        var lo: usize = 0;
        var hi: usize = len;
        while (lo < hi) {
            const mid = (lo + hi) / 2;
            if (tails[mid] < x) lo = mid + 1 else hi = mid;
        }
        tails[lo] = x;
        if (lo == len) len += 1;
    }
    std.debug.print("{d}\n", .{len});
}
