const std = @import("std");

fn f(x: f64) f64 {
    return x * x - 2;
}

pub fn main() void {
    var a: f64 = 1;
    var b: f64 = 2;
    for (0..40) |_| {
        const fa = f(a);
        const fb = f(b);
        if (@abs(fb - fa) < 1e-15) break;
        const c = b - fb * (b - a) / (fb - fa);
        a = b;
        b = c;
    }
    std.debug.print("{d:.8}\n", .{b});
}
