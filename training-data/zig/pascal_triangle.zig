const std = @import("std");

fn pascalRow(n: usize, out: []u64) []u64 {
    out[0] = 1;
    var i: usize = 1;
    while (i <= n) : (i += 1) {
        out[i] = 1;
        var j: usize = i - 1;
        while (j > 0) : (j -= 1) {
            out[j] += out[j - 1];
        }
    }
    return out[0 .. n + 1];
}

pub fn main() void {
    var buf: [16]u64 = undefined;
    var r: usize = 0;
    while (r < 6) : (r += 1) {
        const row = pascalRow(r, &buf);
        for (row) |v| std.debug.print("{d} ", .{v});
        std.debug.print("\n", .{});
    }
}
