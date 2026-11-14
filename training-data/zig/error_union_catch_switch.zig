const std = @import("std");

const E = error{ TooBig, Negative };

fn check(n: i32) E!i32 {
    if (n < 0) return E.Negative;
    if (n > 100) return E.TooBig;
    return n;
}

pub fn main() void {
    for ([_]i32{ 5, -1, 500 }) |n| {
        const r = check(n) catch |e| switch (e) {
            E.Negative => -1,
            E.TooBig => 100,
        };
        std.debug.print("{}\n", .{r});
    }
}
