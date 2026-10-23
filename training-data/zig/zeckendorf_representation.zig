const std = @import("std");

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    var fibs: [16]u32 = undefined;
    fibs[0] = 1;
    fibs[1] = 2;
    var len: usize = 2;
    while (fibs[len - 1] + fibs[len - 2] <= 100) : (len += 1) {
        fibs[len] = fibs[len - 1] + fibs[len - 2];
    }
    var rest: u32 = 100;
    var first = true;
    var i: usize = len;
    while (i > 0) {
        i -= 1;
        if (fibs[i] <= rest) {
            if (!first) try out.writeByte(' ');
            first = false;
            try out.print("{d}", .{fibs[i]});
            rest -= fibs[i];
        }
    }
    try out.writeByte('\n');
}
