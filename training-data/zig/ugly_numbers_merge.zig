const std = @import("std");

fn ugly(comptime n: usize) u64 {
    var seq: [n]u64 = undefined;
    seq[0] = 1;
    var i2: usize = 0;
    var i3: usize = 0;
    var i5: usize = 0;
    for (1..n) |k| {
        const c2 = seq[i2] * 2;
        const c3 = seq[i3] * 3;
        const c5 = seq[i5] * 5;
        const next = @min(c2, @min(c3, c5));
        seq[k] = next;
        if (next == c2) i2 += 1;
        if (next == c3) i3 += 1;
        if (next == c5) i5 += 1;
    }
    return seq[n - 1];
}

pub fn main() void {
    // computed entirely at compile time
    const v = comptime ugly(12);
    std.debug.print("12th ugly number: {d}\n", .{v});
}
