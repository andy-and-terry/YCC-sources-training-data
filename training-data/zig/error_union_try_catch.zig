const std = @import("std");

const E = error{Negative};

fn root(n: i32) E!i32 {
    if (n < 0) return E.Negative;
    return n;
}

pub fn main() void {
    const a = root(4) catch -1;
    const b = root(-4) catch -1;
    std.debug.print("{d} {d}\n", .{ a, b });
}
