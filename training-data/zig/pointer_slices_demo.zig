const std = @import("std");

fn increment(ptr: *i32) void {
    ptr.* += 1;
}

fn fillSlice(items: []u8, value: u8) void {
    for (items) |*item| {
        item.* = value;
    }
}

fn sumSlice(items: []const i32) i32 {
    var total: i32 = 0;
    for (items) |v| total += v;
    return total;
}

pub fn main() void {
    var x: i32 = 41;
    increment(&x);
    std.debug.print("x = {d}\n", .{x});

    var buffer = [_]u8{0} ** 8;
    fillSlice(buffer[2..5], 7);
    std.debug.print("{any}\n", .{buffer});

    const numbers = [_]i32{ 1, 2, 3, 4, 5, 6 };
    std.debug.print("whole {d}, head {d}, tail {d}\n", .{
        sumSlice(&numbers),
        sumSlice(numbers[0..3]),
        sumSlice(numbers[3..]),
    });

    const ptr: [*]const i32 = &numbers;
    std.debug.print("ptr[2] = {d}, (ptr + 4)[0] = {d}\n", .{ ptr[2], (ptr + 4)[0] });

    var value: u32 = 10;
    const p1 = &value;
    const p2 = &value;
    p1.* += 5;
    std.debug.print("{d} {d} same: {any}\n", .{ p2.*, value, p1 == p2 });

    const opt: ?*const i32 = &numbers[0];
    if (opt) |p| std.debug.print("optional pointer -> {d}\n", .{p.*});
    std.debug.print("slice len {d}, size of pointer {d}\n", .{ numbers[1..4].len, @sizeOf(*i32) });
}
