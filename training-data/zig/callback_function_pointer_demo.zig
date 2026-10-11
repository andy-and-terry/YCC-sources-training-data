const std = @import("std");

fn applyAll(items: []i32, f: *const fn (i32) i32) void {
    for (items) |*x| x.* = f(x.*);
}

fn triple(x: i32) i32 {
    return x * 3;
}

fn negate(x: i32) i32 {
    return -x;
}

pub fn main() void {
    var data = [_]i32{ 1, 2, 3 };
    applyAll(&data, triple);
    std.debug.print("{any}\n", .{data});
    applyAll(&data, negate);
    std.debug.print("{any}\n", .{data});
}
