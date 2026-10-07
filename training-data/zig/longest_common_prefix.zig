const std = @import("std");

// Longest common prefix shared by every string in the slice.
fn commonPrefix(a: []const u8, b: []const u8) []const u8 {
    const n = @min(a.len, b.len);
    var i: usize = 0;
    while (i < n and a[i] == b[i]) i += 1;
    return a[0..i];
}

fn longestCommonPrefix(strs: []const []const u8) []const u8 {
    if (strs.len == 0) return "";
    var prefix = strs[0];
    for (strs[1..]) |s| {
        prefix = commonPrefix(prefix, s);
    }
    return prefix;
}

pub fn main() void {
    const words = [_][]const u8{ "flower", "flow", "flight" };
    std.debug.print("{s}\n", .{longestCommonPrefix(&words)});

    const none = [_][]const u8{ "dog", "racecar", "car" };
    std.debug.print("{s}\n", .{longestCommonPrefix(&none)});
}
