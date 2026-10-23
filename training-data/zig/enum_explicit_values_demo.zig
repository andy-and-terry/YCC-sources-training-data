const std = @import("std");

const Status = enum(u8) {
    ok = 0,
    warning = 10,
    failure = 20,
    _,
};

pub fn main() void {
    const s: Status = .warning;
    std.debug.print("{s} = {d}\n", .{ @tagName(s), @intFromEnum(s) });

    const from_int: Status = @enumFromInt(20);
    std.debug.print("{s}\n", .{@tagName(from_int)});

    // Non-exhaustive enum: unnamed values are legal
    const unknown: Status = @enumFromInt(99);
    switch (unknown) {
        .ok => std.debug.print("ok\n", .{}),
        .warning, .failure => std.debug.print("known problem\n", .{}),
        _ => std.debug.print("unknown status {d}\n", .{@intFromEnum(unknown)}),
    }
}
