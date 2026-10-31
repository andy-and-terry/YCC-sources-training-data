const std = @import("std");

fn isSelfDescribing(s: []const u8) bool {
    for (s, 0..) |c, i| {
        var count: u8 = 0;
        for (s) |x| {
            if (x == '0' + @as(u8, @intCast(i))) count += 1;
        }
        if (count != c - '0') return false;
    }
    return true;
}

pub fn main() void {
    const inputs = [_][]const u8{ "1210", "2020", "21200", "1211" };
    for (inputs) |s| {
        std.debug.print("{s} {}\n", .{ s, isSelfDescribing(s) });
    }
}
