const std = @import("std");

fn bitap(text: []const u8, pat: []const u8) ?usize {
    var masks = [_]u64{0} ** 256;
    for (pat, 0..) |c, i| masks[c] |= @as(u64, 1) << @intCast(i);
    const goal = @as(u64, 1) << @intCast(pat.len - 1);
    var state: u64 = 0;
    for (text, 0..) |c, i| {
        state = ((state << 1) | 1) & masks[c];
        if (state & goal != 0) return i + 1 - pat.len;
    }
    return null;
}

pub fn main() void {
    std.debug.print("{?}\n", .{bitap("the quick brown fox", "brown")});
}
