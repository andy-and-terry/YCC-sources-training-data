const std = @import("std");

fn f(x: f64) f64 {
    return x * x - 2;
}

fn secant(a: f64, b: f64) f64 {
    var x0 = a;
    var x1 = b;
    var i: u32 = 0;
    while (i < 50) : (i += 1) {
        const f0 = f(x0);
        const f1 = f(x1);
        if (f1 == f0) break;
        const next = x1 - f1 * (x1 - x0) / (f1 - f0);
        x0 = x1;
        x1 = next;
        if (@abs(x1 - x0) < 1e-12) break;
    }
    return x1;
}

pub fn main() void {
    std.debug.print("{d:.10}\n", .{secant(1, 2)});
}
