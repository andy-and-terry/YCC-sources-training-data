const std = @import("std");

const ParseError = error{ Empty, NotDigit };

fn parse(s: []const u8) ParseError!u32 {
    if (s.len == 0) return error.Empty;
    var n: u32 = 0;
    for (s) |c| {
        if (c < '0' or c > '9') return error.NotDigit;
        n = n * 10 + (c - '0');
    }
    return n;
}

pub fn main() void {
    std.debug.print("{!}\n", .{parse("123")});
    std.debug.print("{!}\n", .{parse("12x")});
    const v = parse("") catch |e| blk: {
        std.debug.print("err {s}\n", .{@errorName(e)});
        break :blk 0;
    };
    _ = v;
}
