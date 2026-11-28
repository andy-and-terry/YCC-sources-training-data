const std = @import("std");

pub fn main() void {
    const s = "banana";
    var i: usize = 0;
    while (i < s.len) {
        var j = i + 1;
        var k = i;
        while (j < s.len and s[k] <= s[j]) {
            k = if (s[k] < s[j]) i else k + 1;
            j += 1;
        }
        while (i <= k) {
            std.debug.print("{s}\n", .{s[i .. i + j - k]});
            i += j - k;
        }
    }
}
