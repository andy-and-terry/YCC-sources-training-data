const std = @import("std");

fn bail(msg: []const u8) noreturn {
    std.debug.print("fatal: {s}\n", .{msg});
    std.process.exit(0);
}

fn parseDigit(c: u8) u8 {
    return switch (c) {
        '0'...'9' => c - '0',
        else => bail("not a digit"),
    };
}

pub fn main() void {
    std.debug.print("{d}\n", .{parseDigit('7')});
    std.debug.print("{d}\n", .{parseDigit('x')});
    std.debug.print("unreachable\n", .{});
}
