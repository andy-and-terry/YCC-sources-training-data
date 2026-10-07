const std = @import("std");

pub fn main() void {
    // The continue expression runs after every iteration, even on `continue`
    var i: u32 = 0;
    var sum_odd: u32 = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 0) continue;
        sum_odd += i;
    }
    std.debug.print("sum of odds below 10: {d}\n", .{sum_odd});

    // Two-variable continue expression
    var lo: usize = 0;
    var hi: usize = 9;
    while (lo < hi) : ({
        lo += 1;
        hi -= 1;
    }) {
        std.debug.print("pair ({d}, {d})\n", .{ lo, hi });
    }

    // while with optional capture
    var maybe: ?u32 = 3;
    while (maybe) |n| : (maybe = if (n > 0) n - 1 else null) {
        std.debug.print("countdown {d}\n", .{n});
    }
}
