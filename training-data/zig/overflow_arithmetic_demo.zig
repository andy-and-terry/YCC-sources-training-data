const std = @import("std");

pub fn main() void {
    const max: u8 = 255;

    // Wrapping operators: modular arithmetic
    std.debug.print("255 +% 1 = {d}\n", .{max +% 1});
    std.debug.print("0 -% 1 = {d}\n", .{@as(u8, 0) -% 1});

    // Saturating operators: clamp to the type's range
    std.debug.print("255 +| 10 = {d}\n", .{max +| 10});
    std.debug.print("5 -| 10 = {d}\n", .{@as(u8, 5) -| 10});

    // Overflow builtins return a tuple of result and overflow bit
    const r = @addWithOverflow(max, 1);
    std.debug.print("addWithOverflow: value={d} overflow={d}\n", .{ r[0], r[1] });

    const m = @mulWithOverflow(@as(i8, 100), 2);
    std.debug.print("mulWithOverflow: value={d} overflow={d}\n", .{ m[0], m[1] });

    // Checked arithmetic via std.math
    const checked = std.math.add(u8, 200, 100) catch |err| {
        std.debug.print("error: {s}\n", .{@errorName(err)});
        return;
    };
    std.debug.print("{d}\n", .{checked});
}
