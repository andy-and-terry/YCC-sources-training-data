const std = @import("std");

fn checkedAdd(a: u8, b: u8) ?u8 {
    const result = @addWithOverflow(a, b);
    if (result[1] != 0) return null;
    return result[0];
}

fn checkedMul(a: i32, b: i32) !i32 {
    const result = @mulWithOverflow(a, b);
    if (result[1] != 0) return error.Overflow;
    return result[0];
}

pub fn main() void {
    std.debug.print("200 + 50 = {any}\n", .{checkedAdd(200, 50)});
    std.debug.print("200 + 60 = {any}\n", .{checkedAdd(200, 60)});

    if (checkedMul(1000, 1000)) |v| {
        std.debug.print("1000 * 1000 = {d}\n", .{v});
    } else |err| {
        std.debug.print("error: {s}\n", .{@errorName(err)});
    }
    if (checkedMul(100000, 100000)) |v| {
        std.debug.print("product = {d}\n", .{v});
    } else |err| {
        std.debug.print("error: {s}\n", .{@errorName(err)});
    }

    const sub = @subWithOverflow(@as(u8, 5), @as(u8, 10));
    std.debug.print("5 - 10 wraps to {d}, overflowed: {d}\n", .{ sub[0], sub[1] });

    const shifted = @shlWithOverflow(@as(u8, 0b1100_0000), 1);
    std.debug.print("shl result {b}, overflow {d}\n", .{ shifted[0], shifted[1] });

    const max_i32 = std.math.maxInt(i32);
    const r = std.math.add(i32, max_i32, 1) catch |e| {
        std.debug.print("std.math.add failed: {s}\n", .{@errorName(e)});
        return;
    };
    std.debug.print("unreachable {d}\n", .{r});
}
