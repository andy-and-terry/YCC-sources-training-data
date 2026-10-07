const std = @import("std");

const ParseError = error{InvalidDigit};
const RangeError = error{OutOfRange};

fn parsePercentage(text: []const u8) (ParseError || RangeError)!i32 {
    var value: i32 = 0;
    for (text) |c| {
        if (c < '0' or c > '9') return ParseError.InvalidDigit;
        value = value * 10 + @as(i32, c - '0');
    }
    if (value > 100) return RangeError.OutOfRange;
    return value;
}

pub fn main() void {
    const inputs = [_][]const u8{ "42", "150", "9x" };
    for (inputs) |input| {
        if (parsePercentage(input)) |value| {
            std.debug.print("{s} -> {d}\n", .{ input, value });
        } else |err| switch (err) {
            ParseError.InvalidDigit => std.debug.print("{s} -> invalid digit\n", .{input}),
            RangeError.OutOfRange => std.debug.print("{s} -> out of range\n", .{input}),
        }
    }
}
