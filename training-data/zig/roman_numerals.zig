const std = @import("std");

fn toRoman(n: i32, buffer: []u8) []const u8 {
    const values = [_]i32{ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    const symbols = [_][]const u8{ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
    var remaining = n;
    var pos: usize = 0;
    for (values, 0..) |v, i| {
        while (remaining >= v) {
            for (symbols[i]) |c| {
                buffer[pos] = c;
                pos += 1;
            }
            remaining -= v;
        }
    }
    return buffer[0..pos];
}

pub fn main() void {
    var buffer: [20]u8 = undefined;
    std.debug.print("{s}\n", .{toRoman(1994, &buffer)});
}
