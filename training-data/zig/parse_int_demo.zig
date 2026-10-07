const std = @import("std");

fn parseOrReport(text: []const u8) void {
    if (std.fmt.parseInt(i32, text, 10)) |n| {
        std.debug.print("'{s}' -> {d}\n", .{ text, n });
    } else |err| switch (err) {
        error.InvalidCharacter => std.debug.print("'{s}' has an invalid character\n", .{text}),
        error.Overflow => std.debug.print("'{s}' does not fit in i32\n", .{text}),
    }
}

pub fn main() !void {
    parseOrReport("123");
    parseOrReport("-45");
    parseOrReport("12x");
    parseOrReport("99999999999");

    const hex = try std.fmt.parseInt(u32, "ff", 16);
    const bin = try std.fmt.parseInt(u8, "101", 2);
    const auto = try std.fmt.parseInt(u16, "0x1F", 0);
    std.debug.print("{d} {d} {d}\n", .{ hex, bin, auto });

    const f = try std.fmt.parseFloat(f64, "3.25");
    std.debug.print("{d:.2}\n", .{f * 2});

    const fallback = std.fmt.parseInt(u8, "abc", 10) catch 0;
    std.debug.print("fallback={d}\n", .{fallback});
}
