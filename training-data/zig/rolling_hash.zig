const std = @import("std");

pub fn main() void {
    const s = "abcabc";
    const k = 3;
    var i: usize = 0;
    while (i + k <= s.len) : (i += 1) {
        var h: u64 = 0;
        for (s[i .. i + k]) |c| h = (h * 31 + c) % 1000003;
        std.debug.print("{d} {d}\n", .{ i, h });
    }
}
