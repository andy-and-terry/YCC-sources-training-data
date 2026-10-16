const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const msg = try std.fmt.allocPrint(allocator, "{s}-{d}-{x}", .{ "id", 7, 255 });
    defer allocator.free(msg);
    std.debug.print("{s} (len {d})\n", .{ msg, msg.len });

    var small: [8]u8 = undefined;
    const fitted = std.fmt.bufPrint(&small, "{d}", .{123456}) catch "overflow";
    std.debug.print("{s}\n", .{fitted});
    const too_long = std.fmt.bufPrint(&small, "{d}", .{123456789012}) catch "overflow";
    std.debug.print("{s}\n", .{too_long});
}
