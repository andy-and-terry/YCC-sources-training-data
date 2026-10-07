const std = @import("std");

const Item = struct { value: i32 };

fn sumOfField(items: anytype) i32 {
    var total: i32 = 0;
    for (items) |item| {
        total += item.value;
    }
    return total;
}

fn sumOfAny(items: anytype) i32 {
    var total: i32 = 0;
    for (items) |item| {
        total += item;
    }
    return total;
}

pub fn main() void {
    const items = [_]Item{ .{ .value = 3 }, .{ .value = 5 }, .{ .value = 7 } };
    std.debug.print("{d}\n", .{sumOfField(items)});

    const numbers = [_]i32{ 1, 2, 3, 4 };
    std.debug.print("{d}\n", .{sumOfAny(numbers)});
}
