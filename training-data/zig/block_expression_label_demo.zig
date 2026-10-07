const std = @import("std");

fn firstNegative(values: []const i32) ?usize {
    return for (values, 0..) |v, i| {
        if (v < 0) break i;
    } else null;
}

pub fn main() void {
    const x = blk: {
        const a = 6;
        const b = 7;
        break :blk a * b;
    };
    std.debug.print("x = {d}\n", .{x});

    const values = [_]i32{ 3, 8, -2, 5, -9 };
    std.debug.print("first negative at {any}\n", .{firstNegative(&values)});
    std.debug.print("none at {any}\n", .{firstNegative(&[_]i32{ 1, 2 })});

    const label = if (x > 40) "big" else "small";
    std.debug.print("{s}\n", .{label});

    var found_pair: [2]i32 = .{ 0, 0 };
    outer: for (1..10) |a| {
        for (a..10) |b| {
            if (a * b == 24 and a + b == 10) {
                found_pair = .{ @intCast(a), @intCast(b) };
                break :outer;
            }
        }
    }
    std.debug.print("pair: {d} * {d} = 24\n", .{ found_pair[0], found_pair[1] });

    const n: u32 = 15;
    const word = switch (n % 3) {
        0 => blk: {
            if (n % 5 == 0) break :blk "fizzbuzz";
            break :blk "fizz";
        },
        else => "other",
    };
    std.debug.print("{s}\n", .{word});

    var total: u32 = 0;
    const evens = while (total < 20) {
        total += 4;
        if (total == 12) break total;
    } else 0;
    std.debug.print("stopped at {d}\n", .{evens});
}
