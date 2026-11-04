const std = @import("std");

pub fn main() !void {
    var buf: [64]u8 = undefined;
    for ([_]u8{ 2, 8, 16, 36 }) |base| {
        const s = std.fmt.bufPrintIntToSlice(&buf, @as(u32, 255), base, .lower, .{});
        std.debug.print("255 in base {d} = {s}\n", .{ base, s });
    }
    std.debug.print("{d}\n", .{try std.fmt.parseInt(u32, "zz", 36)});
}
