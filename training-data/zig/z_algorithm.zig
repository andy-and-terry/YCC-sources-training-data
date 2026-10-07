const std = @import("std");

// The Z-algorithm: z[i] is the length of the longest substring
// starting at i that matches a prefix of s. Used here to find all
// occurrences of a pattern by scanning Z of (pattern ++ "#" ++ text).
fn zArray(s: []const u8, z: []usize) void {
    var l: usize = 0;
    var r: usize = 0;
    z[0] = 0;
    for (1..s.len) |i| {
        var zi: usize = 0;
        if (i < r) {
            zi = @min(z[i - l], r - i);
        }
        while (i + zi < s.len and s[zi] == s[i + zi]) zi += 1;
        z[i] = zi;
        if (i + zi > r) {
            l = i;
            r = i + zi;
        }
    }
}

pub fn main() void {
    var buf: [64]u8 = undefined;
    const combined = std.fmt.bufPrint(&buf, "{s}#{s}", .{ "abc", "abxabcabcaby" }) catch unreachable;

    var z: [64]usize = undefined;
    zArray(combined, z[0..combined.len]);

    const pattern_len: usize = 3;
    for (combined, 0..) |_, i| {
        if (z[i] >= pattern_len and i > pattern_len) {
            std.debug.print("match at text index {d}\n", .{i - pattern_len - 1});
        }
    }
}
