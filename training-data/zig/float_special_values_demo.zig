const std = @import("std");

pub fn main() void {
    const inf = std.math.inf(f64);
    const nan = std.math.nan(f64);
    std.debug.print("inf: {} isInf: {}\n", .{ inf, std.math.isInf(inf) });
    std.debug.print("nan == nan: {}\n", .{nan == nan});
    std.debug.print("isNan: {}\n", .{std.math.isNan(nan)});
    std.debug.print("max f32: {e}\n", .{std.math.floatMax(f32)});
    std.debug.print("eps f64: {e}\n", .{std.math.floatEps(f64)});
    std.debug.print("1/0 = {}\n", .{@as(f64, 1.0) / 0.0});
}
