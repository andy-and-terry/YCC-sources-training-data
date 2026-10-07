const std = @import("std");

// A labeled block is an expression: `break :label value` inside it supplies
// the block's result, letting multi-step logic (early exits included) be
// written without a separate mutable "result" variable declared outside it.
fn classify(n: i32) []const u8 {
    const label = blk: {
        if (n < 0) break :blk "negative";
        if (n == 0) break :blk "zero";
        if (n % 2 == 0) break :blk "positive-even";
        break :blk "positive-odd";
    };
    return label;
}

// The same technique also works from inside a loop: `break :label` can
// jump out of a `for`/`while` nested in the block, carrying a value with it.
fn firstDivisor(n: i32, candidates: []const i32) ?i32 {
    const found = search: {
        for (candidates) |c| {
            if (c != 0 and @rem(n, c) == 0) break :search c;
        }
        break :search null;
    };
    return found;
}

pub fn main() void {
    for ([_]i32{ -3, 0, 4, 7 }) |n| {
        std.debug.print("{d}: {s}\n", .{ n, classify(n) });
    }

    const candidates = [_]i32{ 2, 3, 5, 7 };
    if (firstDivisor(12, &candidates)) |d| {
        std.debug.print("first divisor of 12: {d}\n", .{d});
    }
    if (firstDivisor(13, &candidates)) |d| {
        std.debug.print("first divisor of 13: {d}\n", .{d});
    } else {
        std.debug.print("no divisor of 13 found\n", .{});
    }
}
