const std = @import("std");

// Remove consecutive duplicate bytes into a fixed buffer.
pub fn main() void {
    const s = "aabbbcdd";
    var buf: [s.len]u8 = undefined;
    var k: usize = 0;
    for (s, 0..) |c, i| {
        if (i == 0 or c != s[i - 1]) {
            buf[k] = c;
            k += 1;
        }
    }
    std.debug.print("{s}\n", .{buf[0..k]});
}
