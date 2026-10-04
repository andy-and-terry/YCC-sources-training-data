const std = @import("std");

fn sum(xs: []const i32) i32 {
    var t: i32 = 0;
    for (xs) |x| t += x;
    return t;
}

fn reverse(xs: []i32) void {
    var i: usize = 0;
    var j: usize = xs.len;
    while (i + 1 < j) {
        j -= 1;
        const t = xs[i];
        xs[i] = xs[j];
        xs[j] = t;
        i += 1;
    }
}

pub fn main() void {
    var data = [_]i32{ 1, 2, 3, 4, 5, 6 };
    std.debug.print("all {d}\n", .{sum(&data)});
    std.debug.print("first three {d}\n", .{sum(data[0..3])});
    std.debug.print("tail {d}\n", .{sum(data[3..])});

    reverse(data[1..5]);
    std.debug.print("{any}\n", .{data});

    const mid = data[2..4];
    mid[0] = 99;
    std.debug.print("{any} len={d}\n", .{ data, mid.len });
}
