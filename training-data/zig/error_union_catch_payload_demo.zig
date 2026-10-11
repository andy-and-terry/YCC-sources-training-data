const std = @import("std");

const ParseError = error{ Empty, NotNumber };

fn parse(s: []const u8) ParseError!u32 {
    if (s.len == 0) return error.Empty;
    return std.fmt.parseInt(u32, s, 10) catch error.NotNumber;
}

pub fn main() void {
    const inputs = [_][]const u8{ "42", "", "abc", "7" };
    for (inputs) |s| {
        const v = parse(s) catch |err| {
            std.debug.print("'{s}' -> error.{s}\n", .{ s, @errorName(err) });
            continue;
        };
        std.debug.print("'{s}' -> {d}\n", .{ s, v });
    }
}
