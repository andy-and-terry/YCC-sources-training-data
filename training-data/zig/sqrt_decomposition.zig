const std = @import("std");

pub fn main() void {
    const a = [_]i32{ 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5 };
    const bs = 4;
    var blk = [_]i32{0} ** 3;
    for (a, 0..) |v, i| blk[i / bs] += v;
    var s: i32 = 0;
    var i: usize = 2;
    while (i <= 9) {
        if (i % bs == 0 and i + bs - 1 <= 9) {
            s += blk[i / bs];
            i += bs;
        } else {
            s += a[i];
            i += 1;
        }
    }
    std.debug.print("{d}\n", .{s});
}
