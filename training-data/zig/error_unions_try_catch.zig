const std = @import("std");

const ParseError = error{ Empty, NotNumber, Negative };

fn parsePositive(s: []const u8) ParseError!u32 {
    if (s.len == 0) return error.Empty;
    const n = std.fmt.parseInt(i64, s, 10) catch return error.NotNumber;
    if (n < 0) return error.Negative;
    return @intCast(n);
}

pub fn main() void {
    for ([_][]const u8{ "42", "", "x1", "-3" }) |s| {
        if (parsePositive(s)) |n| {
            std.debug.print("ok {d}\n", .{n});
        } else |err| switch (err) {
            error.Empty => std.debug.print("empty\n", .{}),
            error.NotNumber => std.debug.print("not a number: {s}\n", .{s}),
            error.Negative => std.debug.print("negative\n", .{}),
        }
    }
    const v = parsePositive("7") catch 0;
    std.debug.print("{d}\n", .{v});
}
