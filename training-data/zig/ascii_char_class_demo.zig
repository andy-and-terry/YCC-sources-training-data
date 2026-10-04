const std = @import("std");

pub fn main() void {
    const text = "Hello, World 2024! \t";

    var letters: usize = 0;
    var digits: usize = 0;
    var uppers: usize = 0;
    var spaces: usize = 0;
    var punct: usize = 0;

    for (text) |c| {
        if (std.ascii.isAlphabetic(c)) letters += 1;
        if (std.ascii.isDigit(c)) digits += 1;
        if (std.ascii.isUpper(c)) uppers += 1;
        if (std.ascii.isWhitespace(c)) spaces += 1;
        if (std.ascii.isPrint(c) and !std.ascii.isAlphanumeric(c) and !std.ascii.isWhitespace(c)) punct += 1;
    }
    std.debug.print("letters={d} digits={d} upper={d} space={d} punct={d}\n", .{ letters, digits, uppers, spaces, punct });

    var buf: [32]u8 = undefined;
    const upper = std.ascii.upperString(&buf, "mixed Case");
    std.debug.print("{s}\n", .{upper});
    const lower = std.ascii.lowerString(&buf, "MIXED Case");
    std.debug.print("{s}\n", .{lower});

    std.debug.print("{}\n", .{std.ascii.eqlIgnoreCase("Zig", "zIG")});
    std.debug.print("{c} {c}\n", .{ std.ascii.toUpper('q'), std.ascii.toLower('Q') });
}
