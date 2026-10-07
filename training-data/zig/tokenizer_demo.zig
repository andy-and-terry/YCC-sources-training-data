const std = @import("std");

pub fn main() void {
    const text = "  the quick   brown fox  ";

    // tokenize skips runs of delimiters
    var tok = std.mem.tokenizeScalar(u8, text, ' ');
    while (tok.next()) |word| {
        std.debug.print("token: '{s}'\n", .{word});
    }

    // split keeps empty fields
    var it = std.mem.splitScalar(u8, "a,b,,c", ',');
    while (it.next()) |field| {
        std.debug.print("field: '{s}'\n", .{field});
    }

    // Multiple delimiter characters
    var multi = std.mem.tokenizeAny(u8, "k1=v1;k2=v2", "=;");
    while (multi.next()) |part| {
        std.debug.print("part: {s}\n", .{part});
    }
}
