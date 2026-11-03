const std = @import("std");

pub fn main() void {
    const text = "Education is beautiful";
    const vowels = "aeiou";
    var counts = [_]u32{0} ** 5;
    for (text) |c| {
        if (std.mem.indexOfScalar(u8, vowels, std.ascii.toLower(c))) |i| counts[i] += 1;
    }
    for (vowels, counts) |v, n| std.debug.print("{c}={d} ", .{ v, n });
    std.debug.print("\n", .{});
}
