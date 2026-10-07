const std = @import("std");

pub fn main() void {
    const names = [_][]const u8{ "ann", "bob", "cy" };

    // Iterate items together with an index range
    for (names, 0..) |name, i| {
        std.debug.print("{d}: {s}\n", .{ i, name });
    }

    // Iterate two slices in lockstep
    const a = [_]i32{ 1, 2, 3 };
    const b = [_]i32{ 10, 20, 30 };
    for (a, b) |x, y| {
        std.debug.print("{d} + {d} = {d}\n", .{ x, y, x + y });
    }

    // Mutate through a pointer capture
    var values = [_]i32{ 1, 2, 3, 4 };
    for (&values) |*v| {
        v.* *= v.*;
    }
    std.debug.print("{any}\n", .{values});

    // for as an expression with a label and break value
    const found = blk: for (values, 0..) |v, idx| {
        if (v > 5) break :blk idx;
    } else values.len;
    std.debug.print("first > 5 at index {d}\n", .{found});
}
