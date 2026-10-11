const std = @import("std");

pub fn main() void {
    const x: f64 = 2.0;
    std.debug.print("sqrt  {d:.5}\n", .{@sqrt(x)});
    std.debug.print("sin   {d:.5}\n", .{@sin(1.0)});
    std.debug.print("exp   {d:.5}\n", .{@exp(x)});
    std.debug.print("log   {d:.5}\n", .{@log(x)});
    std.debug.print("floor {d}\n", .{@floor(-2.5)});
    std.debug.print("ceil  {d}\n", .{@ceil(-2.5)});
    std.debug.print("round {d}\n", .{@round(2.5)});
    std.debug.print("pow   {d}\n", .{std.math.pow(f64, 2, 10)});
    std.debug.print("hypot {d}\n", .{std.math.hypot(3.0, 4.0)});
}
