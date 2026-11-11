// Integer (1..3999) to Roman numeral using a greedy table.
const std = @import("std");

const Entry = struct { value: u32, symbol: []const u8 };
const table = [_]Entry{
    .{ .value = 1000, .symbol = "M" },  .{ .value = 900, .symbol = "CM" },
    .{ .value = 500, .symbol = "D" },   .{ .value = 400, .symbol = "CD" },
    .{ .value = 100, .symbol = "C" },   .{ .value = 90, .symbol = "XC" },
    .{ .value = 50, .symbol = "L" },    .{ .value = 40, .symbol = "XL" },
    .{ .value = 10, .symbol = "X" },    .{ .value = 9, .symbol = "IX" },
    .{ .value = 5, .symbol = "V" },     .{ .value = 4, .symbol = "IV" },
    .{ .value = 1, .symbol = "I" },
};

fn toRoman(number: u32, buf: []u8) []const u8 {
    var n = number;
    var len: usize = 0;
    for (table) |e| {
        while (n >= e.value) : (n -= e.value) {
            @memcpy(buf[len..][0..e.symbol.len], e.symbol);
            len += e.symbol.len;
        }
    }
    return buf[0..len];
}

pub fn main() void {
    var a: [32]u8 = undefined;
    var b: [32]u8 = undefined;
    std.debug.print("{s} {s}\n", .{ toRoman(1994, &a), toRoman(58, &b) });
}
