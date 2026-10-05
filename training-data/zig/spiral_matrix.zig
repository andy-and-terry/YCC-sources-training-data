const std = @import("std");

const N = 3;

fn spiral(m: [N][N]i32, out: *[N * N]i32) void {
    var top: i32 = 0;
    var bottom: i32 = N - 1;
    var left: i32 = 0;
    var right: i32 = N - 1;
    var k: usize = 0;

    while (top <= bottom and left <= right) {
        var c = left;
        while (c <= right) : (c += 1) {
            out[k] = m[@intCast(top)][@intCast(c)];
            k += 1;
        }
        top += 1;
        var r = top;
        while (r <= bottom) : (r += 1) {
            out[k] = m[@intCast(r)][@intCast(right)];
            k += 1;
        }
        right -= 1;
        if (top <= bottom) {
            c = right;
            while (c >= left) : (c -= 1) {
                out[k] = m[@intCast(bottom)][@intCast(c)];
                k += 1;
            }
            bottom -= 1;
        }
        if (left <= right) {
            r = bottom;
            while (r >= top) : (r -= 1) {
                out[k] = m[@intCast(r)][@intCast(left)];
                k += 1;
            }
            left += 1;
        }
    }
}

pub fn main() void {
    const grid = [N][N]i32{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    };
    var out: [N * N]i32 = undefined;
    spiral(grid, &out);
    std.debug.print("{any}\n", .{out});
}
