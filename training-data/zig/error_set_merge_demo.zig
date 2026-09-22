const std = @import("std");

const ParseError = error{InvalidFormat};
const RangeError = error{OutOfRange};

fn parseAndValidate(input: []const u8, min: i32, max: i32) (ParseError || RangeError)!i32 {
    const value = std.fmt.parseInt(i32, input, 10) catch return ParseError.InvalidFormat;
    if (value < min or value > max) {
        return RangeError.OutOfRange;
    }
    return value;
}

pub fn main() void {
    const inputs = [_][]const u8{ "42", "abc", "999" };
    for (inputs) |input| {
        if (parseAndValidate(input, 0, 100)) |value| {
            std.debug.print("ok: {d}\n", .{value});
        } else |err| switch (err) {
            ParseError.InvalidFormat => std.debug.print("invalid format: {s}\n", .{input}),
            RangeError.OutOfRange => std.debug.print("out of range: {s}\n", .{input}),
        }
    }
}
