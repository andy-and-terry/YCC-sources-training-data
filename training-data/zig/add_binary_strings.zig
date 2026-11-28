const std = @import("std");

fn addBinary(buf: []u8, a: []const u8, b: []const u8) []const u8 {
    var i = a.len;
    var j = b.len;
    var pos = buf.len;
    var carry: u8 = 0;
    while (i > 0 or j > 0 or carry > 0) {
        var sum: u8 = carry;
        if (i > 0) {
            i -= 1;
            sum += a[i] - '0';
        }
        if (j > 0) {
            j -= 1;
            sum += b[j] - '0';
        }
        pos -= 1;
        buf[pos] = '0' + sum % 2;
        carry = sum / 2;
    }
    return buf[pos..];
}

pub fn main() void {
    var buf: [16]u8 = undefined;
    std.debug.print("{s}\n", .{addBinary(&buf, "1010", "1011")}); // 10101
}
