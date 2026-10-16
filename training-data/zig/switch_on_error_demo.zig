const std = @import("std");

const FileErr = error{ NotFound, AccessDenied, Busy };

fn open(code: u8) FileErr!void {
    switch (code) {
        1 => return error.NotFound,
        2 => return error.AccessDenied,
        3 => return error.Busy,
        else => {},
    }
}

pub fn main() void {
    for (0..4) |i| {
        open(@intCast(i)) catch |err| switch (err) {
            error.NotFound => std.debug.print("{d}: missing\n", .{i}),
            error.AccessDenied => std.debug.print("{d}: denied\n", .{i}),
            error.Busy => std.debug.print("{d}: retry later\n", .{i}),
        };
    }
}
