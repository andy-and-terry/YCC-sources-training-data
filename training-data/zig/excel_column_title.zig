const std = @import("std");

fn columnTitle(buf: []u8, number: u32) []const u8 {
    var n = number;
    var pos = buf.len;
    while (n > 0) {
        n -= 1;
        pos -= 1;
        buf[pos] = 'A' + @as(u8, @intCast(n % 26));
        n /= 26;
    }
    return buf[pos..];
}

pub fn main() void {
    var b1: [8]u8 = undefined;
    var b2: [8]u8 = undefined;
    std.debug.print("{s} {s}\n", .{ columnTitle(&b1, 28), columnTitle(&b2, 701) }); // AB ZY
}
