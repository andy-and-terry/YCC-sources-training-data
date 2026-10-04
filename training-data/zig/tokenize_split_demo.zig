const std = @import("std");

pub fn main() void {
    const text = "  the quick   brown fox  ";

    var tokens = std.mem.tokenizeScalar(u8, text, ' ');
    var count: usize = 0;
    while (tokens.next()) |word| {
        std.debug.print("token: '{s}'\n", .{word});
        count += 1;
    }
    std.debug.print("{d} tokens\n", .{count});

    var parts = std.mem.splitScalar(u8, "a,b,,c", ',');
    while (parts.next()) |part| {
        std.debug.print("part: '{s}'\n", .{part});
    }

    var by_seq = std.mem.splitSequence(u8, "one::two::three", "::");
    while (by_seq.next()) |part| {
        std.debug.print("seq: {s}\n", .{part});
    }

    const trimmed = std.mem.trim(u8, "\t hello \n", " \t\n");
    std.debug.print("[{s}]\n", .{trimmed});
    std.debug.print("{}\n", .{std.mem.startsWith(u8, "foobar", "foo")});
    std.debug.print("{any}\n", .{std.mem.indexOf(u8, "foobar", "bar")});
}
