const std = @import("std");

fn buildLps(pattern: []const u8, lps: []usize) void {
    const n = pattern.len;
    lps[0] = 0;
    var len: usize = 0;
    var i: usize = 1;
    while (i < n) {
        if (pattern[i] == pattern[len]) {
            len += 1;
            lps[i] = len;
            i += 1;
        } else if (len != 0) {
            len = lps[len - 1];
        } else {
            lps[i] = 0;
            i += 1;
        }
    }
}

fn kmpSearch(text: []const u8, pattern: []const u8) i32 {
    var lps: [20]usize = undefined;
    buildLps(pattern, lps[0..pattern.len]);
    const n = text.len;
    const m = pattern.len;
    var i: usize = 0;
    var j: usize = 0;
    while (i < n) {
        if (text[i] == pattern[j]) {
            i += 1;
            j += 1;
            if (j == m) return @intCast(i - j);
        } else if (j > 0) {
            j = lps[j - 1];
        } else {
            i += 1;
        }
    }
    return -1;
}

pub fn main() void {
    std.debug.print("{d}\n", .{kmpSearch("abxabcabcaby", "abcaby")});
}
