const std = @import("std");

fn increment(p: *i32) void {
    p.* += 1;
}

fn firstEven(items: []const i32) ?*const i32 {
    for (items) |*item| {
        if (@mod(item.*, 2) == 0) return item;
    }
    return null;
}

pub fn main() void {
    var x: i32 = 10;
    const px = &x;
    px.* *= 2;
    increment(px);
    std.debug.print("x = {d}\n", .{x});

    var arr = [_]i32{ 1, 3, 4, 7, 8 };
    if (firstEven(&arr)) |p| {
        std.debug.print("first even = {d} at index {d}\n", .{ p.*, (@intFromPtr(p) - @intFromPtr(&arr)) / @sizeOf(i32) });
    }

    const many: [*]i32 = &arr;
    std.debug.print("many[2] = {d}\n", .{many[2]});
    const tail = many[3..5];
    std.debug.print("tail = {any}\n", .{tail});

    for (&arr) |*v| v.* *= v.*;
    std.debug.print("{any}\n", .{arr});

    var maybe: ?*i32 = null;
    std.debug.print("null? {}\n", .{maybe == null});
    maybe = &x;
    std.debug.print("{d}\n", .{maybe.?.*});
}
