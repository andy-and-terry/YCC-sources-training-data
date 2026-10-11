const std = @import("std");

pub fn main() void {
    const inputs = [_][]const u8{ "3.14", "-0.5", "1e3", "abc", "" };
    for (inputs) |s| {
        if (std.fmt.parseFloat(f64, s)) |v| {
            std.debug.print("'{s}' => {d}\n", .{ s, v });
        } else |err| {
            std.debug.print("'{s}' => {s}\n", .{ s, @errorName(err) });
        }
    }
    const hex = std.fmt.parseInt(u16, "ff", 16) catch 0;
    const bin = std.fmt.parseInt(u8, "1010", 2) catch 0;
    std.debug.print("hex {d} bin {d}\n", .{ hex, bin });
}
