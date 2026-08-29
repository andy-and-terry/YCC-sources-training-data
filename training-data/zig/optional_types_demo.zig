const std = @import("std");

fn findFirstNegative(items: []const i32) ?i32 {
    for (items) |x| {
        if (x < 0) return x;
    }
    return null;
}

pub fn main() void {
    const a = [_]i32{ 1, 2, 3, -4, 5 };
    const b = [_]i32{ 1, 2, 3 };
    std.debug.print("{any}\n", .{findFirstNegative(&a)});
    std.debug.print("{any}\n", .{findFirstNegative(&b)});
}
