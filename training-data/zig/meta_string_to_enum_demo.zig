const std = @import("std");

const Command = enum { start, stop, pause, resume_, quit };

fn parse(word: []const u8) ?Command {
    return std.meta.stringToEnum(Command, word);
}

pub fn main() void {
    const inputs = [_][]const u8{ "start", "pause", "bogus", "quit", "Stop" };
    for (inputs) |word| {
        if (parse(word)) |cmd| {
            std.debug.print("{s} -> {s} ({d})\n", .{ word, @tagName(cmd), @intFromEnum(cmd) });
        } else {
            std.debug.print("{s} -> unknown\n", .{word});
        }
    }

    // Enumerate every variant using std.meta.fields.
    inline for (std.meta.fields(Command)) |field| {
        std.debug.print("variant {s} = {d}\n", .{ field.name, field.value });
    }

    std.debug.print("variant count: {d}\n", .{std.meta.fields(Command).len});
}
